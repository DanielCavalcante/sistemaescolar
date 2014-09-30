<div class="panel-group" id="accordion">
	<div class="panel panel-default">
		<div class="panel-heading">
			<h4 class="panel-title">
				<a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
   					<fmt:message key="documento.documento" />
				</a>
			</h4>
		</div>
		<div id="collapseOne" class="panel-collapse collapse in">
			<div class="panel-body">
    					<div class="form-group">
					<label class="col-sm-2 control-label"><fmt:message key="documento.cpf" /></label>
					<div class="col-sm-3">
						<input name="professor.documento.cpf" value="${professor.documento.cpf}" type="text" class="form-control" placeholder="<fmt:message key='documento.cpf' />" />
					</div>
					<label class="col-sm-2 control-label"><fmt:message key="documento.numero.identidade" /></label>
					<div class="col-sm-3">
						<input name="professor.documento.numIdentidade" value="${professor.documento.numIdentidade}" type="text" class="form-control" placeholder="<fmt:message key='documento.numero.identidade' />" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label"><fmt:message key="documento.complemento" /></label>
					<div class="col-sm-3">
						<input name="professor.documento.compIdentidade" value="${professor.documento.compIdentidade}" type="text" class="form-control" placeholder="<fmt:message key='documento.complemento.identidade' />" />
					</div>
					<label class="col-sm-2 control-label"><fmt:message key="documento.orgao" /></label>
					<div class="col-sm-3">
						<input name="professor.documento.orgaoEmissor" value="${professor.documento.orgaoEmissor}" type="text" class="form-control" placeholder="<fmt:message key='documento.orgao.emissor' />" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label"><fmt:message key="documento.uf.identidade" /></label>
					<div class="col-sm-3">
						<select name="professor.documento.ufIdentidade.id" class="form-control">
							<option value=""><fmt:message key="menu.selecione" /></option>
							<c:forEach items="${listaEstados}" var="uf">
								<option value="${uf.id}" ${uf.id eq professor.documento.ufIdentidade.id ? "selected='selected'" : ""}>${uf.nome}</option>
							</c:forEach>
						</select>
					</div>
					<label class="col-sm-2 control-label"><fmt:message key="documento.data" /></label>
					<div class="col-sm-3">
						<div class='input-group date' id='professorDataExpedicao'>
							<input name="professor.documento.dataExpedicaoIdentidade" value="${professor.documento.dataExpedicaoIdentidade}" type="text" class="form-control" placeholder="<fmt:message key='documento.data.expedicao' />" />
							<span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="panel panel-default">
		<div class="panel-heading">
			<h4 class="panel-title">
				<a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
					<fmt:message key="documento.info.certidao" />
				</a>
			</h4>
		</div>
		<div id="collapseTwo" class="panel-collapse collapse">
			<div class="panel-body">
				<div class="form-group">
					<label class="col-sm-2 control-label"><fmt:message key="documento.tipo.certidao" /></label>
					<div class="col-sm-3">
						<select class="form-control" name="professor.documento.tipoCertidao">
							<option><fmt:message key="menu.selecione" /></option>
							<option><fmt:message key="documento.certidao.nascimento" /></option>
							<option><fmt:message key="documento.certidao.casamento" /></option>
						</select>
					</div>
					<label class="col-sm-2 control-label"><fmt:message key="documento.modelo" /></label>
					<div class="col-sm-3">
						<select name="professor.documento.modeloCertidao" id="modeloCertidao" class="form-control">
							<option value=""><fmt:message key="menu.selecione" /></option>
							<c:forEach items="${listaModelos}" var="m">
								<option value="${m.label}" ${m.label eq professor.documento.modeloCertidao ? "selected='selected'" : ""}>${m.label}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="form-group" id="modeloNovo">
					<label class="col-sm-2 control-label"><fmt:message key="documento.numero" /></label>
					<div class="col-sm-3">
						<input name="professor.documento.numeroMatricula" value="${professor.documento.numeroMatricula}" type="text" class="form-control" placeholder="<fmt:message key="documento.numero.matricula" />" />
					</div>
				</div>
				<div id="modeloAntigo">
					<div class="form-group">
						<label class="col-sm-2 control-label"><fmt:message key="documento.numero.termo" /></label>
						<div class="col-sm-3">
							<input name="professor.documento.numeroDoTermo" value="${professor.documento.numeroDoTermo}" type="text" class="form-control" placeholder="<fmt:message key="documento.numero.termo" />">
						</div>
						<label class="col-sm-2 control-label"><fmt:message key="documento.data" /></label>
						<div class="col-sm-3">
							<input name="professor.documento.dataEmissaoCertidao" value="${professor.documento.dataEmissaoCertidao}" type="text" class="form-control" placeholder="<fmt:message key="documento.data.emissao" />">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label"><fmt:message key="documento.folha" /></label>
						<div class="col-sm-3">
							<input name="professor.documento.folhaDoTermo" value="${professor.documento.folhaDoTermo}" type="text" class="form-control" placeholder="<fmt:message key="documento.folha" />">
						</div>
						<label class="col-sm-2 control-label"><fmt:message key="documento.livro" /></label>
						<div class="col-sm-3">
							<input name="professor.documento.livro" value="${professor.documento.livro}" type="text" class="form-control" placeholder="<fmt:message key="documento.livro" />">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label"><fmt:message key="documento.uf.cartorio" /></label>
						<div class="col-sm-3">
							<select name="professor.documento.ufCartorio" id="documentoEstadoSelect" class="form-control">
								<option value=""><fmt:message key="menu.selecione" /></option>
								<c:forEach items="${listaEstados}" var="estado">
									<option value="${estado.id}">${estado.nome}</option>
								</c:forEach>
							</select>
						</div>
						<label class="col-sm-2 control-label"><fmt:message key="documento.cidade" /></label>
						<div class="col-sm-3">
							<select name="professor.documento.cidadeCartorio" id="documentoCidadesSelect" class="form-control">
								<option value=""><fmt:message key="menu.selecione" /></option>
								</select> 
							</div> 
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label"><fmt:message key="documento.nome.cartorio" /></label> 
						<div class="col-sm-3">
							<input type="text" name="professor.documento.nomeCartorio" class="form-control" placeholder="<fmt:message key="documento.nome.cartorio" />" />
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>