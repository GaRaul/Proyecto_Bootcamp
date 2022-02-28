package main.dto;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.ManyToAny;

import com.fasterxml.jackson.annotation.JsonIgnore;

import main.utils.Modo_de_Juego;

@Entity
@Table(name="Grupo")
public class Grupo {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="Id_grupo")
	private long id_grupo;
	
	@ManyToAny(metaColumn = @Column(name = "Id_juego"))
	private Juego juego;
	
	@Enumerated(EnumType.STRING)
	@Column(name="Modo_de_Juego")
	private Modo_de_Juego modo_de_juego;
	
	@Column(name="Dimension")
	private int dimension;
	
	@Column(name="Descripcion")
	private String descripcion;
	
	@Column(name="Juego_nuevo")
	private String juego_nuevo;
	
	@OneToMany
	@JoinColumn(name="Id_grupo")
	private List<Usuario> usuarios;

	public Grupo() {
	}

	public Grupo(long id_grupo, Juego juego, Modo_de_Juego modo_de_juego, int dimension, String descripcion,
			String juego_nuevo) {
		this.id_grupo = id_grupo;
		this.juego = juego;
		this.modo_de_juego = modo_de_juego;
		this.dimension = dimension;
		this.descripcion = descripcion;
		this.juego_nuevo = juego_nuevo;
	}

	public long getId_grupo() {
		return id_grupo;
	}

	public void setId_grupo(long id_grupo) {
		this.id_grupo = id_grupo;
	}

	public Juego getJuego() {
		return juego;
	}

	public void setJuego(Juego juego) {
		this.juego = juego;
	}

	public Modo_de_Juego getModo_de_juego() {
		return modo_de_juego;
	}

	public void setModo_de_juego(Modo_de_Juego modo_de_juego) {
		this.modo_de_juego = modo_de_juego;
	}

	public int getDimension() {
		return dimension;
	}

	public void setDimension(int dimension) {
		this.dimension = dimension;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public String getJuego_nuevo() {
		return juego_nuevo;
	}

	public void setJuego_nuevo(String juego_nuevo) {
		this.juego_nuevo = juego_nuevo;
	}

	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "Usuario")
	public List<Usuario> getUsuarios() {
		return usuarios;
	}

	public void setUsuarios(List<Usuario> usuarios) {
		this.usuarios = usuarios;
	}

	@Override
	public String toString() {
		return "Grupo [id_grupo=" + id_grupo + ", juego=" + juego + ", modo_de_juego=" + modo_de_juego + ", dimension=" + dimension
				+ ", descripcion=" + descripcion + ", juego_nuevo=" + juego_nuevo + ", usuarios=" + usuarios + "]";
	}

	
	
}