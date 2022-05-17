package com.laptrinhjavaweb.model.page;

import com.laptrinhjavaweb.model.PagingModel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductPage {
    PagingModel pagingModel;
    List productSizes;
    List sizes;
    List categories;
}
