package com.sanderxavalon.xiaomibackend.service;

import com.sanderxavalon.xiaomibackend.common.exception.BizException;
import com.sanderxavalon.xiaomibackend.common.exception.StatusEnum;
import com.sanderxavalon.xiaomibackend.entity.User;
import com.sanderxavalon.xiaomibackend.common.response.GenericResponse;
import com.sanderxavalon.xiaomibackend.entity.login.LoginDTO;
import com.sanderxavalon.xiaomibackend.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {

    @Autowired
    UserRepository userRepository;

    public User login(LoginDTO dto){
        User user = userRepository.getUserByUserName(dto.getUsername());
        if (user == null){
            throw new BizException(StatusEnum.NO_USER_FOUND);
        }
        if (!user.getPassword().equals(dto.getPassword())) {
            throw new BizException(StatusEnum.INCORRECT_PASSWORD);
        }

        return user;
    }

}