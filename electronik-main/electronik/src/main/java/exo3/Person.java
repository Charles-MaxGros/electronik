/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package exo3;

/**
 *
 * @author isi
 */
import java.time.LocalDate;
import java.util.ArrayList;
 class Person {

    private String ID;
    private String nom;
    private String prenom;
    private String tel;
    private String mail;

    public Person(String ID, String nom, String prenom, String tel, String mail) {
        this.ID = ID;
        this.nom = nom;
        this.prenom = prenom;
        this.tel = tel;
        this.mail = mail;
    }

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }
    

    public void imprimerInfo(Person person) {
        System.out.println(person.ID + person.nom + person.prenom + person.tel + person.mail);
    }
}
class Etudiant extends Person{
       private LocalDate dateEntreeCollege;

    public Etudiant(LocalDate dateEntreeCollege, String ID, String nom, String prenom, String tel, String mail) {
        super(ID, nom, prenom, tel, mail);
        this.dateEntreeCollege = dateEntreeCollege;
    }

    public LocalDate getDateEntreeCollege() {
        return dateEntreeCollege;
    }

    public void setDateEntreeCollege(LocalDate dateEntreeCollege) {
        this.dateEntreeCollege = dateEntreeCollege;
    }
       

}
 class Enseignant extends Person {
   private LocalDate datePriseenfonction;
   private Matiere matiere;

    public Enseignant(LocalDate datePriseenfonction, Matiere matiere, String ID, String nom, String prenom, String tel, String mail) {
        super(ID, nom, prenom, tel, mail);
        this.datePriseenfonction = datePriseenfonction;
        this.matiere = matiere;
    }

    public Matiere getMatiere() {
        return matiere;
    }

    public void setMatiere(Matiere matiere) {
        this.matiere = matiere;
    }

   
    public LocalDate getDatePriseenfonction() {
        return datePriseenfonction;
    }

    public void setDatePriseenfonction(LocalDate datePriseenfonction) {
        this.datePriseenfonction = datePriseenfonction;
    }

    
}

class Departement{
    private String ID;
    private String designation;
    private Person directeur;
    private ArrayList<Note> notes; // Ajout d'une liste de notes


    public Person getDirecteur() {
        return directeur;
    }

    public void setDirecteur(Person directeur) {
        this.directeur = directeur;
    }

    public Departement(String ID, String designation, Person directeur) {
        this.ID = ID;
        this.designation = designation;
        this.directeur = directeur;
    }

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public String getDesignation() {
        return designation;
    }

    public void setDesignation(String designation) {
        this.designation = designation;
    }
    public double calculerMoyenne() {
        int totalNotes = 0;
        int nombreNotes = 0;
        for (Note note : notes) {
            totalNotes += note.getValue();
            nombreNotes++;
        }

        if (nombreNotes > 0) {
            return (double) totalNotes / nombreNotes;
        } else {
            return 0.0; // Aucune note n'est disponible
        }
    }
    
}

class Matiere {
private String ID;
    private String designation;
    private Etudiant[] etudiants;
    private ArrayList<Note> notes; // Ajout d'une liste de notes

    public Matiere(String ID, String designation, Etudiant[] etudiants) {
        this.ID = ID;
        this.designation = designation;
        this.etudiants = etudiants;
        this.notes = new ArrayList<>(); // Initialisation de la liste de notes
    }

    public void addNote(Note note) {
        notes.add(note);
    }

    public Etudiant[] getEtudiants() {
        return etudiants;
    }

    public void setEtudiants(Etudiant[] etudiants) {
        this.etudiants = etudiants;
    }

    

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public String getDesignation() {
        return designation;
    }

    public void setDesignation(String designation) {
        this.designation = designation;
    }
      public double calculerMoyenne() {
        int totalNotes = 0;
        int nombreNotes = 0;
        for(Etudiant et: etudiants)
        for (Note note : notes) {
            totalNotes += note.getValue();
            nombreNotes++;
        }

        if (nombreNotes > 0) {
            return (double) totalNotes / nombreNotes;
        } else {
            return 0.0; // Aucune note n'est disponible
        }
    }


}
 class College {
    private String ID;
    private String nom;
    private String urlSite;
    private Departement[] departements;

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getUrlSite() {
        return urlSite;
    }

    public void setUrlSite(String urlSite) {
        this.urlSite = urlSite;
    }

    public Departement[] getDepartements() {
        return departements;
    }

    public void setDepartements(Departement[] departements) {
        this.departements = departements;
    }

    public College(String ID, String nom, String urlSite, Departement[] dep) {
        this.ID = ID;
        this.nom = nom;
        this.urlSite = urlSite;
    }
}

class Note{
    private String ID;
    private Etudiant etudiant;
    private Matiere matiere;
    private int value;

    public Note(String ID, Etudiant etudiant, Matiere matiere, int value) {
        this.ID = ID;
        this.etudiant = etudiant;
        this.matiere = matiere;
        this.value = value;
    }

    public int getValue() {
        return value;
    }

    public void setValue(int value) {
        this.value = value;
    }
    

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public Etudiant getEtudiant() {
        return etudiant;
    }

    public void setEtudiant(Etudiant etudiant) {
        this.etudiant = etudiant;
    }

    public Matiere getMatiere() {
        return matiere;
    }

    public void setMatiere(Matiere matiere) {
        this.matiere = matiere;
    }
    public void printNote(){
        System.out.println(this.getEtudiant() + " " + this.getValue());
    }
    
}

// Classe Departement manquante

// Exemple d'utilisation
public class Main {
    public static void main(String[] args) {
          LocalDate date = LocalDate.now();
        Etudiant etudiant = new Etudiant(date, "456", "Smith", "Alice", "987654321", "alice@example.com");

        Matiere mathMatiere = new Matiere("MAT101", "Mathématiques", new Etudiant[] { etudiant });

        Note note1 = new Note("N1", etudiant, mathMatiere, 85);
        Note note2 = new Note("N2", etudiant, mathMatiere, 92);

        mathMatiere.addNote(note1);
        mathMatiere.addNote(note2);

        System.out.println("Moyenne en Mathématiques: " + mathMatiere.calculerMoyenne());
    }
    }

