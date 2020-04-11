/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package br.com.hospitalif.rascunho;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/*
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.hibernate.cfg.Settings;*/
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import br.com.hospitalif.app.Inicio;
import br.com.hospitalif.model.Pessoa;
import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;

/**
 *
 * @author Daniel
 * 
 */

public class Testy extends Application {

	/// @SuppressWarnings("unused")
	/// private static final Logger LOG = LogManager.getLogger(Inicio.class);

	@Override
	public void start(Stage primaryStage) throws Exception {

		try {

			Parent root = FXMLLoader.load(getClass().getResource("../view/Login.fxml"));

			Scene sena = new Scene(root);
			primaryStage.setScene(sena);
			primaryStage.show();

			primaryStage.setTitle("Hospital IF");

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	static final Logger logger = LogManager.getLogger(Inicio.class.getName());

	public static void main(String[] args) {

		// Pessoa pessoa = new Pessoa();
		// pessoa.setNome("Pessoa");

		

		System.out.println("Carregando... ");

		launch(args);
		
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("bdPU");
		EntityManager em = emf.createEntityManager();
		
		em.getTransaction().begin();
		
		// EntityManagerFactory factory =
		// Persistence.createEntityManagerFactory("bdPU");

		// EntityManager manager = factory.createEntityManager();

		// em.getTransaction().begin();
		// em.persist(pessoa);
		// em.getTransaction().commit();

		// System.out.println(em);

		em.close();

	}

	/*
	 * @Override public void start(Stage args) throws Exception { // TODO
	 * Auto-generated method stub Parent root =
	 * FXMLLoader.load(getClass().getResource("../view/Login.fxml")); Scene scene =
	 * new Scene(root); ///
	 * scene.getStylesheets().add(getClass().getResource("/css/estilo.css").
	 * toExternalForm()); args.setTitle("Login"); args.setScene(scene); args.show();
	 * }
	 */
}
