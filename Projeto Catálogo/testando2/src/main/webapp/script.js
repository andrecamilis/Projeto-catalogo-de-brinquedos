const modal = document.querySelector('.modal-container')

function validarForm() {
    modal.classList.add('active')
    var nome = document.getElementsByName("txtNome")[0].value;
    var categoria = document.getElementsByName("cmbCategoria")[0].value;
    var foto = document.getElementsByName("txtFoto")[0].value;
    var preco = document.getElementsByName("txtPreco")[0].value;
    var descricao = document.getElementsByName("txtDescricao")[0].value;
    var errorMessageModal = document.getElementById("error-message-modal"); // Elemento para exibir a mensagem no modal

    if (nome === "" || categoria === "Brinquedo" || foto === "" || descricao === "") {
        errorMessageModal.innerText = "Por favor, preencha todos os campos.";
        return false; // Impede o envio do formulário
    } else if (isNaN(preco) || preco === "") {
        errorMessageModal.innerText = "O campo 'Valor' deve ser um número válido.";
        return false; // Impede o envio do formulário
    } else {
        errorMessageModal.innerText = "Produto Cadastrado"; // Limpa a mensagem de erro se todos os campos estiverem preenchidos
        return true; // Permite o envio do formulário
    }
}

 
  
function closeModal() {
  modal.classList.remove('active')
}