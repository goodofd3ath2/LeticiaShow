package org.apache.jsp.admin.site;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import modelo.Jogador;
import dao.JogadorDAO;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

    //Tentativa de login
    String mensagem = "";
    if(request.getParameter("txtEntrarLogin")!=null &&
            request.getParameter("txtEntrarSenha")!=null)
    {
        JogadorDAO dao = new JogadorDAO();
        Jogador jogador; //variável com o usuário logado
        String login = request.getParameter("txtEntrarLogin");
        String senha = request.getParameter("txtEntrarSenha");
        
        jogador = dao.realizarLogin(login, senha);
        if(jogador !=null)
        {
            //criar uma Sessão para o jogador
            //vou pra tela inicial do jogo
            session.setAttribute("jogador", jogador);
            //vou para tela de jogo
            response.sendRedirect("jogo.jsp");
        }
        else
        {
            mensagem = "Login errado";
        }
       
    }
    

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("        <title>Show do Milhão</title>\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/estilo.css\"/>\r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("        <div class=\"centralizar\">\r\n");
      out.write("            <img src=\"img/show.png\" alt=\"\"/>\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\"inicialformulario\">\r\n");
      out.write("            <h4>Entrar</h4>\r\n");
      out.write("            <form action=\"index.jsp\" method=\"post\">\r\n");
      out.write("                <label>Login:</label>\r\n");
      out.write("                <input type=\"text\" name=\"txtEntrarLogin\"\r\n");
      out.write("                       /><br/>\r\n");
      out.write("                <label>Senha</label>\r\n");
      out.write("                <input type=\"text\" name=\"txtEntrarSenha\"\r\n");
      out.write("                       /><br/>\r\n");
      out.write("                <input type=\"submit\" value=\"Entrar\" />\r\n");
      out.write("                <a href=\"jogo.jsp\">Pular login</a>\r\n");
      out.write("            </form>\r\n");
      out.write("            <div class=\"centralizar\">\r\n");
      out.write("                <hr/>\r\n");
      out.write("                ou\r\n");
      out.write("                <hr/>\r\n");
      out.write("            </div>\r\n");
      out.write("            <h4>Cadastre-se</h4>\r\n");
      out.write("            \r\n");
      out.write("            <form action=\"index.jsp\" method=\"post\">\r\n");
      out.write("                <label>Login:</label>\r\n");
      out.write("                <input type=\"text\" name=\"txtCadastrarLogin\"\r\n");
      out.write("                       /><br/>\r\n");
      out.write("                <label>Senha</label>\r\n");
      out.write("                <input type=\"text\" name=\"txtCadastrarSenha\"\r\n");
      out.write("                       /><br/>\r\n");
      out.write("                <label>Email</label>\r\n");
      out.write("                <input type=\"text\" name=\"txtCadastrarEmail\"\r\n");
      out.write("                       /><br/>\r\n");
      out.write("                <input type=\"submit\" value=\"Cadastrar\" />\r\n");
      out.write("                \r\n");
      out.write("            </form>\r\n");
      out.write("        </div>\r\n");
      out.write("    </body>\r\n");
      out.write("</html>\r\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
