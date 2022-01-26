package com.sanderxavalon.xiaomibackend.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class User {
    Integer id;
    String useranme;
    @JsonIgnore
    String password;
    String email;
    String gender;
    Integer flag;
    Integer role;
    String code;
}
