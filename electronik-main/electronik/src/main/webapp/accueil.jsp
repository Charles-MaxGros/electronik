<%-- 
    Document   : acceuil
    Created on : Apr 15, 2023, 5:44:57 PM
    Author     : isi
--%>
<%@page import="Managers.ProductManager"%>
<%@page import="java.util.Base64"%>
<%@page import="entites.Category"%>
<%@page import="entites.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%  ArrayList<Product> products = (ArrayList<Product>) request.getAttribute("produitsFavoris");
    ArrayList<Category> categories = (ArrayList<Category>) request.getAttribute("categories");

    Cookie[] cookies = request.getCookies();
    ArrayList<Product> cookiesProducts = new ArrayList<>();

    ProductManager produitManager = new ProductManager();
    if (cookies != null) { //attention il pourrait ne pas y avoir de cookie pour le site
        for (Cookie cookie : cookies) { //étape 2 parcourir le tableau de cookie

            if (!cookie.getName().equals("JSESSIONID")) {
                cookiesProducts.add(produitManager.getOneProduct(Integer.parseInt(cookie.getValue())));
            }
        }
    }
%>
<script src="https://kit.fontawesome.com/f3276e9b5b.js" crossorigin="anonymous"></script>
<section>
    <div id="slider">
        <div id="slider-container">
            <img src="images/caroussel1.jpg" alt="carousel-01">
            <img src="images/caroussel2.jpg" alt="carousel-02">
            <img src="images/caroussel3.jpg" alt="carousel-03">
        </div>
    </div>
</section>
<div id="home">
    <%
        if (products != null) {%>
    <h2>Vos Favoris</h2>

    <section id="favoris">

        <article>

            <div class="homecontainer" >
                <%
                    for (Product produit : products) {
                %>
                <div class="card">
                    <img src="<%= produit.getUrlImage1Produit()%>" class="product_image" style="width: 200px; "></img>
                    <div class="product_detail">
                        <span class="title"><%= produit.getNom()%></span>
                        <div class="rating" data-rate="<%= produit.getRate()%>">
                            <i class="fas fa-star "></i>
                            <i class="fas fa-star "></i>
                            <i class="fas fa-star "></i>
                            <i class="fas fa-star "></i>
                            <i class="fas fa-star "></i>
                        </div>
                        <div class="buttons">
                            <div class="price"><%= produit.getPrix()%>$</div>
                            <button class="cart btn"> Add to cart </button>
                            <button class="favorite btn"><i class="far fa-heart"></i></button>
                        </div>
                    </div>
                </div>
       

    <%
            }
        }
    %>
     </article>
    </section>
    <div class="homeCategory" style="height: 50px; margin:30px auto; width: 80%;">
        <% for (Category category : categories) {
        %>
        <span style="background-color: black; padding: 20px; border-radius: 25px; "><a style="text-decoration: none; color: white" href="index?page=catalogue&categoryId=<%=category.getId()%>"><%= category.getNom()%></a></span>
            <%
                }
            %>
    </div>



    <%
        if (cookiesProducts != null) {%>
    <h2>Recemement visites</h2>

    <section id="favoris">

        <article>

            <div class="homecontainer">
                <%
                    for (Product produit : cookiesProducts) {
                %>
                <div class="card">
                    <img src="<%= produit.getUrlImage1Produit()%>" class="product_image" style="width: 200px; "></img>
                    <div class="product_detail">
                        <span class="title"><%= produit.getNom()%></span>
                        <div class="rating" data-rate="<%= produit.getRate()%>">
                            <i class="fas fa-star "></i>
                            <i class="fas fa-star "></i>
                            <i class="fas fa-star "></i>
                            <i class="fas fa-star "></i>
                            <i class="fas fa-star "></i>
                        </div>
                        <div class="buttons">
                            <div class="price"><%= produit.getPrix()%>$</div>
                            <button class="cart btn"> Add to cart </button>
                            <button class="favorite btn"><i class="far fa-heart"></i></button>
                        </div>
                    </div>
                </div>

                <%
                        }
                    }
                %>
        </article>

    </section>
</div>


