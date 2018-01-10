/**   
 * @Title: SecurityConfig.java 
 * @Package com.sva.configure 
 * @Description: 安全配置
 * @author labelCS   
 * @date 2018年1月9日 下午3:35:52 
 * @version V1.0   
 */
package com.sva.configure;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

/** 
 * @ClassName: SecurityConfig 
 * @Description: 安全配置
 * @author labelCS 
 * @date 2018年1月9日 下午3:35:52 
 *  
 */
@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter
{

    /* (非 Javadoc) 
     * <p>Title: configure</p> 
     * <p>Description: </p> 
     * @param auth
     * @throws Exception 
     * @see org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter#configure(org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder) 
     */
    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception
    {
        // TODO Auto-generated method stub
        super.configure(auth);
    }
}
