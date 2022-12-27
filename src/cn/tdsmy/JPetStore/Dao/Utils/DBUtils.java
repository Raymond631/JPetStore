package cn.tdsmy.JPetStore.Dao.Utils;//包名不能改为utils，不然会产生内部冲突，报错javax.servlet.ServletException

import com.mysql.cj.jdbc.MysqlDataSource;

import java.sql.Connection;
import java.sql.SQLException;

public class DBUtils {
    private static final String url = "jdbc:mysql://localhost:3306/jpetstore";
    private static final String user = "Raymond";
    private static final String password = "CSU@82092102";

    public static Connection getConnection() {
        Connection connection;
        try {
            MysqlDataSource dataSource = new MysqlDataSource();
            dataSource.setURL(url);
            dataSource.setUser(user);
            dataSource.setPassword(password);
            connection = dataSource.getConnection();
        }
        catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return connection;
    }
}
