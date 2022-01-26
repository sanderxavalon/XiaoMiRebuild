package com.sanderxavalon.xiaomibackend.common.response;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.sanderxavalon.xiaomibackend.common.exception.StatusEnum;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class GenericResponse {

    private Integer status;
    private String message;

    @JsonInclude(JsonInclude.Include.NON_NULL)
    private Object data;

    public GenericResponse(StatusEnum statusEnum){
        this.status = statusEnum.getStatus();
        this.message = statusEnum.getMessage();
        this.data = null;
    }

    public GenericResponse(StatusEnum statusEnum, Object data){
        this.status = statusEnum.getStatus();
        this.message = statusEnum.getMessage();
        this.data = data;
    }

    public static GenericResponse QuickSuccess(){
        return new GenericResponse(StatusEnum.SUCCESS);
    }

    public static GenericResponse QuickSuccess(Object data){
        return new GenericResponse(StatusEnum.SUCCESS, data);
    }

}
