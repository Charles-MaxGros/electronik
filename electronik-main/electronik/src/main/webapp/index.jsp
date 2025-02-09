<%-- 
    Document   : index
    Created on : Apr 10, 2023, 11:50:32 AM
    Author     : isi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/styles.css"/>
        <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css" />

    </head>
    <body>
        <%@include file="header.jsp" %> 
        <%@include file="navbar.jsp" %> 
        <main><div><%@include file="accueil.jsp" %> </div></main>
            <%@include file="footer.jsp" %> 
        <script src="js/javaScript.js"></script>
        <script >
            const cards = document.querySelectorAll(".card");
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
    </body>
</html>
