package com.laptrinhjavaweb.controller.admin;

import com.laptrinhjavaweb.model.PagingModel;
import com.laptrinhjavaweb.model.page.ProductPage;
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

@Controller(value="productControllerOfAdmin")
public class ProductController {

    @Autowired
    private RestTemplate restTemplate;

    @RequestMapping(value = "/quan-tri/danh-sach-san-pham", method = RequestMethod.GET)
    public ModelAndView getProductSizes(@RequestParam(required = false) Map<String, String> params) {
        ModelAndView mav = new ModelAndView("admin/product/products");

        ProductPage productPage = new ProductPage();
        PagingModel pagingModel = new PagingModel();
        pagingModel.setPage(Integer.parseInt(params.get("trang")));
        pagingModel.setLimit(Integer.parseInt(params.get("soSanPham")));
        pagingModel.setTotalItem(Integer.parseInt(restTemplate.getForObject("/api/productsize/count",Long.class).toString()));
        pagingModel.setTotalPage((int) Math.ceil((double) pagingModel.getTotalItem() / pagingModel.getLimit()));
        productPage.setPagingModel(pagingModel);
        productPage.setProductSizes(restTemplate.getForObject("/api/productsizes?trang={trang}&soSanPham={soSanPham}", List.class, params));
        productPage.setSizes(restTemplate.getForObject("/api/sizes", List.class));
        productPage.setCategories(restTemplate.getForObject("/api/categories", List.class));
        mav.addObject("productPage", productPage);
        return mav;
    }

    @RequestMapping(value = "/quan-tri/them-san-pham", method = RequestMethod.GET)
    public ModelAndView addProduct() {
        ModelAndView mav = new ModelAndView("admin/product/add-product");
        ProductPage productPage = new ProductPage();
        productPage.setSizes(restTemplate.getForObject("/api/sizes", List.class));
        productPage.setCategories(restTemplate.getForObject("/api/categories", List.class));
        mav.addObject("productPage", productPage);
        return mav;
    }
}
