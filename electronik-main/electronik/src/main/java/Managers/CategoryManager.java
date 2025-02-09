/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Managers;

import entites.Category;
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
public class CategoryManager {
    
    ArrayList<Category> categories;

    public ArrayList<Category> getAll() {

        categories = new ArrayList<>();
        String query = "SELECT * FROM categorie";
        ConnexionManager connection = new ConnexionManager();
        try {
            ResultSet result = connection.demandeSQL(query);
            while (result.next()) {
                Category category = new Category(result);
                categories.add(category);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CategoryManager.class.getName()).log(Level.SEVERE, null, ex);
        }

        return categories;
    }
    


}
