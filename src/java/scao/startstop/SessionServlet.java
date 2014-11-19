package scao.startstop;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "SessionServlet", urlPatterns = {"/", "/show", "/new", "/confirm"})
public class SessionServlet extends HttpServlet {

    @EJB
    private SessionFacade sessionFacade;
    @EJB
    private BulletFacade bulletFacade;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String path = request.getServletPath();
        String view = path;

        // if index page is requested
        if (path.equals("/")) {
            List<Session> sessions;
            String username = request.getParameter("username");
            if (username == null) {
                sessions = sessionFacade.findAll();
            } else {
                sessions = sessionFacade.findByUsername(username);
            }
            // store session list in servlet context
            getServletContext().setAttribute("sessions", sessions);
            view = "/index";

        // if new page is requested, does not require action here.
        
        // if show page is requested
        } if (path.equals("/show")) {
            Integer id = Integer.parseInt(request.getParameter("id"));
            getServletContext().setAttribute("session", sessionFacade.find(id));
            getServletContext().setAttribute("bullets", bulletFacade.findBySessionId(id));
        }
        
        if (path.equals("/showby")) {
            String username = request.getParameter("username");
            getServletContext().setAttribute("sessions", sessionFacade.findByUsername(username));
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

        String path = request.getServletPath();
        String username = null;
        for (Cookie cookie : request.getCookies()) {
        if (cookie.getName().equals("username")) {
            username = cookie.getValue();
            break;
        }
    }

        // if create action is requested
        if (path.equals("/create")) {
            Session session = new Session(null, request.getParameter("name"));
            session.setStart(new Date());
            session.setUsername(username);
            sessionFacade.create(session);
            response.sendRedirect(request.getContextPath() + "/show?id=" + session.getId());
        
         // if finish page is requested (ending a session)
        } else if (path.equals("/finish")) {
            Integer id = Integer.parseInt(request.getParameter("id"));
            Session session = sessionFacade.find(id);
            session.setStop(new Date());
            sessionFacade.edit(session);
            response.sendRedirect(request.getContextPath() + "/show?id=" + id);
        
         // if delete page is requested (adding new bullet) - NOTE sessionfacade.delete whatever
        } else if (path.equals("/delete")) {
            Integer id = Integer.parseInt(request.getParameter("id"));
            Session session = sessionFacade.find(id);
            sessionFacade.remove(session);
            response.sendRedirect(request.getContextPath() + "/");
        }
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
