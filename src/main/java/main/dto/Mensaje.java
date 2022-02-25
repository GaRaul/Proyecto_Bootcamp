package main.dto;

import java.sql.Time;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "Mensaje")
public class Mensaje {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String contenido;
	private Time hora;

	@ManyToOne
	@JoinColumn(name = "Id_chat")
	Chat chat;

	@ManyToOne
	@JoinColumn(name = "Nombre_usuario")
	Usuario usuario;

	// CONSTRUCTORES
	public Mensaje() {
	}

	/**
	 * @param id
	 * @param contenido
	 * @param hora
	 * @param chat
	 * @param usuario
	 */
	public Mensaje(int id, String contenido, Time hora, Chat chat, Usuario usuario) {
		this.id = id;
		this.contenido = contenido;
		this.hora = hora;
		this.chat = chat;
		this.usuario = usuario;
	}

	// GETTERS Y SETTERS
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getContenido() {
		return contenido;
	}

	public void setContenido(String contenido) {
		this.contenido = contenido;
	}

	public Time getHora() {
		return hora;
	}

	public void setHora(Time hora) {
		this.hora = hora;
	}

	public Chat getChat() {
		return chat;
	}

	public void setChat(Chat chat) {
		this.chat = chat;
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
		return "Mensaje [id=" + id + ", contenido=" + contenido + ", hora=" + hora + ", chat=" + chat + ", usuario="
				+ usuario + "]";
	}

}
