import java.sql.ResultSet;
import java.sql.SQLException;
//import java.util.ArrayList;
import java.awt.Color;
import java.util.*;
import javax.swing.*;

public class StudioManagement {
	
	private JTextField input1, input2, input3;
	private JLabel numDancer, style, dancerId, output;
	private EventButton findRButton, findSRButton, findDancerButton, listButton;
    private static Database db;
    
	public static void main(String[] args) {
		
		db = Database.getInstance();
		
		try {
			db.connect();
		} catch (SQLException e) {
			System.out.println("Databse connection failed...");
			e.printStackTrace();
		}
		
//		System.out.println("Connected!\n");
		
		StudioManagement studiomanager = new StudioManagement();
//		studiomanager.createWindow();
		
		int choice = 0;
		choice = studiomanager.menu();
		
		while(choice != 5) {
			if(choice == 1) {
				studiomanager.choice1();
			}
			
			if(choice == 2) {
				studiomanager.choice2();
			}
			
			if(choice == 3) {
				studiomanager.choice3();
			}
			
			if(choice == 4) {
				studiomanager.choice4();
			}
			choice = studiomanager.menu();
		}
		
		System.out.println("Have a nice day!");
		
		try {
			db.disconnect();
		} catch (SQLException e) {
			System.out.println("Database closure failed...");
			e.printStackTrace();
		}
		
//		System.out.println("Disconnected!\n");
		return;
	}
	
	public int menu() {
		int choice = 0;
		Scanner scan = new Scanner(System.in);
		System.out.println("What would you like to do?\n");
		System.out.println("1) Find Routines with __ # of Dancers");
		System.out.println("2) Find Routines with most experienced Choreographer with Style _____");
		System.out.println("3) Find Dancer by ID");
		System.out.println("4) List Dancers and Routines they perform");
		System.out.println("5) Quit");
		System.out.print("Enter choice: ");
		choice = scan.nextInt();
		scan.nextLine();
		return choice;
	}
	
	public void choice1() {
		Scanner scnr = new Scanner(System.in);
		int num = 0;
		System.out.print("Enter number of dancers: ");
		num = scnr.nextInt();
		scnr.nextLine();
		System.out.println();
		
		try {
			ResultSet results = db.findRoutines(num);
			
			while(results.next()) {
				String name = results.getString("Name");
				int count = results.getInt("NumDancers");
				
				System.out.println(name + " " + count);
			}
		} catch (SQLException e) {
			System.out.println("Something went wrong..");
		}
		System.out.println();
	}
	
	public void choice2() {
		Scanner scnr = new Scanner(System.in);
		String style = "";
		System.out.print("Enter style: ");
		style = scnr.nextLine();
		System.out.println();
		
		try {
			ResultSet results = db.findStyledRoutine(style);
			
			while(results.next()) {
				String rName = results.getString("RoutineName");
				String fName = results.getString("FirstName");
				String lName = results.getString("LastName");
				String sName = results.getString("StyleName");
				
				System.out.println(rName + " " + fName + " " + lName + " " + sName);
				System.out.println();
			}
		} catch (SQLException e) {
			System.out.println("Something went wrong...");
		}
	}
	
	public void choice3() {
		Scanner scnr = new Scanner(System.in);
		int id = 0;
		System.out.print("Enter Dancer ID: ");
		id = scnr.nextInt();
		scnr.nextLine();
				
		try {
			Dancer d = db.dancerLookup(id);
					
			System.out.println(d.toString());
		} catch (SQLException e) {
			System.out.println("Something went wrong...");
		}
	}
	
	public void choice4() {
		try {
			ResultSet results = db.dancerRoutines();
			
			while(results.next()) {
				String fName = results.getString("FirstName");
				String lName = results.getString("LastName");
				String name = results.getString("Name");
				
				System.out.println(fName + " " + lName + " " + name);
			}
		} catch (SQLException e) {
			System.out.println("Something went wrong...");
		}
		System.out.println();
	}
	
