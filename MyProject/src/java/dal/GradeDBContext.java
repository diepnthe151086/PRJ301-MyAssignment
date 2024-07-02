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
import model.Grade;
import model.Subject;

/**
 *
 * @author ADMIN
 */
public class GradeDBContext extends DBContext<Grade> {

    public ArrayList<ViewGradeDao> getGradesByCourse(int sid, int cid) {
        ArrayList<ViewGradeDao> viewGrades = new ArrayList<>();
        PreparedStatement stm = null;
        try {
            String sql = "SELECT assesments.*, grades.* FROM grades \n"
                    + "JOIN exams on grades.eid = exams.eid\n"
                    + "JOIN assesments on exams.aid = assesments.aid\n"
                    + "JOIN subjects on assesments.subid = subjects.subid\n"
                    + "JOIN courses on subjects.subid = courses.subid\n"
                    + "JOIN students on grades.sid = students.sid\n"
                    + "WHERE students.sid = ? \n"
                    + "AND  courses.cid = ? ";

            stm = connection.prepareStatement(sql);
            stm.setInt(1, sid);
            stm.setInt(2, cid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                String aname = rs.getString("aname");
                double weight = rs.getDouble("weight");
                double score = rs.getDouble("score");

                viewGrades.add(new ViewGradeDao(aname, weight, score));
            }

        } catch (SQLException ex) {
            Logger.getLogger(GradeDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                stm.close();
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(GradeDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return viewGrades;
    }

    @Override
    public void insert(Grade model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Grade model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Grade model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Grade get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Grade> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
