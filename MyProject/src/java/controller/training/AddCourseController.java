/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.training;

import controller.auth.BaseRequiredTrainingAuthenticationController;
import dal.CourseDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.Course;
import model.Lecturer;
import model.Semester;
import model.Subject;
import model.Training;
import model.User;

/**
 *
 * @author ADMIN
 */
public class AddCourseController extends BaseRequiredTrainingAuthenticationController {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, User user, Training training) throws ServletException, IOException {
        CourseDBContext db = new CourseDBContext();
        HttpSession session = request.getSession();
        List<Course> courses = db.findAll();
        request.setAttribute("courses", courses);
        request.getRequestDispatcher("view/training/addcourse.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, User user, Training training) throws ServletException, IOException {
        String action = request.getParameter("action") == null
                ? "" : request.getParameter("action");
        List<Course> listCourse;

        switch (action) {
//            case "search":
//                listProduct = searchProduct(request, response);
//                break;
            case "insert":
                listCourse = insert(request, response);
                break;
            case "delete":
                listCourse = delete(request, response);
                break;
            default:
                throw new AssertionError();
        }
        request.setAttribute("listCourse", listCourse);
        response.sendRedirect("addcourse");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private List<Course> insert(HttpServletRequest request, HttpServletResponse response) {
        CourseDBContext db = new CourseDBContext();

        int cid = Integer.parseInt(request.getParameter("cid"));
        String cname = request.getParameter("cname");
        int lid = Integer.parseInt(request.getParameter("lid"));
        int subid = Integer.parseInt(request.getParameter("subid"));
        int semid = Integer.parseInt(request.getParameter("semid"));

        Lecturer l = new Lecturer();
        l.setId(lid);
        Subject su = new Subject();
        su.setId(subid);
        Semester se = new Semester();
        se.setId(semid);

        Course course = new Course();
        course.setId(cid);
        course.setName(cname);
        course.setLecturer(l);
        course.setSubject(su);
        course.setSemester(se);
        db.insert(course);

        return db.findAll();
    }

    private List<Course> delete(HttpServletRequest request, HttpServletResponse response) {
        CourseDBContext db = new CourseDBContext();
        int id = Integer.parseInt(request.getParameter("cid"));

        Course courses = new Course();
        courses.setId(id);
        db.deleteById(courses);
        return db.findAll();
    }
}
