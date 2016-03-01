<%@page import="modelo.Pergunta"%>
<%@page import="dao.PerguntaDAO"%>
<%@include file="cabecalho-index.jsp"%>

<%
    String msg = "";
    if(request.getParameter("codigo")==null)
    {
        response.sendRedirect("item.jsp");
    }
    else
    {
        String codigo = request.getParameter("codigo");
        
        PerguntaDAO dao = new PerguntaDAO();
        //buscar o registro pela chave primária
        Pergunta obj = dao.buscarPorChavePrimaria(Long.parseLong(codigo));
        if(obj!=null)
        {
            dao.excluir(obj);
            msg = "Registro excluído com sucesso";
        }
        else
        {
            msg = "Registro não encontrado. Verifique.";
        }
        
    }
%>

<section class="section--center mdl-grid mdl-grid--no-spacing mdl-shadow--2dp">
    <div class="mdl-card mdl-cell mdl-cell--12-col">
        <div class="mdl-card__supporting-text ">
            <h4>Pergunta - Excluir</h4>
            
            <div>
             <%=msg%><br />
             <a href="list.jsp">Voltar para Listagem</a>
         </div>
        </div>

    </div>

</section>

<%@include file="../rodape.jsp"%>

