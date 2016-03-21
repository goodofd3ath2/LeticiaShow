<%@include file="../cabecalho.jsp"%>
<%@page import="dao.CategoriaDAO"%>
<%@page import="modelo.Categoria"%>



<%
 
    if(request.getParameter("id") == null)
    {
      response.sendRedirect("list.jsp"); 
     
      return;
    }
     
        Integer id = Integer.parseInt(request.getParameter("txtId"));
        String nome = request.getParameter("txtNome");
        CategoriaDAO dao = new CategoriaDAO();
        Categoria obj = dao.buscarPorChavePrimaria(id);
        
        if(obj==null)
        {
            response.sendRedirect("list.jsp");
            return;
            
        }
        
    
    
%>
 <div>
            <h1 class="centro">Atualização</h1>
            
            <div>
                
                <form action="upd-ok.jsp" method="post">
                    <label>Nome:</label><input type="text" name="txtNome" value="<%=obj.getNome()%>" /><br />
                    <label>Codigo:</label><input type="text" name="txtId" value="<%=obj.getId()%>" readonly="readonly"/><br />
                                        <input type="submit" value="Atualizar" />
                </form>
            </div>
        </div>
              
    </body>

<%@include file="../rodape.jsp"%>


