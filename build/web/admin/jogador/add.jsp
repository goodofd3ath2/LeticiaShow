<%@include file="../cabecalho.jsp"%>
<div>
            <h1 class="centro">Cadastro de Jogadores</h1>
            
            <div>
                
                <form action="add-ok.jsp">
                    <label>Codigo</label><input type="text" name="txtId" /><br />
                    <label>Email</label><input type="text" name="txtEmail" /><br />
                    <label>Foto</label><input type="text" name="txtFoto" /><br />
                    
                    
                    <input type="reset" value="Limpar" />
                    <input type="submit" value="Cadastrar" />
                </form>
            </div>
        </div>


<%@include file="../rodape.jsp"%>


