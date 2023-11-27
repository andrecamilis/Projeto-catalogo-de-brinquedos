package br.edu.exemplo.model;

import java.sql.Blob;

public class Brinquedo {
    private String nome;
    private int id_brinquedo;
    private int codigo;
    private String descricao;
    private String categoria;
    private double preco;
    private byte[] foto;

    public Brinquedo(String nome, int id_brinquedo, int codigo, String descricao, double preco, String categoria, byte[] foto) {
        this.nome = nome;
        this.id_brinquedo = id_brinquedo;
        this.codigo = codigo;
        this.descricao = descricao;
        this.preco = preco;
        this.categoria = categoria;
        this.foto = foto;
    }

    public Brinquedo() {
    }

    /*metodo "reset" responsavel por limpar os dados apĆĀ³s gravalos no banco
    * esse metodo foi criado devido um problema na qual o
    */   
    
    
    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public int getId_brinquedo() {
        return id_brinquedo;
    }

    public void setId_brinquedo(int id_brinquedo) {
        this.id_brinquedo = id_brinquedo;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public double getPreco() {
        return preco;
    }

    public void setPreco(double preco) {
        this.preco = preco;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public byte[] getFoto() {
        return foto;
    }

    public void setFoto(byte[] foto) {
        this.foto = foto;
    }
}