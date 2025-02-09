/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Managers;

import entites.Product;
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
public class ProductManager {

    ArrayList<Product> mesProducts;
    Product produit;

    public ArrayList<Product> getAll() {

        mesProducts = new ArrayList<>();
        String query = "SELECT * FROM produit";
        ConnexionManager connection = new ConnexionManager();
        try {
            ResultSet result = connection.demandeSQL(query);
            while (result.next()) {
                produit = new Product(result);
                mesProducts.add(produit);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductManager.class.getName()).log(Level.SEVERE, null, ex);
        }

        return mesProducts;
    }

    public Product getOneProduct(int sku) {

        String query = "SELECT * FROM produit where sku = ?";

        ConnexionManager connect = new ConnexionManager();

        ArrayList<Object> attributes = new ArrayList<>();
        attributes.add(sku);

        try {
            ResultSet result = connect.demandeSQL(query, attributes);
            while (result.next()) {
                produit = new Product(result);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ProductManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        return produit;
    }

    public ArrayList<Product> getByCategory(int categoryId) {

        String query = "SELECT * FROM produit where id_categorie = ?";
        ArrayList<Product> products = new ArrayList<>();
        ConnexionManager connect = new ConnexionManager();

        ArrayList<Object> attributes = new ArrayList<>();
        attributes.add(categoryId);

        try {
            ResultSet result = connect.demandeSQL(query, attributes);
            while (result.next()) {
                produit = new Product(result);
                products.add(produit);

            }

        } catch (SQLException ex) {
            Logger.getLogger(ProductManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }

    public ArrayList<Product> getUserFavorites(int idUser) {

        String query = "SELECT * FROM produit  INNER JOIN favorite  ON produit.sku = favorite.sku INNER JOIN user ON favorite.id_client = user.id_user WHERE user.id_user = ?";
        ArrayList<Product> products = new ArrayList<>();
        ConnexionManager connect = new ConnexionManager();

        ArrayList<Object> attributes = new ArrayList<>();
        attributes.add(idUser);

        try {
            ResultSet result = connect.demandeSQL(query, attributes);
            while (result.next()) {
                produit = new Product(result);
                products.add(produit);

            }

        } catch (SQLException ex) {
            Logger.getLogger(ProductManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }

    public int deleteProduct(int id) {
        int result = 0;
        // récuperation des params
        String query = "DELETE FROM produit WHERE sku = ?";
        ArrayList<Object> attributes = new ArrayList<>();
        ConnexionManager connection = new ConnexionManager();

        attributes.add(id);
        try {
            result = connection.addSQL(query, attributes);
        } catch (SQLException ex) {
            Logger.getLogger(UserManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }
}
