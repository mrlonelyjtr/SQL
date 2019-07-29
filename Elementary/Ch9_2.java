import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class Ch9_2 {

    public static void main(String[] args) throws Exception {
        Connection con;
        Statement st;

        String url = "jdbc:mysql://localhost:3306/shop?useSSL=false&serverTimezone=UTC";
        String user = "root";
        String password = "";

        Class.forName("com.mysql.cj.jdbc.Driver");

        con = DriverManager.getConnection(url, user, password);
        st = con.createStatement();

        int inscnt;
        inscnt = st.executeUpdate("UPDATE Product SET product_name = 'Y恤衫' WHERE product_id = '0001'");
        System.out.println(inscnt + "行已经更新");

        st.close();
        con.close();
    }
}