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
public class Category {
    int id;
    String nom;
     public Category(ResultSet result) {
        try {
            id = result.getInt("id_categorie");
            nom = result.getString("nom_categorie");
           

        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }
     }

    public int getId() {
        return id;
    }

    public String getNom() {
        return nom;
    }
}
