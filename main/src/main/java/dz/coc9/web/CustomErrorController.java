package dz.coc9.web;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class CustomErrorController implements ErrorController {

    @RequestMapping("/error")
    public ModelAndView handleError(HttpServletRequest request) {
        String code = request.getParameter("code"); // from redirect
        if (code != null) {
            switch (code) {
                case "401":
                    return new ModelAndView("forward:/error/401.html");
                case "403":
                    return new ModelAndView("forward:/error/403.html");
                case "404":
                    return new ModelAndView("forward:/error/404.html");
                default:
                    return new ModelAndView("forward:/error/500.html");
            }
        }

        // fallback: dispatcher errors (e.g. 404, 500)
        Object statusCode = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
        if (statusCode != null) {
            int status = Integer.parseInt(statusCode.toString());
            switch (status) {
                case 401:
                    return new ModelAndView("forward:/error/401.html");
                case 403:
                    return new ModelAndView("forward:/error/403.html");
                case 404:
                    return new ModelAndView("forward:/error/404.html");
                default:
                    return new ModelAndView("forward:/error/500.html");
            }
        }

        return new ModelAndView("forward:/error/500.html");
    }
}
