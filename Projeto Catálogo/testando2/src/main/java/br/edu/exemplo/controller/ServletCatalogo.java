/*	VERSÃO1.0.0-----------------------------------------------------------------------------------------------------------------------
 * tomcat estava com ploblema, impossivel de ser ultilizar, a solução foi reinstalar
 * 
 * nessa versão foram criadas as casses
 * servletCatalogo
 * BrinquedoDAO
 * Brinquedo
 * ConnectionFactory
 * 
 * foi criada as paginas
 * incluir.html
 * index.htlm
 * 
 * 
 * 	VERSÃO 1.0.1-----------------------------------------------------------------------------------------------------------------------
 * Bug do foto
 * o sistema sujerido foi que tivesse q implementar imagem no banco de dados,acontece que ele não estava fazendo isso
 * teve varios erros constantes, mais uma das soluções basicas que funcionaram foi implementar o longblob no banco de dados 
 * colocar  ocodigo 
 * 	
 * ps.setBlob(6, new ByteArrayInputStream(brinquedo.getFoto()), brinquedo.getFoto().length);
 * 
 * Part filePart = request.getPart("txtFoto");
                if (filePart != null) {
                    InputStream inputStream = filePart.getInputStream();
                    byte[] imagemBytes = new byte[inputStream.available()];
                    inputStream.read(imagemBytes);

                    brinquedo.setFoto(imagemBytes);
                } else {
                    System.out.println("Nenhuma imagem enviada.");
                }
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        e esse metodo onde faz com que ele consiga enviar a foto para o banco de dados
             
   bug da exibição da imagem   
 * toda vez a imagem iria set exibida na pagina html ele exibia um codigozinho inves da imagem
 * a solução foi implentar esses codigo
 * <img class="imagem" src="data:image/jpeg;base64, <%=new String(java.util.Base64.getEncoder().encode(brinquedo.getFoto()))%>" width="200" height="220">
 * 
 * nessa versão ouve uma mudança ao inves de utilizar a o formato html na pagina foi trocado para
 * index.jsp, assim poderia exibir a imagem na tela utilizado java
 * 
 * 	VERSÃO 1.0.2-----------------------------------------------------------------------------------------------------------------------
 * 
 * bug na exibição
 * se tivesse 5 brinquedos registrados, ele monstrava apenas 1 brinquedo nas 5 partes 
 * a solução foi implementar  
 * response.setHeader("Cache-Control", "no-store"); 
 * aparente mente na hora de fazer a listagem ele listava sempre o ultimo registrado ou o 1º registrado
 * e limpando o cache do navegador, isso fazia ele voltar ao normal
 * 
 * bug da duplicata
 * 
 * toda vez que era cadastrado um novo brinquedo, e vc atualizava a pagina ele registrava novamente o brinquedo,
 * sendo possivel ficar adicionando infinitas vezes
 * a solução foi criar uma pagina chamada comfirmacao.jsp, para quando registrar o brinquedo ele ser direcionado para essa tela
 * e logo em seguida ser direcionando pra tela index.jsp
 * o problema era porque como atualizar a pagina fazia ele chamar a ultima ação feita, criar pagina faria ele parar de ficar duplicando o cadastro
 * 
 * 
 * VERSÃO 1.0.3
 * IMPLEMENTAÇÃO DOS BOTÕES PARA ATUALIZAR E EXCLUIR
 */

package br.edu.exemplo.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import br.edu.exemplo.dao.BrinquedoDAO;
import br.edu.exemplo.model.Brinquedo;

@WebServlet("/ServletCatalogo")
@MultipartConfig
public class ServletCatalogo extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String cmd = request.getParameter("cmd");

        try {
            if (cmd != null) {
                BrinquedoDAO dao = new BrinquedoDAO();

                if (cmd.equals("filtrarPorCategoria")) {
                    String categoriaSelecionada = request.getParameter("categoria");
                    List<Brinquedo> brinquedosPorCategoria = dao.listarPorCategoria(categoriaSelecionada);

                    request.setAttribute("categoriaSelecionada", categoriaSelecionada);
                    request.setAttribute("brinquedosPorCategoria", brinquedosPorCategoria);

                    // Encaminhar para a página de categoria
                    RequestDispatcher dispatcher = request.getRequestDispatcher("catalogoCategoria.jsp");
                    dispatcher.forward(request, response);
                    return;
                } else if (cmd.equals("incluir") || cmd.equals("atualizar")) {
                    Brinquedo brinquedo = new Brinquedo();
                    brinquedo.setNome(request.getParameter("txtNome"));
                    brinquedo.setPreco(Double.parseDouble(request.getParameter("txtPreco")));
                    brinquedo.setCodigo(Integer.parseInt(request.getParameter("txtCodigo")));
                    brinquedo.setDescricao(request.getParameter("txtDescricao"));
                    brinquedo.setCategoria(request.getParameter("cmbCategoria"));

                    Part filePart = request.getPart("txtFoto");
                    if (filePart != null) {
                        InputStream inputStream = filePart.getInputStream();
                        byte[] imagemBytes = new byte[inputStream.available()];
                        inputStream.read(imagemBytes);
                        brinquedo.setFoto(imagemBytes);
                    } else {
                        System.out.println("Nenhuma imagem enviada.");
                    }
                    if (cmd.equals("incluir")) {
                        String codigo = request.getParameter("txtCodigo");

                        if (BrinquedoDAO.codigoJaExiste(codigo)) {
                            // Redireciona para a página de erro caso exista o código
                            response.sendRedirect("erroCadastro.html");
                        } else {
                            // Proceed with inserting the new item
                            dao.Cadastrar(brinquedo);
                            // Redirect to the confirmation page
                            response.sendRedirect("confirmacao.jsp");
                        }
                    }
                    if (cmd.equals("incluir")) {
                        dao.Cadastrar(brinquedo);
                    } else if (cmd.equals("atualizar")) {
                        int idBrinquedo = Integer.parseInt(request.getParameter("id_brinquedo"));
                        brinquedo.setId_brinquedo(idBrinquedo);
                        dao.Atualizar(brinquedo);
                    }
                } else if (cmd.equals("excluir")) {
                    int idBrinquedo = Integer.parseInt(request.getParameter("id_brinquedo"));
                    Brinquedo brinquedo = new Brinquedo();
                    brinquedo.setId_brinquedo(idBrinquedo);
                    dao.excluir(brinquedo);
                }
                
            }

            // Redirecionar para a página de confirmação após a atualização ou exclusão
            response.sendRedirect("confirmacao.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}