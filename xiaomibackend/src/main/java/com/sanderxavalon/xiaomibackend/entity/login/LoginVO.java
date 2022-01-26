package com.sanderxavalon.xiaomibackend.entity.login;

import com.sanderxavalon.xiaomibackend.entity.User;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class LoginVO {
    private String token;
    private User user;
}
