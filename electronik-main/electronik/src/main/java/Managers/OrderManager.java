/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Managers;

import entites.Order;
import entites.Order;
import entites.Product;
import java.net.http.HttpRequest;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import services.ConnexionManager;

/**
 *
 * @author isi
 */
public class OrderManager {

    ArrayList<Order> orders;
    ProductManager productManager = new ProductManager();

    public ArrayList<Order> getAll() {

        orders = new ArrayList<>();
        String query = "SELECT * FROM commande";
        ConnexionManager connection = new ConnexionManager();
        try {
            ResultSet result = connection.demandeSQL(query);
            while (result.next()) {
                Order order = new Order(result);
                orders.add(order);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderManager.class.getName()).log(Level.SEVERE, null, ex);
        }

        return orders;
    }

    public Order getByClient(String userId) {

        Order order = null;

        String query = "SELECT * FROM ordere where id_client = ?";

        ConnexionManager connect = new ConnexionManager();

        ArrayList<Object> attributes = new ArrayList<>();
        attributes.add(userId);

        try {
            ResultSet result = connect.demandeSQL(query, attributes);
            while (result.next()) {
                order = new Order(result);
            }

        } catch (SQLException ex) {
            Logger.getLogger(OrderManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        return order;
    }

    public int addOrder(int date, double montant, int id_client, HttpServletRequest request) {
        int result = 0;
        Order lastOrder = null;
        // récuperation des params
        String query = "INSERT INTO `commande` (`date_commande`, `montant`, id_client) VALUES(?,?,?)";
        ArrayList<Object> attributes = new ArrayList<>();
        ConnexionManager connection = new ConnexionManager();

        attributes.add(date);

        attributes.add(montant);

        attributes.add(id_client);
        try {
            result = connection.addSQL(query, attributes);
        } catch (SQLException ex) {
            Logger.getLogger(UserManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        
         String query3 = "SELECT * FROM commande where id_client = ? and date_commande = ? and montant = ?";

        ConnexionManager connect = new ConnexionManager();

        ArrayList<Object> attributesSearch = new ArrayList<>();
        attributesSearch.add(id_client);
        attributesSearch.add(date);
        attributesSearch.add(montant);
        try {
            ResultSet res = connect.demandeSQL(query3, attributesSearch);
            while (res.next()) {
                lastOrder = new Order(res);
            }

        } catch (SQLException ex) {
            Logger.getLogger(OrderManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        HttpSession session = request.getSession();
        if (session != null) {
            if (session.getAttribute("panier") != null) {
                HashMap<Integer, Integer> panier = ((HashMap<Integer, Integer>) session.getAttribute("panier"));
                HashMap<Product, Integer> produitToCart = new HashMap<>();
                for (Map.Entry<Integer, Integer> entry : panier.entrySet()) {
                    query = "INSERT INTO `detail_commande` (id_commande, sku , quantite) VALUES(?,?,?)";
                    attributes = new ArrayList<>();
                    connection = new ConnexionManager();
                    attributes.add(lastOrder.getId());
                    attributes.add(entry.getKey());
                    attributes.add(entry.getValue());
                    try {
                        result = connection.addSQL(query, attributes);
                    } catch (SQLException ex) {
                        Logger.getLogger(UserManager.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }

            }
        }

        return result;
    }
    public int deleteOrder(int id){ 
         int result = 0;
        // récuperation des params
        String query = "DELETE FROM commande WHERE id_commande = ?";
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
