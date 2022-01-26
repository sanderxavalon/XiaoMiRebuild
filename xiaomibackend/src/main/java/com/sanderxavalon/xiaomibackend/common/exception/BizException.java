package com.sanderxavalon.xiaomibackend.common.exception;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BizException extends RuntimeException{

    private Integer errorCode;
    private String errorMessage;

    public BizException(StatusEnum statusEnum){
        super(statusEnum.getMessage());
        this.errorCode = statusEnum.getStatus();
        this.errorMessage = statusEnum.getMessage();
    }

}
