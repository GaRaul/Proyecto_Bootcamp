package main.dto;

import java.util.List;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "Usuario")
public class Usuario {

	@Id
	@Column(name = "Nombre_Usuario")
	private String nombreUsuario;

	@Column(name = "Nombre")
	private String nombre;

	@Column(name = "Apellidos")
	private String apellidos;

	@Column(name = "Email")
	private String email;

	@Column(name = "Palabra_clave")
	private String password;

	@Lob
	@Basic(fetch = FetchType.LAZY)
	@Column(name = "Foto_perfil")
	private byte fotoPerfil;

	@Column(name = "Usuario_Steam")
	private String usuarioSteam;

	@OneToMany
	@JoinColumn(name = "Nombre_Usuario")
	private List<Grupo> grupo;

	@OneToMany
	@JoinColumn(name = "Nombre_Usuario")
	private List<Mensaje> mensaje;

	@ManyToOne
	@JoinColumn(name = "Id_grupo")
	Grupo grupos;

	// CONSTRUCTORES
	public Usuario() {
	}

	/**
	 * @param nombreUsuario
	 * @param nombre
	 * @param apellidos
	 * @param email
	 * @param password
	 * @param fotoPerfil
	 * @param usuarioSteam
	 * @param grupos
	 */
	public Usuario(String nombreUsuario, String nombre, String apellidos, String email, String password,
			Byte fotoPerfil, String usuarioSteam, Grupo grupos) {
		this.nombreUsuario = nombreUsuario;
		this.nombre = nombre;
		this.apellidos = apellidos;
		this.email = email;
		this.password = password;
		this.fotoPerfil = fotoPerfil;
		this.usuarioSteam = usuarioSteam;
		this.grupos = grupos;
	}

	// GETTERS Y SETTERS
	public String getNombreUsuario() {
		return nombreUsuario;
	}

	public void setNombreUsuario(String nombreUsuario) {
		this.nombreUsuario = nombreUsuario;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellidos() {
		return apellidos;
	}

	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public byte getFotoPerfil() {
		return fotoPerfil;
	}

	public void setFotoPerfil(byte fotoPerfil) {
		this.fotoPerfil = fotoPerfil;
	}

	public String getUsuarioSteam() {
		return usuarioSteam;
	}

	public void setUsuarioSteam(String usuarioSteam) {
		this.usuarioSteam = usuarioSteam;
	}

	public Grupo getGrupos() {
		return grupos;
	}

	public void setGrupos(Grupo grupos) {
		this.grupos = grupos;
	}

	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "Grupo")
	public List<Grupo> getGrupo() {
		return grupo;
	}

	public void setGrupo(List<Grupo> grupo) {
		this.grupo = grupo;
	}

	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "Mensaje")
	public List<Mensaje> getMensaje() {
		return mensaje;
	}

	public void setMensaje(List<Mensaje> mensaje) {
		this.mensaje = mensaje;
	}

	// METODO TO STRING
	@Override
	public String toString() {
		return "Usuario [nombreUsuario=" + nombreUsuario + ", nombre=" + nombre + ", apellidos=" + apellidos
				+ ", email=" + email + ", password=" + password + ", fotoPerfil=" + fotoPerfil + ", usuarioSteam="
				+ usuarioSteam + ", grupos=" + grupos + "]";
	}

}
