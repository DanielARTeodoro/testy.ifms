/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * 
 */
package br.com.hospitalif.model;

public class EnfermidadePessoal {

	private int idEnfermidadePessoal;
	private String comentario;
	private String statusDeEnfermidade;

	/**
	 * 
	 */
	public EnfermidadePessoal() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @return the idEnfermidadePessoal
	 */
	public int getIdEnfermidadePessoal() {
		return idEnfermidadePessoal;
	}

	/**
	 * @param idEnfermidadePessoal the idEnfermidadePessoal to set
	 */
	public void setIdEnfermidadePessoal(int idEnfermidadePessoal) {
		this.idEnfermidadePessoal = idEnfermidadePessoal;
	}

	/**
	 * @return the comentario
	 */
	public String getComentario() {
		return comentario;
	}

	/**
	 * @param comentario the comentario to set
	 */
	public void setComentario(String comentario) {
		this.comentario = comentario;
	}

	/**
	 * @return the statusDeEnfermidade
	 */
	public String getStatusDeEnfermidade() {
		return statusDeEnfermidade;
	}

	/**
	 * @param statusDeEnfermidade the statusDeEnfermidade to set
	 */
	public void setStatusDeEnfermidade(String statusDeEnfermidade) {
		this.statusDeEnfermidade = statusDeEnfermidade;
	}

}
