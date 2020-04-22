package lima.util;

import io.qameta.allure.Allure;
import lima.base.BasePage;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.remote.RemoteWebDriver;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.net.MalformedURLException;
import java.net.URL;

public class DriverUtil {

    public static WebDriver getDriver() {
        return driver;
    }

    private static WebDriver driver;


    public static void setUp() {
        String grid = System.getProperty("grid");
        boolean remote = false;
        if (grid != null) {
            remote = Boolean.parseBoolean(grid);
        }

        ChromeOptions options = new ChromeOptions();
        options.addArguments("start-maximized");

        if (remote) {
            try {
                String gridIP = System.getProperty("gridIP");
                driver = new RemoteWebDriver(new URL("http://"+gridIP+":4444/wd/hub"), options);
            } catch (MalformedURLException e) {
                e.printStackTrace();
            }
        } else {
            System.setProperty("webdriver.chrome.driver", "src/main/resources/webdriver/chromedriver.exe");
            driver = new ChromeDriver(options);
        }

    }

    public static void closeDriver() {
        driver.close();
    }

    public static <T extends BasePage> T createClass(Class<T> clazz) {
        try {
            Constructor<T> constructor = clazz.getConstructor(WebDriver.class);
            return constructor.newInstance(driver);
        } catch (NoSuchMethodException | IllegalAccessException | InstantiationException | InvocationTargetException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static void takeScreenShot(String screenShotName) {
        try {
            TakesScreenshot scrShot = ((TakesScreenshot) getDriver());
            File SrcFile = scrShot.getScreenshotAs(OutputType.FILE);
            InputStream targetStream = new FileInputStream(SrcFile);
            Allure.attachment(screenShotName, targetStream);
        } catch (IOException e) {
            System.out.println(e.getMessage());
        }
    }

}
