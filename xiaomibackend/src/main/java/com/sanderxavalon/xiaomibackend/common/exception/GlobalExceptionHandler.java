package com.sanderxavalon.xiaomibackend.common.exception;

import com.sanderxavalon.xiaomibackend.common.response.GenericResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@Slf4j
@RestControllerAdvice
public class GlobalExceptionHandler {



    @ExceptionHandler(Exception.class)
    public GenericResponse handleException(Exception exception){
        log.error(exception.toString());
        return new GenericResponse(StatusEnum.ERROR, exception.getMessage());
    }

    @ExceptionHandler(BizException.class)
    public GenericResponse handleBizException(BizException bizException){
        log.info(bizException.toString());
        return new GenericResponse(bizException.getErrorCode(), bizException.getErrorMessage(), null);
    }
}
