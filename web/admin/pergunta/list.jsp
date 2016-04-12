<%@page import="modelo.Pergunta"%>
<%@page import="java.util.List"%>
<%@page import="dao.PerguntaDAO"%>
<%@include file="../cabecalho.jsp"%>
<%
PerguntaDAO dao = new PerguntaDAO();
List<Pergunta> lista;
//Verificar se veio algo do filtro, 
//se vier eu filtro pro nome
//caso contr�rio eu trago todos os clientes
if(request.getParameter("txtFiltro")!= null && request.getParameter("txtFiltro")!= "")
{
    String txtFiltro = request.getParameter("txtFiltro");
     lista = dao.listar(txtFiltro);
  
}
else
{
    lista = dao.listar();
}
%>
<!-- gambiarra pra alinhar o bot�o a esquerda-->
<style>
    .direita
            {
                text-align: right;
                padding-right: 10%;
                
            }
</style>
<section class="section--center mdl-grid mdl-grid--no-spacing mdl-shadow--2dp">
    <div class="mdl-card mdl-cell mdl-cell--12-col">
        <div class="mdl-card__supporting-text">
            <h4 class="centro">Pergunta</h4>
            <!-- Colored mini FAB button -->
            <div class="direita">
                <a href="add.jsp">
                    <button class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab mdl-button--colored">
                         <i class="material-icons">add</i>
                    </button>  
                </a>
            </div>
            
             <form action="list.jsp" method="post"> 
                <input type="text" name="txtFiltro" />
                <input type="submit" value="Pesquisar"/><br />
             </form>
            
            <table class="mdl-data-table mdl-js-data-table">
                <thead>
                    <tr>

                        <th>Enunciado</th>
                        <th>N�vel</th>
                        <th>A��es</th>
                    </tr>
                    <%
                        for(Pergunta item:lista)
                            {
                    %>
                </thead>
                <tbody>
                    <tr>
                        <td><%=item.getEnunciado()%></td>
                        <td><%=item.getNivel()%></td>
                        
                        <td>
                            <!-- 
                                Atualizar 
                            -->
                            <div id="ttupd" class="icon material-icons">
                                <i class="material-icons"><a href="upd.jsp?id=<%=item.getId()%>">update</a></i>
                            </div>
                            <div class="mdl-tooltip" for="ttupd">
                                Atualizar
                            </div>
                            <!-- 
                                Excluir     
                            -->
                            <div id="ttdel" class="icon material-icons">
                                <i class="material-icons"><a href="del-ok.jsp?id=<%=item.getId()%>">delete</a></i>
                            </div>
                            <div class="mdl-tooltip" for="ttdel">
                                Excluir
                            </div>
                            
                        </td>
                
                    </tr>
                    
                    
                    <%
                         }
                     %>
                     
                   
                </tbody>
            </table>   
        </div>

    </div>

<%@include file="../rodape.jsp"%>

