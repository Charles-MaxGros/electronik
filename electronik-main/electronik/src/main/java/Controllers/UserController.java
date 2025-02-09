/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controllers;

import Managers.UserManager;
import entites.User;
import java.io.IOException;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author isi
 */
@WebServlet(name = "login", urlPatterns = {"/login"})
public class UserController extends HttpServlet {

    UserManager usermanager = new UserManager();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //1 param
        String userParam = req.getParameter("userclient");
        String passwordParam = req.getParameter("password");

        // 1 recuperation des valeurs du formulaire d'inscription
        String usernameParam = req.getParameter("user");
        String courrielParam = req.getParameter("courriel");
        String motDePasseParam = req.getParameter("motdepasse");
        String cellulaireParam = req.getParameter("telephone");
        String adresseParam = req.getParameter("adresse");
        String actionParam = req.getParameter("action");

        int resultatAddUsers = 0;

        // Ajouter un client par l'Administrateur
        if (actionParam.equals("formulaire")) {
            if (usernameParam != null && courrielParam != null && motDePasseParam != null && adresseParam != null && cellulaireParam != null) {
                resultatAddUsers = usermanager.addUsers(usernameParam, cellulaireParam, courrielParam, adresseParam, motDePasseParam);

                if (resultatAddUsers != 0) {
                    resp.sendRedirect("index?page=admin&main=clients");
                }
            }
        }

        //2 creer un compte utilisateur
        if (actionParam.equals("sign")) {
            if (usernameParam != null && courrielParam != null && motDePasseParam != null && adresseParam != null) {
                resultatAddUsers = usermanager.addUsers(usernameParam, cellulaireParam, courrielParam, adresseParam, motDePasseParam);

                if (resultatAddUsers != 0) {
                    resp.sendRedirect("index?page=admin");

                }

            }
        } else if (actionParam.equals("login")) {
            User user;
            HashMap<Integer, Integer> cartMap = new HashMap<>();
            // traitement
            if (userParam != null && passwordParam
                    != null) {
                user = usermanager.getByAttributes(userParam, passwordParam);

                if (user != null) {
                    HttpSession session = req.getSession();

                    session.setAttribute("userID", user);
                    session.setAttribute("cart", cartMap);

                    // Rediriger vers la page d'accueil
                    if (user.getPermission().equals("client")) {
                        resp.sendRedirect("index");

                    } else if (user.getPermission().equals("admin")) {
                        resp.sendRedirect("index?page=admin");

                    }

                } else {
                    resp.sendRedirect("index?page=login&errorMessage=IdentifiantInvalide");
                }

            }

        }

    }
}
