package common;

import domain.review.vo.ReviewVO;
import java.util.List;

public class RatingCalcUtils {
    public int[] distributeRating(List<ReviewVO> list) {
        int[] result = new int[5];
        for (ReviewVO reviewVO : list) {
            switch (reviewVO.getRating()) {
                case 1:
                    result[0]++;
                    break;
                case 2:
                    result[1]++;
                    break;
                case 3:
                    result[2]++;
                    break;
                case 4:
                    result[3]++;
                    break;
                case 5:
                    result[4]++;
                    break;
            }
        }
        return result;
    }

    public double calculateAverage(List<ReviewVO> list) {
        return Math.round(list.stream().mapToInt(ReviewVO::getRating)
            .average().orElseGet(() -> {
                return 0;
            }) * 10) / 10.0;
    }

}
