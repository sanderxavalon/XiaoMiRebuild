package com.sanderxavalon.xiaomibackend.repository;

import com.sanderxavalon.xiaomibackend.entity.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface UserRepository {

    @Select("SELECT * FROM tb_user WHERE username = #{username}")
    User getUserByUserName(String username);

}
