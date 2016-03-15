<%@page import="modelo.Categoria"%>
<%@page import="java.util.List"%>
<%@page import="dao.CategoriaDAO"%>
<%@page import="modelo.Pergunta"%>
<%@page import="dao.PerguntaDAO"%>
<%@include file="../cabecalho.jsp"%>
<%
  if(request.getParameter("a") == null ||request.getParameter("nivel") == null ||request.getParameter("certa") == null ||request.getParameter("enunciado") == null ||request.getParameter("categoria") == null)
    {
        response.sendRedirect("list.jsp");
        return;
    }
  
    Long enunciado = Long.parseLong(request.getParameter("enunciado"));
    PerguntaDAO dao = new PerguntaDAO();
    Pergunta obj = dao.buscarPorChavePrimaria(enunciado);
    //Achou a pergunta se não achou volta pra lista
    if(obj==null)
    {
        response.sendRedirect("pergunta.jsp");
        return;
    }
    
    
    
//Listagem de categorias
    CategoriaDAO cDAO = new CategoriaDAO();
    List<Categoria> cLista = cDAO.listar();
%>

<section class="section--center mdl-grid mdl-grid--no-spacing mdl-shadow--2dp">
    <div class="mdl-card mdl-cell mdl-cell--12-col">
        <div class="mdl-card__supporting-text">
            <h4>Pergunta - Atualizar</h4>
            <form action="upd-ok.jsp" method="post">
                <!-- 
                    primeira div -- área que ocupará o campo de formulário
                    segunda div -- campo de texto e label 
                -->
                  <div class="mdl-cell--12-col"> 
                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                        <input class="mdl-textfield__input" type="text" required  id="txtNome" />
                        <label class="mdl-textfield__label" for="txtPergunta">Pergunta</label>
                    </div>
                </div>
                <div class="mdl-cell--12-col"> 
                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                        <input class="mdl-textfield__input" type="text" required  id="txtNome" />
                        <label class="mdl-textfield__label" for="txtEnunciado">Enunciado</label>
                    </div>
                </div>
                
                <!-- 
                    essa div será para o cadastro do NÍVEL da pergunta
                -->
                <div class="mdl-cell--12-col">
                    <div class="mdl-select mdl-js-select mdl-select--floating-label">
                        <select class="mdl-select__input" id="selCategoria" name="selCategoria">
                            <option value="">Selecione a resposta</option>
                              <%                           
                String selected = "";    
                for (Categoria c : cLista) {
                     if(c.getNome()== obj.getCategoria().getNome())
                     {
                         selected = "selected";
                     }
                %>
                <option value="<%=c.getNome()%>" <%=selected%>><%=c%></option>
                <%
                    selected = "";
                    }
                %>
                        </select>
                        <label class="mdl-select__label" for="selCategoria">Exemplo Select</label>
                    </div>
                </div>
                <!-- 
                    essa div será para o cadastro do ACERTO da pergunta
                -->
                <div class="mdl-cell--12-col"> 
                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                        <input class="mdl-textfield__input" type="text" required  id="txtNome" />
                        <label class="mdl-textfield__label" for="txtAcerto">Acerto</label>
                    </div>
                </div>
                <div class="mdl-cell--12-col"> 
                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                        <input class="mdl-textfield__input" type="text" required  id="txtNome" />
                        <label class="mdl-textfield__label" for="txtNivel">Nível</label>
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


