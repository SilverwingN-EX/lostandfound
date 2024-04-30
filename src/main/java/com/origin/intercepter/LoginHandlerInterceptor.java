package com.origin.intercepter;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginHandlerInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception {
        // 登录成功应该有session（在登陆的Controller中设置session）
        // String url = request.getRequestURI();
        // System.out.println(url);
        // if (url.indexOf("/toAdminLogin") > 0) return true;
        // if (url.indexOf("/user") > 0) return true;
        // Object admin = request.getSession().getAttribute("admin");
        // Object user = request.getSession().getAttribute("user");
        // if(user != null){
        //     return true;
        // }else if(admin !=null){
        //     return true;
        // }
        //     request.setAttribute("msg", "没有权限，请先登录！");
        //     response.sendRedirect("login");
        //     return false;
            return true;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
