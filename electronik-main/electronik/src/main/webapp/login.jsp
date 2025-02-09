<%-- 
    Document   : login
    Created on : Apr 15, 2023, 3:37:49 PM
    Author     : isi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% String errorMessage = (String) request.getAttribute("errorMessage");%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/styles.css"/>
        <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css" />

    </head>
    <body>
        <div class="login">
            <div class="form login_form">
                <form action="login" method="post">
                    <h2>Connexion</h2>
                    <p style="display: inline-block; width: 250px; background-color: pink; color: red;"><%
                        if (errorMessage != null) {
                            out.print(errorMessage);
                        }
                        %></p>
                    <div class="input_box">
                        <input type="text" placeholder="Entrer votre UserName" required name="userclient"/>
                        <i class="uil uil-envelope-alt email"></i>
                    </div>
                    <div class="input_box">
                        <input type="password" placeholder="Enter your password" required name="password"/>
                        <i class="uil uil-lock password"></i>
                        <i class="uil uil-eye-slash pw_hide"></i>
                    </div>
                    <input type="hidden" name ="action" value="login"/>
                    <input type="submit" class="button" id="login" value="login Now"
                           style="width: 100%;
                           padding: 10px;
                           background-color: blue;
                           color: black;
                           border: none;
                           border-radius: 5px;
                           cursor: pointer;
                           margin-top: 30px;  " />

                    <div class="login_signup">Vous n'avez pas de compte ? <a href="index?page=sign" id="signup">Inscrivez-Vous</a>
                    </div>
                </form>
            </div>
        </div>
    </body>
    <script>
        home = document.querySelector(".home"),
                formContainer = document.querySelector(".form_container"),
                signupBtn = document.querySelector("#signup"),
                loginBtn = document.querySelector("#login"),
                pwShowHide = document.querySelectorAll(".pw_hide");


        pwShowHide.forEach((icon) => {
            icon.addEventListener("click", () => {
                let getPwInput = icon.parentElement.querySelector("input");
                if (getPwInput.type === "password") {
                    getPwInput.type = "text";
                    icon.classList.replace("uil-eye-slash", "uil-eye");
                } else {
                    getPwInput.type = "password";
                    icon.classList.replace("uil-eye", "uil-eye-slash");
                }
            });
        });


    </script>
</html>
