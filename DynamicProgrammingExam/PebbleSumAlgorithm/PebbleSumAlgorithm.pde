public class PebbleSumAlgorithm {

    // 4가지 패턴 정의 (3행 기준)
    // p=1: 선택 없음 (0, 0, 0)
    // p=2: 맨 위 행 선택 (1, 0, 0)
    // p=3: 중간 행 선택 (0, 1, 0)
    // p=4: 맨 아래 행 선택 (0, 0, 1)
    static int[][] patterns = {
        {0, 0, 0}, // 패턴 1
        {1, 0, 0}, // 패턴 2
        {0, 1, 0}, // 패턴 3
        {0, 0, 1}  // 패턴 4
    };

    public static void main(String[] args) {
        // 예시 가치 테이블 (3행 x n열)
        int[][] w = {
            {6,  7, 12, -5},
            {-8, 10, 14,  0},
            {7,  9, -3,  8}
        };
        
        int n = w[0].length; // 열의 개수
        int result = pebbleSum(n, w);
        System.out.println("최대 조약돌 가치 합: " + result);
    }

    // 특정 열(col)에서 패턴 p를 선택했을 때의 조약돌 가치 총합 계산
    static int getPatternWeight(int[][] w, int col, int p) {
        int sum = 0;
        for (int row = 0; row < 3; row++) {
            if (patterns[p - 1][row] == 1) {
                sum += w[row][col];
            }
        }
        return sum;
    }

    // 패턴 p와 패턴 q가 양립할 수 있는지 검사 (가로로 인접한 행에 조약돌이 겹치는지 확인)
    static boolean isCompatible(int p, int q) {
        int[] patP = patterns[p - 1];
        int[] patQ = patterns[q - 1];
        
        for (int row = 0; row < 3; row++) {
            // 같은 행에 동시에 조약돌이 놓이면 양립 불가
            if (patP[row] == 1 && patQ[row] == 1) {
                return false;
            }
        }
        return true;
    }

    // 작성하신 의사코드를 기반으로 한 다이나믹 프로그래밍 함수
    public static int pebbleSum(int n, int[][] w) {
        // peb[i][p]: i번째 열에 패턴 p를 놓았을 때의 최대 가치 합
        // (1부터 n까지 사용하므로 크기는 n+1, 5)
        int[][] peb = new int[n + 1][5];

        // 1단계: 첫 번째 열 초기화 (for p ← 1 to 4)
        for (int p = 1; p <= 4; p++) {
            peb[1][p] = getPatternWeight(w, 0, p);
        }

        // 2단계: 2열부터 n열까지 순회 (for i ← 2 to n)
        for (int i = 2; i <= n; i++) {
            for (int p = 1; p <= 4; p++) {
                int maxPrev = Integer.MIN_VALUE;
                
                // 이전 열(i-1)의 패턴 q 중 패턴 p와 양립하는 것들 중 최댓값 찾기
                for (int q = 1; q <= 4; q++) {
                    if (isCompatible(p, q)) {
                        if (peb[i - 1][q] > maxPrev) {
                            maxPrev = peb[i - 1][q];
                        }
                    }
                }
                
                // 현재 열의 패턴 가치 + 이전 열의 최대 양립 가치
                peb[i][p] = getPatternWeight(w, i - 1, p) + maxPrev;
            }
        }

        // 3단계: n번째 열의 4가지 패턴 중 최댓값 반환 (return max_{p=1,2,3,4} {peb[n, p]})
        int maxTotal = Integer.MIN_VALUE;
        for (int p = 1; p <= 4; p++) {
            if (peb[n][p] > maxTotal) {
                maxTotal = peb[n][p];
            }
        }

        return maxTotal;
    }
}
