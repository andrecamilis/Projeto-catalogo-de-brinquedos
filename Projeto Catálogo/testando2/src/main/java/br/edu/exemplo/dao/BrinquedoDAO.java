package br.edu.exemplo.dao;

import java.io.ByteArrayInputStream;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.swing.JFileChooser;

import br.edu.exemplo.model.Brinquedo;
import br.edu.exemplo.util.ConnectionFactory;

public class BrinquedoDAO {
	private static Connection conn;   		// abre a conexao do banco de dados
	private static PreparedStatement ps;  // permite que scripts SQL sejam executados a partir do Java
	private static ResultSet rs;  		  // representa as tabelas
	private static FileInputStream fis;
	// classe JavaBean
	private static Brinquedo brinquedo;
	private static int tamanho;

	public BrinquedoDAO() throws Exception {
		// chama a classe ConnectionFactory e estabele uma conexao
		try {
			this.conn = ConnectionFactory.getConnection();
		} catch (Exception e) {
			throw new Exception("erro: \n (" + e.getMessage()+(")"));
		}
	}
	

    public static boolean codigoJaExiste(String codigo) {
        try {
            String SQL = "SELECT COUNT(*) FROM brinquedo WHERE Codigo = ?";
            ps = conn.prepareStatement(SQL);
            ps.setString(1, codigo);
            rs = ps.executeQuery();

            if (rs.next()) {
                int count = rs.getInt(1);
                return count > 0;
            }
        } catch (SQLException sqle) {
            sqle.printStackTrace();
        }
        return false;
    }

	
	
	//metodo para cadastrar o brinquedo
	public static void Cadastrar(Brinquedo brinquedo) throws Exception{
		if (brinquedo == null)
			throw new Exception("O valor passado nao pode ser nulo");
		try {
			String SQL = "INSERT INTO brinquedo (Nome,categoria ,Preço, Codigo, Descricao, foto) values "
					+ "(?, ?, ?, ?, ?, ?)";
			ps = conn.prepareStatement(SQL);
			ps.setString(1, brinquedo.getNome());
			ps.setString(2, brinquedo.getCategoria());
			ps.setDouble(3, brinquedo.getPreco());
			ps.setInt(4, brinquedo.getCodigo());
			ps.setString(5,brinquedo.getDescricao());
			ps.setBlob(6, new ByteArrayInputStream(brinquedo.getFoto()), brinquedo.getFoto().length);
			
		
		
			ps.executeUpdate();
			
		} catch (SQLException sqle) {
			throw new Exception("Erro ao inserir dados " + sqle);
		} finally {
			ConnectionFactory.closeConnection(conn, ps);
		}
		}
	
	
	//metodo para atualizar as informações do brinquedo
		public static void Atualizar(Brinquedo brinquedo) throws Exception {
	    if (brinquedo == null)
	        throw new Exception("O valor passado não pode ser nulo");

	    try {
	        String SQL = "UPDATE brinquedo set Nome = ?, categoria = ?, Preço = ?, Codigo = ?, Descricao = ?";
	        if (brinquedo.getFoto() != null && brinquedo.getFoto().length > 0) {
	            SQL += ", foto = ?";
	        }
	        SQL += " WHERE idBrinquedo = ?";
	        
	        ps = conn.prepareStatement(SQL);
	        ps.setString(1, brinquedo.getNome());
	        ps.setString(2, brinquedo.getCategoria());
	        ps.setDouble(3, brinquedo.getPreco());
	        ps.setInt(4, brinquedo.getCodigo());
	        ps.setString(5, brinquedo.getDescricao());
	        
	        int parameterIndex = 6;
	        if (brinquedo.getFoto() != null && brinquedo.getFoto().length > 0) {
	            ps.setBlob(parameterIndex, new ByteArrayInputStream(brinquedo.getFoto()), brinquedo.getFoto().length);
	            parameterIndex++;
	        }
	        ps.setInt(parameterIndex, brinquedo.getId_brinquedo());
	        
	        int rowsUpdated = ps.executeUpdate();
	        System.out.println("Linhas atualizadas: " + rowsUpdated);
	    
	    } catch (SQLException sqle) {
	        throw new Exception("Erro ao atualizar dados " + sqle);
	    } finally {
	        ConnectionFactory.closeConnection(conn, ps);
	    }
	}
		
