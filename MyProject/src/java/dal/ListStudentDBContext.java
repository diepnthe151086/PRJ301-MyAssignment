/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import dao.ViewGradeDao;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Assessment;
import model.Exam;
import model.Lecturer;
import model.Student;
import model.Subject;

/**
 *
 * @author ADMIN
 */
public class ListStudentDBContext extends DBContext<Lecturer> {

    public ArrayList<Student> getListStudent(int lid, int cid) {
        ArrayList<Student> students = new ArrayList<>();
        PreparedStatement stm = null;
        try {
            String sql = "SELECT s.sid, s.sname\n"
                    + "FROM students s INNER JOIN students_courses sc ON s.sid = sc.sid\n"
                    + "INNER JOIN courses c ON  sc.cid = c.cid\n"
                    + "INNER JOIN lecturers l ON c.lid = l.lid\n"
                    + "WHERE l.lid = ? AND c.cid = ?";

            stm = connection.prepareStatement(sql);
            stm.setInt(1, lid);
            stm.setInt(2, cid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Student s = new Student();
                s.setId(rs.getInt("sid"));
                s.setName(rs.getString("sname"));
                
                students.add(s);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ListStudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                stm.close();
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(ListStudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return students;
    }

    @Override
    public void insert(Lecturer model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Lecturer model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Lecturer model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Lecturer get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Lecturer> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
