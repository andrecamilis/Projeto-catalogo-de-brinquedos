<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Cadastro Brinquedo</title>
	
    <link rel="stylesheet" href="style/cadastroBrinquedo.css">
    <link rel="stylesheet" href="style.css">
    <link rel="shortcut icon" type="image/png" href="/testando2/src/main/webapp/html/css/images/logo-site.png">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm bootstrap-icons@1.10.4/font/bootstrap-icons.css">

 <script>

            function verificarCodigoExistente() {
                var codigo = document.getElementsByName("txtCodigo")[0].value;
                var codigoExistsMessage = document.getElementById("codigo-exists-message");

                // Simule a verificação de código existente (substitua isso pelo código do lado do servidor)
                if (codigo === "codigoExistente") {
                    codigoExistsMessage.innerText = "Este código já existe.";
                } else {
                    codigoExistsMessage.innerText = ""; // Limpa a mensagem
                }
            }
        </script>
</head>

<body>
<h2></h2>
    <form action="../ServletCatalogo" method="post" enctype="multipart/form-data" class="centered-form" onsubmit="return validarForm();">
        <!-- Menu -->
        <div>
            <nav class="barraLateral">
                <nav class="barraLateral">
        <div class="btn-expandir">
            <i class="bi bi-list"></i>
        </div>

        <ul>
            <li class="item-menu">
                <a href="webapp/index.jsp">
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
            </nav>
            <script src="js/menu.js"></script>
        </div>

      
        <div id="codigo-exists-message" style="color: red;"></div> <!-- Mensagem de código existente -->

       

        <div id="linha-vertical2"></div>

        <div id="logo"></div>
        <h1 id="h1">Universo Lúcido</h1>
        <div id="linha-vertical"></div>
        <h2>Catálogo de Brinquedos: Novo Brinquedo</h2>

        <div id="texto">
            Nome:<br><br>
            Categoria:<br><br>
            Imagem:<br><br>
            Valor:<br><br>
            Código:<br><br>
            Descrição:<br><br>
        </div>

        <div id="inserir">
            <input type="hidden" name="cmd" value="incluir">
            <input type="text" name="txtNome" size="60" maxlength="30"  /><br><br>
            <select size="1" name="cmbCategoria" >
                <option>Selecione uma Categoria</option>
                <option>Jogos Digitais</option>
                <option>Livros</option>
                <option>Bonecos</option>
            </select><br><br>
            <input type="file" name="txtFoto" size="60" ><br><br>
            <input type="number" name="txtPreco" step="any" size="60" maxlength="20"/><br><br>
            <input type="number" name="txtCodigo" step="any" size="60" id="codigoCampo" onblur="verificarCodigoExistente()"><br><br>
            <input type="hidden" id="codigoExiste" name="codigoExiste" value="false">

            <div id="error-message" style="color: red;"></div>
            <textarea  type="text" cols="59" rows="7" name="txtDescricao" minlength="5" maxlength="50" placeholder="Digite os detalhes do brinquedo"></textarea><br><br>
            <input id="bntEnviar" onclick="validarForm()" type="submit" value="Enviar">
        </div>
        <div id="linha-vertical3"></div>
    </form>
    
   

  <div class="modal-container">
    <div class="modal">
       <span class="texto" id="error-message-modal"></span>
      <div class="btns">
        <button class="btnOK" onclick="closeModal()">OK</button>
        
      </div>
    </div>
  </div>
  
  <script src="script.js"></script>
</body>
</html>