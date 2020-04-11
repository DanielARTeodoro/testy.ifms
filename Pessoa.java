/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * 
 */
package br.com.hospitalif.model;

public class Pessoa {

	private int idPessoa;
	private String nome;
	private String cpf;
	private int idade;
	private String tipoSanguineo;
	private String sexo;
	private String statusDePessoa;

	/**
	 * 
	 */
	public Pessoa() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @return the idPessoa
	 */
	public int getIdPessoa() {
		return idPessoa;
	}

	/**
	 * @param idPessoa the idPessoa to set
	 */
	public void setIdPessoa(int idPessoa) {
		this.idPessoa = idPessoa;
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
	 * @return the cpf
	 */
	public String getCpf() {
		return cpf;
	}

	/**
	 * @param cpf the cpf to set
	 */
	public void setCpf(String cpf) {
		this.cpf = cpf;
	}

	/**
	 * @return the idade
	 */
	public int getIdade() {
		return idade;
	}

	/**
	 * @param idade the idade to set
	 */
	public void setIdade(int idade) {
		this.idade = idade;
	}

	/**
	 * @return the tipoSanguineo
	 */
	public String getTipoSanguineo() {
		return tipoSanguineo;
	}

	/**
	 * @param tipoSanguineo the tipoSanguineo to set
	 */
	public void setTipoSanguineo(String tipoSanguineo) {
		this.tipoSanguineo = tipoSanguineo;
	}

	/**
	 * @return the sexo
	 */
	public String getSexo() {
		return sexo;
	}

	/**
	 * @param sexo the sexo to set
	 */
	public void setSexo(String sexo) {
		this.sexo = sexo;
	}

	/**
	 * @return the statusDePessoa
	 */
	public String getStatusDePessoa() {
		return statusDePessoa;
	}

	/**
	 * @param statusDePessoa the statusDePessoa to set
	 */
	public void setStatusDePessoa(String statusDePessoa) {
		this.statusDePessoa = statusDePessoa;
	}

	public void criar(Pessoa p) {
		// TODO Auto-generated method stub

	}

}
