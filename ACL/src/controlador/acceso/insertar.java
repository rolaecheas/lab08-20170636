package controlador.acceso;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import modelo.acceso.*;
import modelo.recurso.Recurso;
import modelo.role.Role;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;

@SuppressWarnings("serial")
public class insertar extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		resp.setContentType("text/html");
		
		PersistenceManager pm = PMF.get().getPersistenceManager();
		
		Query query = pm.newQuery(Role.class);
		List<Role> arrayRole = (List<Role>)query.execute("select from Role");
		
		Query query1 = pm.newQuery(Recurso.class);
		//query.setOrdering("nombre descending");
		List<Recurso> arrayRecurso = (List<Recurso>)query1.execute("select from Recurso");
		
		
		try {
			req.setAttribute("arrayRole",arrayRole);
			req.setAttribute("arrayRecurso",arrayRecurso);
			req.getRequestDispatcher("/WEB-INF/Vistas/Acceso/insertar.jsp").forward(req, resp);
			
			query.closeAll();
			query1.closeAll();
			
		} catch (ServletException e) {
			System.out.println("Error");
			// TODO Auto-generated catch block
			//e.printStackTrace();
		}
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		
			//Realizar la persistencia
		String idRecurso = req.getParameter("recurso");
		String idRole = req.getParameter("role");
			
		PersistenceManager pm = PMF.get().getPersistenceManager();
		
		try{
			Long idRecursoL = Long.parseLong(idRecurso);
			Long idRoleL = Long.parseLong(idRole);
			
			Acceso acceso = new Acceso(idRoleL,idRecursoL,true);
			
			pm.makePersistent(acceso);
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

