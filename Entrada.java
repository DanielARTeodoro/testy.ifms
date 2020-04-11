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

public class Entrada {

	private int idEntrada;
	private LocalDate dataEntrada;
	private LocalDate dataSaida;
	private String statusEntrada;
	private String situacaoDePaciente;

	/**
	 * 
	 */
	public Entrada() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @return the idEntrada
	 */
	public int getIdEntrada() {
		return idEntrada;
	}

	/**
	 * @param idEntrada the idEntrada to set
	 */
	public void setIdEntrada(int idEntrada) {
		this.idEntrada = idEntrada;
	}

	/**
	 * @return the dataEntrada
	 */
	public LocalDate getDataEntrada() {
		return dataEntrada;
	}

	/**
	 * @param dataEntrada the dataEntrada to set
	 */
	public void setDataEntrada(LocalDate dataEntrada) {
		this.dataEntrada = dataEntrada;
	}

	/**
	 * @return the dataSaida
	 */
	public LocalDate getDataSaida() {
		return dataSaida;
	}

	/**
	 * @param dataSaida the dataSaida to set
	 */
	public void setDataSaida(LocalDate dataSaida) {
		this.dataSaida = dataSaida;
	}

	/**
	 * @return the statusEntrada
	 */
	public String getStatusEntrada() {
		return statusEntrada;
	}

	/**
	 * @param statusEntrada the statusEntrada to set
	 */
	public void setStatusEntrada(String statusEntrada) {
		this.statusEntrada = statusEntrada;
	}

	/**
	 * @return the situacaoDePaciente
	 */
	public String getSituacaoDePaciente() {
		return situacaoDePaciente;
	}

	/**
	 * @param situacaoDePaciente the situacaoDePaciente to set
	 */
	public void setSituacaoDePaciente(String situacaoDePaciente) {
		this.situacaoDePaciente = situacaoDePaciente;
	}

}
