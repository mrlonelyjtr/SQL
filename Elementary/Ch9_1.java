import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class Ch9_1 {

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
        inscnt = st.executeUpdate("INSERT INTO Product VALUES ('0001', 'T恤衫', '衣服', 1000, 500, '2009-09-20')");
        System.out.println(inscnt + "行已经插入");

        inscnt = st.executeUpdate("INSERT INTO Product VALUES ('0002', '打孔器', '办公用品', 500, 320, '2009-09-11')");
        System.out.println(inscnt + "行已经插入");

        inscnt = st.executeUpdate("INSERT INTO Product VALUES ('0003', '运动T恤', '衣服', 4000, 2800, NULL)");
        System.out.println(inscnt + "行已经插入");

        inscnt = st.executeUpdate("INSERT INTO Product VALUES ('0004', '菜刀', '厨房用具', 3000, 2800, '2009-09-20')");
        System.out.println(inscnt + "行已经插入");

        inscnt = st.executeUpdate("INSERT INTO Product VALUES ('0005', '高压锅', '厨房用具', 6800, 5000, '2009-01-15')");
        System.out.println(inscnt + "行已经插入");

        inscnt = st.executeUpdate("INSERT INTO Product VALUES ('0006', '叉子', '厨房用具', 500, NULL, '2009-09-20')");
        System.out.println(inscnt + "行已经插入");

        inscnt = st.executeUpdate("INSERT INTO Product VALUES ('0007', '擦菜板', '厨房用具', 880, 790, '2008-04-28')");
        System.out.println(inscnt + "行已经插入");

        inscnt = st.executeUpdate("INSERT INTO Product VALUES ('0008', '圆珠笔', '办公用品', 100, NULL,'2009-11-11')");
        System.out.println(inscnt + "行已经插入");

        st.close();
        con.close();
    }
}