	public void createWindow() {
		int textHeight = 30;
        int textWidth = 150;
        int buttonWidth = 150;
        int buttonHeight = 40;
        int spacer = 15;
        int windowSize = 3 * textWidth + 6 * spacer + 2 * buttonHeight;
        
        JFrame window = new JFrame();
        window.setBounds( 50, 50, windowSize, windowSize);
        window.setTitle( "Studio Management" );
        Color lightSteelBlue = new Color( 176, 196, 222 );
        window.getContentPane().setBackground( lightSteelBlue );
        window.setLayout( null );
        window.setDefaultCloseOperation( JFrame.EXIT_ON_CLOSE );
        window.setResizable( true );
        window.setVisible( true );
        
        int graphicY = spacer;
        numDancer = new JLabel();
        numDancer.setBounds(spacer, graphicY, textWidth, textHeight);
        numDancer.setText("Number of Dancers");
        numDancer.setHorizontalAlignment(JLabel.RIGHT);
        numDancer.setBackground(lightSteelBlue);
        window.add(numDancer);
        
        input1 = new JTextField();
        input1.setBounds(numDancer.getX() + numDancer.getWidth() + spacer, graphicY, textWidth, textHeight);
        input1.setHorizontalAlignment(JTextField.RIGHT);
        window.add(input1);
        
        findRButton = new EventButton(this);
        findRButton.setBounds(input1.getX() + input1.getWidth() + spacer, graphicY, buttonWidth, buttonHeight);
        findRButton.setText("Find Routines");
        window.add(findRButton);
        
        graphicY = findRButton.getY() + findRButton.getHeight() + spacer;
        style = new JLabel();
        style.setBounds(spacer, graphicY, textWidth, textHeight);
        style.setText("Style");
        style.setHorizontalAlignment(JLabel.RIGHT);
        style.setBackground(lightSteelBlue);
        window.add(style);
        
        input2 = new JTextField();
        input2.setBounds(style.getX() + style.getWidth() + spacer, graphicY, textWidth, textHeight);
        input2.setHorizontalAlignment(JTextField.RIGHT);
        window.add(input2);
        
        findSRButton = new EventButton(this);
        findSRButton.setBounds(input2.getX() + input2.getWidth() + spacer, graphicY, buttonWidth, buttonHeight);
        findSRButton.setText("Find Styled Routines");
        window.add(findSRButton);
        
        graphicY = findSRButton.getY() + findSRButton.getHeight() + spacer;
        dancerId = new JLabel();
        dancerId.setBounds(spacer, graphicY, textWidth, textHeight);
        dancerId.setText("Dancer Id");
        dancerId.setHorizontalAlignment(JLabel.RIGHT);
        dancerId.setBackground(lightSteelBlue);
        window.add(dancerId);
        
        input3 = new JTextField();
        input3.setBounds(dancerId.getX() + dancerId.getWidth() + spacer, graphicY, textWidth, textHeight);
        input3.setHorizontalAlignment(JTextField.RIGHT);
        window.add(input3);
        
        findDancerButton = new EventButton(this);
        findDancerButton.setBounds(input3.getX() + input3.getWidth() + spacer, graphicY, buttonWidth, buttonHeight);
        findDancerButton.setText("Find Dancer");
        window.add(findDancerButton);
        
        graphicY = findDancerButton.getY() + findDancerButton.getHeight() + spacer;
        listButton = new EventButton(this);
        listButton.setBounds(window.getWidth() / 2 - (buttonWidth + 50) / 2, graphicY, buttonWidth + 50, buttonHeight);
        listButton.setText("List Dancers & Routines");
        window.add(listButton);
        
        graphicY = listButton.getY() + listButton.getHeight() + spacer;
        output = new JLabel();
        output.setBounds(spacer, graphicY, window.getWidth() - spacer, window.getHeight() / 4);
        window.add(output);
        
        window.repaint();
        
	}
	
	public void buttonPressed(EventButton button) {
		
		output.setText("");
		int in1 = 0;
		String in2 = "";
		int in3 = 0;
		String text1 = input1.getText();
		String text2 = input2.getText();
		String text3 = input3.getText();
		
		
		Scanner scan = new Scanner(text1);
		if(scan.hasNextInt()) {
			in1 = scan.nextInt();
		}
		
		Scanner scan2 = new Scanner(text2);
		if(scan2.hasNext()) {
			in2 = scan2.next();
		}
		
		Scanner scan3 = new Scanner(text3);
		if(scan3.hasNextInt()) {
			in3 = scan3.nextInt();
		}
		
		scan.close();
		scan2.close();
		scan3.close();
		
		if(button == findRButton) {
			try {
				ResultSet results = db.findRoutines(in1);
				
				while(results.next()) {
					String name = results.getString("Name");
					int count = results.getInt("NumDancers");
					
					output.setText(name + " " + count + "\n");
				}
			} catch (SQLException e) {
				output.setText("Something went wrong...");
			}
		}
		
		if(button == findSRButton) {
			try {
				ResultSet results = db.findStyledRoutine(text2);
				
				while(results.next()) {
					String rName = results.getString("RoutineName");
					String fName = results.getString("FirstName");
					String lName = results.getString("LastName");
					String sName = results.getString("StyleName");
					
					output.setText(rName + " " + fName + " " + lName + " " + sName + "\n");
				}
			} catch (SQLException e) {
				output.setText("Something went wrong...");
			}
		}
		
		if (button == findDancerButton) {
			try {
				Dancer d = db.dancerLookup(in3);
				
				output.setText(d.toString());
			} catch (SQLException e) {
				output.setText("Something went wrong...");
			}
		}
		
		if(button == listButton) {
			try {
				ResultSet results = db.dancerRoutines();
				
				while(results.next()) {
					String fName = results.getString("FirstName");
					String lName = results.getString("LastName");
					String name = results.getString("Name");
					
					output.setText(fName + " " + lName + " " + name + "\n");
				}
			} catch (SQLException e) {
				output.setText("Something went wrong...");
			}
			
		}
	}
	
}