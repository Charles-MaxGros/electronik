/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entites;

/**
 *
 * @author isi
 */
public class CartObject {
    int idProduct;
    int quantite;

    public CartObject(int idProduct, int quantite) {
        this.idProduct = idProduct;
        this.quantite = quantite;
    }

    public void setQuantite(int quantite) {
        this.quantite = quantite;
    }

    public void setIdProduct(int idProduct) {
        this.idProduct = idProduct;
    }

    public int getIdProduct() {
        return idProduct;
    }

    public int getQuantite() {
        return quantite;
    }
    
    
    
}
