<%-- 
    Document   : formulaire.jsp
    Created on : 20 avr. 2023, 19 h 39 min 41 s
    Author     : isi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/styles.css"/>
        <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css" />
    </head>
    <body>
        <div class="inscription">
            <div class="form login_form">
                <form action="login" method="post">
                    <h2>Nouveau Client</h2>
                    <p style="display: inline-block; width: 200px; background-color: red; color: blueviolet;"></p>
                    <div class="input_box">
                        <input type="text" placeholder="UserName du client" required name="user"/>
                        <i class="uil uil-user input"></i>
                    </div>
                    <div class="input_box">
                        <input type="text" name="courriel" id="mail" placeholder="Courriel du client" required> 
                        <i class="uil uil-envelope-alt input"></i>

                    </div>
                    <div class="input_box">
                        <input type="password" placeholder="Password du client" required name="password"/>
                        <i class="uil uil-lock password"></i>
                        <i class="uil uil-eye-slash pw_hide"></i>
                    </div>
                    <div class="input_box">
                        <input type="text" name="telephone" id="cellulaire" placeholder="Cellulaire du client" maxlength="12"> 
                        <i class="uil uil-phone-alt input"></i>
                    </div>

                    <div class="input_box">
                        <input type="text" id="adresse" name="adresse" required placeholder="Adresse civique du client">
                        <i class="uil uil-map input"></i>
                    </div>  
                    <input type="hidden" name ="action" value="formulaire"/>
                    <input type="submit" class="button" id="envoi" value="Enregistrer" 
                           style="width: 100%;
                           padding: 10px;
                           background-color: #ff0000;
                           color: #fff;
                           border: none;
                           border-radius: 5px;
                           cursor: pointer;
                           margin-top: 30px;  "  />

                </form>
            </div>
        </div> 

    </body>
</html>
