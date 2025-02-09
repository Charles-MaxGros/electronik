/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package services;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import services.Connexion;

/**
 *
 * @author isi
 */
public class ConnexionManager {

    public ConnexionManager() {
    }

    public ResultSet demandeSQL(String query) throws SQLException {
        Connexion connexion = new Connexion();
        ResultSet result = connexion.demandeSQL(query);
        return result;

    }

    public ResultSet demandeSQL(String query, ArrayList<Object> param) throws SQLException {

        Connexion connexion = new Connexion();
        ResultSet result = connexion.demandeSQL(query, param);

        return result;
    }

    public int modifierSQL(String query) throws SQLException {
        Connexion connexion = new Connexion();
        int result = connexion.modifierSQL(query);
        return result;
    }
    public int modifierSQL(String query, ArrayList<Object> param) throws SQLException {

        Connexion connexion = new Connexion();
        int result = connexion.modifierSQL(query, param);

        return result;
    }
    public int addSQL(String query, ArrayList<Object> param) throws SQLException {

        Connexion connexion = new Connexion();
        int result = connexion.addSQL(query, param);

        return result;
    }
}
