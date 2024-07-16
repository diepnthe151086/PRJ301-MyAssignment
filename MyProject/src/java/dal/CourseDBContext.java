/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import dao.ViewCourseDao;
import java.util.ArrayList;
import model.Course;
import java.sql.*;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Lecturer;
import model.Semester;
import model.Student;
import model.Subject;

/**
 *
 * @author ADMIN
 */
public class CourseDBContext extends DBContext<Course> {

//    public static void main(String[] args)
//    {
//        CourseDBContext db = new CourseDBContext();
//        ArrayList<Course> coursesByLecturer = db.getCoursesByLecturer(1);
//        System.out.println(coursesByLecturer.size());
//    }
    public ArrayList<Course> getCoursesByLecturer(int lid) {
        ArrayList<Course> courses = new ArrayList<>();
        PreparedStatement stm = null;
        try {
            String sql = "SELECT c.cid,c.cname FROM courses c INNER JOIN lecturers l ON l.lid = c.lid\n"
                    + "				INNER JOIN semester sem ON sem.semid = c.semid\n"
                    + "				WHERE l.lid = ? AND sem.active = 1";

            stm = connection.prepareStatement(sql);
            stm.setInt(1, lid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Course c = new Course();
                c.setId(rs.getInt("cid"));
                c.setName(rs.getString("cname"));
                courses.add(c);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CourseDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                stm.close();
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(CourseDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return courses;

    }

    public ArrayList<Course> getCoursesByStudent(int sid) {
        ArrayList<Course> courses = new ArrayList<>();
        PreparedStatement stm = null;
        try {
            String sql = "SELECT c.cid, c.cname\n"
                    + "FROM courses c INNER JOIN students_courses sc ON sc.cid = c.cid\n"
                    + "WHERE sid = ? ";

            stm = connection.prepareStatement(sql);
            stm.setInt(1, sid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Course c = new Course();
                c.setId(rs.getInt("cid"));
                c.setName(rs.getString("cname"));
                courses.add(c);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CourseDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                stm.close();
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(CourseDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return courses;

    }

    public List<ViewCourseDao> getCoursesByTraining() {
        List<ViewCourseDao> listFound = new ArrayList<>();
        PreparedStatement stm = null;
        try {
            String sql = "SELECT c.cid, c.cname, l.lid, l.lname, s.sid, s.sname, c.semid\n"
                    + "FROM courses c\n"
                    + "JOIN lecturers l ON c.lid = l.lid\n"
                    + "JOIN students_courses sc ON c.cid = sc.cid\n"
                    + "JOIN students s ON sc.sid = s.sid\n"
                    + "ORDER BY c.cid;";

            stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                ViewCourseDao c = new ViewCourseDao();
                c.setCid(rs.getInt("cid"));
                c.setCname(rs.getString("cname"));
                c.setLid(rs.getInt("lid"));
                c.setLname(rs.getString("lname"));
                c.setSid(rs.getInt("sid"));
                c.setSname(rs.getString("sname"));
                c.setSemid(rs.getInt("semid"));

                listFound.add(c);

            }
        } catch (SQLException ex) {
            Logger.getLogger(CourseDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                stm.close();
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(CourseDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return listFound;
    }

    @Override
    public void insert(Course course) {
        PreparedStatement stm = null;
        try {
            String sql = "INSERT INTO [dbo].[courses]\n"
                    + "           ([cid]\n"
                    + "           ,[cname]\n"
                    + "           ,[lid]\n"
                    + "           ,[subid]\n"
                    + "           ,[semid])\n"
                    + "     VALUES\n"
                    + "           (?, ?, ?, ?, ?)";

            stm = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

            stm.setObject(1, course.getId());
            stm.setObject(2, course.getName());
            stm.setObject(3, course.getLecturer().getId());
            stm.setObject(4, course.getSubject().getId());
            stm.setObject(5, course.getSemester().getId());

            stm.executeUpdate();
            ResultSet rs = stm.getGeneratedKeys();
        } catch (SQLException ex) {
            Logger.getLogger(CourseDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                stm.close();
                
            } catch (SQLException ex) {
                Logger.getLogger(CourseDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    @Override
    public void update(Course model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Course model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Course get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Course> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public List<Course> findAll() {
        List<Course> listFound = new ArrayList<>();
        PreparedStatement stm = null;
        try {
            String sql = "SELECT [cid]\n"
                    + "      ,[cname]\n"
                    + "      ,[lid]\n"
                    + "      ,[subid]\n"
                    + "      ,[semid]\n"
                    + "  FROM [courses]";

            stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Course c = new Course();
                c.setId(rs.getInt("cid"));
                c.setName(rs.getString("cname"));

                Lecturer l = new Lecturer();
                l.setId(rs.getInt("lid"));
                c.setLecturer(l);

                Subject su = new Subject();
                su.setId(rs.getInt("subid"));
                c.setSubject(su);

                Semester se = new Semester();
                se.setId(rs.getInt("semid"));
                c.setSemester(se);

                listFound.add(c);

            }
        } catch (SQLException ex) {
            Logger.getLogger(CourseDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                stm.close();
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(CourseDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return listFound;
    }

    public void deleteById(Course courses) {
        PreparedStatement stm = null;
        try {
            String sql = "DELETE FROM [dbo].[courses]\n"
                    + "      WHERE cid = ?";

            stm = connection.prepareStatement(sql);

            stm.setObject(1, courses.getId());

            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CourseDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                stm.close();
            } catch (SQLException ex) {
                Logger.getLogger(CourseDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

}
