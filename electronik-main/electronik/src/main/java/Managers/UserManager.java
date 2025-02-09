/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Managers;

import entites.User;
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
public class UserManager {

    ArrayList<User> mesUsers;

    public ArrayList<User> getAll() {

        mesUsers = new ArrayList<>();
        String query = "SELECT * FROM user";
        ConnexionManager connection = new ConnexionManager();
        try {
            ResultSet result = connection.demandeSQL(query);
            while (result.next()) {
                User user = new User(result);
                mesUsers.add(user);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserManager.class.getName()).log(Level.SEVERE, null, ex);
        }

        return mesUsers;
    }

    public User getByAttributes(String username, String password) {
        User unUser = null;

        String query = "SELECT * FROM user WHERE nom_complet LIKE ? and password LIKE ?";

        ConnexionManager connect = new ConnexionManager();

        ArrayList<Object> attributes = new ArrayList<>();
        attributes.add(username);
        attributes.add(password);

        try {
            ResultSet result = connect.demandeSQL(query, attributes);
            while (result.next()) {
                unUser = new User(result);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        return unUser;
    }
    public User getUserById(int id) {

        User unUser = null;

        String query = "SELECT * FROM user WHERE id_user = ?";

        ConnexionManager connect = new ConnexionManager();

        ArrayList<Object> attributes = new ArrayList<>();
        attributes.add(id);

        try {
            ResultSet result = connect.demandeSQL(query, attributes);
            while (result.next()) {
                unUser = new User(result);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        return unUser;
    }

    public int addUsers(String userName, String tel, String couriel, String adresse, String password) {
        int result = 0;
        // récuperation des params
        String query = "INSERT INTO `user` (`nom_complet`, `tel`, `couriel`, `adresse`, `password`, `permission`) VALUES (?, ?, ?, ?, ?, ?)";
        ArrayList<Object> attributes = new ArrayList<>();
        ConnexionManager connection = new ConnexionManager();

        attributes.add(userName);
        attributes.add(tel);
        attributes.add(couriel);
        attributes.add(adresse);
        attributes.add(password);
        attributes.add("client");
        try {
            result = connection.addSQL(query, attributes);
        } catch (SQLException ex) {
            Logger.getLogger(UserManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }
    public int deleteUser(int id){ 
         int result = 0;
        // récuperation des params
        String query = "DELETE FROM user WHERE id_user = ?";
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
