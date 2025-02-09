<%-- 
    Document   : inscription
    Created on : 17 avr. 2023, 12 h 16 min 54 s
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
                    <h2>Inscription</h2>
                    <p style="display: inline-block; width: 300px; background-color: pink; color: red;"></p>
                    <div class="input_box">
                        <input type="text" placeholder="Entrer votre UserName" required name="user"/>
                        <i class="uil uil-user input"></i>
                    </div>
                    <div class="input_box">
                        <input type="text" name="courriel" id="mail" placeholder="Entrez votre courriel" required> 
                        <i class="uil uil-envelope-alt input"></i>

                    </div>
                    <div class="input_box">
                        <input type="password" placeholder="Enter votre password" required name="password"/>
                        <i class="uil uil-lock password"></i>
                        <i class="uil uil-eye-slash pw_hide"></i>
                    </div>
                    <div class="input_box">
                        <input type="text" name="telephone" id="cellulaire" placeholder="Entrez votre cellulaire" maxlength="12"> 
                        <i class="uil uil-phone-alt input"></i>
                    </div>


                    <div class="input_box">
                        <input type="text" id="adresse" name="adresse" required placeholder="Entrez votre adresse civique">
                        <i class="uil uil-map input"></i>
                    </div>  
                    <input type="hidden" name ="action" value="sign"/>
                    <input type="submit" class="button" id="login" value="login Now" 
                           style="
                           width: 100%;
                           padding: 10px;
                           background-color: blue;
                           color: white;
                           border: none;
                           border-radius: 5px;
                           cursor: pointer;
                           margin-top: 30px;"  />

                    <div class="login_signup">Vous avez déja un compte? <a href="index?page=login" id="signup">Connexion</a></div>
                </form>
            </div>
        </div> 

    </body>
</html>
