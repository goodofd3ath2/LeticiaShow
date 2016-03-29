<%@page import="modelo.Jogador"%>
<%@page import="dao.JogadorDAO"%>
<%@include file="cabecalho-index.jsp"%>

<%
    String mensagem = "";
        if(request.getParameter("txtEntrarLogin")!=null &&
                request.getParameter("txtEntrarSenha")!=null)
        {
            JogadorDAO dao = new JogadorDAO();
            Jogador jogador;
            String login = request.getParameter("txtEntrarLogin");
            String senha = request.getParameter("txtEntrarSenha");
            
            jogador = dao.realizarLogin(login, senha);
            if(jogador !=null)
            {
                mensagem = "Login OK";
            }
            else
            { 
                mensagem = "Login not OK";
            }
            out.print(mensagem);
        }
    %>
<section class="section--center mdl-grid mdl-grid--no-spacing mdl-shadow--2dp">
    <div class="mdl-card mdl-cell mdl-cell--12-col">
        <div class="mdl-card__supporting-text">
            <h4>Gerenciamento do Sistema</h4>
            Dolore ex deserunt aute fugiat aute nulla ea sunt aliqua nisi cupidatat eu. Nostrud in laboris labore nisi amet do dolor eu fugiat consectetur elit cillum esse. Pariatur occaecat nisi laboris tempor laboris eiusmod qui id Lorem esse commodo in. Exercitation aute dolore deserunt culpa consequat elit labore incididunt elit anim.
        </div>

    </div>

</section>

<%@include file="rodape-index.jsp"%>
