/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */


import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDate;

/**
 *
 * @author nofom
 */
@WebServlet(urlPatterns={"/StatisticServlet"})
public class StatisticServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet StatisticServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet StatisticServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        DoanhThu6ThangDTO data = new DoanhThu6ThangDTO();
//        lay 6 thang gan nhat
        LocalDate today = LocalDate.now();
        data.setThang1st(today);
        data.setThang2st(today.minusMonths(1));
        data.setThang3st(today.minusMonths(2));
        data.setThang4st(today.minusMonths(3));
        data.setThang5st(today.minusMonths(4));
        data.setThang6st(today.minusMonths(5));
        
//        get du lieu
        DoanhThuDAO dao = new DoanhThuDAO();
        data.setDoanhthu1st(dao.getRevenueByMonth(data.getThang1st()));
        data.setDoanhthu2st(dao.getRevenueByMonth(data.getThang2st()));
        data.setDoanhthu3st(dao.getRevenueByMonth(data.getThang3st()));
        data.setDoanhthu4st(dao.getRevenueByMonth(data.getThang4st()));
        data.setDoanhthu5st(dao.getRevenueByMonth(data.getThang5st()));
        data.setDoanhthu6st(dao.getRevenueByMonth(data.getThang6st()));        
        
//        truyen du lieu sang jsp
        request.setAttribute("data", data);
        request.getRequestDispatcher("index.jsp").forward(request, response);


    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
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
