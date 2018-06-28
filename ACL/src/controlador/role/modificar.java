package controlador.role;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import modelo.role.*;
import javax.jdo.PersistenceManager;

@SuppressWarnings("serial")
public class modificar extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		resp.setContentType("text/html");
		
		PersistenceManager pm = PMF.get().getPersistenceManager();
		
		try {
			
			String id = req.getParameter("id");
			Long idLong = Long.parseLong(id); 
			Role rol = pm.getObjectById(Role.class,idLong);
			req.setAttribute("role",rol);
			req.getRequestDispatcher("/WEB-INF/Vistas/Role/modificar.jsp").forward(req, resp);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally{
			pm.close();
		}
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		
			//Realizar la persistencia
		String id = req.getParameter("id");
		String nombre = req.getParameter("nombre");
		String estado = req.getParameter("estado");
		Date fecha = new Date();
		
		PersistenceManager pm = PMF.get().getPersistenceManager();
		
		try{
			Long idLong = Long.parseLong(id);
			boolean estadoBool = Boolean.parseBoolean(estado);
			
			 Role prof = pm.getObjectById(Role.class,idLong);
			prof.setNombre(nombre);
			prof.setFecha(fecha);
			prof.setEstado(estadoBool);
			
		}
		catch(Exception e){
			System.out.println("Se produjo un Error");
		}
		finally{
			pm.close();
		}
			resp.sendRedirect("/role");
	}
}

