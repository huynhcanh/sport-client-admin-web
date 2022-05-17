package com.laptrinhjavaweb.controller.admin;

import com.laptrinhjavaweb.model.PagingModel;
import com.laptrinhjavaweb.model.page.UserPage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

@Controller(value="userControllerOfAdmin")
public class UserController {

    @Autowired
    private RestTemplate restTemplate;

    @RequestMapping(value = "/quan-tri/danh-sach-nguoi-dung", method = RequestMethod.GET)
    public ModelAndView getUsers(@RequestParam(required = false) Map<String, String> params) {
        ModelAndView mav = new ModelAndView("admin/user/users");
        UserPage userPage = new UserPage();
            PagingModel pagingModel = new PagingModel();
                pagingModel.setPage(Integer.parseInt(params.get("trang")));
                pagingModel.setLimit(Integer.parseInt(params.get("soNguoiDung")));
                pagingModel.setTotalItem(Integer.parseInt(restTemplate.getForObject("/api/user/count",Long.class).toString()));
                pagingModel.setTotalPage((int) Math.ceil((double) pagingModel.getTotalItem() / pagingModel.getLimit()));
            userPage.setPagingModel(pagingModel);
            userPage.setUsers(restTemplate.getForObject("/api/users?trang={trang}&soNguoiDung={soNguoiDung}", List.class, params));
            userPage.setRoles(restTemplate.getForObject("/api/roles", List.class));
        mav.addObject("userPage", userPage);
        return mav;
    }

    @RequestMapping(value = "/quan-tri/them-nguoi-dung", method = RequestMethod.GET)
    public ModelAndView addUser() {
        ModelAndView mav = new ModelAndView("admin/user/add-user");
        UserPage userPage = new UserPage();
        userPage.setRoles(restTemplate.getForObject("/api/roles", List.class));
        mav.addObject("userPage", userPage);
        return mav;
    }
}
