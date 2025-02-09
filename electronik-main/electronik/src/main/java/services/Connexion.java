/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package services;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author isi
 */
public class Connexion {

    Connection connection;

    public Connexion() {

        try {
            //connexion a la bd

            Class.forName("org.mariadb.jdbc.Driver");  //charger le diver MariaDB
            String urlServeur = "jdbc:mariadb://localhost:3310/electronik";
            String identifiant = "root";
            String motDePasse = "abc123...";
            Connection connexion = DriverManager.getConnection(urlServeur, identifiant, motDePasse);
            this.connection = connexion;
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Connexion.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ResultSet demandeSQL(String query) throws SQLException {

        PreparedStatement preparedStatement = connection.prepareStatement(query);
        ResultSet result = preparedStatement.executeQuery();

        return result;
    }

    public ResultSet demandeSQL(String query, ArrayList<Object> param) throws SQLException {

        PreparedStatement preparedStatement = connection.prepareStatement(query);
        if (param != null) {
            for (int i = 0; i < param.size(); i++) {
                if (param.get(i).getClass().getName().equals("java.lang.String")) {
                    preparedStatement.setString(i + 1, (String) param.get(i));

                } else if (param.get(i).getClass().getName().equals("java.lang.Integer")) {
                    preparedStatement.setInt(i + 1, (int) param.get(i));

                } else {
                    preparedStatement.setDouble(i + 1, (double) param.get(i));

                }
            }
        }
        ResultSet result = preparedStatement.executeQuery();
        return result;
    }

    public int addSQL(String query, ArrayList<Object> param) throws SQLException {
        PreparedStatement preparedStatement = connection.prepareStatement(query);
        if (param != null) {
            for (int i = 0; i < param.size(); i++) {
                if (param.get(i).getClass().getName().equals("java.lang.String")) {
                    preparedStatement.setString(i + 1, (String) param.get(i));

                } else if (param.get(i).getClass().getName().equals("java.lang.Integer")) {
                    preparedStatement.setInt(i + 1, (int) param.get(i));

                } else {
                    preparedStatement.setDouble(i + 1, (double) param.get(i));

                }
            }
        }
        int result = preparedStatement.executeUpdate();
        return result;
    }

    public int modifierSQL(String query) throws SQLException {

        PreparedStatement preparedStatement = connection.prepareStatement(query);
        int result = preparedStatement.executeUpdate();

        return result;
    }

    public int modifierSQL(String query, ArrayList<Object> param) throws SQLException {

        PreparedStatement preparedStatement = connection.prepareStatement(query);
        if (param != null) {
            for (int i = 1; i < param.size(); i++) {
                if (param.get(i).getClass().equals("class java.lang.String")) {
                    preparedStatement.setString(i, (String) param.get(i));

                } else {
                    preparedStatement.setInt(i, Integer.parseInt((String) param.get(i)));

                }
            }
        }
        int result = preparedStatement.executeUpdate();
        return result;
    }
}
