/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.exam;

import controller.auth.BaseRequiredLecturerAuthenticationController;
import dal.CourseDBContext;
import dal.ExamDBContext;
import dal.ListStudentDBContext;
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
import model.Lecturer;
import model.Student;
import model.User;

/**
 *
 * @author ADMIN
 */
public class ViewListStudentByLecturer extends BaseRequiredLecturerAuthenticationController {

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, User user, Lecturer lecturer) throws ServletException, IOException {
        HttpSession req = request.getSession();

        CourseDBContext db = new CourseDBContext();
        int lid = Integer.parseInt(req.getAttribute("userLecturerId").toString());
        ArrayList<Course> courses = db.getCoursesByLecturer(lid);
        request.setAttribute("courses", courses);
        request.getRequestDispatcher("../view/exam/lecturer.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, User user, Lecturer lecturer) throws ServletException, IOException {
        int cid = Integer.parseInt(request.getParameter("cid"));
        int lid = lecturer.getId();

        ListStudentDBContext db = new ListStudentDBContext();
        ArrayList<Student> students = db.getListStudent(cid);
        request.setAttribute("students", students);

        request.getRequestDispatcher("../view/exam/liststudent.jsp").forward(request, response);
    }

}
