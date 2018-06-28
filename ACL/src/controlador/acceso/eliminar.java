package controlador.acceso;

import java.io.IOException;
import javax.servlet.http.*;
import modelo.acceso.*;
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
			Acceso acceso = pm.getObjectById(Acceso.class,idLong);
			pm.deletePersistent(acceso);
		}
		finally{
			pm.close();
		}
		resp.sendRedirect("/acceso");
	}

}

