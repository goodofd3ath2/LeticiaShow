<%@include file="../cabecalho.jsp"%>

<%@include file="cabecalho.jsp"%>
<%@page import="modelo.Jogador"%>
<%@page import="dao.JogadorDAO"%>
<%
    String msg = "";
    if(request.getParameter("id")==null)
    {
        response.sendRedirect("list.jsp");
    }
    else
    {
        String id = request.getParameter("id");
        
        JogadorDAO dao = new JogadorDAO();
        //buscar o registro pela chave primária
        Jogador obj = dao.buscarPorChavePrimaria(Long.parseLong(id));
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
         <h1 class="centro">Exclusão de Itens</h1>
            
         <div>
             <%=msg%><br />
             <a href="list.jsp">Voltar para Listagem</a>
         </div>
    </body>
      
<%@include file="../rodape.jsp"%>

