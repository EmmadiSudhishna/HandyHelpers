package com.example.controller.admin;

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

import com.example.model.Services;

/**
 * Servlet implementation class AddServiceServlet
 */
@WebServlet("/AddServiceServlet")
@MultipartConfig

public class AddServiceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddServiceServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);

		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();

		// Retrieve parameters from the view
		String serviceName = request.getParameter("serviceName");

		Part servicePic = request.getPart("servicePic");

		System.out.println("Sname: " + serviceName);
		System.out.println("servicePic: " + servicePic);

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
		/////// upload productImage1////////////////////
		//////////////////////////////

		// Get the input stream of the uploaded file
		InputStream inputStream1 = servicePic.getInputStream();

		// Generate the unique filename or use the original file name
		String fileName1 = System.currentTimeMillis() + "_" + servicePic.getSubmittedFileName();

		// Save file to the server
		Path filePath1 = uploadPath.resolve(fileName1);
		Files.copy(inputStream1, filePath1, StandardCopyOption.REPLACE_EXISTING);

		// Create a new Service object and set the values
		Services service = new Services();
		service.setServiceName(serviceName);
		service.setServicePic(fileName1);

		// Call the addService method
		int n = service.addServices();
		response.sendRedirect("Admin/AddService.jsp?res=" + n);
		pw.close();
	}
}
