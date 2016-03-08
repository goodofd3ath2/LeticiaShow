<%@include file="../cabecalho.jsp"%>
<%@page import="dao.CategoriaDAO"%>
<%@page import="modelo.Categoria"%>

<%
    
  //Buscar as informações do Formulario
    String nome = request.getParameter("txtNome");
    
    Long id = Long.parseLong(request.getParameter("txtId"));
    //Criar meu objeto modelo 
    Categoria cat = new Categoria();
    //Adiciono os valores enviados
   cat.setNome(nome);
   
    
    //Instanciar minha classe de acesso a dados
    CategoriaDAO dao = new CategoriaDAO();
    
    dao.incluir(cat);
%>
         <h1 class="centro">Cadastro de Itens</h1>
            
         <div>
              Registro cadastrado com sucesso.<br />
                Nome:<%=nome%><br />
             <a href="list.jsp">Voltar para Listagem</a>
         </div>    




<%@include file="../rodape.jsp"%>

