package controlador.recurso;

import java.io.IOException;
import javax.servlet.http.*;
import modelo.recurso.*;
import javax.jdo.PersistenceManager;
import javax.jdo.Query;

@SuppressWarnings("serial")
public class eliminar extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		resp.setContentType("text/html");

		String id = req.getParameter("id");
		Long idLong = Long.parseLong(id);
		PersistenceManager pm = PMF.get().getPersistenceManager();
		
		try{
			Query query = pm.newQuery(Recurso.class);
			query.setFilter("id == idParam");
			query.declareParameters("Long idParam");
			query.deletePersistentAll(idLong);
			query.closeAll();
		}
		finally{
			pm.close();
		}
		resp.sendRedirect("/recurso");
	}

}

