package controlador.acceso;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import modelo.acceso.Acceso;
import modelo.acceso.AccesoAux;
import modelo.recurso.Recurso;
import modelo.role.Role;

@SuppressWarnings("serial")
public class index extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		resp.setContentType("text/html");

		PersistenceManager pm = PMF.get().getPersistenceManager();
		Query query0 = pm.newQuery(Acceso.class);

		List<Acceso> listAcceso = (List<Acceso>)query0.execute("select from Acceso");
		
		List<AccesoAux> array = new ArrayList<AccesoAux>();
		AccesoAux nuevo;
		
		for(Acceso acceso:listAcceso){
			
			Role rol = pm.getObjectById(Role.class,acceso.getIdRole());
			Recurso recurso = pm.getObjectById(Recurso.class,acceso.getIdRecurso());
			nuevo = new AccesoAux(acceso.getId(),rol.getNombre(),recurso.getUrl(),acceso.isEstado());
			array.add(nuevo);
		}
		
		req.setAttribute("array", array);
		
		try {
			req.getRequestDispatcher("/WEB-INF/Vistas/Acceso/index.jsp").forward(req, resp);
			query0.closeAll();

		} catch (ServletException e) {
			// TODO Auto-generated catch block
			System.out.println("Error" + e.toString());
		}
		finally {
			pm.close();
		}
	}
}
