/**
 * 
 */
let page = "page1";


const m_payment_btn = document.getElementById("m_payment_btn");
const res_btn = document.getElementById("res_btn");
const set_btn = document.getElementById("set_btn");
const home_btn = document.getElementById("home_btn");

home_btn.addEventListener("click",()=>{
    document.getElementById(page).style.display = "none";
    document.getElementById("page1").style.display = "flex";
    page = "page1";
})

m_payment_btn.addEventListener("click",()=>{
    document.getElementById(page).style.display = "none";
    document.getElementById("page2").style.display = "block";
    page = "page2"
})

res_btn.addEventListener("click",()=>{
    document.getElementById(page).style.display = "none";
    document.getElementById("page3").style.display = "block";
    page = "page3"
})

set_btn.addEventListener("click",()=>{
    document.getElementById(page).style.display = "none";
    document.getElementById("page4").style.display = "block";
    page = "page4"
})