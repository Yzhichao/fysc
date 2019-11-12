package com.sky.commons.scan;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.sky.commons.annotation.LogAnno;
import com.sky.model.SysLog;
import com.sky.model.SysOptLog;
import com.sky.service.ISysLogService;
import com.sky.service.ISysOptLogService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;
import java.sql.SQLException;
import java.util.Date;

@Aspect
@Component
public class DatalogAspect {
    private static final Logger LOGGER = LogManager.getLogger(DatalogAspect.class);


    @Autowired
    private ISysOptLogService sysOptLogService;

    @Pointcut("@annotation(com.sky.commons.annotation.LogAnno)")
    public void cutController() {
    }

    @Around("cutController()")
    public Object recordSysLog(ProceedingJoinPoint point) throws Throwable {
        // 1.方法执行前的处理，相当于前置通知
        // 获取方法签名
        MethodSignature methodSignature = (MethodSignature) point.getSignature();
        // 获取方法
        Method method = methodSignature.getMethod();
        // 获取方法上面的注解
        LogAnno logAnno = method.getAnnotation(LogAnno.class);
        HttpServletRequest request =((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        Object result = point.proceed();
        try {
            Subject currentUser = SecurityUtils.getSubject();
            PrincipalCollection collection = currentUser.getPrincipals();
            if (null != collection) {
                String loginName = collection.getPrimaryPrincipal().toString();
                // 获取操作描述的属性值
                int operateType = logAnno.operateType();
                String logtable = logAnno.TableName();
                // 创建一个日志对象(准备记录日志)
                SysOptLog sysOptLog = new SysOptLog();
                sysOptLog.setOptType(operateType);
                sysOptLog.setOptTable(logtable);
                sysOptLog.setLoginName(loginName);
                sysOptLog.setRoleName(loginName);
                sysOptLog.setCreateTime(new Date());
                if (request != null) {
                    sysOptLog.setClientIp(request.getRemoteAddr());
                }
                Object[] args = point.getArgs();
                if (args.length > 0) {
                    System.out.println(args[0].toString());
                    if (operateType == 3) {
                        Integer id =  (Integer) args[0];
                        if (id != null) {
                            sysOptLog.setOptId(id.toString());
                        }
                    }else{
                        JSONObject jsonObject = ((JSONObject)JSONObject.toJSON(args[0]));
                        if (jsonObject != null) {
                            Object optId = jsonObject.get("id");
                            if (optId != null) {
                                sysOptLog.setOptId(optId.toString());
                            }
                        }
                    }
                }
                LOGGER.info(sysOptLog.toString());
                sysOptLogService.insert(sysOptLog);// 添加日志记录
            }
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
        }
        return result;
    }


    private boolean isWriteLog(String method) {
        String[] pattern = {"add", "edit", "delete"};
        for (String s : pattern) {
            if (method.indexOf(s) > -1) {
                return true;
            }
        }
        return false;
    }

}
