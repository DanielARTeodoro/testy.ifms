/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * 
 */

package br.com.hospitalif.model;

public class Medico extends Funcionario {

	private int numeroDeRegistroMedico;

	private String especialidade;

	/**
	 * 
	 */
	public Medico() {

		// TODO Auto-generated constructor stub
	}

	/**
	 * @return the numeroDeRegistroMedico
	 */
	public int getNumeroDeRegistroMedico() {
		return numeroDeRegistroMedico;
	}

	/**
	 * @param numeroDeRegistroMedico the numeroDeRegistroMedico to set
	 */
	public void setNumeroDeRegistroMedico(int numeroDeRegistroMedico) {
		this.numeroDeRegistroMedico = numeroDeRegistroMedico;
	}

	/**
	 * @return the especialidade
	 */
	public String getEspecialidade() {
		return especialidade;
	}

	/**
	 * @param especialidade the especialidade to set
	 */
	public void setEspecialidade(String especialidade) {
		this.especialidade = especialidade;
	}

}
