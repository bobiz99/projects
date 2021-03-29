$(document).ready(function () {
   prikazSlidera();
   dohvatiShippingIkonice();
   showCategories();
   prikaziSveProizvode();
   dohvatiVrsteProizvoda();
  $(".dropdown-item").click(sortiranjeProizvoda);

  //ISPIS DATUMA

    //Ispis Godina
var nizGodina = [];
for(let i=2020;i>1929;i--){
    nizGodina.push(i);
}

var godineIspis = "<select id='godina'>";
godineIspis += "<option>Year</option>";
for (let i in nizGodina) {
    godineIspis += "<option>"+nizGodina[i]+"</option>";
}
godineIspis += "</select>";
document.getElementById("ddlYear").innerHTML = godineIspis;

    //Ispis meseci
var nizMeseca = [];
for(let i = 12; i>0;i--){
    nizMeseca.push(i);
}

var meseciIspis = "<select id='mesec'>";
meseciIspis += "<option>Month</option>";
for (let i in nizMeseca) {
    meseciIspis += "<option>"+nizMeseca[i]+"</option>";
}
meseciIspis += "</select>";
document.getElementById("ddlMonth").innerHTML = meseciIspis;

    //Ispis dana
 var nizDana = [];
for(let i = 31; i>0;i--){
    nizDana.push(i);
}
var daniIspis = "<select id='dan'>";
daniIspis += "<option>Day</option>";
    for (let i in nizDana) {
        daniIspis += "<option>"+nizDana[i]+"</option>";
    }
    daniIspis += "</select>";
    document.getElementById("ddlDay").innerHTML = daniIspis;
});

//VALIDACIJA FORME
$("#btnProveri").click(function(e){
  e.preventDefault();
  //dohvatanje vrednosti iz forme
  var ime =   document.getElementById("ime").value.trim();
  var prezime = document.getElementById("prezime").value.trim();
  var email = document.getElementById("email").value.trim();
  var godine = document.getElementById("godina").value;
  var meseci = document.getElementById("mesec").value;
  var dani = document.getElementById("dan").value;
  var msg = document.getElementById("message").value.trim();

  //dohvatanje divova za erore
  var imeGreska = document.getElementById("firstNameError");
  var prezimeGreska = document.getElementById("lastNameError");
  var emailGreska = document.getElementById("emailError");
  var godineGreska = document.getElementById("godineError");
  var meseciGreska = document.getElementById("meseciError");
  var daniGreska = document.getElementById("daniError");
  var msgGreska = document.getElementById("msgError");

  //regex

  var regexIme = new RegExp('^[A-Z][a-z]{2,15}$');
  var regexPrezime = new RegExp('^[A-Z][a-z]{2,15}$');
  var regexEmail = new RegExp('^[a-z]+[\.\-\_\!a-z\d]*\@[a-z]{2,10}(\.[a-z]{2,3}){1,2}$');
  var regexMsg = new RegExp('^[A-Za-z0-9" *"\.\!\?\-]{5,1000}$');

  //PROVERA
  //ime
  if(ime==""){
      $("#firstNameError").addClass("displayError");
      imeGreska.innerHTML = "This field is required!";
      $("#ime").addClass("is-invalid");
  }
  else if(!regexIme.test(ime)){
      $("#firstNameError").addClass("displayError");
      imeGreska.innerHTML = "Enter valid name!";
      $("#ime").addClass("is-invalid");
  }else{
      $("#firstNameError").removeClass("displayError");
      imeGreska.innerHTML = "";
      $("#ime").removeClass("is-invalid");
      $("#ime").addClass("is-valid");
  }
  //prezime
  if(prezime==""){
    $("#lastNameError").addClass("displayError");
    prezimeGreska.innerHTML = "This field is required!";
    $("#prezime").addClass("is-invalid");
}
else if(!regexPrezime.test(prezime)){
    $("#lastNameError").addClass("displayError");
    prezimeGreska.innerHTML = "Enter valid lastname!";
    $("#prezime").addClass("is-invalid");
}else{
    $("#lastNameError").removeClass("displayError");
    prezimeGreska.innerHTML = "";
    $("#prezime").removeClass("is-invalid");
    $("#prezime").addClass("is-valid");
}

  // //email
  if(email==""){
    $("#emailError").addClass("displayError");
    emailGreska.innerHTML = "This field is required!";
    $("#email").addClass("is-invalid");
}
else if(!regexEmail.test(email)){
    $("#emailError").addClass("displayError");
    emailGreska.innerHTML = "Enter valid email!";
    $("#email").addClass("is-invalid");
}else{
    $("#emailError").removeClass("displayError");
    emailGreska.innerHTML = "";
    $("#email").removeClass("is-invalid");
    $("#email").addClass("is-valid");
}

  //godine
  if(godine == "Year") {
    godineGreska.classList.add("displayError");
    $("#ddlYear").addClass("is-invalid");
    godineGreska.innerHTML = "Enter valid year!"
} else {
    godineGreska.classList.remove("displayError");
    $("#ddlYear").removeClass("is-invalid");
    $("#ddlYear").addClass("is-valid");
    godineGreska.innerHTML = "";
    console.log("Izabrana godina");
}
//meseci
if(meseci == "Month") {
    meseciGreska.classList.add("displayError");
    $("#ddlMonth").addClass("is-invalid");
    meseciGreska.innerHTML = "Enter valid month!"
} else {
    meseciGreska.classList.remove("displayError");
    $("#ddlMonth").removeClass("is-invalid");
    $("#ddlMonth").addClass("is-valid");
    meseciGreska.innerHTML = "";
    console.log("Izabran mesec");
}

//dani
if(dani == "Day") {
    daniGreska.classList.add("displayError");
    $("#ddlDay").addClass("is-invalid");
    daniGreska.innerHTML = "Enter valid day!"
} else {
    daniGreska.classList.remove("displayError");
    $("#ddlDay").removeClass("is-invalid");
    $("#ddlDay").addClass("is-valid");
    daniGreska.innerHTML = "";
    console.log("Izabran dan");
}

//textarea
if(msg==""){
  $("#msgError").addClass("displayError");
  msgGreska.innerHTML = "This field is required!";
  $("#message").removeClass("msgValid");
  $("#message").addClass("msgInvalid");
}
else if(!regexMsg.test(msg)){
  $("#msgError").addClass("displayError");
  msgGreska.innerHTML = "Enter valid message!";
  $("#message").removeClass("msgValid");
  $("#message").addClass("msgInvalid");
}else{
  $("#msgError").removeClass("displayError");
  msgGreska.innerHTML = "";
  $("#message").removeClass("msgInvalid");
  $("#message").addClass("msgValid");
}
});

