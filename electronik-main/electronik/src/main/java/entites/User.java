/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entites;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author isi
 */
public class User {

    int idUser;
    String nom;
    String tel;
    String couriel;
    String adresse;
    String password;
    String permission;

    public User(ResultSet result) {
        try {
            idUser = result.getInt("id_user");
            nom = result.getString("nom_complet");
            tel = result.getString("tel");
            couriel = result.getString("couriel");
            adresse = result.getString("adresse");
            password = result.getString("password");
           permission = result.getString("permission");

        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int getIdUser() {
        return idUser;
    }

    public String getNom() {
        return nom;
    }

    public String getTel() {
        return tel;
    }

    public String getCouriel() {
        return couriel;
    }

    public String getAdresse() {
        return adresse;
    }

    public String getPassword() {
        return password;
    }

    public String getPermission() {
        return permission;
    }
    
}
