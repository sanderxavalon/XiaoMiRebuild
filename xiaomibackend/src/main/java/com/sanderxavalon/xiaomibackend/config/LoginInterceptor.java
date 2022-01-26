package com.sanderxavalon.xiaomibackend.config;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sanderxavalon.xiaomibackend.common.exception.StatusEnum;
import com.sanderxavalon.xiaomibackend.common.response.GenericResponse;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        String token = request.getHeader("token");

        if ("".equals(token) || null == token){

            response.setHeader("Access-Control-Allow-Credentials", "true");
            response.setHeader("Access-Control-Allow-Origin", request.getHeader("Origin"));
            response.setHeader("Access-Control-Allow-Headers", "*");

            response.setCharacterEncoding("UTF-8");
            response.setContentType("application/json;charset=UTF-8");
            ObjectMapper mapper = new ObjectMapper();
            GenericResponse genericResponse = new GenericResponse(StatusEnum.NOT_LOGIN);
            String jsonString = mapper.writeValueAsString(genericResponse);

            response.getWriter().write(jsonString);

            return false;
        }

        return true;
    }
}
