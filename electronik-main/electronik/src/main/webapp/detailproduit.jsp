<%-- 
    Document   : detailproduit
    Created on : Apr 18, 2023, 5:28:46 PM
    Author     : isi
--%>

<%@page import="entites.Category"%>
<%@page import="entites.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Product produit = (Product) request.getAttribute("produit");
    ArrayList<Category> categories = (ArrayList<Category>) request.getAttribute("categories");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/styles.css"/>  
        <script src="js/javaScript.js"></script>
        <script src="js/pagination.js"></script>

        <style>
            h1 {
                text-align: center;
                text-align: justify;
            }

            .productDetails {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin: 30px;
                align-self: flex-start;
            }

            .productDetails p {
                padding: 10px;
                text-align: justify;
                width: 90%;
            }

            .infoProduct {
                flex: 1;
                display: flex;
                flex-direction: column;
            }

            .largeImage img,
            .miniImages img {
                border: 1px solid black;
                border-radius: 10px;
            }

            .largeImage img {
                width: 100%;
                margin-bottom: 15px;
                background-size: 150px;
                width: 500px;
            }

            .miniImages {
                display: flex;
                justify-content: space-between;
                max-width: 1800px;
                margin-bottom: 10px;
            }

            .miniImages img {
                width: 30%;
            }

            .productDescription {
                flex: 1;

                padding-left: 20px;
                display: flex;
                flex-direction: column;
            }


            .buttons {

                display: flex;
                flex: 1;

                flex-wrap: wrap;
                padding-bottom: 250px;
                margin-left: 250px;
            }


            .price {
                font-weight: bold;
                font-size: 24px;
                text-align: center;
                padding-bottom:70px;
                margin-right:20px;

            }

            .avis{
                padding-left:230px;
            }

            .star {
                position: absolute;
                padding-bottom:250px;
                padding-right:50px;
                font-size: 40px; /* Taille de la police pour les étoiles */
                color: #FFC107; /* Couleur des étoiles */
                text-shadow: 1px 1px #888; /* Ombre pour les étoiles */
            }

            .rating {
                unicode-bidi: bidi-override;
                direction: rtl;
                display: inline-block;
            }

            .rating > span {
                display: inline-block;
                position: relative;
                width: 1.1em;
            }

            .rating > span:hover:before,
            .rating > span:hover ~ span:before {
                content: "\2605";
                position: absolute;
                color: #FFC107;
            }


        </style>

    </head>
    <body>
        <%@include file="header.jsp" %> 

        <%@include file="navbar.jsp" %> 
        <h1>Detail produit</h1>
        <div class="productDetails">

            <section>

                <div class="infoProduct">

                    <div class="largeImage">
                        <img src="<%= produit.getUrlImage1Produit()%>" class="product_image"  ">

                    </div>

                    <div class="miniImages">
                        <% if (produit.getUrlImage2Produit() != null) {%>
                        <img src="<%= produit.getUrlImage2Produit()%>" class="product_image">
                        <% } %>
                        <% if (produit.getUrlImage3Produit() != null) {%>
                        <img src="<%= produit.getUrlImage3Produit()%>" class="product_image">
                        <% } %>
                        <% if (produit.getUrlImage4Produit() != null) {%>
                        <img src="<%= produit.getUrlImage4Produit()%>" class="product_image">
                        <% } %>
                        <% if (produit.getUrlImage2Produit() == null && produit.getUrlImage3Produit() == null && produit.getUrlImage4Produit() == null) { %>
                        Aucune image disponible
                        <% }%>
                    </div>


                </div>

                <article>
                    <div class="productDescription">
                        <h1><%=produit.getNom()%></h1>
                        <p><%= produit.getDesc()%></p>
                    </div>  

                    <div class="buttons">
                        <div class="price"><%= produit.getPrix()%>$</div>
                        <a class="cart btn button" href="#"> Add to cart </a>

                    </div>
                    <div class="avis">
                        <h2>Avis clients</h2>
                        <div class="rating">

                            <span class="star">&#9734;</span>
                            <span class="star">&#9734;</span>
                            <span class="star">&#9734;</span>
                            <span class="star">&#9734;</span>
                            <span class="star">&#9734;</span>
                        </div>
                    </div> 
                </article>

            </section> 
        </div>
        <script >
            Translate.init();
        </script>

    </body>
    <%@include file="footer.jsp" %>
</html>

