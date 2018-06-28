package controlador.role;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import modelo.role.*;
import javax.jdo.PersistenceManager;

@SuppressWarnings("serial")
public class insertar extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		resp.setContentType("text/html");
		
		try {
			req.getRequestDispatcher("/WEB-INF/Vistas/Role/insertar.jsp").forward(req, resp);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		
			//Realizar la persistencia
		String nombre = req.getParameter("nombre");
		Date fecha = new Date(); 
	
		PersistenceManager pm = PMF.get().getPersistenceManager();
		
		 Role rol = new Role(nombre,fecha,true);
		
		try{
			pm.makePersistent(rol);
			}
		finally{
			pm.close();
		}
			resp.sendRedirect("/role");
	}
}

