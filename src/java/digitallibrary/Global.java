package digitallibrary;

import java.net.HttpURLConnection;
import java.net.URL;

/**
 * Created with IntelliJ IDEA.
 * User: sachin
 * Date: 9/5/13
 * Time: 2:01 PM
 * To change this template use File | Settings | File Templates.
 */



public class Global {

    public static String ebookURL = "http://dev.sopac.org.fj/ebook/";
    public static String thumbURL = "http://dev.sopac.org.fj/thumb/";
    public static String path = "/opt/dl/";


    public static boolean exists(String targetUrl) {
        HttpURLConnection.setFollowRedirects(false);
        //HttpURLConnection.setInstanceFollowRedirects(false)
        HttpURLConnection httpUrlConn;
        try {
            httpUrlConn = (HttpURLConnection) new URL(targetUrl).openConnection();

            // A HEAD request is just like a GET request, except that it asks
            // the server to return the response headers only, and not the
            // actual resource (i.e. no message body).
            // This is useful to check characteristics of a resource without
            // actually downloading it,thus saving bandwidth. Use HEAD when
            // you don't actually need a file's contents.
            httpUrlConn.setRequestMethod("HEAD");

            // Set timeouts in milliseconds
            httpUrlConn.setConnectTimeout(30000);
            httpUrlConn.setReadTimeout(30000);

            // Print HTTP status code/message for your information.
            //System.out.println("Response Code: "  + httpUrlConn.getResponseCode());
            //System.out.println("Response Message: " + httpUrlConn.getResponseMessage());

            return (httpUrlConn.getResponseCode() == HttpURLConnection.HTTP_OK);
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
            return false;
        }
    }

}
