console.log("main.js");

// ----------------------
// Global token helper
// ----------------------
var token; // keep in global scope

// const server1Url = "http://localhost:3000/api/v2";
const server2Url = "http://localhost:8080/api/";
function getToken() {
  if (!token) {
    console.log("getting token from localStorage");
    token = localStorage.getItem("jwt");
  }
  return token;
}

// ----------------------
// Session check
// ----------------------
async function checkSession() {
  const currentPath = window.location.pathname;

  if (!getToken()) {
    if (currentPath !== "/login") {
      window.location.href = "/login";
    }
    return false;
  }

  try {
    // Ask native server to verify token
    const resp = await fetch("http://localhost:3000/api/v3/session/verify", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        Authorization: `Bearer ${getToken()}`,
      },
    });

    if (resp.ok) {
      const userInfo = await resp.json();
      localStorage.setItem("userInfo", JSON.stringify(userInfo));

      // Redirect only if user is on "/" or "/login"
      if (currentPath === "/" || currentPath === "/login") {
        window.location.href = "/home";
      }
      return true;
    } else {
      // 🚨 Token invalid or expired
      localStorage.removeItem("jwt");
      localStorage.removeItem("userInfo");
      if (currentPath !== "/login") {
        window.location.href = "/login";
      }
      return false;
    }
  } catch (e) {
    console.error("Session check failed", e);
    // 🚨 Token verification failed (likely invalid/expired)
    localStorage.removeItem("jwt");
    localStorage.removeItem("userInfo");
    if (currentPath !== "/login") {
      window.location.href = "/login";
    }
    return false;
  }
}

// ----------------------
// Load current user info
// ----------------------
async function loadCurrentUser() {
  const token = getToken();
  if (!token) {
    console.error("No token in storage");
    window.location.href = "/login";
    return;
  }

  try {
    const response = await fetch("http://localhost:3000/api/v3/session/verify", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        Authorization: `Bearer ${token}`, // ✅ use header not body
      },
    });

    if (!response.ok) {
      console.error("Token invalid or expired");
      localStorage.removeItem("jwt");
      localStorage.removeItem("userInfo");
      window.location.href = "/login"; // ✅ redirect
      return;
    }

    const userInfo = await response.json();
    localStorage.setItem("userInfo", JSON.stringify(userInfo)); // ✅ keep user session
    console.log("userInfo", userInfo);

    // Update sidebar
    const userNameElem = document.querySelector(".sidebar .user-panel .info a");
    const userImgElem = document.querySelector(".sidebar .user-panel .image img");

    if (userNameElem) {
      userNameElem.textContent =
        userInfo.firstName || userInfo.login || "User";
    }
    if (userImgElem) {
      userImgElem.src = userInfo.imageUrl
        ? `/dist/img/${userInfo.imageUrl}`
        : "../dist/img/avatar.png";
      userImgElem.alt = userInfo.login || "User Image";
    }

    // ✅ (optional) show user’s roles/authorities in sidebar
    const userRolesElem = document.querySelector(".sidebar .user-panel .roles");
    if (userRolesElem && userInfo.auths) {
      userRolesElem.textContent = userInfo.auths.join(", ");
    }
  } catch (err) {
    console.error("Failed to verify session:", err);
    localStorage.removeItem("jwt");
    localStorage.removeItem("userInfo");
    window.location.href = "/login"; // ✅ fallback redirect
  }
}
// ----------------------
// Load sidebar menus
// ----------------------
let firstMenu = true; // pour n'ouvrir que le premier menu par défaut

async function loadSidebarMenus() {
  console.debug('loadSidebarMenus')
  try {
    const resp = await fetch("/api/v3/sys-menus/sidebar");

    if (!resp.ok) {
      throw new Error("Failed to fetch menus: " + resp.status);
    }

    const menus = await resp.json();
    renderSidebarMenus(menus);
    return menus;
  } catch (err) {
    console.error("Error loading menus:", err);
  }
}

// ----------------------
// Render sidebar
// ----------------------
function renderSidebarMenus(menus) {
  const menuContainer = document.querySelector("#sidebar-menu-ul");
  if (!menuContainer) {
    console.error("No sidebar menu UL found.");
    return;
  }

  // Clear existing items
  menuContainer.innerHTML = "";

  // Recursive render
  menus.forEach(menu => {
    menuContainer.appendChild(renderMenuItem(menu));
  });

  // Re-init AdminLTE treeview
  // console.debug('Re-init AdminLTE treeview')
  if ($.fn.Treeview) {
    $('[data-widget="treeview"]').Treeview("init");
  }
}

