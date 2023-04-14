const table = document.querySelector("#tablebody")


fetch("http://localhost:3000/restaurantes", { method: 'GET' })
.then(response => response.json())
.then(data => {
  list(data);})
.catch(error => console.error(error));

function list(tableData){
    tableData.forEach(e =>{
        let line = document.createElement('tr')
        let col1 = document.createElement('td')
        let col2 = document.createElement('td')
        let col3 = document.createElement('td')
        let col4 = document.createElement('td')
        col1.innerHTML = e.restID
        col2.innerHTML = e.restNome
        col3.innerHTML = e.catNome
        col4.innerHTML = e.endereco
        line.addEventListener('click', function() {
            fetch(`http://localhost:3000/restaurantemenu/${e.restID}`, { method: 'GET' })
                .then(response => response.json())
                .then(data => {
                    // redirect to menu page with retrieved ID
                    window.location.href = `./menus.html?restID=${e.restID}`;
                })
                .catch(error => console.error(error));
        });

        line.appendChild(col1)
        line.appendChild(col2)
        line.appendChild(col3)
        line.appendChild(col4)
        table.appendChild(line)
    })
}