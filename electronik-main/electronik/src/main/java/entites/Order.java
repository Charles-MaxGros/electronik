/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entites;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author isi
 */
public class Order {
   int id;
   Date date;
   double montant;
   int idClient;
   int sku;
   
     public Order(ResultSet result) {
        try {
            id = result.getInt("id_commande");
            date = new Date (result.getLong("date_commande"));
            montant = result.getDouble("montant");
            idClient= result.getInt("id_client");
           
        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int getId() {
        return id;
    }

    public Date getDate() {
        return date;
    }

    public double getMontant() {
        return montant;
    }

    public int getIdClient() {
        return idClient;
    }

    public int getSku() {
        return sku;
    }
    
}
