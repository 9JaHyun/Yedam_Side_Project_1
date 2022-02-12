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
                case 2:
                    result[1]++;
                case 3:
                    result[2]++;
                case 4:
                    result[3]++;
                case 5:
                    result[4]++;
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
