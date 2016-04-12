<%@page import="modelo.Ranking"%>
<%@page import="dao.RankingDAO"%>
<%@include file="../cabecalho.jsp"%>
<%@include file="../cabecalho.jsp"%>
<%
    String msg = "";
    if(request.getParameter("id")==null)
    {
        response.sendRedirect("list.jsp");
    }
    else
    {
        
        Long id = Long.parseLong(request.getParameter("id")); 
        
        RankingDAO dao = new RankingDAO();
        
        Ranking obj = dao.buscarPorChavePrimaria(id);
        
        if(obj!=null)
        {
            dao.excluir(obj);
            msg = "Registro exclu�do com sucesso";
        }
        else
        {
            msg = "Registro n�o encontrado. Verifique.";
        }
        
    }
String id = request.getParameter("txtId");
%>
<section class="section--center mdl-grid mdl-grid--no-spacing mdl-shadow--2dp">
    <div class="mdl-card mdl-cell mdl-cell--12-col">
        <div class="mdl-card__supporting-text ">
           <h4>Pergunta - Excluir</h4>
            <%=msg%>.<br />
            Id:<%=id%><br />
            <a href="list.jsp"><i class="material-icons">list</i></a>
            
        </div>

    </div>

</section>

<%@include file="../rodape.jsp"%>

