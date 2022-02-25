package main.dto;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "SeUne")
public class SeUne {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@ManyToOne
	@JoinColumn(name = "Id_grupo")
	Grupo grupo;

	@ManyToOne
	@JoinColumn(name = "Nombre_usuario")
	Usuario usuario;

	// CONSTRUCTORES
	public SeUne() {
	}

	/**
	 * @param id
	 * @param grupo
	 * @param usuario
	 */
	public SeUne(int id, Grupo grupo, Usuario usuario) {
		this.id = id;
		this.grupo = grupo;
		this.usuario = usuario;
	}

	// GETTERS Y SETTERS
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Grupo getGrupo() {
		return grupo;
	}

	public void setGrupo(Grupo grupo) {
		this.grupo = grupo;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	// METODO TO STRING
	@Override
	public String toString() {
		return "SeUne [id=" + id + ", grupo=" + grupo + ", usuario=" + usuario + "]";
	}

}
