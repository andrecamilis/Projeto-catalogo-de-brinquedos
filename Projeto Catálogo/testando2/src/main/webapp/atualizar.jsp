<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="br.edu.exemplo.dao.BrinquedoDAO" %>
<%@ page import="br.edu.exemplo.model.Brinquedo" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="style/atualizar.css">
    <link rel="shortcut icon" type="imagex/png" href="/testando2/src/main/webapp/style/images/logo-site.png">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css">
    
    <title>Atualizar Brinquedo</title>
</head>
<body>
   <div id="logo"></div>
	<h1 id="h1">Universo Lúcido</h1>
	<div id="linha-vertical"></div>
	<h2>Catálogo de Brinquedos:  :Atualizar Brinquedo:</h2>
   
    

    <%
    try {
        // Recupere o "id_brinquedo" da solicitação
        int idBrinquedo = Integer.parseInt(request.getParameter("id_brinquedo"));
        // Crie uma instância do DAO e obtenha o brinquedo com base no "id_brinquedo"
        BrinquedoDAO dao = new BrinquedoDAO();
        Brinquedo brinquedo = dao.obterBrinquedoPorId(idBrinquedo); // Use a variável idBrinquedo

        // Preencha os campos do formulário com as informações do brinquedo
	
%>
  <form action="ServletCatalogo" method="post" enctype="multipart/form-data" onsubmit="return validarForm();">
    <input type="hidden" name="cmd" value="atualizar">
    <!-- Campo oculto para id_brinquedo -->
    <input type="hidden" name="id_brinquedo" value="<%= brinquedo.getId_brinquedo() %>">
    
    
    

   
    <!-- Outros campos do formulário -->
    
    <script>
function validarForm() {
    var nome = document.getElementsByName("txtNome")[0].value;
    var preco = document.getElementsByName("txtPreco")[0].value;
    var codigo = document.getElementsByName("txtCodigo")[0].value;
    var descricao = document.getElementsByName("txtDescricao")[0].value;
    
    if (nome.trim() === "" || preco.trim() === "" || codigo.trim() === "" || descricao.trim() === "") {
        alert("Por favor, preencha todos os campos obrigatórios.");
        return false; // Impede o envio do formulário
    }
    
    // Pode adicionar validações adicionais aqui, como validar se o campo "preço" é um número válido.
    
    return true; // Permite o envio do formulário se tudo estiver válido
}
</script>
    
<div id="texto">
Nome:<br><br>
Valor:  <br><br>
Imagem: <br><br>
Codigo:<br><br>
Descrição:<br><br>
Categoria:<br><br>


</div>
    <div id="inserir">
        <!-- Outros campos do formulário -->
           
           	<input type="text" name="txtNome" size="60" value="<%= brinquedo.getNome() %>" /><br><br>
   
         	<input type="number" size="60" name="txtPreco" step="any" size="60" required value="<%= brinquedo.getPreco() %>" /><br><br>
        
   	   <!-- Campo de arquivo para fazer upload da nova imagem (opcional) -->
   	     	<input type="file" name="txtFoto" size="60"><br><br>
            
       <!-- Outros campos do formulário -->    
            <input type="text" size="60" name="txtCodigo" value="<%= brinquedo.getCodigo() %>" /><br><br>
       
           	<input type="text" height="60" size="60" name="txtDescricao" value="<%= brinquedo.getDescricao() %>" /><br><br>
     
         
                <select size="1" name="cmbCategoria">
                    <option value="jogos eletronicos" <%= brinquedo.getCategoria().equals("Jogos Eletronicos") ? "selected" : "" %>>Jogos Eletronicos</option>
                    <option value="brinquedo" <%= brinquedo.getCategoria().equals("Brinquedo") ? "selected" : "" %>>Brinquedo</option>
                    <option value="livros" <%= brinquedo.getCategoria().equals("Livros") ? "selected" : "" %>>Livros</option>
                    <option value="bonecos" <%= brinquedo.getCategoria().equals("Bonecos") ? "selected" : "" %>>Bonecos</option>
                </select><br><br>
          
          <input type="submit" value="Confirmar Atualização" /></div>
    
    </form>
    <%
    } catch (Exception e) {
        out.println("Erro ao carregar os detalhes do brinquedo.");
    }
    %>

</body>
</html>