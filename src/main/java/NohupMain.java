import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.concurrent.TimeUnit;

public class NohupMain {

    public static void main(String[] args) throws InterruptedException {
        SimpleDateFormat format = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
        for (; ; ) {
            System.out.println("System.out: " + format.format(new Date()));
            System.err.println("System.err: " + format.format(new Date()));
            TimeUnit.SECONDS.sleep(1);
        }
    }

}
