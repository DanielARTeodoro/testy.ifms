/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * 
 */
package br.com.hospitalif.model;

import java.time.LocalDate;
/// import java.util.List;
///import java.sql.Date;

public class Atendimento {

	private int idAtendimento;
	private String comentarioEnfermeiro;
	private String comentarioMedico;
	private float peso = (0.01f);
	private float altura = (0.01f);
	private LocalDate data;
	private String doenca;

	/**
	 * 
	 */
	public Atendimento() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @return the idAtendimento
	 */
	public int getIdAtendimento() {
		return idAtendimento;
	}

	/**
	 * @param idAtendimento the idAtendimento to set
	 */
	public void setIdAtendimento(int idAtendimento) {
		this.idAtendimento = idAtendimento;
	}

	/**
	 * @return the comentarioEnfermeiro
	 */
	public String getComentarioEnfermeiro() {
		return comentarioEnfermeiro;
	}

	/**
	 * @param comentarioEnfermeiro the comentarioEnfermeiro to set
	 */
	public void setComentarioEnfermeiro(String comentarioEnfermeiro) {
		this.comentarioEnfermeiro = comentarioEnfermeiro;
	}

	/**
	 * @return the comentarioMedico
	 */
	public String getComentarioMedico() {
		return comentarioMedico;
	}

	/**
	 * @param comentarioMedico the comentarioMedico to set
	 */
	public void setComentarioMedico(String comentarioMedico) {
		this.comentarioMedico = comentarioMedico;
	}

	/**
	 * @return the peso
	 */
	public float getPeso() {
		return peso;
	}

	/**
	 * @param peso the peso to set
	 */
	public void setPeso(float peso) {
		this.peso = peso;
	}

	/**
	 * @return the altura
	 */
	public float getAltura() {
		return altura;
	}

	/**
	 * @param altura the altura to set
	 */
	public void setAltura(float altura) {
		this.altura = altura;
	}

	/**
	 * @return the data
	 */
	public LocalDate getData() {
		return data;
	}

	/**
	 * @param data the data to set
	 */
	public void setData(LocalDate data) {
		this.data = data;
	}

	/**
	 * @return the doenca
	 */
	public String getDoenca() {
		return doenca;
	}

	/**
	 * @param doenca the doenca to set
	 */
	public void setDoenca(String doenca) {
		this.doenca = doenca;
	}

}
