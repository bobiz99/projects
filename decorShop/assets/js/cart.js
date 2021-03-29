$(document).ready(function () {
    let products = proizvodiUKorpi();

    if(!products.length){
        praznaKorpa();
    }
    else{
        prikaziKorpu();
    }
});

function prikaziKorpu(){
    let products = proizvodiUKorpi();
        $.ajax({
            url: "assets/data/products.json",
            success: function (data) {
                    data = data.filter(p=>{
                        for(let pro of products)
                        {
                            if(p.id == pro.id) {
                                p.kolicina = pro.kolicina;
                                return true;
                            }
                                
                        }
                        return false;
                    });
                    ispisiTabelu(data);
            },
            error: function (xhr, error, status) {
                alert(status);
            }
        });
}

//ISPISIVANJE TABELE

function ispisiTabelu(products){
    var suma = 0;
        let ispis = `<h1 class="text-center mt-5">Your shopping cart</h1>
        <table class="table table-striped mt-5 mb-5 table-responsive">
        <thead>
          <tr>
            <th scope="col" class="text-center">Product ID</th>
            <th scope="col" class="text-center">Product</th>
            <th scope="col" class="text-center">Product Name</th>
            <th scope="col" class="text-center">Base Price</th>
            <th scope="col" class="text-center">Quantity</th>
            <th scope="col" class="text-center">Price</th>
            <th scope="col" class="text-center">Remove item</th>
          </tr>
        </thead>
        <tbody>`;

        for(let p of products){
            ispis += ispisiTr(p);
            suma += p.cena.novaCena * p.kolicina;
        }
        let krajnjaSuma = Math.round(suma * 100)/ 100;
        ispis += `<tr scope="col" class="text-right">
                    <td colspan="7">Total price : $${krajnjaSuma}</td>
                    </tr>
                </tbody>
                </table>`;

        document.getElementById("tabelaSadrzaj").innerHTML = ispis;

        function ispisiTr(p){
            return `<tr>
            <th scope="row" class="text-center">${p.id}</th>
            <td class="text-center">
                <img src="${p.slika.src}" alt="${p.slika.alt}" class="img-fluid">
            </td>
            <td class="text-center">${p.naziv}</td>
            <td class="text-center">$${p.cena.novaCena}</td>
            <td class="text-center"><i class="fas fa-plus mb-3" onclick='povecajKolicinu(${p.id})'></i><br>${p.kolicina}<br><i class="fas fa-minus mt-3" onclick='smanjiKolicinu(${p.id})'></i></td>
            <td class="text-center">$${Math.round((p.cena.novaCena * p.kolicina)*100)/100}</td>
            <td class="text-center"><i class="fas fa-trash" onclick='obrisiIzKorpe(${p.id})'></i></td>
          </tr>`
        }
        
}

//*HELPERI*//

function proizvodiUKorpi(){
    return JSON.parse(localStorage.getItem("products"));
  }

function praznaKorpa(){
    document.getElementById("tabelaSadrzaj").innerHTML += "<h1 class='text-center'>Your shopping cart<br> is empty!</h1>";
}

function obrisiIzKorpe(proizvodID){
    let products = proizvodiUKorpi();
    let updatedProducts = products.filter(p=> p.id != proizvodID);

    localStorage.setItem("products", JSON.stringify(updatedProducts));
    prikaziKorpu();
}

function povecajKolicinu(proizvodID){
    let products = proizvodiUKorpi();
    for(let i in products)
        {
            if(products[i].id == proizvodID) {
                products[i].kolicina++;
                break;
            }      
        }
      localStorage.setItem("products", JSON.stringify(products));
      prikaziKorpu();
}

function smanjiKolicinu(proizvodID){
    let products = proizvodiUKorpi();
    for(let i in products)
        {
            if(products[i].id == proizvodID) {
                if(products[i].kolicina == 0){
                    break;
                }else{
                    products[i].kolicina--;
                break;
                }
                
            }      
        }
      localStorage.setItem("products", JSON.stringify(products));
      prikaziKorpu();
}