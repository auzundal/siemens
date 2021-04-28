package nsp.page;

import io.qameta.allure.Step;
import nsp.base.BasePage;
import nsp.constants.Constants.*;
import nsp.constants.Constants.LoginPage.*;
import nsp.util.DriverUtil;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;

public class LoginPage extends BasePage {

    public LoginPage(WebDriver driver) {
        super(driver);
    }

    @Step
    public void navigateToLogin() {
        getDriver().get(DriverUtil.getBaseUrl());
        takeScreenShot("Address is visited...");
    }

    public void login(String username, String password) {
        clickAndWrite(usernameTextbox, username);
        clickAndWrite(passwordTextbox, password);
        //waitUntilClickableByLocator(loginButton);
        click(loginButton);
        takeScreenShot("login");
    }

    public boolean checkLoginWithWrongCrediantialsToast() {
        waitUntilVisibleByLocator(loginPageErrorMessageToast);
        takeScreenShot("checkLoginWithWrongCrediantialsToast");
        return isElementExists(loginPageErrorMessageToast);
    }
}