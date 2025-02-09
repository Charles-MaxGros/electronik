<%-- 
    Document   : panier.jsp
    Created on : Apr 15, 2023, 7:40:03 PM
    Author     : isi
--%>

<%@page import="java.time.Instant"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% double subTotal = 0; %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/styles.css"/>  
    <body>
        <%@include file="header.jsp" %> 

        <%@include file="navbar.jsp" %> 
        <main>
            <div class="panier">
                <h1 id="cart-title">Cart</h1>
                <table id="cart-table">
                    <thead>
                        <tr>
                            <th>Images</th>
                            <th>Produit</th>
                            <th>Prix</th>
                            <th>Quantité</th>
                            <th>Total</th>
                        </tr>
                    </thead>
                    <tbody>
                       <% if (productToCart != null) {
                        for (Map.Entry<Product, Integer> entry : productToCart.entrySet())  {
                    %>
                    <tr>
                        <td>
                            <img src="<%= entry.getKey().getUrlImage1Produit() %>" alt="Image produit 1" />
                        </td>
                        <td><%= entry.getKey().getNom() %></td>
                        <td>$<%= entry.getKey().getPrix() %></td>
                        <td><%= entry.getValue() %></td>
                        <td><%=(entry.getKey().getPrix()*entry.getValue())  %></td>
                    </tr>
                    <% subTotal += (entry.getKey().getPrix()*entry.getValue()); %>
                       <%
                    }
                }
            %>
                   
                    </tbody>

                </table>

            <p> Sous-total : <%= subTotal %> </p>

            <a href="index?page=viewOrder&actionCommande=add&date=<%= Instant.now().getEpochSecond() %>&montant=<%= subTotal %>&userId=<%= user.getNom() %>" id="caisse">Passer à la caisse</a>
            </div>
        </main>
        <%@include file="footer.jsp" %> 
        <script src="js/javaScript.js"></script>
        <script >
            Translate.init();
        </script>
    </body>
</html>
