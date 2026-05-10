package com.MVC.Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public final class DbConfig {
	private DbConfig() {}

	public static Connection getConnection() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		String url = System.getenv().getOrDefault("MYSQL_URL", "jdbc:mysql://localhost:3306/PetHub");
		String user = System.getenv().getOrDefault("MYSQL_USER", "root");
		String password = System.getenv().getOrDefault("MYSQL_PASSWORD", "");
		return DriverManager.getConnection(url, user, password);
	}
}
