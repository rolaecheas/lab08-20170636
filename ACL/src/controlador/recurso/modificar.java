package controlador.recurso;

import java.io.IOException;
import java.util.Date;
import javax.servlet.http.*;
import modelo.recurso.*;
import javax.jdo.PersistenceManager;

@SuppressWarnings("serial")
public class modificar extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		resp.setContentType("text/html");
		
		PersistenceManager pm = PMF.get().getPersistenceManager();
		
		try {		
			String id = req.getParameter("id");
			Long idLong = Long.parseLong(id); 
			Recurso rec = pm.getObjectById(Recurso.class,idLong);
			req.setAttribute("recurso",rec);
			req.getRequestDispatcher("/WEB-INF/Vistas/Recurso/modificar.jsp").forward(req, resp);
			
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
		String url = req.getParameter("url");
		String estado = req.getParameter("estado");
		Date fecha = new Date();
		
		PersistenceManager pm = PMF.get().getPersistenceManager();
		
		try{
			Long idLong = Long.parseLong(id);
			boolean estadoBool = Boolean.parseBoolean(estado);
			
			Recurso rec = pm.getObjectById(Recurso.class,idLong);
			rec.setUrl(url);
			rec.setFecha(fecha);
			rec.setEstado(estadoBool);
			
		}
		catch(Exception e){
			System.out.println("Se produjo un Error");
		}
		finally{
			pm.close();
		}
			resp.sendRedirect("/recurso");
	}
}

