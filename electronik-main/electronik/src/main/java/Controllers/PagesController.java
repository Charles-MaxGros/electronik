/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import Managers.CategoryManager;
import Managers.FavoriteManager;
import Managers.OrderManager;
import Managers.PanierManager;
import Managers.ProductManager;
import Managers.UserManager;
import entites.Category;
import entites.Product;
import entites.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Base64;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import jdk.javadoc.internal.tool.Main;

/**
 *
 * @author isi
 */
@WebServlet(name = "pages", urlPatterns = {"/index"})
public class PagesController extends HttpServlet {

    ProductManager productManager = new ProductManager();
    CategoryManager categoryManager = new CategoryManager();
    UserManager usermanager = new UserManager();
    FavoriteManager favoriteManager = new FavoriteManager();
    OrderManager orderManage = new OrderManager();
    PanierManager panierManager = new PanierManager();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String pagesParams = request.getParameter("page");
        String categoryIdParams = request.getParameter("categoryId");
        String deconexionParams = request.getParameter("deconnexion");
        String actionCommandeParam = request.getParameter("actionCommande");
        String main = request.getParameter("main");
        panierManager.Init(request);
        String errorMessage = request.getParameter("errorMessage");
        String actionProduitParam = request.getParameter("actionProduit");
        String ProduitCartParam = request.getParameter("ProduitCartParam");
        String actionOnCartProduct = request.getParameter("actionOnCartProduct");
        String productIdParam = request.getParameter("productId");
        String dateCommandeParam = request.getParameter("date");
        String montantCommandeParam = request.getParameter("montant");
        String redirection = "index.jsp";
        String actionAdminParam = request.getParameter("actionAdmin");
        String IdClientParam = request.getParameter("IdClient");
        HttpSession session = request.getSession();

