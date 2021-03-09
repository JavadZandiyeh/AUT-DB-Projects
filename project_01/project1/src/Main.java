import redis.clients.jedis.Jedis;

import java.io.File;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        try {
            Jedis jedis = new Jedis("localhost");

            Scanner csv_scanner = new Scanner(new File(".\\NYSE_20210301.csv"));
            String[] row;
            while (csv_scanner.hasNext()){
                row = csv_scanner.next().split(",");
                jedis.set(row[0], row[1]);
            }

            Scanner scanner = new Scanner(System.in);
            while (true){
                String input_command = scanner.nextLine();
                String[] in_array = input_command.split(" ");
                String command = in_array[0];
                String key = in_array[1];
                switch (command){
                    case "create": {
                        if (jedis.get(key) == null){
                            jedis.set(key, in_array[2]);
                            System.out.println("true");
                        }else System.out.println("false");
                        break;
                    }
                    case "fetch": {
                        String value = jedis.get(key);
                        if (value == null)
                            System.out.println("false");
                        else System.out.println("true\n" + value);
                        break;
                    }
                    case "update": {
                        if (jedis.get(key) != null) {
                            jedis.set(key, in_array[2]);
                            System.out.println("true");
                        }
                        else System.out.println("false");
                        break;
                    }
                    case "delete": {
                        if (jedis.get(key) != null){
                            jedis.del(key);
                            System.out.println("true");
                        }else System.out.println("false");
                        break;
                    }
                }
                System.out.println();
            }
        }catch (Exception ex){
            ex.printStackTrace();
        }
    }
}