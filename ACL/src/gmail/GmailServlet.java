package gmail;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

@SuppressWarnings("serial")
public class GmailServlet extends HttpServlet {
 public void doGet(HttpServletRequest req, HttpServletResponse resp)
 throws IOException {
	 resp.setContentType("text/html");
 
	 PrintWriter out = resp.getWriter();
 
	 UserService us = UserServiceFactory.getUserService();
	 User user = us.getCurrentUser();
 	
	 if(user == null){
		 resp.sendRedirect(us.createLoginURL(req.getRequestURI()));
 	}else{
		 out.println("<!DOCTYPE html>"	 
		 + "<html>"
		 + "<head><title>Informacion de la cuenta</title>"
		 + "<meta charset=utf-8;>"
		 + "<body>"
		 + "<h1>Informacion de la Cuenta Google</h1>"
		 + "<br><a href='../'>Regresar...</a>"
		 +"<br/><b>User :</b>"
		 +"<br/>Nickname³ : "+user.getNickname()
		 +"<br/>Dominio : "+user.getAuthDomain()
		 +"<br/>Email  : "+user.getEmail()
		 +"<br/>UserId  : "+user.getUserId()
		 +"<br/>FederatedIdentity : "+user.getFederatedIdentity()
		 +"<br/>"
		 +"<br/><b>Servicio de Usuario :</b>"
		 +"<br/>isUserAdmin : "+us.isUserAdmin() 
		 +"<br/>isUserLoggedIn  : "+us.isUserLoggedIn()
		 +"<br/>getCurrentUser  : "+us.getCurrentUser()
		 +"<br/>"
		 +"<a href='"+ us.createLogoutURL(req.getRequestURI())+"'> Cerrar sesion </a>"
		 + "</body></html>");
 	}
 }
}