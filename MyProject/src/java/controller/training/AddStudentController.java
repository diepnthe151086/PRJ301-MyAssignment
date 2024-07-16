/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.training;

import dal.CourseDBContext;
import dal.StudentDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Course;
import model.Lecturer;
import model.Semester;
import model.Student;
import model.Subject;

/**
 *
 * @author ADMIN
 */
public class AddStudentController extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        StudentDBContext db = new StudentDBContext();
        int cid = Integer.parseInt(request.getParameter("cid"));
        List<Student> students = db.findStudentByCourseID(cid);
        request.setAttribute("students", students);
        request.getRequestDispatcher("view/training/addstudent.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action") == null
                ? "" : request.getParameter("action");
        List<Student> listStudent;

        switch (action) {
//            case "search":
//                listProduct = searchProduct(request, response);
//                break;
            case "insert":
                listStudent = insert(request, response);
                break;
            case "delete":
                listStudent = delete(request, response);
                break;
            default:
                throw new AssertionError();
        }
        request.setAttribute("listStudent", listStudent);
        response.sendRedirect("addstudent");
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

    private List<Student> insert(HttpServletRequest request, HttpServletResponse response) {
        StudentDBContext db = new StudentDBContext();

        int sid = Integer.parseInt(request.getParameter("sid"));
        String sname = request.getParameter("sname");

        Student student = new Student();
        student.setId(sid);
        student.setName(sname);
        
        db.insertStudent(student);
       

        return db.findStudentByCourseID(cid);
    }

    private List<Student> delete(HttpServletRequest request, HttpServletResponse response) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
