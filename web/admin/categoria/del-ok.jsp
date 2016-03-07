<%@include file="../cabecalho.jsp"%>
<%@page import="modelo.Categoria"%>
<%@page import="dao.CategoriaDAO"%>
<%
    String msg = "";
    if(request.getParameter("codigo")==null)
    {
        response.sendRedirect("item.jsp");
    }
    else
    {
        String codigo = request.getParameter("codigo");
        
        CategoriaDAO dao = new CategoriaDAO();
        //buscar o registro pela chave primária
        Categoria obj = dao.buscarPorChavePrimaria(Long.parseLong(codigo));
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



</section>

<%@include file="../rodape.jsp"%>

