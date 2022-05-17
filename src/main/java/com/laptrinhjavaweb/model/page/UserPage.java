package com.laptrinhjavaweb.model.page;

import com.laptrinhjavaweb.model.PagingModel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserPage {
    PagingModel pagingModel;
    List users;
    List roles;
}
