/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.training;

import controller.auth.BaseRequiredTrainingAuthenticationController;
import dal.CourseDBContext;
import dao.ViewCourseDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
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
public class ViewCourseByTraining extends BaseRequiredTrainingAuthenticationController {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, User user, Training training) throws ServletException, IOException {
        CourseDBContext db = new CourseDBContext();
        HttpSession session = request.getSession();
        List<ViewCourseDao> list = db.getCoursesByTraining();
        request.setAttribute("list", list);
        request.getRequestDispatcher("view/training/viewcourse.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, User user, Training training) throws ServletException, IOException {
        String action = request.getParameter("action") == null
                ? "" : request.getParameter("action");
        List<Course> listCourse;
        switch (action) {
            case "insert":
                listCourse = insert(request, response);
                break;
            default:
                throw new AssertionError();
        }
        request.getSession().setAttribute("listCourse", listCourse);
        response.sendRedirect("viewcourse");
    }

    private List<Course> insert(HttpServletRequest request, HttpServletResponse response) {
        CourseDBContext db = new CourseDBContext();
        //get ve data
        int cid = Integer.parseInt(request.getParameter("cid"));
        String cname = request.getParameter("cname");
        Course course = new Course();
        course.setId(cid);
        course.setName(cname);
        Lecturer l = new Lecturer();
        int lid = Integer.parseInt(request.getParameter("lid"));
        l.setId(lid);
        course.setLecturer(l);
        Subject su = new Subject();
        int subid = Integer.parseInt(request.getParameter("subid"));
        su.setId(subid);
        course.setSubject(su);
        Semester se = new Semester();
        int semid = Integer.parseInt(request.getParameter("semid"));
        se.setId(semid);
        course.setSemester(se);

        //insert vao trong db
        db.insert(course);

        //get ve toan bo data moi
        return db.findAll();

        //tra ve list
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
