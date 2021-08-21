package com.mulcam.project.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.mulcam.project.service.ChatService;
import com.mulcam.project.vo.ChatVO;

@Controller
public class ChatControllerImpl implements ChatController {



  @Autowired
  ChatService chatService;

  @Override
  @GetMapping("/chore-chat")
  public String chatRoom() {
    return "chore-chat";
  }

  @Override
  @PostMapping("/chatList")
  public void chatList(@RequestParam("listType") String listType, HttpServletResponse response)
      throws IOException {
    response.setCharacterEncoding("UTF-8");
    response.setContentType("text/html;charset=UTF-8");
    PrintWriter out = response.getWriter();

    ArrayList<ChatVO> chatList = new ArrayList<ChatVO>();
    System.out.println("WebControllerImpl chatRoom Start");

    Calendar cal = Calendar.getInstance();
    Date currentTime = new Date();
    cal.setTime(currentTime);
    cal.add(Calendar.HOUR, +9 - 24);

    Date chatTime = new Date(cal.getTimeInMillis()); // Date(long date)
    System.out.println("chatTime" + chatTime);

    if (listType == null || listType.equals("")) {
      out.append("");
    } else if (listType.equals("today")) {

      try {
        chatList = chatService.getChatList(chatTime);

        System.out.println("WebControllerImpl service return size :: " + chatList.size());


        for (ChatVO chat : chatList) {
          System.out.println("chatRoom List");
          System.out.println(chat.getChatId());
          System.out.println(chat.getChatName());
          System.out.println(chat.getChatContent());
          System.out.println(chat.getChatTime());
        }

        StringBuffer result = new StringBuffer("");
        result.append("{\"result\":[");
        for (int i = 0; i < chatList.size(); i++) {
          result.append("[{\"value\": \"" + chatList.get(i).getChatName() + "\"},");
          result.append("{\"value\": \"" + chatList.get(i).getChatContent() + "\"},");
          result.append("{\"value\": \"" + chatList.get(i).getChatTime() + "\"}]");
          if (i != chatList.size() - 1)
            result.append(",");
        }
        result.append("]}");
        out.append(result.toString());
        out.flush();
        out.close();


      } catch (Exception e) {
        e.printStackTrace();
        out.append("error");
        out.flush();
        out.close();
      }
    } // today
  }


  @Override
  @PostMapping("/submitChat")
  public ModelAndView submitChat(@ModelAttribute ChatVO chat, HttpServletResponse response)
      throws IOException {
    ModelAndView mv = new ModelAndView();
    PrintWriter out = response.getWriter();
    System.out.println("chatController : " + chat.getChatName());
    System.out.println("chatController : " + chat.getChatContent());
    try {
      if (chat.getChatName() == null || chat.getChatName().equals("")
          || chat.getChatContent() == null || chat.getChatContent().equals("")) {
        out.append("0");
      } else {
        out.append(chatService.submitChat(chat.getChatName(), chat.getChatContent()) + "");

      }
      out.flush();
      out.close();
      mv.setViewName("chatroom");
    } catch (Exception e) {
      e.printStackTrace();
      out.append(e.getMessage());
      out.flush();
      out.close();
      mv.setViewName("error");
    }
    return mv;
  }

  @Override
  @PostMapping("/recentChatList")
  public void recentChatList(@RequestParam("num") int num, HttpServletResponse response)
      throws IOException {
    response.setCharacterEncoding("UTF-8");
    response.setContentType("text/html;charset=UTF-8");
    PrintWriter out = response.getWriter();

    ArrayList<ChatVO> chatList = new ArrayList<ChatVO>();
    System.out.println("WebControllerImpl recentChatList Start");


    try {
      chatList = chatService.getRecentChatList(num);

      System.out.println("WebControllerImpl service return size :: " + chatList.size());


      for (ChatVO chat : chatList) {
        System.out.println("recentChatList List");

        System.out.println(chat.getChatName());
        System.out.println(chat.getChatContent());
        System.out.println(chat.getChatTime());
      }

      StringBuffer result = new StringBuffer("");
      result.append("{\"result\":[");
      for (int i = 0; i < chatList.size(); i++) {
        result.append("[{\"value\": \"" + chatList.get(i).getChatName() + "\"},");
        result.append("{\"value\": \"" + chatList.get(i).getChatContent() + "\"},");
        result.append("{\"value\": \"" + chatList.get(i).getChatTime() + "\"}]");
        if (i != chatList.size() - 1)
          result.append(",");
      }
      result.append("], \"last\":\"" + chatList.get(chatList.size() - 1).getChatId() + "\"}");
      out.append(result.toString());
      out.flush();
      out.close();


    } catch (Exception e) {
      e.printStackTrace();
      out.append("error");
      out.flush();
      out.close();
    }
  }

  @Override
  @PostMapping("/realtimeChatList")
  public void realtimeChatList(@RequestParam("chatId") int chatId, HttpServletResponse response)
      throws IOException {
    response.setCharacterEncoding("UTF-8");
    response.setContentType("text/html;charset=UTF-8");
    PrintWriter out = response.getWriter();

    ArrayList<ChatVO> chatList = new ArrayList<ChatVO>();
    System.out.println("WebControllerImpl recentChatList Start");


    try {
      chatList = chatService.getRecentChatListById(chatId);

      System.out.println("WebControllerImpl service return size :: " + chatList.size());


      for (ChatVO chat : chatList) {
        System.out.println("realtimeChatList List");

        System.out.println(chat.getChatName());
        System.out.println(chat.getChatContent());
        System.out.println(chat.getChatTime());
      }

      StringBuffer result = new StringBuffer("");
      result.append("{\"result\":[");
      for (int i = 0; i < chatList.size(); i++) {
        result.append("[{\"value\": \"" + chatList.get(i).getChatName() + "\"},");
        result.append("{\"value\": \"" + chatList.get(i).getChatContent() + "\"},");
        result.append("{\"value\": \"" + chatList.get(i).getChatTime() + "\"}]");
        if (i != chatList.size() - 1)
          result.append(",");
      }
      if (chatList.size() > 0) {
        result.append("], \"last\":\"" + chatList.get(chatList.size() - 1).getChatId() + "\"}");
      }
      out.append(result.toString());
      out.close();
    } catch (Exception e) {
      e.printStackTrace();
      out.append("error");
      out.close();
    }
  }
}
