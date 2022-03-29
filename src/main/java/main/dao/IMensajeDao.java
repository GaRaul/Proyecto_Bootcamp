package main.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import main.dto.Mensaje;

public interface IMensajeDao extends JpaRepository<Mensaje, Integer> {

	public List<Mensaje> findById_chat(Integer id_chat);
	
}
