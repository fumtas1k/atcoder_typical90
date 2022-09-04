# [競プロ典型 90問](https://atcoder.jp/contests/typical90)

atcoderの典型90問の解法集.

## 各論

| 問題文 | アルゴリズム等 | ruby解 | java解 | 解説 |
|-|-|-|-|-|
| [001 - Yokan Party（★4）](https://atcoder.jp/contests/typical90/tasks/typical90_a) | 貪欲法, 二分探索法 | [ruby](001_YokanParty.rb) | [java](001_YokanParty.java) | [解説](https://twitter.com/e869120/status/1377027868518064129/photo/1) |
| [002 - Encyclopedia of Parentheses（★3）](https://atcoder.jp/contests/typical90/tasks/typical90_b) | bit全探索 | [ruby](002_EncyclopediaOfParentheses.rb) |  | [解説](https://twitter.com/e869120/status/1377391097836544001/photo/1) |
| [003 - Longest Circular Road（★4）](https://atcoder.jp/contests/typical90/tasks/typical90_c) | 木の直径 | [ruby1](003-01_LongestCircularRoad.rb), [ruby2](003-02_LongestCircularRoad.rb) |  | [解説](https://twitter.com/e869120/status/1377752658149175299/photo/1) |
| [004 - Cross Sum（★2）](https://atcoder.jp/contests/typical90/tasks/typical90_d) |包除原理 | [ruby](004_CrossSum.rb) |  | [解説](https://twitter.com/e869120/status/1378115289649348611/photo/1) |
|005|桁DP法, ダブリング||||
| [006 - Smallest Subsequence（★5）](https://atcoder.jp/contests/typical90/tasks/typical90_f) | 貪欲法 | [ruby1](006-01_SmallestSubsequence.rb), [ruby2](006-02_SmallestSubsequence.rb) |  | [解説](https://twitter.com/e869120/status/1379202843622576130/photo/1) |
| [007 - CP Classes（★3）](https://atcoder.jp/contests/typical90/tasks/typical90_g) | 二分探索法 | [ruby](007_CPClasses.rb) |  | [解説](https://twitter.com/e869120/status/1379565222541680644/photo/1) |
| [008 - AtCounter（★4）](https://atcoder.jp/contests/typical90/tasks/typical90_h) | 状態DP法 | [ruby](008_AtCounter.rb) |  | [解説](https://twitter.com/e869120/status/1379927227739987972/photo/1) |
| 009 |二分探索法, 偏角ソート, 真ん中決め打ち||||
| [010 - Score Sum Queries（★2）](https://atcoder.jp/contests/typical90/tasks/typical90_j) | 累積和 | [ruby](010_ScoreSumQueries.rb) |  | [解説](https://twitter.com/e869120/status/1380652465834532865) |
| [011 - Gravy Jobs（★6）](https://atcoder.jp/contests/typical90/tasks/typical90_k) | DP法, 締め切りが早い順 | [ruby](011_GravyJobs.rb) |  | [解説](https://github.com/E869120/kyopro_educational_90/blob/main/sol/011-03.cpp) |
| [012 - Red Painting（★4）](https://atcoder.jp/contests/typical90/tasks/typical90_l) |Union-Find| [ruby](012_RedPainting.rb) |  | [解説](https://twitter.com/e869120/status/1381739128291614720) |
| [013 - Passing（★5）](https://atcoder.jp/contests/typical90/tasks/typical90_m) | ダイクストラ法 | [ruby](013_Passing.rb) |  | [解説](https://twitter.com/e869120/status/1382101716066127872) |
| [014 - We Used to Sing a Song Together（★3）](https://atcoder.jp/contests/typical90/tasks/typical90_n) | ソート, 貪欲法 | [ruby](014_WeUsedToSingASongTogether.rb) |  | [解説](https://twitter.com/e869120/status/1382478816627478530) |
| [015 - Don't be too close（★6）](https://atcoder.jp/contests/typical90/tasks/typical90_o) | 調和級数, 逆元, フェルマーの小定理 | [ruby](015_DontBeTooClose.rb) |  | [解説](https://twitter.com/e869120/status/1382827276673306624) |
| [016 - Minimum Coins（★3）](https://atcoder.jp/contests/typical90/tasks/typical90_p) | 工夫した全探索 | [ruby](016_MinimumCoins.rb) |  | [解説](https://twitter.com/e869120/status/1383189464650981378/photo/1) |
| 017 |余事象, bit全探索||||
| [018 - Statue of Chokudai（★3）](https://atcoder.jp/contests/typical90/tasks/typical90_r) | 三角関数 | [ruby](018_StatueOfChokudai.rb) |  | [解説](https://twitter.com/e869120/status/1384276005330690049) |
| [019 - Pick Two（★6）](https://atcoder.jp/contests/typical90/tasks/typical90_s) | 区間DP法 | [ruby](019_PickTwo.rb) |  | [解説](https://twitter.com/e869120/status/1384638694162780166) |
| [020 - Log Inequality（★3）](https://atcoder.jp/contests/typical90/tasks/typical90_t) | 整数 | [ruby](020_LogInequality.rb) |  | [解説](https://twitter.com/e869120/status/1385001057512693762) |
| [021 - Come Back in One Piece（★5）](https://atcoder.jp/contests/typical90/tasks/typical90_u) | 強連結成分分解 | [ruby](021_ComeBackInOnePiece.rb) |  | [解説](https://twitter.com/e869120/status/1385363292739104775) |
| [022 - Cubic Cake（★2）](https://atcoder.jp/contests/typical90/tasks/typical90_v) | ユークリッド互除法 | [ruby1](022-01_CubicCake.rb), [ruby2](022-02_CubicCake.rb) |  | [解説](https://twitter.com/e869120/status/1385725481920520193) |
| 023 |bit全探索, bitDP法 ||||
| [024 - Select +／- One（★2）](https://atcoder.jp/contests/typical90/tasks/typical90_x) | パリティ | [ruby](024_Select+／-One.rb) |  | [解説](https://twitter.com/e869120/status/1386814047081746432) |
| [025 - Digit Product Equation（★7）](https://atcoder.jp/contests/typical90/tasks/typical90_y) | 再帰関数 | [ruby](025_DigitProductEquation.rb) |  | [解説](https://twitter.com/e869120/status/1387175538544975872) |
| [026 - Independent Set on a Tree（★4）](https://atcoder.jp/contests/typical90/tasks/typical90_z) | 二部グラフ, 再帰関数 | [ruby](026_IndependentSetOnATree.rb) |  | [解説](https://twitter.com/e869120/status/1387538790017769474) |
| [027 - Sign Up Requests （★2）](https://atcoder.jp/contests/typical90/tasks/typical90_aa) | Hash(Set) | [ruby](027_SignUpRequests.rb) |  | [解説](https://twitter.com/e869120/status/1387901052683386880) |
| [028 - Cluttered Paper（★4）](https://atcoder.jp/contests/typical90/tasks/typical90_ab) | いもす法 | [ruby](028_ClutteredPaper.rb) |  | [解説](https://twitter.com/e869120/status/1388262816101007363) |
| 029 | 座標圧縮, セグメント木 ||||
| 030 | エラトステネスの篩 ||||
| 031 |||||
| [032 - AtCoder Ekiden（★3）](https://atcoder.jp/contests/typical90/tasks/typical90_af) | 順列全探索 | [ruby](032_AtCoderEkiden.rb) |  | [解説](https://twitter.com/e869120/status/1390074137192767489) |
| [033 - Not Too Bright（★2）](https://atcoder.jp/contests/typical90/tasks/typical90_ag) | 境界条件 | [ruby](033_NotTooBright.rb) |  | [解説](https://twitter.com/e869120/status/1390436977808351234) |
| [034 - There are few types of elements（★4）](https://atcoder.jp/contests/typical90/tasks/typical90_ah) | 尺取法 | [ruby](034_ThereAreFewTypesOfElements.rb) |  | [解説](https://twitter.com/e869120/status/1390798852299448322) |
| [035 - Preserve Connectivity（★7）](https://atcoder.jp/contests/typical90/tasks/typical90_ai) | 木DP, 最近共通祖先(LCA), 座標圧縮 | [ruby](035_PreserveConnectivity.rb) |  | [解説](https://twitter.com/e869120/status/1391218516129312768) |
| [036 - Max Manhattan Distance（★5）](https://atcoder.jp/contests/typical90/tasks/typical90_aj) | マンハッタン距離 | [ruby](036_MaxManhattanDistance.rb) |  | [解説](https://twitter.com/e869120/status/1391886390091075586) |
| [037 - Don't Leave the Spice（★5）](https://atcoder.jp/contests/typical90/tasks/typical90_ak) | スライド最大値(最小値), DP法, 動的計画法 | [ruby](037_DontLeaveTheSpice.rb) |  | [解説](https://twitter.com/e869120/status/1392248540882116610) |
| [038 - Large LCM（★3）](https://atcoder.jp/contests/typical90/tasks/typical90_al) | ユークリッド互除法 | [ruby](038_LargeLCM.rb) |  | [解説](https://twitter.com/e869120/status/1392612322410057729) |
| [039 - Tree Distance（★5）](https://atcoder.jp/contests/typical90/tasks/typical90_am) | 貢献度, 再帰関数 | [ruby](039_TreeDistance.rb) |  | [解説](https://twitter.com/e869120/status/1392974101061378049) |
| 040 |||||
| 041 |||||
| [042 - Multiple of 9（★4）](https://atcoder.jp/contests/typical90/tasks/typical90_ap) |DP法| [ruby](042_MultipleOf9.rb) |  | [解説](https://twitter.com/e869120/status/1394423616805097477) |
| [043 - Maze Challenge with Lack of Sleep（★4）](https://atcoder.jp/contests/typical90/tasks/typical90_aq) | 拡張BFS | [ruby1](043-01_MazeChallengewithLackofSleep.rb), [ruby2](043-02_MazeChallengewithLackofSleep.rb) |  | [解説](https://twitter.com/e869120/status/1394787605099601923) |
| [044 - Shift and Swapping（★3）](https://atcoder.jp/contests/typical90/tasks/typical90_ar) | 見かけ上の変化をメモ | [ruby](044_ShiftAndSwapping.rb) |  | [解説](https://twitter.com/e869120/status/1395148057730187265) |
| 045 | bitDP法 ||||
| [046 - I Love 46（★3）](https://atcoder.jp/contests/typical90/tasks/typical90_at) | 同じものをまとめる, 剰余 | [ruby](046_ILove46.rb) |  | [解説](https://twitter.com/e869120/status/1395873457259225091) |
| [047 - Monochromatic Diagonal（★7）](https://atcoder.jp/contests/typical90/tasks/typical90_au) ||||
| [048 - I will not drop out（★3）](https://atcoder.jp/contests/typical90/tasks/typical90_av) | 上界(下界)見積り | [ruby](048_IWillNotDropOut.rb) |  | [解説](https://twitter.com/e869120/status/1396960059796582400) |
| [049 - Flip Digits 2（★6）](https://atcoder.jp/contests/typical90/tasks/typical90_aw) | 最小全域木, Union-Find, クラスカル法 | [ruby](049_FlipDigits2.rb) |  | [解説](https://github.com/E869120/kyopro_educational_90/blob/main/sol/049.cpp) |
| [050 - Stair Jump（★3）](https://atcoder.jp/contests/typical90/tasks/typical90_ax) | DP法 |[ruby](050_StairJump.rb) | | [解説](https://twitter.com/e869120/status/1397684795560259586)|
| [051 - Typical Shop（★5）](https://atcoder.jp/contests/typical90/tasks/typical90_ay) | 半分全列挙 |[ruby](051_TypicalShop.rb) |  | [解説](https://twitter.com/e869120/status/1398046858933538819)|
| [052 - Dice Product（★3）](https://atcoder.jp/contests/typical90/tasks/typical90_az) | 因数分解 | [ruby](052_DiceProduct.rb) |  | [解説](https://twitter.com/e869120/status/1398409831044632576) |
| 053 |||||
| [054 - Takahashi Number（★6）](https://atcoder.jp/contests/typical90/tasks/typical90_bb) | 最短経路問題, 幅優先探索, グラフの辺数削減, エルデシュ数　| [ruby](054_TakahashiNumber.rb) |  | [解説](https://twitter.com/e869120/status/1399496993014116352) |
| [055 - Select 5（★2）](https://atcoder.jp/contests/typical90/tasks/typical90_bc) | 定数倍 | [ruby](055_Select5.rb) |  | [解説](https://twitter.com/e869120/status/1399859200046505984) |
| [056 - Lucky Bag（★5）](https://atcoder.jp/contests/typical90/tasks/typical90_bd) | 動的計画法, DP法, DP復元 | [ruby](056_LuckyBag.rb) |  | [解説](https://twitter.com/e869120/status/1400221404109230082) |
| [057 - Flip Flap（★6）](https://atcoder.jp/contests/typical90/tasks/typical90_be) | 掃き出し法 | [ruby](057_FlipFlap.rb) |  |[解説](https://twitter.com/e869120/status/1400584377902399490) |
| [058 - Original Calculator（★4）](https://atcoder.jp/contests/typical90/tasks/typical90_bf) |  | [ruby](058_OriginalCalculator.rb) |  | [解説](https://twitter.com/e869120/status/1400584377902399490) |
| 059 |||||
| [060 - Chimera（★5）](https://atcoder.jp/contests/typical90/tasks/typical90_bh) | 最長増加部分列(LIS), 二分探索法 | [ruby](060_Chimera.rb) |  | [解説](https://twitter.com/e869120/status/1402034055734980608) |
| [061 - Deck（★2）](https://atcoder.jp/contests/typical90/tasks/typical90_bi) | deque | [ruby](061_Deck.rb) |  | [解説](https://twitter.com/e869120/status/1402395219287371779) |
| [062 - Paint All（★6）](https://atcoder.jp/contests/typical90/tasks/typical90_bj) | 幅優先探索, 後ろから考える | [ruby](062_PaintAll.rb) |  | [解説](https://twitter.com/e869120/status/1402758934268571648) |
| [063 - Monochromatic Subgrid（★4）](https://atcoder.jp/contests/typical90/tasks/typical90_bk) | bit全探索 | [ruby](063_MonochromaticSubgrid.rb) |  | [解説](https://twitter.com/e869120/status/1403121388773249024) |
| [064 - Uplift（★3）](https://atcoder.jp/contests/typical90/tasks/typical90_bl) | 階差 | [ruby](064_Uplift.rb) |  | [解説](https://twitter.com/e869120/status/1403483256234799105) |
| 065 |||||
| [066 - Various Arrays（★5）](https://atcoder.jp/contests/typical90/tasks/typical90_bn) | 期待値の線形性 | [ruby](066_VariousArrays.rb) |  | [解説](https://github.com/E869120/kyopro_educational_90/blob/main/sol/066a.cpp) |
| [067 - Base 8 to 9（★2）](https://atcoder.jp/contests/typical90/tasks/typical90_bo) |  | [ruby](067_Base8to9.rb) |  | [解説](https://twitter.com/e869120/status/1404931743820357633) |
| [068 - Paired Information（★5）](https://atcoder.jp/contests/typical90/tasks/typical90_bp) |　クエリ先読み, Union-Find | [ruby](068_PairedInformation.rb) |  | [解説]() |
| [069 - Colorful Blocks 2（★3）](https://atcoder.jp/contests/typical90/tasks/typical90_bq) | 繰り返し2乗法 | [ruby](069_ColorfulBlocks2.rb) |  | [解説](https://twitter.com/e869120/status/1405298187384999938) |
| [070 - Plant Planning（★4）](https://atcoder.jp/contests/typical90/tasks/typical90_br) | マンハッタン距離, 独立で考える | [ruby](070_PlantPlanning.rb) |  | [解説](https://twitter.com/e869120/status/1406020809492090882) |
| 071 |||||
| [072 - Loop Railway Plan（★4）](https://atcoder.jp/contests/typical90/tasks/typical90_bt) | バックトラック, 再帰関数, "何通りか"の感覚 | [ruby](072_LoopRailwayPlan.rb) |  | [解説](https://twitter.com/e869120/status/1407109731546636289) |
| [073 - We Need Both a and b（★5）](https://atcoder.jp/contests/typical90/tasks/typical90_bu) | 木DP, 動的計画法 | [ruby](073_WeNeedBothAandB.rb) |  | [解説](https://github.com/E869120/kyopro_educational_90/blob/main/sol/073.cpp) |
| [074 - ABC String 2（★6）](https://atcoder.jp/contests/typical90/tasks/typical90_bv) | 特殊ケースを考える, 不変量を考える | [ruby](074_ABCString2.rb) |  | [解説](https://twitter.com/e869120/status/1407833847413178372) |
| [075 - Magic For Balls（★3）](https://atcoder.jp/contests/typical90/tasks/typical90_bw) | 素因数分解 | [ruby](075_MagicForBalls.rb) |  | [解説](https://twitter.com/e869120/status/1408195203538690048) |
| [076 - Cake Cut（★3）](https://atcoder.jp/contests/typical90/tasks/typical90_bx) | 円環を列にして二倍にする(累積和), 尺取法 | [ruby](076_CakeCut.rb) |  | [解説](https://github.com/E869120/kyopro_educational_90/blob/main/sol/076.cpp) |
| 077 |||||
| [078 - Easy Graph Problem（★2）](https://atcoder.jp/contests/typical90/tasks/typical90_bz) | グラフの基本 | [ruby](078_EasyGraphProblem.rb) |  | [解説](https://twitter.com/e869120/status/1409644684561944579) |
| [079 - Two by Two（★3）](https://atcoder.jp/contests/typical90/tasks/typical90_ca) | 操作順序によらない | [ruby](079_TwobyTwo.rb) |  | [解説](https://twitter.com/e869120/status/1410007233262276612) |
| [080 - Let's Share Bit（★6）](https://atcoder.jp/contests/typical90/tasks/typical90_cb) | 包除原理, bit全探索 | [ruby](080_LetsShareBit.rb) |  | [解説](https://twitter.com/e869120/status/1410368312760934404) |
| 081 |||||
| [082 - Counting Numbers（★3）](https://atcoder.jp/contests/typical90/tasks/typical90_cd) | 数列の和の公式, 部分問題に分解 | [ruby](082_CountingNumbers.rb) |  | [解説](https://twitter.com/e869120/status/1411094412319330305) |
| 083 |||||
| [084 - There are two types of characters（★3）](https://atcoder.jp/contests/typical90/tasks/typical90_cf) |  | [ruby](084_ThereAreTwoTypesOfCharacters.rb) |  | [解説](https://twitter.com/e869120/status/1412179495868534784) |
| [085 - Multiplication 085（★4）](https://atcoder.jp/contests/typical90/tasks/typical90_cg) | 全件探索, 約数列挙 | [ruby](085_Multiplication085.rb) |  | [解説](https://twitter.com/e869120/status/1412541885160189952) |
| [086 - Snuke's Favorite Arrays（★5](https://atcoder.jp/contests/typical90/tasks/typical90_ch) | bit全探索, bit毎に独立に考える | [ruby](086_Snuke'sFavoriteArrays.rb) |  | [解説](https://twitter.com/e869120/status/1412904274900754441) |
| [087 - Chokudai's Demand（★5）](https://atcoder.jp/contests/typical90/tasks/typical90_ci) | ワーシャルフロイド法, 二分探索法 | [ruby](087_ChokudaisDemand.rb) |  | [解説](https://twitter.com/e869120/status/1413266660862009348) |
| [088 - Similar but Different Ways（★6）](https://atcoder.jp/contests/typical90/tasks/typical90_cj) | 鳩ノ巣原理, DFS | [ruby](088_SimilarButDifferentWays.rb) |  | [解説](https://github.com/E869120/kyopro_educational_90/blob/main/sol/088.cpp) |
