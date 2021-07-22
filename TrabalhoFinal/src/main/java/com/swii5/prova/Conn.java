//Bruno Paranhos Silva  CB3005437
package com.swii5.prova;

import java.sql.*;

public class Conn {

    private static Connection myConn = null;
    private static Statement myStmt = null;
    private static ResultSet myRs = null;
    private static String jdbcURL;
    private static String jdbcUsername;
    private static String jdbcPassword;

    public Conn(String jdbcURL, String jdbcUsername, String jdbcPassword) {
        this.jdbcURL = jdbcURL;
        this.jdbcUsername = jdbcUsername;
        this.jdbcPassword = jdbcPassword;
    }

    private void connect() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.jdbc.Driver");
        myConn = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        myStmt = myConn.createStatement();        
    }

    // <editor-fold desc="Inset">
    //Vendedor
    public int insert(String nome, String cidade, float comissao) throws SQLException, ClassNotFoundException {
        this.connect();

        String sql = "insert into vendedor(nome, cidade, comissao) values ('" + nome + "', '" + cidade + "', " + comissao + ");";
        
        int id = insert(sql);
        
        return id;
    }
    
    //Cliente
    public int insert(String nome, String cidade, int grau) throws SQLException, ClassNotFoundException {
        this.connect();

        String sql = "insert into cliente(nome, cidade, grau) values ('" + nome + "', '" + cidade + "', " + grau + ");";

        int id = insert(sql);
        
        return id;
    }
    
    //Venda
    public int insert(float valor, String dia, int idC, int idV) throws SQLException, ClassNotFoundException {
        this.connect();

        String sql = "insert into venda(valor, dia, idCliente, idVendedor) values ("+ valor + ", '" + dia + "', " + idC + ", " + idV + ");";

        int id = insert(sql);
        
        return id;
    }
    
    //Insert
    private int insert(String sql) throws SQLException{
        myStmt.executeUpdate(sql);
        
        ResultSet rs = myStmt.getGeneratedKeys();
        
        rs.next();
        
        int id = rs.getInt("id"); 

        close();
        
        return id;
    }
    // </editor-fold>

    // <editor-fold desc="Update">
    //Vendedor
    public void update(int id, String nome, String cidade, float comissao) throws SQLException, ClassNotFoundException {
        connect();

        String sql = "update vendedor set nome = '" + nome + "', cidade = '" + cidade + "', comissao = " + comissao + " where id = " + id + ";";

        update(sql);
    }
    
    //Cliente
    public void update(int id, String nome, String cidade, int grau) throws SQLException, ClassNotFoundException {
        connect();

        String sql = "update cliente set nome = '" + nome + "', cidade = '" + cidade + "', grau = " + grau + " where id = " + id + ";";

        update(sql);
    }
    
    //Venda
    public void update(int id, float valor, String dia, int idC, int idV) throws SQLException, ClassNotFoundException {
        connect();

        String sql = "update venda set valor = " + valor + ", dia = '" + dia + "', idVendedor = " + idV + ", idCliente = " + idC + " where id = " + id + ";";

        update(sql);
    }
    
    //Update
    private void update(String sql) throws SQLException{
        myStmt.executeUpdate(sql);

        close();
    }
    
    // </editor-fold>

    // <editor-fold desc="Delete">
    public void delete(int id, String tipo) throws SQLException, ClassNotFoundException {
        connect();

        String sql = "delete from " + tipo + " where id = " + id + ";";

        myStmt.executeUpdate(sql);

        close();
    }
    // </editor-fold>

    // <editor-fold desc="Select">
    public ResultSet select(String tipo) throws SQLException, ClassNotFoundException {
        connect();
        
        String sql;
        
        if (tipo.equals("venda")) {
            sql = "select venda.id, venda.valor, venda.dia, cliente.nome, vendedor.nome  from " + tipo
                + " inner join cliente on cliente.id = venda.idCliente"
                + " inner join vendedor on vendedor.id = venda.idVendedor;";
        }
        else
            sql = "select * from " + tipo + ";";

        myRs = myStmt.executeQuery(sql);

        return myRs;
    }
    
    public ResultSet select(String tipo, int id) throws SQLException, ClassNotFoundException {
        connect();

        String sql = "select * from " + tipo + " where id = " + id + ";";

        myRs = myStmt.executeQuery(sql);
            
        return myRs;
    }
    // </editor-fold>

    public void close() throws SQLException {
        if (myRs != null) {
            myRs.close();
        }

        if (myStmt != null) {
            myStmt.close();
        }

        if (myConn != null) {
            myConn.close();
        }
    }
}
