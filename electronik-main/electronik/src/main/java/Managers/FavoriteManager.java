/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Managers;

import entites.Favorite;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import services.ConnexionManager;

/**
 *
 * @author isi
 */
public class FavoriteManager {

    ArrayList<Favorite> favorites;

    public ArrayList<Favorite> getAll() {

        favorites = new ArrayList<>();
        String query = "SELECT * FROM favorite";
        ConnexionManager connection = new ConnexionManager();
        try {
            ResultSet result = connection.demandeSQL(query);
            while (result.next()) {
                Favorite favorite = new Favorite(result);
                favorites.add(favorite);
            }
        } catch (SQLException ex) {
            Logger.getLogger(FavoriteManager.class.getName()).log(Level.SEVERE, null, ex);
        }

        return favorites;
    }

    public Favorite getByUser(int userId, int sku) {

        Favorite favorite = null;

        String query = "SELECT * FROM favorite where  id_client = ? and sku = ?";

        ConnexionManager connect = new ConnexionManager();

        ArrayList<Object> attributes = new ArrayList<>();
        attributes.add(userId);
        attributes.add(sku);

        try {
            ResultSet result = connect.demandeSQL(query, attributes);
            while (result.next()) {
                favorite = new Favorite(result);
            }

        } catch (SQLException ex) {
            Logger.getLogger(FavoriteManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        return favorite;
    }


    public int addFavorite(int idClient, int idProduct) {
        int result = 0;
        // récuperation des params
        String query = "INSERT INTO `favorite` (`id_client`, `sku`) VALUES(?,?)";
        ArrayList<Object> attributes = new ArrayList<>();
        ConnexionManager connection = new ConnexionManager();

        attributes.add(idClient);

        attributes.add(idProduct);
        try {
            result = connection.addSQL(query, attributes);
        } catch (SQLException ex) {
            Logger.getLogger(UserManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    public int deleteFavorite(int idClient, int idProduct) {
        int result = 0;
        // récuperation des params
        String query = "DELETE FROM `favorite` where id_client = ? and sku = ?";
        ArrayList<Object> attributes = new ArrayList<>();
        ConnexionManager connection = new ConnexionManager();

        attributes.add(idClient);
        attributes.add(idProduct);
        try {
            result = connection.addSQL(query, attributes);
        } catch (SQLException ex) {
            Logger.getLogger(UserManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }
}
