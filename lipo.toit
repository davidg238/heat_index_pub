// Copyright (c) 2021 Ekorau LLC

// LiPo Reference https://blog.ampow.com/lipo-voltage-chart/

class LiPo:

// capacity table according to reference above for 1S LiPo
    static capacity := [4.2, 4.15, 4.11, 4.08, 4.02, 3.98, 3.95, 3.91, 3.87, 3.85, 3.84, 3.82, 3.80, 3.79, 3.77, 3.75, 3.73, 3.71, 3.69, 3.61, 3.27]
//                %     100    95    90    85    80    75    70    65    60    55    50    45    40    35    30    25    20    15    10     5     0

    static capacityAt v/float -> float:
        if v >= capacity.first: return 100.0
        if v <= capacity.last: return 0.0

        idx := 0
        while capacity[idx] > v: idx++

        hi := capacity[idx-1]
        low := capacity[idx]

        base := 100 - (idx * 5)
        interp := ((v - low)/(hi - low)) * 5
        return base + interp


