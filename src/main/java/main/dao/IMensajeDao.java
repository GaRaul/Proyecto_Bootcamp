package main.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import main.dto.Mensaje;

public interface IMensajeDao extends JpaRepository<Mensaje, Integer> {

	
	
}
