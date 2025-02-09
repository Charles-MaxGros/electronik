<%-- 
    Document   : catalogue
    Created on : 16 avr. 2023, 21 h 05 min 00 s
    Author     : isi
--%>

<%@page import="entites.Category"%>
<%@page import="entites.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    ArrayList<Product> products = (ArrayList<Product>) request.getAttribute("produits");
    ArrayList<Category> categories = (ArrayList<Category>) request.getAttribute("categories");

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://kit.fontawesome.com/f3276e9b5b.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="css/styles.css"/>
        <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css" />

        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="header.jsp" %> 

        <%@include file="navbar.jsp" %> 

        <div class="Filter">
           <div class="homeCategory" style="height: 50px; margin:30px auto; width: 80%;">
        <% for (Category category : categories) {
        %>
        <span style="background-color: black; padding: 20px; border-radius: 25px; "><a style="text-decoration: none; color: white" href="index?page=catalogue&categoryId=<%=category.getId()%>"><%= category.getNom()%></a></span>
            <%
                }
            %>
    </div>

        </div>
        <div>


        </div>
        <div class="container" id="container">
            <% for (Product produit : products) {
            %>
            <div class="card" data-id = "<%= produit.getSku()%>">
                <img src="<%= produit.getUrlImage1Produit()%>" class="product_image" style="width: 200px; "></img>
                <div class="product_detail">
                    <span class="title"><%= produit.getNom()%></span>
                    <div class="rating" id="rating" data-rate="<%= produit.getRate()%>">
                        <i class="fas fa-star "></i>
                        <i class="fas fa-star "></i>
                        <i class="fas fa-star "></i>
                        <i class="fas fa-star "></i>
                        <i class="fas fa-star "></i>
                    </div>
                    <div class="buttons">
                        <div class="price"><%= produit.getPrix()%>$</div>



                        <a class="cart btn button" href="index?page=catalogue&actionProduit=addToCart&productId=<%= produit.getSku()%>"> Add to cart </a>

                        <a class="favorite btn button" href="index?page=catalogue&actionProduit=addToFavorite&productId=<%= produit.getSku()%>"><i class="far fa-heart"></i></a>

                    </div>
                </div>
            </div>
            <%
                }
            %>
        </div>
        <div class="pagination-container">
            <div class="pagination">
                <button class="control" id="prev" title="Previous_page">
                    < Prev
                </button>
                <div class="pageNumbers">

                </div>
                <button class="control" id="next" title="Next_page">
                    Next >
                </button>
            </div>
        </div>
        <%@include file="footer.jsp" %> 

        <script src="js/javaScript.js"></script>
        <script src="js/pagination.js"></script>

        <script >
            const cardsI = document.getElementsByClassName("card");
            cards.forEach((card) => {
                const ratings = card.getElementsByClassName("rating")[0].querySelectorAll("i");
                const rate = card.getElementsByClassName("rating")[0].getAttribute("data-rate");

                for (var i = 0, max = rate; i < max; i++) {
                    ratings[i].classList.add("activeStar");
                    console.log(ratings[i]);
                }
            });

            Translate.init();

        </script>
        <script>
            const productCards = document.querySelectorAll('.card');

            productCards.forEach((card) => {
                console.log(card);
                card.addEventListener('click', () => {
                    const productId = card.getAttribute("data-id");
                    window.location.href = 'index?page=detailproduit&productId=' + productId;
                });
            });

        </script>

    </script>

</body>
</html>
