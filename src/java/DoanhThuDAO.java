
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.time.Month;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author nofom
 */
public class DoanhThuDAO {
    
    Connection conn = null;
    PreparedStatement psm = null;
    ResultSet rs = null;

    public double getRevenueByMonth(LocalDate month){
        String query = "SELECT SUM(doanh_thu) FROM doanh_thu WHERE MONTH(ngay) = ? AND YEAR(ngay) = ? GROUP BY  MONTH(ngay), YEAR(ngay)";
        try {
            conn = DBUtils.getConnection();
            psm = conn.prepareStatement(query);
            psm.setInt(1, month.getMonthValue());
            psm.setInt(2, month.getYear());
            rs = psm.executeQuery();
            while (rs.next()) {
                return rs.getDouble(1);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return 0;
    }
    public static void main(String[] args) {
        DoanhThuDAO dao = new DoanhThuDAO();
//         LocalDate today = LocalDate.of(2024, Month.MARCH, 23);
         LocalDate today = LocalDate.now().minusMonths(1);
         System.out.println(dao.getRevenueByMonth(today));
    }
}
