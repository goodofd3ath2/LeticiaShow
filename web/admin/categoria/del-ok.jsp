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
        //buscar o registro pela chave primária
        Categoria obj = dao.buscarPorChavePrimaria(Long.parseLong(id));
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





<%@include file="../rodape.jsp"%>

