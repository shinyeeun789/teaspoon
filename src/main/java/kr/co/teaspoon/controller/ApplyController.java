package kr.co.teaspoon.controller;

import kr.co.teaspoon.dto.Apply;
import kr.co.teaspoon.service.ApplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/apply/*")
public class ApplyController {

    @Autowired
    private ApplyService applyService;

    @RequestMapping(value="insert.do", method= RequestMethod.POST)
    public ModelAndView applyInsert(HttpServletRequest request, Model model) throws Exception {
        HttpSession session = request.getSession();
        int eno = Integer.parseInt(request.getParameter("eno"));


        Apply apply = new Apply();
        apply.setEno(eno);
        apply.setName(request.getParameter("name"));
        apply.setId((String) session.getAttribute("sid"));
        apply.setTel(request.getParameter("tel"));
        applyService.applyInsert(apply);

        model.addAttribute("eno", request.getParameter("eno"));

        ModelAndView mav = new ModelAndView();
        mav.setView(new RedirectView(request.getContextPath() + "/event/list.do"));
        return mav;
    }

    @GetMapping("delete.do")
    public ModelAndView applyDelete(HttpServletRequest request, Model model) throws Exception {
        int appno = Integer.parseInt(request.getParameter("appno"));
        applyService.applyDelete(appno);

        model.addAttribute("eno", request.getParameter("eno"));

        ModelAndView mav = new ModelAndView();
        mav.setView(new RedirectView(request.getContextPath() + "/member/eventMypage.do"));
        return mav;
    }
}
