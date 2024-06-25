package com.example.controller.worker;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;
import java.util.Calendar;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import com.example.model.Workers;

import servletpack.Cryptography;

/**
 * Servlet implementation class AddWorkerServlet
 */
@WebServlet("/AddWorkerServlet")
@MultipartConfig
public class AddWorkerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
   

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		// getting the parameters
		String fullName = request.getParameter("fullName");
		String serviceName = request.getParameter("serviceName");
		String mobile = request.getParameter("mobile");
		String currentAddress = request.getParameter("currentAddress");
		String cities = request.getParameter("cities");
		String password = request.getParameter("password");
		String status = request.getParameter("status");
		System.out.println("mobile ="+mobile);
		Part workerPic = request.getPart("workerPic");
		Part aadhaarPic = request.getPart("aadhaarPic");
		System.out.println("workerPic ="+workerPic);
		
		ServletContext sc = getServletContext();
		String path = sc.getRealPath("/");
		System.out.println("path = " + path);

		/*String str = path.substring(0, path.indexOf(".metadata") - 1);
		System.out.println("str = " + str);

// get application name
		String appName = path.substring(path.lastIndexOf("\\", path.length() - 2));
		System.out.println("appName = " + appName);

// Concatenate root directory with application name
		String uploadDirectory = str + appName + "\\src\\main\\webapp\\uploads";*/
		
		String uploadDirectory = path + "/uploads";
		System.out.println("uploadDirectory :" + uploadDirectory);

		Path uploadPath = Path.of(uploadDirectory);

		// Create the directory if it doesnt't exist
		if (!Files.exists(uploadPath)) {
			Files.createDirectories(uploadPath);
			System.out.println("directory Created");
		} else {
			System.out.println("directory not Created");
		}
		InputStream inputStream1 = workerPic.getInputStream();

		// Generate the unique filename or use the original file name
		String fileName1 = System.currentTimeMillis() + "_" + workerPic.getSubmittedFileName();

		// Save file to the server
		Path filePath1 = uploadPath.resolve(fileName1);
		Files.copy(inputStream1, filePath1, StandardCopyOption.REPLACE_EXISTING);
		
		InputStream inputStream2 = aadhaarPic.getInputStream();

		// Generate the unique filename or use the original file name
		String fileName2 = System.currentTimeMillis() + "_" + aadhaarPic.getSubmittedFileName();

		// Save file to the server
		Path filePath2 = uploadPath.resolve(fileName2);
		Files.copy(inputStream2, filePath2, StandardCopyOption.REPLACE_EXISTING);

		String encodedMobile = Cryptography.encode(mobile);
		String encodedPassword = Cryptography.encode(password);
		
		// use model to insert
		Workers worker = new Workers();// creating the object
		worker.setFullName(fullName);  // setting the parameters
		worker.setServiceName(serviceName);
		worker.setMobile(encodedMobile);
		worker.setCurrentAddress(currentAddress);
		worker.setCities(cities);
		worker.setWorkerPic(fileName1);
		worker.setAadhaarPic(fileName2);
		worker.setPassword(encodedPassword);
		worker.setStatus(status);
		
		 
		int n = worker.addWorker();
		System.out.println(n);
		if (n == 1) {
			
			response.sendRedirect("/HandyHelpers/WorkerLogin.jsp?res=" + n);
			
		} else {
			out.println("<h1>Fill all the required feilds</h1>");
			out.println("<script language='javascript'>alert('Invalid user');window.location='WorkerRegistration.jsp?res=0';</script>");

		}
		out.close();
	}

}

