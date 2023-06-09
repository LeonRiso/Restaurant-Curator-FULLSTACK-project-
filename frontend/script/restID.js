const urlParams = new URLSearchParams(window.location.search);
const restID = urlParams.get('restID');
const body = document.querySelector('body')


fetch(`http://localhost:3000/restaurantemenu/${restID}`)
  .then(response => response.json())
  .then(data => {
    console.log(data); // debug output

    menu(data)})
  .catch(error => console.error(error));

  function menu(data) {
    data.forEach(e => {
        console.log(data); // debug output

      let name = document.createElement('h1')
      let description = document.createElement('h2')
      let value = document.createElement('p')
      name.innerHTML = e.nome
      description.innerHTML = e.descricao
      value.innerHTML = e.preco
      body.appendChild(name)
      body.appendChild(description)
      body.appendChild(value)
    });
  }

fetch(`http://localhost:3000/restaurantreview/${restID}`)
.then(response => response.json())
.then(data => {
  console.log(data); // debug output
  reviews(data)})
.catch(error => console.error(error));
  
function reviews(data){
    if (data.length > 0) {
      console.log(data)
      data.forEach(e => {
        let description = document.createElement('p')
        let date = document.createElement('p')
        let score = document.createElement('p')
        description.innerHTML = e.descricao
        date.innerHTML = e.Dia 
        score.innerHTML = e.nota
        body.appendChild (description)
        body.appendChild (date)
        body.appendChild (score)
      })
      }
  }
