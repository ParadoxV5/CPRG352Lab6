package servlet;

import java.util.LinkedList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.ServletException;
import java.io.IOException;

public class ShoppingListServlet extends xyz.paradoxv5.servlet.MyServlet {
  private static final long serialVersionUID = 1;
  
  @SuppressWarnings("unchecked")
  @Override protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    javax.servlet.http.HttpSession session =  request.getSession(false);
    String action = request.getParameter("action");
    if(action != null) switch(action) {
      case "register":
        session = request.getSession(false);
        if(session == null) { // Initialize session
          session = request.getSession();
          session.setAttribute("items", new LinkedList<String>());
        }
        session.setAttribute("username", request.getParameter("username"));
      break;
      case "add":
        if(session != null)
          ((LinkedList<String>)session.getAttribute("items")).add(request.getParameter("item"));
      break;
      case "delete":
        if(session != null) ((LinkedList<String>)session.getAttribute("items")).remove(
          Integer.parseInt(request.getParameter("item"))
        );
      break;
      case "logout":
        if(session != null) {
          session.invalidate();
          session = null;
        }
      break;
    }
    
    forward(session == null
      ? "/WEB-INF/register.jsp"
      : "/WEB-INF/shoppingList.jsp"
    , request, response);
  }
  
  @Override protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    doGet(request, response);
  }
}