package scao.startstop;

import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "SessionServlet", urlPatterns = {"/", "/show", "/new", "/confirm"})
public class SessionServlet extends HttpServlet {
     @EJB
    private SessionFacade sessionFacade;
    
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String path = request.getServletPath();
        String view = path;

        // if index page is requested
        if (path.equals("/")) {
        // store session list in servlet context
        getServletContext().setAttribute("sessions", sessionFacade.findAll());
        view = "/index";

        // if new page is requested, does not require action here.
            
        // if show page is requested
        } else if (path.equals("/show")) {
            Integer id = Integer.parseInt(request.getParameter("id"));
            getServletContext().setAttribute("session", sessionFacade.find(id));
        }
            
        // if confirm page is requested, does not require action here.
            
        // use RequestDispatcher to forward request internally
        String url = "/WEB-INF/view" + view + ".jsp";
        
        try {
            request.getRequestDispatcher(url).forward(request, response);
        } catch (Exception ex) {
            ex.printStackTrace();
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // create, delete, finish
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
