document.querySelector("form").addEventListener("submit", async function (e) {
  e.preventDefault(); // stop default form submission

  const formData = {
    username: document.querySelector("input[name='username']").value,
    password: document.querySelector("input[name='password']").value,
    rememberMe: document.querySelector("input[name='rememberMe']").checked
  };

  try {
    // 1️⃣ Authenticate with JHipster
    const jhiResp = await fetch("http://localhost:82/api/authenticate", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(formData)
    });

    if (!jhiResp.ok) {
      const errorText = await jhiResp.text();
      alert("Login failed: " + errorText);
      return;
    }

    const jhiData = await jhiResp.json();
    const token = jhiData.id_token || jhiData.token;
    if (!token) {
      alert("Login failed: no token received");
      return;
    }

    // 2️⃣ Verify and create session in native server, returning UserInfoDto
    const verifyResp = await fetch("http://localhost:3000/api/v3/session/verify", {
      method: "POST",
      headers: { "Authorization": `Bearer ${token}` }
    });

    if (!verifyResp.ok) {
      alert("Session verification failed");
      return;
    }

    const userInfo = await verifyResp.json(); // <-- UserInfoDto from native server

    // 3️⃣ Store JWT locally
    localStorage.setItem("jwt", token);

    // 4️⃣ Update sidebar with user info
    const userNameElem = document.querySelector(".sidebar .user-panel .info a");
    const userImgElem = document.querySelector(".sidebar .user-panel .image img");

    if (userNameElem) userNameElem.textContent = userInfo.firstName || userInfo.login || "User";
    if (userImgElem) {
      userImgElem.src = userInfo.imageUrl
        ? `/dist/img/${userInfo.imageUrl}`
        : "../dist/img/avatar.png";
      userImgElem.alt = userInfo.login || "User Image";
    }

    // 5️⃣ Redirect to home
    window.location.href = "/home";

  } catch (err) {
    console.error("Error during login:", err);
    alert("Unable to connect to server");
  }
});
