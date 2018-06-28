package controlador.role;

import java.io.IOException;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import modelo.role.Role;

@SuppressWarnings("serial")
public class index extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		resp.setContentType("text/html");
		
		PersistenceManager pm = PMF.get().getPersistenceManager();
		Query query = pm.newQuery(Role.class);
		//query.setOrdering("nombre descending");
		List<Role> array = (List<Role>)query.execute("select from Role");
		
		req.setAttribute("array", array);
		try {
			req.getRequestDispatcher("/WEB-INF/Vistas/Role/index.jsp").forward(req, resp);
			query.closeAll();
		
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			pm.close();
		}
	}
}
