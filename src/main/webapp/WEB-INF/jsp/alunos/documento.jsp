<div class="panel-group" id="accordion">
	<div class="panel panel-default">
		<div class="panel-heading">
			<h4 class="panel-title">
				<a data-toggle="collapse" data-parent="#accordion"
					href="#collapseOne"> <fmt:message
						key="documento.info.certidao" />
				</a>
			</h4>
		</div>
		<div id="collapseOne" class="panel-collapse collapse in">
			<div class="panel-body">
				<div class="form-group">
					<label class="col-sm-2 control-label"><fmt:message key="documento.tipo.certidao" /></label>
					<div class="col-sm-3">
						<select name="aluno.documento.tipoCertidao" class="form-control">
							<option value=""><fmt:message key="menu.selecione" /></option>
							<c:forEach items="${listaCertidoes}" var="c">
								<option value="${c.label}"
									${c.label eq aluno.documento.tipoCertidao ? "selected='selected'" : ""}>${c.label}</option>
							</c:forEach>
						</select>
					</div>
					<label class="col-sm-2 control-label"><fmt:message key="documento.modelo" /></label>
					<div class="col-sm-3">
						<select id="modeloCertidao" name="aluno.documento.modeloCertidao" class="form-control">
							<option value=""><fmt:message key="menu.selecione" /></option>
							<c:forEach items="${listaModelos}" var="m">
								<option value="${m.label}" ${m.label eq aluno.documento.modeloCertidao ? "selected='selected'" : ""}>${m.label}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="form-group" id="modeloNovo" style="display: ${aluno.documento.modeloCertidao eq 'Modelo novo' ? block : none}">
					<label class="col-sm-2 control-label"><fmt:message key="documento.numero.matricula" /></label>
					<div class="col-sm-3">
						<input name="aluno.documento.numeroMatricula" value="${aluno.documento.numeroMatricula}" type="text" class="form-control" placeholder="<fmt:message key="documento.numero.matricula" />" />
					</div>
				</div>
				<div id="modeloAntigo">
					<div class="form-group">
						<label class="col-sm-2 control-label"><fmt:message key="documento.numero" /></label>
						<div class="col-sm-3">
							<input name="aluno.documento.numeroDoTermo" value="${aluno.documento.numeroDoTermo}" type="text" class="form-control" placeholder="<fmt:message key="documento.numero.termo" />" />
						</div>
						<label class="col-sm-2 control-label"><fmt:message key="documento.data" /></label>
						<div class="col-sm-3">
							<div class='input-group date' id='datetimepicker2'>
								<input name="aluno.documento.dataEmissaoCertidao" value='<fmt:formatDate value="${aluno.documento.dataEmissaoCertidao}" pattern="dd/MM/yyyy" />'  placeholder="<fmt:message key="documento.data.expedicao" />" type="text" class="form-control" /> 
								<span class="input-group-addon">
									<span class="glyphicon glyphicon-time"></span>
								</span>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label"><fmt:message key="documento.folha" /></label>
						<div class="col-sm-3">
							<input name="aluno.documento.folhaDoTermo" value="${aluno.documento.folhaDoTermo}" type="text" class="form-control"
								placeholder="<fmt:message key="documento.folha" />" />
						</div>
						<label class="col-sm-2 control-label"><fmt:message key="documento.livro" /></label>
						<div class="col-sm-3">
							<input name="aluno.documento.livro" value="${aluno.documento.livro}" type="text" class="form-control"
								placeholder="<fmt:message key="documento.livro" />" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label"><fmt:message key="documento.uf.cartorio" /></label>
						<div class="col-sm-3">
							<select name="aluno.documento.ufCartorio.id" id="documentoEstadoSelect" class="form-control">
								<option value=""><fmt:message key="menu.selecione" /></option>
								<c:forEach items="${listaEstados}" var="uf">
									<option value="${uf.id}" ${uf.id eq aluno.documento.ufCartorio.id ? "selected='selected'" : ""}>${uf.nome}</option>
								</c:forEach>
							</select>
						</div>
						<label class="col-sm-2 control-label"><fmt:message
								key="documento.cidade" /></label>
						<div class="col-sm-3">
							<select name="aluno.documento.cidadeCartorio.id"
								id="documentoCidadesSelect" class="form-control">
								<option value=""><fmt:message key="menu.selecione" /></option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label"><fmt:message
								key="documento.nome.cartorio" /></label>
						<div class="col-sm-3">
							<input name="aluno.documento.nomeCartorio"
								value="${aluno.documento.nomeCartorio}" type="text"
								class="form-control"
								placeholder="<fmt:message key="documento.nome.cartorio" />" />
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="panel panel-default">
		<div class="panel-heading">
			<h4 class="panel-title">
				<a data-toggle="collapse" data-parent="#accordion"
					href="#collapseTwo"> <fmt:message key="documento.cadastrar" />
				</a>
			</h4>
		</div>
		<div id="collapseTwo" class="panel-collapse collapse">
			<div class="panel-body">
				<div class="form-group">
					<label class="col-sm-2 control-label"><fmt:message
							key="documento.numero.identidade" /></label>
					<div class="col-sm-3">
						<input name="aluno.documento.numIdentidade"
							value="${aluno.documento.numIdentidade}" type="text"
							class="form-control"
							placeholder="<fmt:message key="documento.numero.identidade" />" />
					</div>
					<label class="col-sm-2 control-label"><fmt:message
							key="documento.complemento" /></label>
					<div class="col-sm-3">
						<input name="aluno.documento.compIdentidade"
							value="${aluno.documento.compIdentidade}" type="text"
							class="form-control"
							placeholder="<fmt:message key="documento.complemento.identidade" />" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label"><fmt:message
							key="documento.orgao" /></label>
					<div class="col-sm-3">
						<input name="aluno.documento.orgaoEmissor"
							value="${aluno.documento.orgaoEmissor}" type="text"
							class="form-control"
							placeholder="<fmt:message key="documento.orgao.emissor" />" />
					</div>
					<label class="col-sm-2 control-label"><fmt:message
							key="documento.data" /></label>
					<div class="col-sm-3">
						<div class='input-group date' id='dataExpedicao'>
							<input name="aluno.documento.dataExpedicaoIdentidade"
								value="${aluno.documento.dataExpedicaoIdentidade}"
								placeholder="<fmt:message key="documento.data.expedicao" />"
								type="text" class="form-control" /> <span
								class="input-group-addon"><span
								class="glyphicon glyphicon-time"></span></span>
						</div>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label"> <fmt:message
							key="documento.uf.identidade" /></label>
					<div class="col-sm-3">
						<select class="form-control"
							name="aluno.documento.ufIdentidade.id">
							<option value=""><fmt:message key="menu.selecione" /></option>
							<c:forEach items="${listaEstados}" var="uf">
								<option value="${uf.id}"
									${uf.id eq aluno.documento.ufIdentidade.id ? "selected='selected'" : ""}>${uf.nome}</option>
							</c:forEach>
						</select>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>