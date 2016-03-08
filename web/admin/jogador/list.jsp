<%@include file="../cabecalho.jsp"%>
<!-- gambiarra pra alinhar o botão a esquerda-->
<style>
    .direita
            {
                text-align: right;
                padding-right: 10%;
                
            }
</style><%@page import="java.util.List"%>
<%@page import="modelo.Jogador"%>
<%@page import="dao.JogadorDAO"%>

<%
    JogadorDAO dao = new JogadorDAO();
    List<Jogador> lista;
     
     if(request.getParameter("txtFiltro")!= null && request.getParameter("txtFiltro")!=""){
         String txtFiltro = request.getParameter("txtFiltro");
         lista = dao.listar(txtFiltro);
     }
     else {
         lista = dao.listar();
     }
%>
        <div>
            <h1 class="centro">Item</h1>
            
            <div>
                +<a href="add.jsp">Novo Jogador</a><br />
                  <form action="list.jsp" method="post"> 
                    <input type="text" name="txtFiltro" />
                    <input type="submit" value="Pesquisar"/><br />
                    <table>
                        <tr>
                            <th>Login</th>
                            <th>Email</th>
                            <th>Foto</th>
                            
                            <th>Ações</th>
                        </tr>
                        <%
                            for(Jogador que:lista){
                                
                            
                        %>
                        <tr>
                            <td><%=que.getLogin()%></td>
                            <td><%=que.getEmail()%></td>
                            <td><%=que.getFoto()%></td>
                            <td><%=que.getId()%></td>
                            <td><a href="upd.jsp?codigo=<%=que.getId()%>">Editar</a>
                                <a href="del-ok.jsp?codigo=<%=que.getId()%>">Excluir</a>
                            </td>
                            
                        </tr>
                        <%
                        
                            }
                        
                        %>
                       
                    </table>
                    
                </form>
            </div>
       

<%@include file="../rodape.jsp"%>

