/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**

 * Sample Skeleton for 'Entrada.fxml' Controller Class
 */
/**
 * @author Frank
 *
 */
package br.com.hospitalif.rascunho;

/*
 * import java.io.IOException; import java.net.URL; import
 * java.util.ResourceBundle;
 * 
 * import br.com.hospitalif.dao.EntradaDAO; import
 * br.com.hospitalif.model.Entrada; import javafx.event.ActionEvent; import
 * javafx.fxml.FXML; import javafx.fxml.FXMLLoader; import javafx.scene.Parent;
 * import javafx.scene.Scene; import javafx.scene.control.Button; import
 * javafx.scene.control.TextField; import javafx.stage.Stage;
 * 
 * /**
 * 
 * @author Daniel
 *
 */
/*
 * public class EntradaController {
 * 
 * @FXML // ResourceBundle that was given to the FXMLLoader private
 * ResourceBundle resources;
 * 
 * @FXML // URL location of the FXML file that was given to the FXMLLoader
 * private URL location;
 * 
 * @FXML // fx:id="txtEntrada0" private TextField txtEntrada0; // Value injected
 * by FXMLLoader
 * 
 * @FXML // fx:id="txtEntrada1" private TextField txtEntrada1; // Value injected
 * by FXMLLoader
 * 
 * @FXML // fx:id="txtEntrada2" private TextField txtEntrada2; // Value injected
 * by FXMLLoader
 * 
 * @FXML // fx:id="txtEntrada3" private TextField txtEntrada3; // Value injected
 * by FXMLLoader
 * 
 * @FXML // fx:id="txtEntrada4" private TextField txtEntrada4; // Value injected
 * by FXMLLoader
 * 
 * @FXML // fx:id="btnEntrada" private Button btnEntrada; // Value injected by
 * FXMLLoader
 * 
 * @FXML void handleSubmitButtonAction(ActionEvent event) throws IOException {
 * 
 * if (txtEntrada0.getText().equals("")) { Stage stage = (Stage)
 * btnEntrada.getScene().getWindow(); Parent root =
 * FXMLLoader.load(getClass().getResource("../view/Home.fxml")); Scene scene =
 * new Scene(root); ///
 * scene.getStylesheets().add(getClass().getResource("/css/estilo.css").
 * toExternalForm()); stage.setTitle("Alerta: ERRO!"); stage.setScene(scene);
 * stage.show(); } else { Entrada en = new Entrada();
 * en.setStatusEntrada(txtEntrada3.getText());
 * 
 * EntradaDAO efdaoe = new EntradaDAO(); efdaoe.inserir(en);
 * 
 * Stage stage = (Stage) btnEntrada.getScene().getWindow(); Parent root =
 * FXMLLoader.load(getClass().getResource("../view/Home.fxml")); Scene scene =
 * new Scene(root); ///
 * scene.getStylesheets().add(getClass().getResource("/css/estilo.css").
 * toExternalForm()); stage.setTitle("Alerta: Sucesso!"); stage.setScene(scene);
 * stage.show(); }
 * 
 * }
 * 
 * @FXML // This method is called by the FXMLLoader when initialization is
 * complete void initialize() { assert txtEntrada0 != null :
 * "fx:id=\"txtEntrada0\" was not injected: check your FXML file 'Entrada.fxml'."
 * ; assert txtEntrada1 != null :
 * "fx:id=\"txtEntrada1\" was not injected: check your FXML file 'Entrada.fxml'."
 * ; assert txtEntrada2 != null :
 * "fx:id=\"txtEntrada2\" was not injected: check your FXML file 'Entrada.fxml'."
 * ; assert txtEntrada3 != null :
 * "fx:id=\"txtEntrada3\" was not injected: check your FXML file 'Entrada.fxml'."
 * ; assert txtEntrada4 != null :
 * "fx:id=\"txtEntrada4\" was not injected: check your FXML file 'Entrada.fxml'."
 * ; assert btnEntrada != null :
 * "fx:id=\"btnEntrada\" was not injected: check your FXML file 'Entrada.fxml'."
 * ;
 * 
 * } }
 */