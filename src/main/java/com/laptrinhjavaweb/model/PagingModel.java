package com.laptrinhjavaweb.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PagingModel {
    Integer page;
    Integer limit;
    Integer totalItem;
    Integer totalPage;
    String categoryCode;
    String sortByPrice;
}
