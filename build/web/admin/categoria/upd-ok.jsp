<%@include file="../cabecalho.jsp"%>
<%@page import="dao.CategoriaDAO"%>
<%@page import="modelo.Categoria"%>


<%
    if(request.getParameter("txtNome") == null || request.getParameter("txtId")==null )
{
    response.sendRedirect("list.jsp");
    return;
}
    
     
       
        String nome = request.getParameter("txtNome");
        Integer id = Integer.parseInt(request.getParameter("id"));
         
        CategoriaDAO dao = new CategoriaDAO();
        Categoria obj = dao.buscarPorChavePrimaria(id);
       
        if(obj==null)
        {
            response.sendRedirect("list.jsp");
            return;
            
        }
        
    obj.setId(id);
    obj.setNome(nome);
    
    obj.alterar(obj);
    
%>
        <div>
            <h1 class="centro">Atualização de Itens</h1>
            
            <div>
                
                <form action="upd-ok.jsp" method="post">
                    <label>Nome:</label><input type="text" name="txtNome" value="<%=obj.getNome()%>" /><br />
                    <label>Codigo:</label><input type="text" name="txtId" value="<%=obj.getId()%>" readonly="readonly"/><br />
                    
                    <input type="submit" value="Atualizar" />
                </form>
            </div>
        </div>
              


<%@include file="../rodape.jsp"%>

