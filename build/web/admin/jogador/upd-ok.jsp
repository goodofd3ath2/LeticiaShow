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
//Buscar o registro pela chave primária
//Alterar os demais valores (nesse caso apenas Nome)
//mandar alterar
JogadorDAO dao = new JogadorDAO();
//busquei o professor pelo siape (registro pela C.Primária)
Jogador obj = dao.buscarPorChavePrimaria(id);
//Se não encontrou o registro volta pra lista
if(obj == null)
{
    response.sendRedirect("list.jsp");
    return;
}
//Atualizar as demais informações enviadas
obj.setLogin(login);
obj.setEmail(email);
obj.setFoto(foto);

dao.alterar(obj);
%>

         <h1 class="centro">Atualização</h1>
            
         <div>
             Registro alterado com sucesso.<br />
             <a href="list.jsp">Voltar para Listagem</a>
         </div>
    </body>
<%@include file="../rodape.jsp"%>

