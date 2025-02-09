<%-- 
    Document   : caisse
    Created on : 16 avr. 2023, 17 h 50 min 18 s
    Author     : isi
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="entites.Order"%>
<%@page import="entites.User"%>
<%@page import="entites.Product"%>


<%
    ArrayList<User> mesUsers = (ArrayList<User>) request.getAttribute("mesUsers");
    ArrayList<Product> products = (ArrayList<Product>) request.getAttribute("products");
    ArrayList<Order> orders = (ArrayList<Order>) request.getAttribute("orders");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/styles.css"/>
        <style>

        </style>
    </head>

    <body>
        <%@include file="header.jsp" %>
        <main>
            <aside>
                <table>

                    <h3>Recapitulatif de la commande</h3>

                    <tbody>
                        <tr>
                            <th>Prix des Articles</th>
                            <th>Frais de livraison</th>
                            <th>Sous-Total</th>
                            <th>Taxes</th>
                            <th>Total de la Commande</th>
                        </tr>


                        <%for (Product product : products) {%>

                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>

                        <%}%>


                    </tbody>

                </table>
            </aside>

            <section>
                <%for (User aUser : mesUsers) {%>
                <form action="caisse">
                    <div class="adresse">
                        <h3>Saissez votre adresse</h3>
                        
                        <label>Pays</label>
                        <input type="text" id="0" required>

                        <label>Ville</label>
                        <input type="text" id="1" required>

                        <label>Code Postal</label>
                        <input type="text" id="2" required>

                        <label>Numero de Rue</label>
                        <input type="text" id="3" required>

                        <label>Nom de la Rue</label>
                        <input type="text" id="4" required>
                    </div>

                    <div class="paiement">
                        <h3>Mode de Paiement</h3>
                        <label>VISA</label>
                        <input type="radio" id="5" name="paiement" value="visa">
                        <label>MASTERCARD</label>
                        <input type="radio" id="5" name="paiement" value="mastercard">


                        <h4>Informations sur la carte</h4>
                            
                        <label>Nom de la carte</label>
                        <input type="text" name="carte">

                        <label>Numero de la carte</label>
                        <input type="type" name="numero">

                        <label>Date d'Expiration</label>
                        <input type="date">

                        <label>CVC</label>
                        <input type="number">

                    </div>

                    <div>
                        <p>
                            <strong>
                                Votre Commande sera livrée dans les 3 prochains jours à l'adresse 
                                <%= aUser.getAdresse()%> ,Nous vous avons envoyé un courriel à
                                <%=aUser.getCouriel()%> pour toutes les détails complets de votre Achat
                                Nous vous remercions <%=aUser.getNom()%> et à Bientôt
                            </strong>
                        </p>
                    </div>

                    <% }%>

                    <input type="submit" value="Valider">

                </form>
            </section>

        </main>

    </body>

    <%@include file="footer.jsp" %>
</html>
