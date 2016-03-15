<%@page import="modelo.Pergunta"%>
<%@page import="dao.PerguntaDAO"%>
<%@page import="modelo.Categoria"%>
<%@include file="../cabecalho.jsp"%>
<%

String msg="";

String certa = request.getParameter("txtCerta");
String enunciado = request.getParameter("txtEnunciado");
Integer nivel = Integer.parseInt(request.getParameter("txtNivel")); 
String a = request.getParameter("txtA");
String b = request.getParameter("txtB");
String c = request.getParameter("txtC");
String d = request.getParameter("txtD");
Integer id = Integer.parseInt(request.getParameter("selCategoria")); 
PerguntaDAO dao = new PerguntaDAO();
Pergunta obj = new Pergunta();

Categoria objCategoria = new Categoria();
objCategoria.setId(id);
        

obj.setCerta(certa);
obj.setEnunciado(enunciado);
obj.setNivel(nivel);
obj.setA(a);
obj.setB(b);
obj.setC(c);
obj.setD(d);
obj.setCategoria(objCategoria);
 try
           {   
               dao.incluir(obj);
               msg = "Registro cadastrado com sucesso";
          }
            catch(Exception ex)
           {
                msg = "Erro ao cadastrar registro";
          }
  
String enunciado1 = request.getParameter("txtEnunciado");
%>

<section class="section--center mdl-grid mdl-grid--no-spacing mdl-shadow--2dp">
    <div class="mdl-card mdl-cell mdl-cell--12-col">
        <div class="mdl-card__supporting-text ">
            <h4>Pergunta - Cadastrar</h4>
             <%=msg%>.<br />
             Enunciado:<%=enunciado1%><br />
            <a href="list.jsp"><i class="material-icons">list</i></a>
            
        </div>

    </div>

<%@include file="../rodape.jsp"%>

