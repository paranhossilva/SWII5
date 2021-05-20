// Bruno Paranhos Silva     CB3005437

package Package;

import java.sql.*;

public class Conn {

    private static Connection myConn = null;
    private static Statement myStmt = null;
    private static ResultSet myRs = null;

    public void connect() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            myConn = DriverManager.getConnection("jdbc:mysql://localhost:3306/tp02", "root", "root");
            myStmt = myConn.createStatement();
        } catch (Exception e) {
        }
    }

    public void insert(String nome, int unidade, String desc, int qtd, double preco) throws SQLException {
        this.connect();

        String sql = "insert into produto(nome, unidade, descricao, qtd, preco) values ('" + nome + "', " + unidade + ", '" + desc + "', " + qtd + ", " + preco + ");";
        
        try {
            myStmt.executeUpdate(sql);
        } catch (SQLException e) {
            System.out.println(e.getCause());
        }
        finally{
            close();
        }
    }

    public void update(int id, String nome, int unidade, String desc, int qtd, double preco) throws SQLException {
        connect();

        String sql = "update produto set nome = '" + nome + "', unidade = " + unidade + ", descricao = '" + desc + "', qtd = " + qtd + ", preco = " + preco + " where id = " + id + ";";

        try {
            myStmt.executeUpdate(sql);
        } catch (SQLException e) {}
        finally{
            close();
        }        
    }

    public void delete(int id) throws SQLException {
        connect();

        String sql = "delete from produto where id = " + id + ";";

        try {
            myStmt.executeUpdate(sql);
        } catch (SQLException e) {}
        finally{
            close();
        }
    }

    public ResultSet select() throws SQLException {
        connect();

        String sql = "select * from produto;";

        try {
            myRs = myStmt.executeQuery(sql);
        } catch (SQLException e) {}        
        finally{
            return myRs;
        }
    }
    
    public ResultSet select(int id) throws SQLException {
        connect();

        String sql = "select * from produto where id = " + id + ";";

        try {
            myRs = myStmt.executeQuery(sql);
        } catch (SQLException e) {}        
        finally{
            return myRs;
        }
    }

    public void close() throws SQLException {
        if (myRs != null)
            myRs.close();

        if (myStmt != null)
            myStmt.close();

        if (myConn != null)
            myConn.close();
    }
}
