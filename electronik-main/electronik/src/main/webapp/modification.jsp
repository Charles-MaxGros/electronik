<%-- 
    Document   : modification
    Created on : 20 avr. 2023, 20 h 11 min 10 s
    Author     : isi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css" />

    </head>
    <body>
        <div class="inscription">
            <div class="form login_form">
                <form action="formulaire" method="post">
                    <h2>Nouveau Client</h2>
                    <p style="display: inline-block; width: 200px; background-color: red; color: blueviolet;"></p>
                    <div class="input_box">
                        <input type="text" placeholder="UserName du client" required name="user"/>
                        <i class="uil uil-user input"></i>
                    </div>
                    <div class="input_box">
                        <input type="text" name="courriel" id="mail" placeholder="Nouveau courriel" required> 
                        <i class="uil uil-envelope-alt input"></i>

                    </div>
                    <div class="input_box">
                        <input type="password" placeholder="Enter le password" required name="Password du client"/>
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
                    <input type="submit" class="button" id="login" value="loginNow" />

                </form>
            </div>
        </div> 

    </body>
</html>
