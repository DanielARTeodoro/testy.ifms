/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * 
 * Sample Skeleton for 'enfermidade.fxml' Controller Class
 */

package br.com.hospitalif.rascunho;
/*
 * import java.io.IOException; import java.net.URL; import
 * java.util.ResourceBundle;
 * 
 * import br.com.hospitalif.dao.EnfermidadePessoalDAO; import
 * br.com.hospitalif.model.EnfermidadePessoal; import javafx.event.ActionEvent;
 * import javafx.fxml.FXML; import javafx.fxml.FXMLLoader; import
 * javafx.scene.Parent; import javafx.scene.Scene; import
 * javafx.scene.control.Button; import javafx.scene.control.ChoiceBox; import
 * javafx.scene.control.TextField; import javafx.stage.Stage;
 * 
 * /**
 * 
 * @author Daniel
 *
 */

/*
 * public class EnfermidadePessoalController {
 * 
 * @FXML // ResourceBundle that was given to the FXMLLoader private
 * ResourceBundle resources;
 * 
 * @FXML // URL location of the FXML file that was given to the FXMLLoader
 * private URL location;
 * 
 * @FXML // fx:id="txtEnfermidadePessoal0" private TextField
 * txtEnfermidadePessoal0; // Value injected by FXMLLoader
 * 
 * @FXML // fx:id="txtEnfermidadePessoal1" private TextField
 * txtEnfermidadePessoal1; // Value injected by FXMLLoader
 * 
 * @FXML // fx:id="comEnfermidadePessoal2" private ChoiceBox<?>
 * comEnfermidadePessoal2; // Value injected by FXMLLoader
 * 
 * @FXML // fx:id="btnEnfermidadePessoal" private Button btnEnfermidadePessoal;
 * // Value injected by FXMLLoader
 * 
 * @FXML void handleSubmitButtonAction(ActionEvent event) throws IOException {
 * 
 * if (txtEnfermidadePessoal0.getText().equals("")) { Stage stage = (Stage)
 * btnEnfermidadePessoal.getScene().getWindow(); Parent root =
 * FXMLLoader.load(getClass().getResource("../view/Home.fxml")); Scene scene =
 * new Scene(root); ///
 * scene.getStylesheets().add(getClass().getResource("/css/estilo.css").
 * toExternalForm()); stage.setTitle("Alerta: ERRO!"); stage.setScene(scene);
 * stage.show(); } else { EnfermidadePessoal enfep = new EnfermidadePessoal();
 * enfep.setComentario(txtEnfermidadePessoal1.getText());
 * 
 * EnfermidadePessoalDAO efdaop = new EnfermidadePessoalDAO();
 * efdaop.inserir(enfep);
 * 
 * Stage stage = (Stage) btnEnfermidadePessoal.getScene().getWindow(); Parent
 * root = FXMLLoader.load(getClass().getResource("../view/Home.fxml")); Scene
 * scene = new Scene(root); ///
 * scene.getStylesheets().add(getClass().getResource("/css/estilo.css").
 * toExternalForm()); stage.setTitle("Alerta: Sucesso!"); stage.setScene(scene);
 * stage.show(); }
 * 
 * }
 * 
 * @FXML // This method is called by the FXMLLoader when initialization is
 * complete void initialize() { assert txtEnfermidadePessoal0 != null :
 * "fx:id=\"txtEnfermidadePessoal0\" was not injected: check your FXML file 'EnfermidadePessoal.fxml'."
 * ; assert txtEnfermidadePessoal1 != null :
 * "fx:id=\"txtEnfermidadePessoal1\" was not injected: check your FXML file 'EnfermidadePessoal.fxml'."
 * ; assert comEnfermidadePessoal2 != null :
 * "fx:id=\"comEnfermidadePessoal2\" was not injected: check your FXML file 'EnfermidadePessoal.fxml'."
 * ; assert btnEnfermidadePessoal != null :
 * "fx:id=\"btnEnfermidadePessoal\" was not injected: check your FXML file 'EnfermidadePessoal.fxml'."
 * ;
 * 
 * } }
 */