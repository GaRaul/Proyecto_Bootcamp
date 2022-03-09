package main.dto;

import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "Usuario")
public class Usuario {

	@Id
	@Column(name = "Nombre_Usuario")
	private String nombre_usuario;

	@Column(name = "Nombre")
	private String nombre;

	@Column(name = "Apellidos")
	private String apellidos;

	@Column(name = "Email")
	private String email;

	@Column(name = "Palabra_clave")
	private String password;

	@Column(name = "Foto_perfil")
	private String fotoPerfil;

	@JsonFormat(pattern = "dd-MM-yyyy HH:mm:ss")
	@Column(name = "Fecha_creacion")
	private LocalDateTime fecha_creacion;

	@JsonFormat(pattern = "dd-MM-yyyy HH:mm:ss")
	@Column(name = "Fecha_modificacion")
	private LocalDateTime fecha_modificacion;

	@Column(name = "Rol")
	private String rol;

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
	 * @param fecha_creacion
	 * @param fecha_modificacion
	 * @param rol
	 * @param usuarioSteam
	 * @param grupo
	 * @param mensaje
	 * @param grupos
	 */
	public Usuario(String nombreUsuario, String nombre, String apellidos, String email, String password,
			String fotoPerfil, LocalDateTime fecha_creacion, LocalDateTime fecha_modificacion, String rol,
			String usuarioSteam, Grupo grupos) {
		this.nombre_usuario = nombreUsuario;
		this.nombre = nombre;
		this.apellidos = apellidos;
		this.email = email;
		this.password = password;
		this.fotoPerfil = fotoPerfil;
		this.fecha_creacion = fecha_creacion;
		this.fecha_modificacion = fecha_modificacion;
		this.rol = rol;
		this.usuarioSteam = usuarioSteam;
		this.grupos = grupos;
	}

	// GETTERS Y SETTERS
	public String getNombreUsuario() {
		return nombre_usuario;
	}

	public void setNombreUsuario(String nombreUsuario) {
		this.nombre_usuario = nombreUsuario;
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

	public String getFotoPerfil() {
		return fotoPerfil;
	}

	public void setFotoPerfil(String fotoPerfil) {
		this.fotoPerfil = fotoPerfil;
	}

	public LocalDateTime getFecha_creacion() {
		return fecha_creacion;
	}

	public void setFecha_creacion(LocalDateTime fecha_creación) {
		this.fecha_creacion = fecha_creación;
	}

	public LocalDateTime getFecha_modificacion() {
		return fecha_modificacion;
	}

	public void setFecha_modificacion(LocalDateTime fecha_modificacion) {
		this.fecha_modificacion = fecha_modificacion;
	}

	public String getRol() {
		return rol;
	}

	public void setRol(String rol) {
		this.rol = rol;
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
		return "Usuario [nombreUsuario=" + nombre_usuario + ", nombre=" + nombre + ", apellidos=" + apellidos
				+ ", email=" + email + ", password=" + password + ", fotoPerfil=" + fotoPerfil + ", fecha_creacion="
				+ fecha_creacion + ", fecha_modificacion=" + fecha_modificacion + ", rol=" + rol + ", usuarioSteam="
				+ usuarioSteam + ", grupo=" + grupo + ", mensaje=" + mensaje + ", grupos=" + grupos + "]";
	}

}
