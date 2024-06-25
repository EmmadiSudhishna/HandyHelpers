package com.example.controller.user;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import com.example.model.Users;
import com.example.model.Workers;

import servletpack.Cryptography;

/**
 * Servlet implementation class AddUserServlet
 */
@WebServlet("/AddUserServlet")
@MultipartConfig
public class AddUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddUserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		// getting the parameters
		String fullName = request.getParameter("fullName");
		
		String mobile = request.getParameter("mobile");
		
		String password = request.getParameter("password");
		
		System.out.println("mobile ="+mobile);
		Part profilePic = request.getPart("profilePic");
		
		System.out.println("profilePic ="+profilePic);
		
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
		InputStream inputStream1 = profilePic.getInputStream();

		// Generate the unique filename or use the original file name
		String fileName1 = System.currentTimeMillis() + "_" + profilePic.getSubmittedFileName();

		// Save file to the server
		Path filePath1 = uploadPath.resolve(fileName1);
		Files.copy(inputStream1, filePath1, StandardCopyOption.REPLACE_EXISTING);
		
		String encodedMobile = Cryptography.encode(mobile);
		String encodedPassword = Cryptography.encode(password);
		
		// use model to insert
		Users user = new Users();// creating the object
		user .setFullName(fullName);  // setting the parameters
		
		user.setMobile(encodedMobile);
		user.setPassword(encodedPassword);
		user.setProfilePic(fileName1);
		
		 
		int n = user.addUser();
		System.out.println(n);
		if (n == 1) {
			
			response.sendRedirect("/HandyHelpers/UserLogin.jsp?res=" + n);
			out.close(); 
		} else {
			out.println("<h1>Fill all the required feilds</h1>");
			out.println("<script language='javascript'>alert('Invalid user');window.location='UserRegistration.jsp?res=0';</script>");

		}
		out.close();
	}

	}


