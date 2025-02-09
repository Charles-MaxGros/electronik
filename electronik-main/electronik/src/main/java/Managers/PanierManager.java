/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Managers;

import entites.CartObject;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpSession;

/**
 *
 * @author isi
 */
public class PanierManager {

    HashMap<Integer, Integer> panier;
    HttpSession session;
    ArrayList<CartObject> cartItems;

    public void Init(HttpServletRequest request) {
        session = request.getSession();
        panier = (HashMap<Integer, Integer>) session.getAttribute("panier");
    }

    public HashMap<Integer, Integer> getAll() {
        HashMap retour = new HashMap<>();
        if (session != null && panier != null) {
            retour = panier;
        }
        return retour;
    }

    public void add(int idProduct) {
        if (panier == null) {
            panier = new HashMap<>();
            session.setAttribute("panier", panier);

            panier.put(idProduct, 1);

        } else if (panier.containsKey(idProduct) == true) {
            int quantite = 1;
            quantite += panier.get(idProduct);
            panier.put(idProduct, quantite);
        } else {
            panier.put(idProduct, 1);
        }
        
    }

    public void remove(int idProduct) {
        if (panier == null) {
            panier = new HashMap<>();

        } else if (panier.containsKey(idProduct) == true) {
            if (panier.get(idProduct) > 1) {
                int quantite = 1;
                quantite = panier.get(idProduct)- quantite;
                panier.put(idProduct, quantite);
            } else {
                panier.remove(idProduct);

            }
        } else {
            panier.put(idProduct, 0);
        }
    }

    public int countNbArticle(HttpServletRequest request) {
        int nb = 0;
        panier = (HashMap<Integer, Integer>) session.getAttribute("panier");
        if (panier != null) {
            for (Map.Entry<Integer, Integer> entry : panier.entrySet()) {
                nb += entry.getValue();
            }
        }
        return nb;
    }
}
