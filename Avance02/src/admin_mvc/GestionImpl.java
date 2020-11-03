package admin_mvc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import Users_mvc.Users2;
import Utils.DB_Connection;

public class GestionImpl implements IGestion {
	private static final String INSERT_USERS_SQL = "INSERT INTO users"
			+ "  (id, first_name, last_name, username, password, address, contact) VALUES " + " (?, ?, ?, ?, ?,?,?);";

	private static final String SELECT_USERS_BY_ID = "select id, first_name, last_name, username, password, address, contact from todos where id =?";
	private static final String SELECT_ALL_USERS = "select * from users";
	private static final String DELETE_USERS_BY_ID = "delete from users where id = ?;";
	private static final String UPDATE_USERS = "update todos set first_name = ?, last_name= ?, username =?, password =?, address = ?, contact = ? where id = ?;";

	public GestionImpl() {
		
	}

	@Override
	public void insertUsers2(Users2 todo) throws SQLException {
		System.out.println(INSERT_USERS_SQL);
		// try-with-resource statement will auto close the connection.
		try (Connection connection = DB_Connection.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
			preparedStatement.setString(1,todo.getFirstName());
            preparedStatement.setString(2,todo.getLastName());
            preparedStatement.setString(3,todo.getUsername());
            preparedStatement.setString(4,todo.getPassword());
            preparedStatement.setString(5,todo.getAddress());
            preparedStatement.setString(6,todo.getContact());
			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();
		} catch (SQLException exception) {
			DB_Connection.printSQLException(exception);
		}
	}

	@Override
	public Users2 selectUsers2(long todoId) {
		Users2 todo = null;
		// Step 1: Establishing a Connection
		try (Connection connection = DB_Connection.getConnection();
				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USERS_BY_ID);) {
			preparedStatement.setLong(1, todoId);
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				int id = rs.getInt("id");
				String first_name = rs.getString("first_name");
				String last_name = rs.getString("last_name");
				String username = rs.getString("username");
				String password = rs.getString("password");
				String address = rs.getString("address");
				String contact = rs.getString("contact");
				
				todo = new Users2(id, first_name, last_name, username, password, address,contact);
			}
		} catch (SQLException exception) {
			DB_Connection.printSQLException(exception);
		}
		return todo;
	}

	@Override
	public List<Users2> selectAllUsers2() {

		// using try-with-resources to avoid closing resources (boiler plate code)
		List<Users2> todos = new ArrayList<>();

		// Step 1: Establishing a Connection
		try (Connection connection = DB_Connection.getConnection();

				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USERS);) {
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				int id = rs.getInt("id");
				String first_name = rs.getString("first_name");
				String last_name = rs.getString("last_name");
				String username = rs.getString("username");
				String password = rs.getString("password");
				String address = rs.getString("address");
				String contact = rs.getString("contact");
				todos.add(new Users2(id, first_name, last_name, username, password, address,contact));
				
			}
		} catch (SQLException exception) {
			DB_Connection.printSQLException(exception);
		}
		return todos;
	}

	@Override
	public boolean deleteTodo(int id) throws SQLException {
		boolean rowDeleted;
		try (Connection connection = DB_Connection.getConnection();
				PreparedStatement statement = connection.prepareStatement(DELETE_USERS_BY_ID);) {
			statement.setInt(1, id);
			rowDeleted = statement.executeUpdate() > 0;
		}
		return rowDeleted;
	}

	@Override
	public boolean updateTodo(Users2 todo) throws SQLException {
		boolean rowUpdated;
		try (Connection connection = DB_Connection.getConnection();
				PreparedStatement statement = connection.prepareStatement(UPDATE_USERS);) {
			
			statement.setString(1, todo.getFirstName());
			statement.setString(2, todo.getLastName());
			statement.setString(3, todo.getUsername());
			statement.setString(4, todo.getPassword());
			statement.setString(5, todo.getAddress());
			statement.setString(6, todo.getContact());
			statement.setLong(7, todo.getId());
			rowUpdated = statement.executeUpdate() > 0;
		}
		return rowUpdated;
	}
}
