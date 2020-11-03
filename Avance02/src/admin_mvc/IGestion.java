package admin_mvc;

import java.sql.SQLException;
import java.util.List;

import Users_mvc.Users2;

public interface IGestion {
	void insertUsers2(Users2 todo) throws SQLException;

	Users2 selectUsers2(long todoId);

	List<Users2> selectAllUsers2();

	boolean deleteTodo(int id) throws SQLException;

	boolean updateTodo(Users2 todo) throws SQLException;
}
