package main.service;

import java.util.List;

import main.dto.SeUne;

public interface ISeUneService {

	public List<SeUne> listarSeUne();
	
	public SeUne guardarSeUne(SeUne seUne);
	
	public SeUne seUneXID(Integer id);
	
	public SeUne actualizarSeUne(SeUne seUne);
	
	public void eliminarSeUne(Integer id);
}
