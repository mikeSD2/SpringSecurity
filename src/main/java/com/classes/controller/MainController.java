package com.classes.controller;
import java.security.Principal;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class MainController {  
    
  @GetMapping("/loginFormPage") //этот адресс мы указывали в конфигурации security. 
  //этот адрес будет у нас в url в браузере на нашей кастомной странице авторизации
  public String FormPage() {  
      return "loginFormPage";  //кастомная страница авторизации в папке jsp которую мы создали
  }  
  
  @GetMapping("/403") //при ошибке 403 будет показываться созданная нами страница 403.jsp. 
  //адресс /403 мы указывали в конфигурации security.  
  public ModelAndView accesssDenied(Principal user) { //в этом обработчике мы можем обработать и отправить какие-то данные на страницу 403.jsp
	  //ModelAndView - как Model только можем еще указать страницу на которую хотим перейти и отправить данные. 
	  //Principal user - здесь храняться данные авторизированного пользователя там имя, роль и т.д.
	  ModelAndView model = new ModelAndView();
	  model.setViewName("403");
	  return model; 
  } 
  
  @GetMapping("/")  
  public String home() {  
      return "homePage";  
  }  
    
  @GetMapping("/admin")  
  public String privateHome() {  
      return "adminPage";  
  }  
} 