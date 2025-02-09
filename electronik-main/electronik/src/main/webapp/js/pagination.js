/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
'use strict';
const pageNumbers = document.querySelector(".pageNumbers");
const container = document.getElementById("container");
console.log(container);
const cards = container.querySelectorAll(".card");
const prevButton = document.getElementById("prev");
const nextButton = document.getElementById("next");


const contentLimit = 8;
const pageCount = Math.ceil(cards.length / contentLimit);
let currentPage = 1;
function displayPageNumber(index) {
    const pageNumber = document.createElement("a");
    pageNumber.innerHTML = (index);
    pageNumber.setAttribute("href", "#");
    pageNumber.setAttribute("index", index);
    pageNumbers.appendChild(pageNumber);
}

function getPageNumber () {
    for (let i = 0; i <= pageCount; i++) {
        displayPageNumber(i);
    }
}
function disableButton(button){
    button.classList.add("disabled");
    button.setAttribute("disabled", true);
}
function enableButton(button){
        button.classList.remove("disabled");
    button.removeAttribute("disabled");
}
function controlButtonStatus(){
    if (currentPage === 1){
        disableButton(prevButton);
    } else{
        enableButton(prevButton);
    }
    if(pageCount === currentPage){
        disableButton(nextButton);
    } else{
        enableButton(nextButton);
    }
}
function handleActivePageNumber(){
    const linkTab = pageNumbers.querySelectorAll("a");
            linkTab.forEach( (button) =>{
        button.classList.remove("active");
        const pageIndex = Number(button.getAttribute("index"));
        if (pageIndex === currentPage) {
            button.classList.add("active");
        }
    });
    
        
}
function setCurrentPage(pageNum){
    currentPage = pageNum;
    handleActivePageNumber();
    controlButtonStatus();
    const prevRange = (pageNum - 1)*contentLimit;
    const currRange = (pageNum )*contentLimit;
    cards.forEach((item,index) =>{
        item.classList.add("hidden");
        if (index>= prevRange && index < currRange){
            item.classList.remove("hidden");
        }
    });
    
}

window.addEventListener("load", ()=>{
    getPageNumber();
    setCurrentPage(1);
    
    prevButton.addEventListener("click", ()=>{
        setCurrentPage(currentPage-1);
    });
    nextButton.addEventListener("click", ()=>{
        setCurrentPage(currentPage+1);
    });
    pageNumbers.querySelectorAll("a").forEach((button) =>{
        const pageIndex =Number(button.getAttribute("index"));
        if (pageIndex){
            button.addEventListener("click", () =>{
                setCurrentPage(pageIndex);
            });
        }
    });
});