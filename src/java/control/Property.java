/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package control;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author kelli
 */
public class Property {

    //Database connection strings:
    private Connection conn;
    private ResultSet result;
    DriverManager driverManager;
    
    private String propertyID;
    private String location;
    private  String type;
    private String email;
    private String price;
    private String phone;

    public Property(String propertyID,String location, String type,String email,String price,String phone){
        this.propertyID = propertyID;
        this.location = location;
        this.type = type;
        this.email = email;
        this.price = price;
        this.phone = phone;
    }
   
    public  Property(){
        
    }
    /**
     * @return the propertyID
     */
    public String getPropertyID() {
        return propertyID;
    }

    /**
     * @param propertyID the propertyID to set
     */
    public void setPropertyID(String propertyID) {
        this.propertyID = propertyID;
    }

    /**
     * @return the location
     */
    public String getLocation() {
        return location;
    }

    /**
     * @param location the location to set
     */
    public void setLocation(String location) {
        this.location = location;
    }

    /**
     * @return the type
     */
    public String getType() {
        return type;
    }

    /**
     * @param type the type to set
     */
    public void setType(String type) {
        this.type = type;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @return the price
     */
    public String getPrice() {
        return price;
    }

    /**
     * @param price the price to set
     */
    public void setPrice(String price) {
        this.price = price;
    }

    /**
     * @return the phone
     */
    public String getPhone() {
        return phone;
    }

    /**
     * @param phone the phone to set
     */
    public void setPhone(String phone) {
        this.phone = phone;
    }
           
    
    public boolean connectToDb(String user, String pass){

        boolean connected = false;
        String url ="jdbc:mysql://localhost:3306/chabrin_db";
        try {
            /*Load the mysql driver*/
            Class.forName("com.mysql.jdbc.Driver").newInstance();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Property.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            Logger.getLogger(Property.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(Property.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        try {
            /*Connect to the database*/
            conn = DriverManager.getConnection(url, user, pass);
            if(conn!=null){
                connected = true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(Property.class.getName()).log(Level.SEVERE, null, ex);
        }
        return connected;
    }
    /**
     * Persists the provided details on property to the database.
     * @param propertyID
     * @param location
     * @param type
     * @param email
     * @param price
     * @param phone
     * @return 
     */
    public boolean persistProperty(String propertyID,String location, String price,String type,String email,String phone){
        if(connectToDb("root", "bluehair123")){
            
            try {
                int prop_id=Integer.parseInt(propertyID);
                int price_ = Integer.parseInt(price);
                //connected to database .... save the record
                String sql ="insert into property(prop_id, location, price, _type, email, phone) values("
                        +prop_id+",\'"+location+"\',"+price_+",\'"+type+"\',\'"+email+"\',\'"+phone+"\');";
                java.sql.Statement statement = conn.createStatement();
                statement.executeUpdate(sql);
            } catch (SQLException ex) {
                Logger.getLogger(Property.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return true;
    }
    
    
    public List <Property> getAllProperties(){
        List properties = new ArrayList();
        if(connectToDb("root","bluehair123")){
            try{
                String propertyList = "select * from property;";
                Statement stmt = conn.createStatement();
                ResultSet resultSet = stmt.executeQuery(propertyList);
                
                while(resultSet.next()){
                    properties.add(new Property(resultSet.getString("prop_id"), resultSet.getString("location"), 
                            resultSet.getString("price"),resultSet.getString("_type"), resultSet.getString("email"),resultSet.getString("phone")));
                }
        }
            catch(SQLException sqle){
                System.out.println("SQL Exception");
            }
    }
        return properties;
    }
    
    
    public List<Property> searchProperties(String criteria, String target){
        List properties = new ArrayList();
        if(connectToDb("root","bluehair123")){
            try{
                String searchSql = "select * from property where "+criteria+"="+target;
                System.out.println(searchSql);
                Statement stmt = conn.createStatement();
                ResultSet resultSet = stmt.executeQuery(searchSql);
                while(resultSet.next()){
                    properties.add(new Property(resultSet.getString("prop_id"), resultSet.getString("location"), 
                            resultSet.getString("price"),resultSet.getString("_type"), resultSet.getString("email"),resultSet.getString("phone")));
                }
        }
            catch(SQLException sqle){
                System.out.println("SQL Exception");
            }
    }
        return properties;
    }
    }


