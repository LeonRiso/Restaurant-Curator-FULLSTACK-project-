const form = document.getElementById("login-form");

form.addEventListener("submit", (event) => {
  event.preventDefault();
  login();
});


function login() {
  const email = document.getElementById("email").value;
  const password = document.getElementById("pass").value;

  const data = {
    "email": email,
    "senha": password,
  };

  const options = {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify(data),
  };

  fetch("http://localhost:3000/login", options)
    .then((response) => {
      if (response.ok) {
        return response.json();
      } else {
        throw new Error("Something went wrong");
      }
    })
    .then((data) => {
      localStorage.setItem("clientes", JSON.stringify(data));
      window.location.href = "./lista.html";
      return false})
    .catch((error) => {
      console.log(error)
    });
}

console.log(login)