//dropdown menu
$(function() {
    var box = $('.box');
    var button = $('#btnMeni, .header-menu');
    button.on('click', function(){
      box.toggleClass('activeBox');
    });
  });


//Header SLIDER
var i =0;
function prikazSlidera(){
  $.ajax({
    url: "assets/data/sliderSlike.json",
    method: "GET",
    type: "json",
    success: function (data) {
      imageSlider(data)
    },
    error: function (xhr, error, status){
      alert(status);
    }
  });

  function imageSlider(nizSlika){
  document.getElementById("slider").style.backgroundImage = "url('"+nizSlika[i].src+"')";
  document.getElementById("naslovSlider").innerHTML = nizSlika[i].naslov;
    if(i < nizSlika.length-1){
        i++;
    }
    else{
        i=0;
    }

    setTimeout("prikazSlidera()", 2500);
}
}


//ISPIS IKONICA
function dohvatiShippingIkonice(){
  $.ajax({
    url : "assets/data/shippingIkonica.json",
    method : "GET",
    type : "json",
    success : function(data) {
        prikazShippingIkonica(data);
    },
    error : function(xhr, error, status) {
        alert(status);
    }
});
}

function prikazShippingIkonica(ikonice){
    document.getElementById("contentShipping").innerHTML = ispisDiv();

    function ispisDiv(){
      let ispis = "";
      for (let ik of ikonice) {
          ispis+=`<div class="col-sm-12 col-md-6 col-lg-3 pt-5">
          <div class="row mb-5 margineRow">
            <div class="col-6 d-flex align-items-center justify-content-end">
              <i class="${ik.klasa} velicinaTextaShipping"></i>
            </div>
            <div class="col-6 text-left">
              <p><b>${ik.tekst1}</b></p>
              <p>${ik.tekst2}</p>
            </div>
          </div>
        </div>`;
      }
      return ispis;
    }
}

