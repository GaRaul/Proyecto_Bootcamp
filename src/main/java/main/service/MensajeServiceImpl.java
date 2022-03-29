package main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import main.dao.IMensajeDao;
import main.dto.Mensaje;

@Service
public class MensajeServiceImpl implements IMensajeService {

	@Autowired
	IMensajeDao iMensajeDao;

	@Override
	public List<Mensaje> listarMensaje() {
		return iMensajeDao.findAll();
	}

	@Override
	public Mensaje guardarMensaje(Mensaje mensaje) {
		return iMensajeDao.save(mensaje);
	}

	@Override
	public Mensaje mensajeXID(Integer id) {
		return iMensajeDao.findById(id).get();
	}

	@Override
	public Mensaje actualizarMensaje(Mensaje mensaje) {
		return iMensajeDao.save(mensaje);
	}

	@Override
	public void eliminarMensaje(Integer id) {
		iMensajeDao.deleteById(id);
	}

	@Override
	public List<Mensaje> listarMensajesChat(Integer id_chat) {
		return iMensajeDao.findById_chat(id_chat);
	}

}
