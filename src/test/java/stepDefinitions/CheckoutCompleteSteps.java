package stepDefinitions;

import Utilities.DriverManager;
import io.cucumber.java.en.Then;
import org.junit.Assert;
import pages.CheckoutCompletePage;

public class CheckoutCompleteSteps {
    CheckoutCompletePage checkoutCompletePage = new CheckoutCompletePage(DriverManager.getDriver());

    @Then("I should see a message saying {string}")
    public void verifyCompleteMessage(String message){
        Assert.assertTrue(checkoutCompletePage.verifyCompleteMessage(message));
    }
}
