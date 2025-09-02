// index.js
//check login.js
// then fetch user meus from backend using java based on the current user, if has admin role sole load all pages under /pages folder
// else fetch only using authorities
// in each request the pageController must check if the user has auth to viw the page
// then js store all the pages fragments locally
// after any click on the side menu render that fragment
// if any fragmet requested any data or waiting from any responce from the server this must be handled

async function loadMenu() {
  const sidebar = document.getElementById("sidebar-menu"); // UL element inside sidebar

  try {
    const res = await fetch("http://localhost:9000/api/v3/sys-menu", {
      headers: {
        "Authorization": "Bearer " + localStorage.getItem("jwt")
      }
    });

    if (!res.ok) {
      throw new Error("Failed to load menu");
    }

    const menus = await res.json();
    sidebar.innerHTML = ""; // clear existing

    menus.forEach(menu => {
      // parent LI
      const li = document.createElement("li");
      li.classList.add("nav-item");

      if (menu.children && menu.children.length > 0) {
        li.classList.add("menu-open");
        li.innerHTML = `
          <a href="#" class="nav-link">
            <i class="nav-icon ${menu.icon || 'fas fa-circle'}"></i>
            <p>
              ${menu.title}
              <i class="right fas fa-angle-left"></i>
            </p>
          </a>
        `;

        const ul = document.createElement("ul");
        ul.classList.add("nav", "nav-treeview");

        menu.children.forEach(child => {
          const childLi = document.createElement("li");
          childLi.classList.add("nav-item");
          childLi.innerHTML = `
            <a href="${child.url}" class="nav-link">
              <i class="${child.icon || 'far fa-circle nav-icon'}"></i>
              <p>${child.title}</p>
            </a>
          `;
          ul.appendChild(childLi);
        });

        li.appendChild(ul);
      } else {
        li.innerHTML = `
          <a href="${menu.url || '#'}" class="nav-link">
            <i class="nav-icon ${menu.icon || 'fas fa-circle'}"></i>
            <p>
              ${menu.title}
              ${menu.badge ? `<span class="right ${menu.badge.class}">${menu.badge.text}</span>` : ""}
            </p>
          </a>
        `;
      }

      sidebar.appendChild(li);
    });
  } catch (err) {
    console.error("Error loading menus:", err);
    sidebar.innerHTML = "<li class='nav-item'><p class='text-danger'>Menu load failed</p></li>";
  }
}

// run when DOM ready
// document.addEventListener("DOMContentLoaded", loadMenu);
