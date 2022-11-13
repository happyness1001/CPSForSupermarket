package com.qfedu.fmmall.config;

import com.qfedu.fmmall.interceptor.CheckTokenInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.Ordered;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class InterceptorConfig implements WebMvcConfigurer {

    @Autowired
    private CheckTokenInterceptor checkTokenInterceptor;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(checkTokenInterceptor)
                .addPathPatterns("/shopcart/**")
                .addPathPatterns("/orders/**")
                .addPathPatterns("/useraddr/**")
                .addPathPatterns("/user/check");
    }
//    @Override
//    public void addResourceHandlers(ResourceHandlerRegistry registry) {
//        registry.addResourceHandler("/index").addResourceLocations("/index");
//    }

    @Override
    public void addViewControllers(ViewControllerRegistry registry) {

        //默认地址（可以是页面或后台请求接口）
        registry.addViewController("/CFS").setViewName("/login");
        registry.addViewController("/index").setViewName("/index");
        //设置过滤优先级最高
        registry.setOrder(Ordered.HIGHEST_PRECEDENCE);
    }

}
