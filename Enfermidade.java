/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * 
 */
package br.com.hospitalif.model;

public class Enfermidade {

	private int idEnfermidade;
	private String nome;
	private String tipo;
	private String descricao;

	/**
	 * 
	 */
	public Enfermidade() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @return the idEnfermidade
	 */
	public int getIdEnfermidade() {
		return idEnfermidade;
	}

	/**
	 * @param idEnfermidade the idEnfermidade to set
	 */
	public void setIdEnfermidade(int idEnfermidade) {
		this.idEnfermidade = idEnfermidade;
	}

	/**
	 * @return the nome
	 */
	public String getNome() {
		return nome;
	}

	/**
	 * @param nome the nome to set
	 */
	public void setNome(String nome) {
		this.nome = nome;
	}

	/**
	 * @return the tipo
	 */
	public String getTipo() {
		return tipo;
	}

	/**
	 * @param tipo the tipo to set
	 */
	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	/**
	 * @return the descricao
	 */
	public String getDescricao() {
		return descricao;
	}

	/**
	 * @param descricao the descricao to set
	 */
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

}
