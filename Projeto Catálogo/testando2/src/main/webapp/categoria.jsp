<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Universo Lúcido</title>
    <link href="style/categoria.css" rel="stylesheet" />
    <!-- Logo do site -->
    <link rel="shortcut icon" type="imagex/png" href="style/images/logo-site.png">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css">

</head>
<body>

<div id="linha-vertical"></div>
<div id="logo"></div>
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
                <a href="index.jsp">
                    <span class="icon"><i class="bi bi-house"></i></span>
                    <span class="txtBarra">Início</span>
                </a>
            </li>

            <li class="item-menu">
                <a href="categoria.jsp">
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



<h2 class="h2">Catálogo de Brinquedo:  :categorias</h2>
<div id="linha-vertical3"></div>
<div class="categorias">
<form action="ServletCatalogo" method="get">
 <input type="hidden" name="cmd" value="filtrarPorCategoria">
    
     <div id="brinquedo">
    <button style="Transparent" type="submit" name="categoria" value="jogos eletronico">
        <img src="style/images/jogos.png" width="200px">
    <h3 id="h4">Jogos </h3>
    <h3 id="h5">Eletronicos</h3></button></div>
    
    
    <div id="brinquedo2">
    <button style="Transparent" type="submit" name="categoria" value="brinquedo"><img src="style/images/brinquedo.png" width="205px">
    <h3 id="h3">Brinquedos</h3></button></div>
 
    <div id="brinquedo3">
   <button type="submit" name="categoria" value="livros">
    <img src="style/images/livro.png" width="205px">
        <h3 id="h3">Lívros</h3></button></div>
        
        
    <div id="brinquedo4">
    <button type="submit" name="categoria" value="bonecos">
    <img src="style/images/action.png" width="295px" >
        <h3 id="h3">Bonécos</h3></button></div>

</form>
</div>
</body>
</html>