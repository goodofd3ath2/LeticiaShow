
<%@page import="dao.JogadorDAO"%>
<%@page import="modelo.Jogador"%>
<%@include file="cabecalho.jsp"%>
<%
    
  //Buscar as informações do Formulario
    String login = request.getParameter("txtLogin");
    String email = request.getParameter("txtEmail");
    String foto = request.getParameter("txtFoto");
    
    Long codigo = Long.parseLong(request.getParameter("txtCodigo"));
    //Criar meu objeto modelo 
    Jogador jog = new Jogador();
    //Adiciono os valores enviados
    jog.setEmail(email);
    jog.setFoto(foto);
    jog.setLogin(login);
       
    //Instanciar minha classe de acesso a dados
    JogadorDAO dao = new JogadorDAO();
    
    dao.incluir(jog);
%>
         <h1 class="centro">Cadastro de Itens</h1>
            
         <div>
              Registro cadastrado com sucesso.<br />
                Nome:<%=email%><br />
             <a href="list.jsp">Voltar para Listagem</a>
             
         </div>
    
<%@include file="../rodape.jsp"%>

