/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.training;

import controller.auth.BaseRequiredTrainingAuthenticationController;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Training;
import model.User;

/**
 *
 * @author ADMIN
 */
public class homeController extends BaseRequiredTrainingAuthenticationController  {
   



    

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, User user, Training training) throws ServletException, IOException {
        
        request.getRequestDispatcher("view/training/home.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, User user, Training training) throws ServletException, IOException {
        
    }
/** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