//Prikaz slika kategorija
function showCategories(){
  $.ajax({
    url: "assets/data/categories.json",
    method: "GET",
    type: "json",
    success: function(categories){
        showImageCategories(categories);
        ispisiKategorije(categories);
    }
  });
}


//ispis slika kategorija
function showImageCategories(categories){
    document.getElementById("gallery").innerHTML = ispisDiv();

    function ispisDiv(){
      let ispis="";
      for (let img of categories) {
        ispis += kolonaSlika(img);
      }
      return ispis;
    }
}

//ispis Kategorija u vidu liste
function ispisiKategorije(categories){
  document.getElementById("kategorije").innerHTML += ispisDiv();

  function ispisDiv(){
    let html = "";
    for (let cat of categories) {
      html += `<li class="control filter" data-id="${ cat.id }">${cat.naziv}</li>`;
    }
    return html;
  }

  $('.filter').click(filtrirajPoKategoriji);
}

//FILTRIRANJE

//po kategoriji
function filtrirajPoKategoriji(){
  
  let categoryID = $(this).data("id");
  dohvatiProizvode(
    function(products){
      if(categoryID == "all"){
        ispisiProizvode(products);
      }else{
        products = filtrirajKategorija(products, categoryID);
        ispisiProizvode(products);
      }
    }
  );
}

function filtrirajKategorija(products, categoryID){
  return products.filter(p=> p.kategorija.id == categoryID);
}

//filtriranje po vrsti proizvoda
function filtrirajPoVrstiProizvoda(products){
  let vrstaID = $(this).data("id");
  dohvatiProizvode(
    function(products){
      products = filtrirajVrsta(products, vrstaID);
      ispisiProizvode(products);
    }
  );
}

function filtrirajVrsta(products, vrstaID){
  return products.filter(p=> p.vrstaProizvoda.id == vrstaID);
}

//dohvatanje json fajla VRSTE PROIZVODA
function dohvatiVrsteProizvoda(){
  $.ajax({
    url: "assets/data/vrsteProizvoda.json",
    method: "GET",
    type: "json",
    success: function(vrsteProizvoda){
        ispisiVrsteProizvoda(vrsteProizvoda);
    }
  });
}

//Ispisivanje vrsta proizvoda u vidu liste
function ispisiVrsteProizvoda(vrsteProizvoda){
  document.getElementById("vrsteProizvoda").innerHTML = ispisDiv();

  function ispisDiv(){
    let html = "";
    for (let v of vrsteProizvoda) {
      html += `<li class="control vrsta" data-filter=".new" data-id="${ v.id }">${v.naziv}</li>`;
    }
    return html;
  }
  $('.vrsta').click(filtrirajPoVrstiProizvoda);
}

//dohvatanje svih produkta
function dohvatiProizvode(povratna){ 
  $.ajax({
      url: "assets/data/products.json",
      method: "GET",
      success: povratna
  });
}

//prikaz svih proizvoda
function prikaziSveProizvode(){
  dohvatiProizvode(
    function(products){
      ispisiProizvode(products);
    }
  );
}


//funkcija za ispisivanje proizvoda
function ispisiProizvode(products){
  $("#product-filter").html(ispisDiv);
  dodajCartEvent();
  function ispisDiv(){
    let ispis = "";
    if(products.length > 0){
      for (let p of products) {
        if(p.new){
          ispis+= ispisNovogProizvoda(p);
        }
        else if(p.sale){
          ispis+= ispisSaleProizvoda(p);
        }
        else{
          ispis+= ispisNormalProizvoda(p);
        }
      }
    }
    else{
      ispis+= `<h3 class="display-3 text-center mb-5">No products!</h3>`;
    }
    return ispis;
  }
}

//SORTIRANJE PROIZVODA
function sortiranjeProizvoda(e){
  e.preventDefault();
  let sort = $(this).data("sort");
  let order = $(this).data("order");
  dohvatiProizvode(function(products){
    sortiraj(products, sort, order);
    ispisiProizvode(products);
  })
}

