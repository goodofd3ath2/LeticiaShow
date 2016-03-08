<%@include file="../cabecalho.jsp"%>
<%@page import="modelo.Categoria"%>
<%@page import="dao.CategoriaDAO"%>
<%
    String msg = "";
    if(request.getParameter("id")==null)
    {
        response.sendRedirect("list.jsp");
    }
    else
    {
        String id = request.getParameter("id");
        
        CategoriaDAO dao = new CategoriaDAO();
        //buscar o registro pela chave prim�ria
        Categoria obj = dao.buscarPorChavePrimaria(Long.parseLong(id));
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
%>
         <h1 class="centro">Exclus�o de Itens</h1>
            
         <div>
             <%=msg%><br />
             <a href="list.jsp">Voltar para Listagem</a>
         </div>





<%@include file="../rodape.jsp"%>

