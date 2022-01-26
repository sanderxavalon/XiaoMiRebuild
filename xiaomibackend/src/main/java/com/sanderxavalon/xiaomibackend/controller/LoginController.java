package com.sanderxavalon.xiaomibackend.controller;

import com.sanderxavalon.xiaomibackend.common.response.GenericResponse;
import com.sanderxavalon.xiaomibackend.entity.login.LoginDTO;
import com.sanderxavalon.xiaomibackend.entity.login.LoginVO;
import com.sanderxavalon.xiaomibackend.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.UUID;

@RestController
public class LoginController {

    @Autowired
    UserService userService;

    @CrossOrigin("*")
    @RequestMapping(path = "/api/login")
    public GenericResponse login(@RequestBody LoginDTO dto, HttpServletResponse response){
        return GenericResponse.QuickSuccess(
                LoginVO.builder()
                        .token(UUID.randomUUID().toString())
                        .user(userService.login(dto))
                        .build()
        );
    }

    @CrossOrigin("*")
    @RequestMapping(path = "/api/test")
    public GenericResponse test2(){
        return GenericResponse.QuickSuccess("Checked!");
    }
}
