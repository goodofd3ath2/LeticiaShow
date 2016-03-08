<%@page import="dao.CategoriaDAO"%>
<%@page import="modelo.Categoria"%>
<%@include file="cabecalho.jsp"%>


<%
    if(request.getParameter("id") == null)
    {
      response.sendRedirect("item.jsp"); 
      //para a execução aqui
      return;
    }
     //Buscar o registro(professor) a partir da sua
        //chave primária, nesse caso o SIAPE
        String id = request.getParameter("id");
        CategoriaDAO dao = new CategoriaDAO();
        Categoria obj = dao.buscarPorChavePrimaria(Long.parseLong(id));
        //verificar se o registro existe, se não existir, volta pra lista
        if(obj==null)
        {
            response.sendRedirect("item.jsp");
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


