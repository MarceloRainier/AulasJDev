package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import connection.SingleConnection;

public class DaoLogin {
	
	// 2 - definição do objeto connection do tipo Connection (java.sql)
	private Connection connection;
	
	
	// 1- Criação do construtor default
	public DaoLogin() {
		
		// 3 - connection recebe nosso objeto de Connection do banco de dados
		connection = SingleConnection.getConnection();

	}
	
	// 4 - Validação do login no Banco de Dados
	// Como há risco de ser gerada uma exceção, um throw é incluido para tratar essa eventualidade
	// em outro momento
	public boolean validarLogin(String login, String senha) throws Exception{
		
		//5 - Observe que, por ser String, temos que usar também aspas simples
		String sql = "select * from usuario where login = '" + login + "' and senha = '" + senha + "'";
		// 6 - Criando a instrução do Banco de dados usando o PreparedStatement usando o objeto connection
		PreparedStatement statement = connection.prepareStatement(sql);
		// 7 - Criando o objeto que irá carregar o resultado do sql - ResultSet
		ResultSet resultSet = statement.executeQuery();
		// 8 - Teste de condição para tratar a busca por usuario
		if(resultSet.next()) {
			return true; // possui usuario
		}else {
			return false; // não validou usuario
		}
		
	}

}