// ----------------------
// Render a single menu item (recursive)
// ----------------------
function renderMenuItem(menu) {
  console.debug('renderMenuItem', menu);
  const li = document.createElement("li");
  li.className = "nav-item";

  li.id = `menu-${menu.url}`;
  if (firstMenu && (!menu.parentMenuId || menu.subMenus?.length)) {
    li.classList.add("menu-open");
    firstMenu = false;
  }

  const a = document.createElement("a");
  a.className = "nav-link";
  a.href = "#";

  // Optional icon
  if (menu.iconName) {
    const i = document.createElement("i");
    i.className = `nav-icon ${menu.iconName}`;
    a.appendChild(i);
  }

  const p = document.createElement("p");
  p.textContent = menu.title || "Untitled";

  if (menu.subMenus && menu.subMenus.length > 0) {
    const rightIcon = document.createElement("i");
    rightIcon.className = "right fas fa-angle-left";
    p.appendChild(rightIcon);
  }

  a.appendChild(p);
  li.appendChild(a);

  // ------------------------------
  // Add click event to root menu
  // ------------------------------
  if (!menu.parentMenuId) { // root menu only
    a.addEventListener("click", (e) => {
      e.preventDefault();
      showModuleTabs(menu.url); // show only this module's tabs
    });
  }

  // Render children recursively
  if (menu.subMenus && menu.subMenus.length > 0) {
    const ul = document.createElement("ul");
    ul.className = "nav nav-treeview";
    menu.subMenus.forEach(subMenu => {
      ul.appendChild(renderMenuItem(subMenu));
    });
    li.appendChild(ul);
  }

  return li;
}

// ------------------------------
// Show only the tabs belonging to the selected module
// ------------------------------
let moduleTabsData = []; // global

async function renderModuleTabs() {
  try {
    const response = await fetch("http://localhost:3000/api/v3/sys-menus/tabs");
    if (!response.ok) throw new Error(`HTTP error! Status: ${response.status}`);

    moduleTabsData = await response.json(); // store globally

    // Hide all tabs initially
    const container = document.getElementById("module-tab-container");
    const navLinks = container.querySelectorAll(".nav-link");
    const tabPanes = container.querySelectorAll(".tab-pane");
    navLinks.forEach(link => link.classList.add("hidden"));
    tabPanes.forEach(pane => pane.classList.add("hidden"));

  } catch (err) {
    console.error("Error rendering module tabs:", err);
  }
}

// ------------------------------
// Show only the tabs belonging to the selected module
// ------------------------------
function showModuleTabs(moduleUrl) {
  const container = document.getElementById("module-tab-container");
  const navLinks = container.querySelectorAll(".nav-link");
  const tabPanes = container.querySelectorAll(".tab-pane");

  // Hide all
  navLinks.forEach(link => link.style.display = "none");
  tabPanes.forEach(pane => pane.style.display = "none");

  // Show only tabs that match the moduleUrl
  moduleTabsData.forEach(moduleTabObj => {
    console.debug(moduleTabObj.parentUrl ,' vs ', moduleUrl)
    if (moduleUrl.includes(moduleTabObj.parentUrl)) {
      const nav = container.querySelector(`.nav-link[href="#${moduleTabObj.module}-${moduleTabObj.tab}"]`);
      const pane = container.querySelector(`#${moduleTabObj.module}-${moduleTabObj.tab}`);
      if (nav)
        nav.style.display = "block";   // or "" to restore

      if (pane)
      pane.style.display = "block";   // or "" to restore

    }
  });

  // todo Activate first visible tab
  const firstNav = container.querySelector(`.nav-link:not(.hidden)`);
  const firstPane = container.querySelector(`.tab-pane:not(.hidden)`);
  if (firstNav) firstNav.classList.add("active");
  if (firstPane) firstPane.classList.add("active");
}


function addLogoutEvnt() {
  const logoutBtn = document.getElementById("logoutBtn");
  if (logoutBtn) {
    logoutBtn.addEventListener("click", async (e) => {
      e.preventDefault();
      /* todo to only add blacklist
            try {
              const token = getToken();
              if (token) {
                await fetch("http://localhost:3000/api/v3/session/logout", {
                  method: "POST",
                  headers: {
                    "Content-Type": "application/json",
                    Authorization: `Bearer ${token}`,
                  },
                });
              }
            } catch (err) {
              console.error("Logout failed:", err);
            }*/

      // ✅ Clear session client-side
      localStorage.removeItem("jwt");
      localStorage.removeItem("userInfo");

      // ✅ Redirect to login
      window.location.href = "/login";
    });
  }
}

// ----------------------
// Init after DOM ready
// ----------------------
document.addEventListener("DOMContentLoaded", () => {
  checkSession().then((ok) => {
    if (ok) {
      loadCurrentUser();
      loadSidebarMenus();
      addLogoutEvnt();
      renderModuleTabs();


    }
  });
});
