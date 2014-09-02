package com.business;

import com.model.Documento;
import com.repository.DocumentoRepository;
import com.util.GenericBusiness;

public class DocumentoBusiness extends GenericBusiness<Documento> implements
		DocumentoRepository {

	public DocumentoBusiness(){
		super();
	}
	
}
