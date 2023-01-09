package java;
import java.util.*;

public class SignUpRequests_027 {

  public static void main(String[] args) {
    var sc = new Scanner(System.in);
    var N = sc.nextInt();
    Map<String, Integer> map = new HashMap<>();
    for (int i = 1; i <= N; i++) {
      var s = sc.next();
      if (map.containsKey(s)) continue;
      map.put(s, i);
    }
    map.entrySet().stream().map(e -> e.getValue()).sorted().forEach(System.out::println);
  }
}
