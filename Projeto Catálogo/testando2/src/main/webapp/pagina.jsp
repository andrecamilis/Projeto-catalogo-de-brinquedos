<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="br.edu.exemplo.dao.BrinquedoDAO" %>
<%@ page import="br.edu.exemplo.model.Brinquedo" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link href="style/pagin2.css" rel="stylesheet" />
    <link rel="shortcut icon" type="imagex/png" href="style/images/logo-site.png">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css">
    
    <title>Universo Lúcido</title>
</head>
<body>

<div id="linha-vertical"></div>
<div id="logo"></div>
<h1 id="h1">Universo Lúcido</h1>
    <%
    try {
        // Recupere o "id_brinquedo" da solicitação
        int idBrinquedo = Integer.parseInt(request.getParameter("id_brinquedo"));
        // Crie uma instância do DAO e obtenha o brinquedo com base no "id_brinquedo"
        BrinquedoDAO dao = new BrinquedoDAO();
        Brinquedo brinquedo = dao.obterBrinquedoPorId(idBrinquedo); // Use a variável idBrinquedo

        // Exiba os detalhes do brinquedo
    %>
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
    
    
    
    <h2 class="h2">Catálogo de Brinquedo: <%= brinquedo.getCategoria() %> : <%= brinquedo.getNome() %> </h2>
<div id="linha-vertical3"></div>


	
    <img src="data:image/jpeg;base64, <%= new String(java.util.Base64.getEncoder().encode(brinquedo.getFoto())) %>"  alt="<%= brinquedo.getNome() %>">
    
    <p id = "codBrinquedo"><%=brinquedo.getCodigo() %></p>
    <p id ="nomeProd"><%= brinquedo.getNome() %></p>
   
   
    <p id="rbpreco">R$ <%= brinquedo.getPreco() %></p>

    <div id = "container">
    <p id="informacoes">_=Descrição=_</p>
    <p id="desq"><%= brinquedo.getDescricao() %></p></div>
    
   		
 
    
    
<!--<form method="post" action="ServletCatalogo">
    	<input type="hidden" name="cmd" value="excluir">
   		<input type="hidden" name="id_brinquedo" value="<%= brinquedo.getId_brinquedo() %>">
    	<button type="submit" onclick="return confirm('Tem certeza que deseja excluir este brinquedo?')">Excluir</button>
	</form>-->
	

	<!--<form method="post" action="atualizar.jsp">
	<a href="atualizar.jsp?id_brinquedo=<%= brinquedo.getId_brinquedo() %>">Atualizar</a>
	<% System.out.println("ID do Brinquedo: " + idBrinquedo);%>
	

</form>-->

    <%
    } catch (Exception e) {
        out.println("Erro ao carregar os detalhes do brinquedo.");
    }
    %>

</body>
</html>
