<%@include file="../cabecalho.jsp"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Categoria"%>
<%@page import="dao.CategoriaDAO"%>


<!-- gambiarra pra alinhar o botão a esquerda-->
<style>
    .direita
            {
                text-align: right;
                padding-right: 10%;
                
            }
</style>
<%
    CategoriaDAO dao = new CategoriaDAO();
    List<Categoria> lista;
     
     if(request.getParameter("txtFiltro")!= null && request.getParameter("txtFiltro")!=""){
         String txtFiltro = request.getParameter("txtFiltro");
         lista = dao.listar(txtFiltro);
     }
     else {
         lista = dao.listar();
     }
%>
<section class="section--center mdl-grid mdl-grid--no-spacing mdl-shadow--2dp">
    <div class="mdl-card mdl-cell mdl-cell--12-col">
        <div class="mdl-card__supporting-text">
            <h4>Categoria</h4>
            <!-- Colored mini FAB button -->
            <div class="direita">
                <a href="add.jsp">
                    <button class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab mdl-button--colored">
                         <i class="material-icons">add</i>
                    </button>  
                </a>
            </div>

            <table class="mdl-data-table mdl-js-data-table">
                <thead>
                    <tr>

                        <th>ID</th>
                        <th>Nome</th>
                        <th>Ações</th>
                    </tr>
                </thead>
                    <tr>
                        <%
                            for(Categoria que:lista){
                                
                            
                        %>
                        <tr>
                            <td><%=que.getId()%></td>
                            <td><%=que.getNome()%></td>
                            <td><a href="upd.jsp?id=<%=que.getId()%>">Editar</a>
                                <a href="del-ok.jsp?id=<%=que.getId()%>">Excluir</a>
                            </td>
                            
                        </tr>
                        <%
                        
                            }
                        
                        %>
                            
                        </td>
                
                    </tr>
                    
                
                    </tr>
                
            </table>   
        </div>

    </div>

</section>

<%@include file="../rodape.jsp"%>

