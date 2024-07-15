/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import model.User;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Lecturer;
import model.Role;
import model.Student;
import model.Training;

/**
 *
 * @author ADMIN
 */
public class UserDBContext extends DBContext<User> {

    public void setUserLecturer(User user) {
        PreparedStatement stm = null;

        try {
            String sql = "SELECT u.username, u.displayname, l.lid, l.lname\n"
                    + "FROM users u LEFT JOIN users_lecturers ul ON ul.username = u.username AND ul.active = 1\n"
                    + "             LEFT JOIN lecturers l ON ul.lid = l.lid\n"
                    + "WHERE u.username = ? AND u.password = ?";
            stm = connection.prepareStatement(sql);
            stm.setString(1, user.getUsername());
            stm.setString(2, user.getPassword());
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                int lid = rs.getInt("lid");
                if (lid != 0) {
                    Lecturer lecturer = new Lecturer();
                    lecturer.setId(lid);
                    lecturer.setName(rs.getString("lname"));
                    user.setLecturer(lecturer);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (stm != null) {
                    stm.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public void setTrainingDepartment(User user) {
        PreparedStatement stm = null;

        try {
            String sql = "SELECT td.username, u.displayname, td.tid\n"
                    + "FROM users u LEFT JOIN training_department td ON u.username = td.username\n"
                    + "WHERE u.username = ? AND u.[password] = ?";
            stm = connection.prepareStatement(sql);
            stm.setString(1, user.getUsername());
            stm.setString(2, user.getPassword());
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                int tid = rs.getInt("tid");
                if (tid != 0) {
                    Training training = new Training();
                    training.setTid(tid);
                    user.setTraining(training);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (stm != null) {
                    stm.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public User getUserByUsernamePassword(String username, String password) {
        PreparedStatement stm = null;
        User user = null;
        try {
            String sql = "SELECT *\n"
                    + "FROM users u INNER JOIN role r ON u.roleid = r.roleid\n"
                    + "WHERE u.username = ? AND u.password = ?";
            stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, password);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                user = new User();
                user.setUsername(username);
                user.setPassword(password);
                Role role = new Role();
                role.setRoleid(rs.getInt("roleid"));
                user.setRole(role);

                // Kiểm tra và lấy thông tin chi tiết nếu là giảng viên hoặc sinh viên
                if (role.getRoleid() == 1) { // Giả sử 1 là ID của vai trò Lecturer
                    setUserLecturer(user);
                } else if (role.getRoleid() == 2) { // Giả sử 2 là ID của vai trò Student
                    setUserStudent(user);
                } else if (role.getRoleid() == 3) { // Giả sử 2 là ID của vai trò Student
                    setTrainingDepartment(user);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (stm != null) {
                    stm.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return user;
    }

    @Override
    public void insert(User model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(User model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(User model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public User get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<User> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public void setUserStudent(User user) {
        PreparedStatement stm = null;
        try {
            String sql = "SELECT u.username,u.displayname,s.sid,s.sname\n"
                    + "                    FROM users u LEFT JOIN users_students us ON us.username = u.username AND us.active = 1\n"
                    + "                   LEFT JOIN students s ON us.sid = s.sid\n"
                    + "			WHERE u.username = ? AND u.[password] = ?";
            stm = connection.prepareStatement(sql);
            stm.setString(1, user.getUsername());
            stm.setString(2, user.getPassword());
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                int sid = rs.getInt("sid");
//                user.setRole(rs.getInt("role"));
                if (sid != 0) {
                    Student student = new Student();
                    student.setId(sid);
                    student.setName(rs.getString("sname"));
                    user.setStudent(student);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                stm.close();
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

}