        ArrayList<Product> produits = productManager.getAll();
        int resultAddToFav = -1;
        if (deconexionParams != null) {
            session.invalidate();
            response.sendRedirect("login.jsp");
        } else {
            ArrayList<Category> categories = new ArrayList<>();
            if (actionOnCartProduct != null) {
                if (actionOnCartProduct.equals("+")) {
                    panierManager.add(Integer.parseInt(ProduitCartParam));
                } else if (actionOnCartProduct.equals("-")) {
                    panierManager.remove(Integer.parseInt(ProduitCartParam));

                }
            }

            if (null == pagesParams) {
                redirection = "index.jsp";

            } else {
                switch (pagesParams) {
                    case "index":
                        categories = categoryManager.getAll();
                        request.setAttribute("categories", categories);
                        redirection = "index.jsp";
                        break;
                    case "catalogue":
                        if (categoryIdParams != null) {
                            produits = productManager.getByCategory(Integer.parseInt(categoryIdParams));
                        }
                        if (productIdParam != null) {
                            if (actionProduitParam != null && actionProduitParam.equals("addToFavorite")) {
                                if (session != null && session.getAttribute("userID") != null) {
                                    User currentUser = (User) session.getAttribute("userID");
                                    if (favoriteManager.getByUser(currentUser.getIdUser(), Integer.parseInt(productIdParam)) != null) {
                                        resultAddToFav = favoriteManager.deleteFavorite(currentUser.getIdUser(), Integer.parseInt(productIdParam));
                                    } else {
                                        resultAddToFav = favoriteManager.addFavorite(currentUser.getIdUser(), Integer.parseInt(productIdParam));

                                    }

                                }

                            }
                            if (actionProduitParam != null && actionProduitParam.equals("addToCart")) {
                                if (session != null) {
                                    panierManager.add(Integer.parseInt(productIdParam));

                                }

                            }
                        }

                        request.setAttribute("produits", produits);

                        categories = categoryManager.getAll();
                        request.setAttribute("categories", categories);
                        redirection = "catalogue.jsp";
                        break;
                    case "contact":
                        redirection = "contact.jsp";
                        break;
                    case "login":
                        if (errorMessage != null) {
                            request.setAttribute("errorMessage", "Identifiant ou Mot de passe Invalide");
                        }
                        redirection = "login.jsp";
                        break;
                    case "sign":
                        redirection = "inscription.jsp";
                        break;
                    case "ajouter":
                        redirection = "formulaire.jsp";
                        break;
                   
                    case "modifier":
                        redirection = "modification.jsp";
                        break;

                    case "admin":
                        request.setAttribute("mesUsers", usermanager.getAll());
                        request.setAttribute("orders", orderManage.getAll());
                        request.setAttribute("products", productManager.getAll());

                        if (main != null) {

                            if (main.equals("clients")) {

                                request.setAttribute("include", "clients");
                                if (actionAdminParam != null && actionAdminParam.equals("delete")) {
                                    if (IdClientParam != null) {
                                        int nb = usermanager.deleteUser(Integer.parseInt(IdClientParam));
                                        redirection = "administrateur.jsp";
                                    }
                                }
                            } else if (main.equals("commandes")) {
                                request.setAttribute("include", "commandes");
                                if (actionAdminParam != null && actionAdminParam.equals("delete")) {
                                    if (IdClientParam != null) {
                                        int nb = orderManage.deleteOrder(Integer.parseInt(IdClientParam));
                                        redirection = "administrateur.jsp";
                                    }
                                }
                            } else if (main.equals("produits")) {
                                request.setAttribute("include", "produits");
                                if (actionAdminParam != null && actionAdminParam.equals("delete")) {
                                    if (IdClientParam != null) {
                                        int nb = productManager.deleteProduct(Integer.parseInt(IdClientParam));
                                        redirection = "administrateur.jsp";
                                    }
                                }
                            }
                        }

                        redirection = "administrateur.jsp";
                        break;

                    case "detailproduit":
                        if (productIdParam != null) {
                            Product produit = productManager.getOneProduct(Integer.parseInt(productIdParam));
                            request.setAttribute("produit", produit);

                            Cookie userIdCookie = new Cookie(Base64.getEncoder().withoutPadding().encodeToString(String.valueOf("produit" + produit.getSku()).getBytes()), String.valueOf(produit.getSku()));
                            response.addCookie(userIdCookie);
                        }
                        redirection = "detailproduit.jsp";
                        break;

                    case "viewOrder":
                        if (session.getAttribute("userID") != null) {
                            redirection = "panier.jsp";
                            if (actionCommandeParam != null && actionCommandeParam.equals("add")) {
                                orderManage.addOrder(Integer.parseInt(dateCommandeParam), Double.parseDouble(montantCommandeParam), ((User) session.getAttribute("userID")).getIdUser(), request);

                            }

                        } else {
                            redirection = "login.jsp";

                        }

                        break;

                    default:
                        redirection = "index.jsp";
                        break;
                }
            }

            if (session.getAttribute("panier") != null) {
                HashMap<Integer, Integer> panier = ((HashMap<Integer, Integer>) session.getAttribute("panier"));
                HashMap<Product, Integer> produitToCart = new HashMap<>();
                for (Map.Entry<Integer, Integer> entry : panier.entrySet()) {
                    Product prd = productManager.getOneProduct((int) entry.getKey());
                    produitToCart.put(prd, entry.getValue());
                }

                request.setAttribute("produitsAddToCart", produitToCart);
            }
            if (session.getAttribute("userID") != null) {
                ArrayList<Product> produitsFavoris = productManager.getUserFavorites(((User) session.getAttribute("userID")).getIdUser());
                request.setAttribute("produitsFavoris", produitsFavoris);

            }
            int nb = panierManager.countNbArticle(request);
            categories = categoryManager.getAll();
            request.setAttribute("categories", categories);
            request.setAttribute("nbProduit", nb);
            request.setAttribute("produits", produits);
            request.getRequestDispatcher(redirection).forward(request, response);
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
