package com.laptrinhjavaweb.model.page;

import com.laptrinhjavaweb.model.response.TurnoverResponse;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class HomePage {
    long totalUser;
    long totalProductSize;
    long totalOrder;
    TurnoverResponse turnoverResponse;
    long totalTotalOrderByDay;
}

