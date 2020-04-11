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
import java.util.Date;
///import java.sql.Date;
/// import java.util.List;

public class PacientePessoa {

	/// Atendimento

	private int idAtendimento;
	private String comentarioEnfermeiro;
	private String comentarioMedico;
	private float peso = (0.01f);
	private float altura = (0.01f);
	private LocalDate data;
	private String doenca;

	/// Enfermidade

	private int idEnfermidade;
	private String nomeEnfermidade;
	private String tipo;
	private String descricao;

	/// EnfermidadePessoal

	private int idEnfermidadePessoal;
	private String comentario;
	private String statusDeEnfermidade;

	/// Entrada

	private int idEntrada;
	private Date dataEntrada;
	private Date dataSaida;
	private String statusEntrada;
	private String situacaoDePaciente;

	/// Paciente

	private int idPaciente;
	private String doencaPaciente;
	private String historico;

	/// Pessoa

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
	public PacientePessoa() {

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
	 * @return the nomeEnfermidade
	 */
	public String getNomeEnfermidade() {
		return nomeEnfermidade;
	}

	/**
	 * @param nomeEnfermidade the nomeEnfermidade to set
	 */
	public void setNomeEnfermidade(String nomeEnfermidade) {
		this.nomeEnfermidade = nomeEnfermidade;
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
	public Date getDataEntrada() {
		return dataEntrada;
	}

	/**
	 * @param dataEntrada the dataEntrada to set
	 */
	public void setDataEntrada(Date dataEntrada) {
		this.dataEntrada = dataEntrada;
	}

	/**
	 * @return the dataSaida
	 */
	public Date getDataSaida() {
		return dataSaida;
	}

	/**
	 * @param dataSaida the dataSaida to set
	 */
	public void setDataSaida(Date dataSaida) {
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

	/**
	 * @return the idPaciente
	 */
	public int getIdPaciente() {
		return idPaciente;
	}

	/**
	 * @param idPaciente the idPaciente to set
	 */
	public void setIdPaciente(int idPaciente) {
		this.idPaciente = idPaciente;
	}

	/**
	 * @return the doencaPaciente
	 */
	public String getDoencaPaciente() {
		return doencaPaciente;
	}

	/**
	 * @param doencaPaciente the doencaPaciente to set
	 */
	public void setDoencaPaciente(String doencaPaciente) {
		this.doencaPaciente = doencaPaciente;
	}

	/**
	 * @return the historico
	 */
	public String getHistorico() {
		return historico;
	}

	/**
	 * @param historico the historico to set
	 */
	public void setHistorico(String historico) {
		this.historico = historico;
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

}
