
<%@include file="../cabecalho.jsp"%>
<%@page import="dao.JogadorDAO"%>
<%@page import="modelo.Jogador"%>


<%
    if(request.getParameter("id") == null)
    {
      response.sendRedirect("list.jsp"); 
      //para a execução aqui
      return;
    }
     //Buscar o registro(professor) a partir da sua
        //chave primária, nesse caso o SIAPE
        String id = request.getParameter("id");
        JogadorDAO dao = new JogadorDAO();
        Jogador obj = dao.buscarPorChavePrimaria(Long.parseLong(id));
        //verificar se o registro existe, se não existir, volta pra lista
        if(obj==null)
        {
            response.sendRedirect("list.jsp");
            return;
            
        }
        
    
    
%>
        <div>
            <h1 class="centro">Atualização</h1>
        
            <div>
                
                <form action=upd-ok.jsp" method="post">
                    <label>Login:</label><input type="text" name="txtNome" value="<%=obj.getLogin()%>" /><br />
                    <label>Email:</label><input type="text" name="txtId" value="<%=obj.getEmail()%>" /><br />
                    <label>Foto:</label><input type="text" name="txtId" value="<%=obj.getFoto()%>" readonly="readonly"/><br />
                   
                   
                    <input type="submit" value="Atualizar" />
                </form>
            </div>
        </div>


        
    </body>
<section class="section--center mdl-grid mdl-grid--no-spacing mdl-shadow--2dp">
    <div class="mdl-card mdl-cell mdl-cell--12-col">
        <div class="mdl-card__supporting-text">
            <h4>Jogador - Atualizar</h4>
            <form action="upd-ok.jsp" method="post">
                <!-- 
                    primeira div -- área que ocupará o campo de formulário
                    segunda div -- campo de texto e label 
                -->
                <div class="mdl-cell--12-col"> 
                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                        <input class="mdl-textfield__input" type="text" required  id="txtNome" />
                        <label class="mdl-textfield__label" for="txtLogin">Login</label>
                    </div>
                <div class="mdl-cell--12-col"> 
                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                        <input class="mdl-textfield__input" type="text" required  id="txtNome" />
                        <label class="mdl-textfield__label" for="txtSenha">Senha</label>
                    </div>
                </div>
                <div class="mdl-cell--12-col"> 
                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                        <input class="mdl-textfield__input" type="text" required  id="txtNome" />
                        <label class="mdl-textfield__label" for="txtEmail">Email</label>
                    </div>
                </div>
                <div class="mdl-cell--12-col"> 
                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                        <input class="mdl-textfield__input" type="text" required  id="txtNome" />
                        <label class="mdl-textfield__label" for="txtFoto">Foto</label>
                    </div>
                </div>
                </div>
                <div class="mdl-cell--12-col">
                    
                    <button type="submit" class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab mdl-button--colored">
                    <i class="material-icons">save</i></button>
                    <button type="reset" class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab mdl-button--colored">
                    <i class="material-icons">clear</i></button>
                    
                    
                </div>
            </form>
        </div>

    </div>

</section>

<%@include file="../rodape.jsp"%>