	//metodo para deletar o brinquedo
	public void excluir(Brinquedo brinquedo) throws Exception {
		if (brinquedo == null)
			throw new Exception("O valor passado nao pode ser nulo");
		try {
			String SQL = "DELETE FROM brinquedo WHERE idBrinquedo = ?";
			ps = conn.prepareStatement(SQL);
			ps.setInt(1, brinquedo.getId_brinquedo());
			ps.executeUpdate();
		} catch (SQLException sqle) {
			throw new Exception("Erro ao excluir dados " + sqle);
		} finally {
			ConnectionFactory.closeConnection(conn, ps);
		}
	}
	
	//metodo para exibir o brinquedo
	public List<Brinquedo> Listar() throws Exception{	
		try {			
			ps = conn.prepareStatement("SELECT * FROM brinquedo");
			rs = ps.executeQuery();
			List<Brinquedo> list = new ArrayList<Brinquedo>();
			while (rs.next()) {
				String nome = rs.getString("Nome");
				int id = rs.getInt("idBrinquedo");
				int estoque = rs.getInt("Codigo");
				double preco = rs.getDouble("Preço");		
				String descricao = rs.getString("Descricao");	
				String categoria = rs.getString("Categoria");
				byte[] algumByteArray = rs.getBytes("foto");
				list.add(new Brinquedo(nome, id, estoque, descricao, preco, categoria, algumByteArray));
			}
			
			return list;
		} catch (SQLException sqle) {
			throw new Exception(sqle);
		} finally {
			ConnectionFactory.closeConnection(conn, ps, rs);
		}
		
	}
	public static void carregar_imagem() {
		JFileChooser jfc = new JFileChooser();
	
	}
	
	public Brinquedo obterBrinquedoPorId(int idBrinquedo) throws Exception {
	    try {
	        String SQL = "SELECT * FROM brinquedo WHERE idBrinquedo = ?";
	        ps = conn.prepareStatement(SQL);
	        ps.setInt(1, idBrinquedo);

	        rs = ps.executeQuery();

	        if (rs.next()) {
	            String nome = rs.getString("Nome");
	            int estoque = rs.getInt("Codigo");
	            double preco = rs.getDouble("Preço");
	            String descricao = rs.getString("Descricao");
	            String categoria = rs.getString("categoria");
	            byte[] foto = rs.getBytes("foto");

	            return new Brinquedo(nome, idBrinquedo, estoque, descricao, preco, categoria, foto);
	        } else {
	            throw new Exception("Brinquedo com idBrinquedo " + idBrinquedo + " não encontrado.");
	        }
	    } catch (SQLException sqle) {
	        throw new Exception("Erro ao obter o brinquedo por id: " + sqle);
	    } finally {
	        ConnectionFactory.closeConnection(conn, ps, rs);
	    }
	}
	
	public List<Brinquedo> listarPorCategoria(String categoria) throws Exception {
	    try {
	        String SQL = "SELECT * FROM brinquedo WHERE categoria = ?";
	        ps = conn.prepareStatement(SQL);
	        ps.setString(1, categoria);

	        rs = ps.executeQuery();

	        List<Brinquedo> brinquedosPorCategoria = new ArrayList<>();
	        while (rs.next()) {
	            String nome = rs.getString("Nome");
	            int id = rs.getInt("idBrinquedo");
	            int Codigo = rs.getInt("Codigo");
	            double preco = rs.getDouble("Preço");
	            String descricao = rs.getString("Descricao");
	            byte[] foto = rs.getBytes("foto");

	            brinquedosPorCategoria.add(new Brinquedo(nome, id, Codigo, descricao, preco, categoria, foto));
	        }

	        return brinquedosPorCategoria;
	    } catch (SQLException sqle) {
	        throw new Exception("Erro ao listar brinquedos por categoria: " + sqle);
	    } finally {
	        ConnectionFactory.closeConnection(conn, ps, rs);
	    }
	}
	
	
}