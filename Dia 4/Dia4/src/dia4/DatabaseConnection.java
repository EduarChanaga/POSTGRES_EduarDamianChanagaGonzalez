import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {

    private static final String URL = "jdbc:postgresql://172.16.101.172:5432/examen";
    private static final String USER = "postgres";
    private static final String PASSWORD = "1095581647";

    public static Connection getConnection() {
        Connection connection = null;
        try {
            // Cargar el driver de PostgreSQL
            Class.forName("org.postgresql.Driver");
            
            // Establecer la conexión
            connection = DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException e) {
            System.out.println("Driver no encontrado: " + e.getMessage());
        } catch (SQLException e) {
            System.out.println("Error de SQL: " + e.getMessage());
        }
        return connection;
    }
}
