package interChanger;

import interChanger.gifMaker.AnimatedGifEncoder;
import javax.imageio.ImageIO;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.Arrays;

public class GifEncoder {

    public static void main(String[] args) throws IOException {
        FileOutputStream fos;
        fos = new FileOutputStream("myResult.gif");
        ByteArrayOutputStream bos = new ByteArrayOutputStream();
        AnimatedGifEncoder encoder = new AnimatedGifEncoder();
        System.out.println((Paths.get(".")).toAbsolutePath());
        encoder.start(bos);

        /**Set your path here*/
        final File folder = new File("clay");

         File[] list = folder.listFiles();
        assert list != null;
        Arrays.sort(list, (f1, f2) -> {
            int fn1 = Integer.parseInt(f1.getName().replaceAll("\\D",""));
            int fn2 = Integer.parseInt(f2.getName().replaceAll("\\D",""));
            return Long.compare(fn1, fn2);
        });

        for(int i = 0; i < list.length; i++)
        {
            encoder.addFrame(ImageIO.read(list[i]));
        }
//        encoder.addFrame(ImageIO.read(new File("errored/test2.jpg")));
        encoder.finish();
        bos.writeTo(fos);
    }


}
