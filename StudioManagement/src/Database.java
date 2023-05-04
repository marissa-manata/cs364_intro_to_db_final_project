import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

public class Database {
	
	private String url = "jdbc:sqlite:/Users/marissamanata/Documents/2019-20/Summer2020/CS364/Assignments/project/StudioManagement.db";
	
	private Connection connection;
	
	// singleton pattern
	private static final Database INSTANCE = new Database();
	
	private Database() { }
	
	public static Database getInstance() {
		return INSTANCE;
	}
	
	public void connect() throws SQLException {
		connection = DriverManager.getConnection(url);
	}
	
	public void disconnect() throws SQLException {
		connection.close();
	}
	
	public Dancer dancerLookup(int dancerId) throws SQLException {
		String query = "SELECT DancerId, FirstName, MiddleName, LastName, Birthday, StreetAddress, City, State, ZipCode FROM Dancer WHERE DancerID = ?";
		PreparedStatement stmt = connection.prepareStatement(query);
		stmt.setInt(1, dancerId);
		ResultSet results = stmt.executeQuery();
		
		Dancer d = null;
		while(results.next()) {
			int dId = results.getInt("DancerId");
			String fName = results.getString("FirstName");
			String mName = results.getString("MiddleName");
			String lName = results.getString("LastName");
			String bday = results.getString("Birthday");
			String addr = results.getString("StreetAddress");
			String cit = results.getString("City");
			String st = results.getString("State");
			String zip = results.getString("ZipCode");
			
			d = new Dancer(dId, fName, mName, lName, bday, addr, cit, st, zip);
		}
		return d;
	}
	
	public ResultSet dancerRoutines() throws SQLException {
		String query = "SELECT FirstName, LastName, Name\n" + 
				"  FROM Dancer JOIN PERFORMS JOIN Routine\n" + 
				"    ON Dancer.DancerId = PERFORMS.DancerId\n" + 
				"   AND PERFORMS.RoutineNumber = Routine.RoutineNumber\n" + 
				"ORDER BY Dancer.FirstName, Dancer.LastName";
		PreparedStatement stmt = connection.prepareStatement(query);
		ResultSet results = stmt.executeQuery();
		return results;
	}
	
	public ResultSet findRoutines(int numDancers) throws SQLException {
		String query = "SELECT Name, count(*) AS NumDancers\n" + 
				"  FROM (SELECT Name, DancerId\n" + 
				"          FROM PERFORMS JOIN Routine\n" + 
				"            ON PERFORMS.RoutineNumber = Routine.RoutineNumber\n" + 
				"        ORDER BY Name) AS DancerCount\n" + 
				" GROUP BY Name\n" + 
				" HAVING count(*) = ?";
		PreparedStatement stmt = connection.prepareStatement(query);
		stmt.setInt(1, numDancers);
		ResultSet results = stmt.executeQuery();
		return results;
	}
	
	public ResultSet findStyledRoutine(String style) throws SQLException {
		String query = "SELECT Routine.Name AS RoutineName, FirstName, LastName, StyleName\n" + 
				"  FROM (SELECT Teacher.TeacherId AS Teacher, FirstName, LastName, Style.StyleId, Style.Name AS StyleName, YearsTaught\n" + 
				"        FROM Teacher JOIN TEACHES JOIN Style\n" + 
				"          ON Teacher.TeacherId = TEACHES.TeacherId\n" + 
				"         AND TEACHES.StyleId = Style.StyleId\n" + 
				"      GROUP BY Name\n" + 
				"      HAVING max(YearsTaught) AND Style.Name = ?) AS Experienced JOIN CHOREOGRAPHS JOIN Routine\n" + 
				"    ON Experienced.Teacher = CHOREOGRAPHS.TeacherId\n" + 
				"   AND CHOREOGRAPHS.RoutineNumber = Routine.RoutineNumber\n" + 
				"   AND Experienced.StyleId = Routine.Style\n" + 
				"GROUP BY Routine.Name";
		PreparedStatement stmt = connection.prepareStatement(query);
		stmt.setString(1, style);
		ResultSet results = stmt.executeQuery();
		return results;
	}
	
}
