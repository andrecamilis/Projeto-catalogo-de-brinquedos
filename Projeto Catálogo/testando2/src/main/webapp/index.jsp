<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@page import="br.edu.exemplo.dao.BrinquedoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="br.edu.exemplo.model.Brinquedo" %>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="style/inde.css" rel="stylesheet" />
    <!-- <link href="style/global.css" rel="stylesheet" /> -->
    <link rel="shortcut icon" type="imagex/png" href="style/images/logo-site.png">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css">
	<title>Universo Lúcido</title>

</head>

<body>

<div id="linha-vertical"></div>
<div id="logo"> </div>
<h1 id="h1">Universo Lúcido</h1>


<!--============================================================

                        Menu

============================================================-->
<div>
    <nav class="barraLateral">
        <div class="btn-expandir">
            <i class="bi bi-list"></i>
        </div>

        <ul>
            <li class="item-menu">
                <a href="/testando/index.jsp">
                    <span class="icon"><i class="bi bi-house"></i></span>
                    <span class="txtBarra">Início</span>
                </a>
            </li>

            <li class="item-menu">
                <a href="/testando/categoria.jsp">
                    <span class="icon"><i class="bi bi-card-checklist"></i></span>
                    <span class="txtBarra2">Catálogo de Brinquedos</span>
                </a>
            </li>


            <li class="item-menu">
                <a href="listar.jsp">
                    <span class="icon"><i class="bi bi-pencil"></i></span>
                    <span class="txtBarra3">Administração</span>
                </a>
            </li>


            <li class="item-menu">
                <a href="equipe.html">
                    <span class="icon"><i class="bi bi-person-lines-fill"></i></span>
                    <span class="txtBarra4">Sobre a equipe</span>
                </a>
            </li>
        </ul>

    </nav>
    <script src="js/menu.js"></script>
</div>

<div id="linha-vertical2"></div>

<!--============================================================

                        Corpo do  site

============================================================-->

<h2 class="h2">Brinquedos em destaque</h2>
<div id="linha-vertical3"></div>
 <div class="container">
        <%
            BrinquedoDAO dao = new BrinquedoDAO();
            List<Brinquedo> lista = dao.Listar(); // Obtém a lista de brinquedos do banco de dados
            for (Brinquedo brinquedo : lista) {
        %>
        <div class="brinquedo" data-categoria="<%=brinquedo.getCategoria()%>">
        
            <a class="produto-link" href="pagina.jsp?id_brinquedo=<%=brinquedo.getId_brinquedo()%>">
               
                
                <span style="font-weight: bold; color: white;"><%=brinquedo.getNome()%></span>
                <span class="descricao">R$ <%=brinquedo.getPreco()%></span>
                <div class="imagem_container">
                    <img class="im" src="data:image/jpeg;base64, <%=new String(java.util.Base64.getEncoder().encode(brinquedo.getFoto()))%>" alt="<%=brinquedo.getNome()%>">
                
                </div>
                
            </a>
             
        </div>
        <%
        }
        %>
    </div>
   
</body>
 
</html>