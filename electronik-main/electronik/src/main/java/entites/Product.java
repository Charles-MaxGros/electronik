
package entites;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author isi
 */
public class Product {

    int sku;
    String nom;
    String desc;
    double prix;
    int idCategorie;
    String urlImage1Produit;
    String urlImage2Produit;
    String urlImage3Produit;
    String urlImage4Produit;
    int rate;
    
 public Product(ResultSet result) {
        try {
            sku = result.getInt("sku");
            nom = result.getString("nom_produit");
            desc = result.getString("desc_produit");
            prix = result.getDouble("prix");
            idCategorie = result.getInt("id_categorie");
            urlImage1Produit = result.getString("url_image1_produit");
            urlImage2Produit = result.getString("url_image2_produit");
            urlImage3Produit = result.getString("url_image3_produit");
            urlImage4Produit = result.getString("url_image4_produit");
            rate = result.getInt("rate");

        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int getSku() {
        return sku;
    }

    public String getNom() {
        return nom;
    }

    public String getDesc() {
        return desc;
    }

    public double getPrix() {
        return prix;
    }

    public int getIdCategorie() {
        return idCategorie;
    }

    public String getUrlImage1Produit() {
        return urlImage1Produit;
    }

    public String getUrlImage2Produit() {
        return urlImage2Produit;
    }

    public String getUrlImage3Produit() {
        return urlImage3Produit;
    }

    public String getUrlImage4Produit() {
        return urlImage4Produit;
    }

    public void setRate(int rate) {
        this.rate = rate;
    }

    public int getRate() {
        return rate;
    }

    public void setSku(int sku) {
        this.sku = sku;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public void setPrix(double prix) {
        this.prix = prix;
    }

    public void setIdCategorie(int idCategorie) {
        this.idCategorie = idCategorie;
    }

    public void setUrlImage1Produit(String urlImage1Produit) {
        this.urlImage1Produit = urlImage1Produit;
    }

    public void setUrlImage2Produit(String urlImage2Produit) {
        this.urlImage2Produit = urlImage2Produit;
    }

    public void setUrlImage3Produit(String urlImage3Produit) {
        this.urlImage3Produit = urlImage3Produit;
    }

    public void setUrlImage4Produit(String urlImage4Produit) {
        this.urlImage4Produit = urlImage4Produit;
    }
 
}
