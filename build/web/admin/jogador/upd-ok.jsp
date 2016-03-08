<%@include file="../cabecalho.jsp"%>
<%@page import="dao.JogadorDAO"%>
<%@page import="modelo.Jogador"%>

<%
if(request.getParameter("txtLogin") == null ||request.getParameter("txtEmail") == null || request.getParameter("txtFoto")==null || request.getParameter("txtId")==null)
{
    response.sendRedirect("list.jsp");
    return;
}
String login = request.getParameter("txtLogin");
String email = request.getParameter("txtEmail");
String foto = request.getParameter("txtFoto");
Long id = Long.parseLong(request.getParameter("txtId"));
//Buscar o registro pela chave prim�ria
//Alterar os demais valores (nesse caso apenas Nome)
//mandar alterar
JogadorDAO dao = new JogadorDAO();
//busquei o professor pelo siape (registro pela C.Prim�ria)
Jogador obj = dao.buscarPorChavePrimaria(id);
//Se n�o encontrou o registro volta pra lista
if(obj == null)
{
    response.sendRedirect("list.jsp");
    return;
}
//Atualizar as demais informa��es enviadas
obj.setLogin(login);
obj.setEmail(email);
obj.setFoto(foto);

dao.alterar(obj);
%>

         <h1 class="centro">Atualiza��o</h1>
            
         <div>
             Registro alterado com sucesso.<br />
             <a href="list.jsp">Voltar para Listagem</a>
         </div>
    </body>
<%@include file="../rodape.jsp"%>