function sortiraj(products, sort, order){
  products.sort(function(a,b){
    let vrA = (sort == "cena")? a.cena.novaCena : a.naziv;
    let vrB = (sort == "cena")? b.cena.novaCena : b.naziv;
    if(vrA > vrB)
        return order == "asc"? 1 : -1;
    else if(vrA < vrB)
        return order == "asc"? -1 : 1;
    else
        return 0;
  });
}

//*DODAVANJE U KORPU*//
function dodajCartEvent(){
   $(".btn-line").click(dodajUKorpu);
}

function dodajUKorpu(){
  console.log("korpa");
  let productID = $(this).data("id");
  var products = proizvodiUKorpi();

  if(products) {
    if(proizvodJeUKorpi()){
      updateBrojProizvoda();
    }
    else{
      dodajULocalStorage();
    }
  }else{
    dodajPrviPut();
  }

  prikaziObavestenje();
  /*helperi*/
  function proizvodJeUKorpi(){
    return products.filter(p => p.id == productID).length;
  }

  function updateBrojProizvoda(){
    let products = proizvodiUKorpi();
    for(let i in products)
        {
            if(products[i].id == productID) {
                products[i].kolicina++;
                break;
            }      
        }
      localStorage.setItem("products", JSON.stringify(products));
  }

  function dodajULocalStorage(){
    let products = proizvodiUKorpi();
    products.push({
      id : productID,
      kolicina : 1
    });
    localStorage.setItem("products", JSON.stringify(products));
  }

  function dodajPrviPut(){
    let products = [];
    products[0] = ({
      id : productID,
      kolicina : 1
    });
    localStorage.setItem("products", JSON.stringify(products));
  }

  function prikaziObavestenje(){
    $(".uspesnoDodato").addClass("displayError");

    setTimeout(() => $(".uspesnoDodato").removeClass("displayError"), 650);
  }
}

function proizvodiUKorpi(){
  return JSON.parse(localStorage.getItem("products"));
}

//*HELPERI*//

//funkcija za ispis SINGLE kategorija slika
function kolonaSlika(img){
  return `<div class="col-lg-4 col-sm-12 pl-0 pr-0 d-flex justify-content-center position-relative" data-aos="flip-up">
  <img src="${img.slika.src}" alt="${img.slika.alt}" class="img-fluid">
  <h1 class="position-absolute centered text-dark text-center naslovSlider">${img.naziv}</h1>
  <a href="#shop" class="position-absolute bb_button bb_button--transparent bb_position"><span class="bb_button__text">Shop now</span></a>
</div>`;
}


//funckija za ispis single novog proizvoda
function ispisNovogProizvoda(product){
  return `<div class="mix col-lg-3 col-md-6" data-aos="fade-up">
  <div class="product-item">
    <figure>
      <img src="${product.slika.src}" alt="${product.slika.alt}">
      <div class="bache">NEW</div>
    </figure>
    <div class="product-info">
      <h6>${product.naziv}</h6>
      <p>$${product.cena.novaCena}</p>
      <button class="site-btn btn-line" data-id=${product.id}>ADD TO CART</button>
    </div>
  </div>
</div>`;
}


//funkcija za ispis single sale proizvoda
function ispisSaleProizvoda(product){
  return `<div class="mix col-lg-3 col-md-6" data-aos="fade-up">
  <div class="product-item">
    <figure>
      <img src="${product.slika.src}" alt="${product.slika.alt}">
      <div class="bache sale">SALE</div>
    </figure>
    <div class="product-info">
      <h6>${product.naziv}</h6>
      <p>$${product.cena.novaCena} <span><del>$${product.cena.staraCena}</del></span></p>
      <button class="site-btn btn-line" data-id=${product.id}>ADD TO CART</button>
    </div>
  </div>
</div>`;
}

//funkcija za ispis normalnog proizvoda
function ispisNormalProizvoda(product){
  return `<div class="mix col-lg-3 col-md-6" data-aos="fade-up">
  <div class="product-item">
    <figure>
      <img src="${product.slika.src}" alt="${product.slika.alt}">
    </figure>
    <div class="product-info">
      <h6>${product.naziv}</h6>
      <p>$${product.cena.novaCena}</p>
      <button class="site-btn btn-line" data-id=${product.id}>ADD TO CART</button>
    </div>
  </div>
</div>`;
}