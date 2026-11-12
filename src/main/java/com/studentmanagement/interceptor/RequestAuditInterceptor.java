package com.studentmanagement.interceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class RequestAuditInterceptor implements HandlerInterceptor {

    private static final Logger logger = LoggerFactory.getLogger(RequestAuditInterceptor.class);

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
        logger.info("preHandle: {} {} | handler={}", request.getMethod(), request.getRequestURI(), handler);
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
                           ModelAndView modelAndView) {
        logger.info("postHandle: controller processing completed for {} {}", request.getMethod(),
                request.getRequestURI());
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler,
                                Exception ex) {
        logger.info("afterCompletion: request completed for {} {} | exception={}", request.getMethod(),
                request.getRequestURI(), ex != null ? ex.getMessage() : "none");
    }
}