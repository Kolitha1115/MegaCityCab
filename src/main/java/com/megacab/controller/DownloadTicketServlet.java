package com.megacab.controller;

import java.io.IOException;
import java.io.OutputStream;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

@WebServlet("/downloadTicket")
public class DownloadTicketServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=\"ticket.pdf\"");

        try (OutputStream out = response.getOutputStream()) {
            Document document = new Document();
            PdfWriter.getInstance(document, out);
            document.open();

            // Get booking details from request
            String fullName = request.getParameter("full_name");
            String address = request.getParameter("address");
            String nic = request.getParameter("nic");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            String fromLocation = request.getParameter("from_location");
            String toLocation = request.getParameter("to_location");
            String vehicleModel = request.getParameter("vehicle_model");
            String rentPrice = request.getParameter("rent_price");
            String bookingId = "B" + System.currentTimeMillis(); // Generate unique booking ID

            // Add title
            addTitle(document);

            // Add booking details
            addBookingDetails(document, fullName, address, nic, phone, email, fromLocation, toLocation, vehicleModel, rentPrice, bookingId);

            // Add QR Code
            addQRCode(document, bookingId, fullName, vehicleModel);

            // Add footer
            addFooter(document);

            document.close();
            
            // **Send JavaScript to redirect after download**
            response.getWriter().println("<script>window.location.href = 'index.jsp';</script>");

        } catch (DocumentException e) {
            e.printStackTrace();
            response.getWriter().write("Error generating the PDF.");
        }
    }

    private void addTitle(Document document) throws DocumentException {
        Font titleFont = new Font(Font.FontFamily.HELVETICA, 24, Font.BOLD, BaseColor.BLUE);
        Paragraph title = new Paragraph("Mega City Cab - Booking Ticket", titleFont);
        title.setAlignment(Element.ALIGN_CENTER);
        title.setSpacingAfter(20);
        document.add(title);
    }

    private void addBookingDetails(Document document, String fullName, String address, String nic, String phone, String email, String fromLocation, String toLocation, String vehicleModel, String rentPrice, String bookingId) throws DocumentException {
        PdfPTable table = new PdfPTable(2);
        table.setWidthPercentage(90);
        table.setSpacingBefore(10);
        table.setSpacingAfter(10);

        // Add details
        addTableCell(table, "Booking ID:", bookingId);
        addTableCell(table, "Customer Name:", fullName);
        addTableCell(table, "Address:", address);
        addTableCell(table, "NIC:", nic);
        addTableCell(table, "Phone Number:", phone);
        addTableCell(table, "Email Address:", email);
        addTableCell(table, "From:", fromLocation);
        addTableCell(table, "To:", toLocation);
        addTableCell(table, "Vehicle Model:", vehicleModel);
        addTableCell(table, "Total Fare:", "Rs. " + rentPrice + ".00");

        document.add(table);
    }

    private void addTableCell(PdfPTable table, String label, String value) {
        Font labelFont = new Font(Font.FontFamily.HELVETICA, 12, Font.BOLD);
        Font valueFont = new Font(Font.FontFamily.HELVETICA, 12);

        PdfPCell labelCell = new PdfPCell(new Phrase(label, labelFont));
        labelCell.setBorder(Rectangle.NO_BORDER);
        table.addCell(labelCell);

        PdfPCell valueCell = new PdfPCell(new Phrase(value, valueFont));
        valueCell.setBorder(Rectangle.NO_BORDER);
        table.addCell(valueCell);
    }

    private void addQRCode(Document document, String bookingId, String fullName, String vehicleModel) throws DocumentException, IOException {
        String qrText = "Booking ID: " + bookingId + "\nCustomer: " + fullName + "\nVehicle: " + vehicleModel;
        try {
            Image qrCode = Image.getInstance("https://api.qrserver.com/v1/create-qr-code/?size=150x150&data=" + qrText);
            qrCode.setAlignment(Element.ALIGN_CENTER);
            qrCode.setSpacingBefore(10);
            qrCode.setSpacingAfter(10);
            document.add(qrCode);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void addFooter(Document document) throws DocumentException {
        Font footerFont = new Font(Font.FontFamily.HELVETICA, 10, Font.ITALIC, BaseColor.GRAY);
        Paragraph footer = new Paragraph("Thank you for choosing Mega City Cab! Have a safe journey.", footerFont);
        footer.setAlignment(Element.ALIGN_CENTER);
        footer.setSpacingBefore(20);
        document.add(footer);
    }
}
