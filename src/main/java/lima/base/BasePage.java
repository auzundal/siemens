package lima.base;

import io.qameta.allure.Allure;
import lima.util.DriverUtil;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import static lima.util.DriverUtil.*;

import org.apache.commons.io.FileUtils;
import org.openqa.selenium.*;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

public class BasePage {

    private WebDriver driver;

    private WebDriverWait wait;

    private Actions actions;


    public BasePage(WebDriver driver) {
        this.driver = driver;
        wait = new WebDriverWait(driver, 10);
        actions = new Actions(driver);
    }

    protected WebDriver getDriver() {
        return driver;
    }

    protected void clickAndWrite(By by, String value) {
        WebElement element = waitUntilVisibleByLocator(by);
        element.click();
        takeScreenShot("Sendkeys");
        element.sendKeys(value);

    }

    protected WebElement waitUntilVisibleByLocator(By locator) {

        return wait.until(ExpectedConditions.visibilityOfElementLocated(locator));
    }

    protected boolean isElementExists(By locator) {
        return getDriver().findElements(locator).size() == 1;
    }

    protected void click(By locator) {
        WebElement element = waitUntilVisibleByLocator(locator);
//        WebElement element = getDriver().findElement(locator);
        takeScreenShot("Click");
        element.click();

    }


    public WebElement hover(By locator) {
        WebElement webElement = waitUntilVisibleByLocator(locator);
        actions.moveToElement(webElement).build().perform();
        return webElement;
    }

    public void clickAfterWaitForElement(By locator) {
        waitUntilVisibleByLocator(locator);
        click(locator);
    }

    public String getText(By locator) {
        return waitUntilVisibleByLocator(locator).getText();
    }


}

