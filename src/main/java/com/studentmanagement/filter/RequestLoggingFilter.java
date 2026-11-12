package com.studentmanagement.filter;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class RequestLoggingFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) {
        System.out.println("RequestLoggingFilter initialized");
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        httpRequest.setCharacterEncoding("UTF-8");
        httpResponse.setCharacterEncoding("UTF-8");

        long startTime = System.currentTimeMillis();
        try {
            chain.doFilter(request, response);
        } finally {
            long processingTime = System.currentTimeMillis() - startTime;
            System.out.println("========== REQUEST LOG ==========");
            System.out.println("Method: " + httpRequest.getMethod());
            System.out.println("URI: " + httpRequest.getRequestURI());
            System.out.println("Client IP: " + httpRequest.getRemoteAddr());
            System.out.println("Request processing time: " + processingTime + " ms");
            System.out.println("=================================");
        }
    }

    @Override
    public void destroy() {
        System.out.println("RequestLoggingFilter destroyed");
    }
}
