<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="entites.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entites.User"%>
<%    HashMap<Product,Integer> productToCart = (HashMap<Product,Integer>) request.getAttribute("produitsAddToCart");
      int nbProd = (int)request.getAttribute("nbProduit");
    User user = null;
    if (session != null) {
        //test que la session existe pour le cas getSession(false
        if (session.getAttribute("userID") != null) {
            user = (User) session.getAttribute("userID");
        }

    } %>
<header>
    <div class="logo"></div>

    <% if (user != null) {%>
    <div class="greatDiv">
        <div id="great"> </div>
        <span><%= user.getNom()%></span>
        <a href="index?deconnexion=oui">Deconnexion</a>
    </div>

    <% } else {%>


    <div >
        <i class="uil uil-user" style="font-size: 30px"></i>
        <ul id="connectPanel">

        </ul >



    </div>
    <%}%>
    <div class="langCartPanel">
        <i class="uil uil-shopping-cart shoppingCartIcon " id="shoppingCartIcon"></i>
        <span id="cartCount" ><%= nbProd %></span>
        <div id="cart" class="hidden" >
            <% if (productToCart != null) {
                     for (Map.Entry<Product, Integer> entry : productToCart.entrySet())  {
            %>
            <div class="cartItem">
                <div class="cartItemImage" style=" background-image: url('<%= entry.getKey().getUrlImage1Produit()%>'); "></div>
                <div id="nomProduit" style=" width: 150px; height: 50px; overflow: hidden; ">
                    <%= entry.getKey().getNom()%>
                </div>
                <form action="index">
                    <input type="hidden"  name="ProduitCartParam" value="<%= entry.getKey().getSku() %>">
                    <input type="submit" value="+" name="actionOnCartProduct">
                    <input type="number" name="qty" style="width: 30px" value="<%= entry.getValue() %>">
                    <input type="submit" value="-" name="actionOnCartProduct">
                </form>
            </div>
            <%
                    }
                }
            %>
            <button ><a href="index?page=viewOrder">Checkout</a></button>
        </div>
        <div>
            <div class="select-menu">
                <div class="select-btn sBtn-text">
                    <img src="images/lang/francais.png" alt="alt" data-lang="fr"/>

                </div>

                <ul class="options">
                    <li class="option" data-lang="fr">
                        <img src="images/lang/francais.png" alt="alt" />
                    </li>
                    <li class="option"data-lang="en">
                        <img src="images/lang/usa.png" alt="alt" />

                    </li>
                    <li class="option" data-lang="sp">
                        <img src="images/lang/espagne.png" alt="alt" />


                </ul>
            </div>
        </div>
    </div>
    <script >
        const cart = document.getElementById("cart");
        const shoppingCartIcon = document.getElementById("shoppingCartIcon");
        const cartCount = document.getElementById("cartCount");
        shoppingCartIcon.addEventListener("click", () => {
            cart.classList.toggle("hidden");
        });
      
    </script>
</header>
