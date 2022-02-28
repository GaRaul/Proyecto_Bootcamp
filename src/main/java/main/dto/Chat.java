package main.dto;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "Chat")
public class Chat {

	// Atributos
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="Id_chat")
	private int id_chat;

	@OneToOne
	private Grupo grupo;
	
	@OneToMany
	@JoinColumn(name = "Id_chat")
	private List<Mensaje> mensaje;	

	// Constructores
	public Chat() {
	}

	public Chat(int id_chat) {
		this.id_chat = id_chat;
	}

	// Getters and Setters
	public int getId_chat() {
		return id_chat;
	}

	public void setId_chat(int id_chat) {
		this.id_chat = id_chat;
	}

	// ToString
	@Override
	public String toString() {
		return "Chat [id_chat=" + id_chat + "]";
	}
}
