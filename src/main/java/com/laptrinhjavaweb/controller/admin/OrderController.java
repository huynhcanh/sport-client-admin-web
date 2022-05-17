package com.laptrinhjavaweb.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller(value="orderControllerOfAdmin")
public class OrderController {
    @RequestMapping(value = "/quan-tri/danh-sach-don-hang", method = RequestMethod.GET)
    public ModelAndView getProducts() {
        ModelAndView mav = new ModelAndView("admin/order/orders");
        return mav;
    }

    @RequestMapping(value = "/quan-tri/them-don-hang", method = RequestMethod.GET)
    public ModelAndView addProduct() {
        ModelAndView mav = new ModelAndView("admin/order/add-order");
        return mav;
    }

}
