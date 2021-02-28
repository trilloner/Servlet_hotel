package filter;

import model.user.User;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Filter for the distribution of roles for the admin
 */
public class AdminPathFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        HttpSession session = request.getSession();
        User admin = (User) session.getAttribute("user");
        if (admin != null && admin.getRole().equals("ROLE_ADMIN")) {

            filterChain.doFilter(request, response);
        } else {
            response.sendRedirect("/hotel/logout");
        }
    }

    @Override
    public void destroy() {

    }
}
