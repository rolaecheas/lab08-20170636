package controlador.acceso;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.*;
import modelo.acceso.Acceso;
import modelo.recurso.Recurso;
import modelo.role.Role;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;

@SuppressWarnings("serial")
public class modificar extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		resp.setContentType("text/html");
		
		PersistenceManager pm = PMF.get().getPersistenceManager();
		
		try {
			
			Query query = pm.newQuery(Role.class);
			List<Role> arrayRole = (List<Role>)query.execute("select from Role");
			
			Query query1 = pm.newQuery(Recurso.class);
			List<Recurso> arrayRecurso = (List<Recurso>)query1.execute("select from Recurso");
			
			String id = req.getParameter("id");
			Long idLong = Long.parseLong(id); 
			
			Acceso acceso = pm.getObjectById(Acceso.class,idLong);
			
			req.setAttribute("acceso",acceso);
			req.setAttribute("arrayRole",arrayRole);
			req.setAttribute("arrayRecurso",arrayRecurso);
			
			
			
			req.getRequestDispatcher("/WEB-INF/Vistas/Acceso/modificar.jsp").forward(req, resp);
	
			query.closeAll();
			query1.closeAll();
		} catch (Exception e) {
			System.out.println("Error "+e.getMessage());
		}
		finally{
			pm.close();
		}
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		
			//Realizar la persistencia
		String id = req.getParameter("id");
		String idRole = req.getParameter("role");
		String idRecurso = req.getParameter("recurso");
		String estado = req.getParameter("estado");
		
		PersistenceManager pm = PMF.get().getPersistenceManager();
		
		try{
			Long idLong = Long.parseLong(id);
			Long idRoleL = Long.parseLong(idRole);
			Long idRecursoL = Long.parseLong(idRecurso);
			
			boolean estadoBool = Boolean.parseBoolean(estado);
			
			 Acceso acceso = pm.getObjectById(Acceso.class,idLong);
			acceso.setIdRecurso(idRecursoL);
			acceso.setIdRole(idRoleL);
			acceso.setEstado(estadoBool);
			
		}
		catch(Exception e){
			System.out.println("Se produjo un Error");
		}
		finally{
			pm.close();
		}
			resp.sendRedirect("/acceso");
	}
}

