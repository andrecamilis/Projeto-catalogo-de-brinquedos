<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="br.edu.exemplo.dao.BrinquedoDAO" %>
<%@ page import="br.edu.exemplo.model.Brinquedo" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="style/lista.css" rel="stylesheet" />
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



<h2 id="h2">Catálogo de Brinquedos: :administração:</h2>
<div id="linha-vertical3"></div>

<table id="teste" border="1">
        <tr>
            <th>ID</th>
            <th>Nome</th>
            <th>Categoria</th>
            <th>Preço</th>
            <th>Codigo</th>
            <th>Descrição</th>
            <th>Opções</th>
        </tr>
        <%
            BrinquedoDAO dao = new BrinquedoDAO();
            List<Brinquedo> lista = dao.Listar();
            for (Brinquedo brinquedo : lista) {
        %>
        <tr>
            <td><%= brinquedo.getId_brinquedo() %></td>
            <td><%= brinquedo.getNome() %></td>
            <td><%= brinquedo.getCategoria() %></td>
            <td>R$ <%= brinquedo.getPreco() %></td>
            <td><%= brinquedo.getCodigo() %></td>
            <td><%= brinquedo.getDescricao() %></td>
            <td>
                <a href="atualizar.jsp?id_brinquedo=<%= brinquedo.getId_brinquedo() %>">Atualizar</a>
       <form method="post" action="ServletCatalogo">
    <input type="hidden" name="cmd" value="excluir">
    <input type="hidden" name="id_brinquedo" value="<%= brinquedo.getId_brinquedo() %>">
    <button type="submit" onclick="return confirm('Tem certeza que deseja excluir este brinquedo?')">Excluir</button>
    <input type="hidden" name="currentPage" value="<%= request.getRequestURI() %>">
</form>


            </td>
        </tr>
        <%
            }
        %>
    </table>
    
    
    <button id="bntEnviar" onclick="window.location.href ='cadastroBrinquedo.jsp'">Cadastrar Brinquedo</button>
    
 
    
</body>
</html>