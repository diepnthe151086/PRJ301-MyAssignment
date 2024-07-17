/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.grade;

import controller.auth.BaseRequiredStudentAuthenticationController;
import dal.CourseDBContext;
import dal.GradeDBContext;
import dao.ViewGradeDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import model.Course;
import model.Exam;
import model.Student;
import model.User;

/**
 *
 * @author ADMIN
 */
public class ViewCourseByStudentController extends BaseRequiredStudentAuthenticationController {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, User user, Student student) throws ServletException, IOException {
        HttpSession req = request.getSession();
        CourseDBContext db = new CourseDBContext();
        String displayname = req.getAttribute("displayname").toString();
        int sid = Integer.parseInt(request.getSession().getAttribute("userStudentId").toString());
        ArrayList<Course> courses = db.getCoursesByStudent(sid);
        request.setAttribute("displayname", displayname);
        request.setAttribute("courses", courses);
        request.getRequestDispatcher("../view/grade/student.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, User user, Student student) throws ServletException, IOException {
        int cid = Integer.parseInt(request.getParameter("cid"));
        int sid = Integer.parseInt(request.getSession().getAttribute("userStudentId").toString());

        GradeDBContext db = new GradeDBContext();
        ArrayList<ViewGradeDao> viewGradeDaos = db.getGradesByCourse(sid, cid);
        request.setAttribute("grades", viewGradeDaos);
        request.getRequestDispatcher("../view/grade/view.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
