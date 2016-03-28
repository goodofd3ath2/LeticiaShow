<%-- 
    Document   : debug.jsp
    Created on : 28/03/2016, 18:15:25
    Author     : Aluno
--%>
<%@page import="dao.JogadorDAO"%>
<%@page import="modelo.Jogador"%>
<%
Jogador jogador = new Jogador();
jogador.setEmail("aaa@llll.com");
jogador.setFoto("alo.jpg");
jogador.setSenha("1111");

JogadorDAO dao = new JogadorDAO();

dao.incluir(jogador );
String msg = "Tudo Ok";
 %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
