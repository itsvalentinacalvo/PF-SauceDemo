package stepDefinitions;

import Utilities.DriverManager;
import io.cucumber.datatable.DataTable;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.junit.Assert;
import pages.CheckoutInformationPage;

import java.util.List;

public class CheckoutInformationSteps {
    CheckoutInformationPage checkoutInformationPage = new CheckoutInformationPage(DriverManager.getDriver());


    @And("I enter my checkout details")
    public void fillCheckoutInformation(DataTable checkoutInformation){
        List<String> data = checkoutInformation.transpose().asList(String.class);
        checkoutInformationPage.setFirstNameTextBox(data.get(0));
        checkoutInformationPage.setLastNameTextBox(data.get(1));
        checkoutInformationPage.setZipCodeTextBox(data.get(2));
    }


    @When("I enter only last name and postal code")
    public void fillOnlyLastNameAndPostalCode(DataTable dataTable) {
        // Deja "First Name" vacío intencionalmente
        List<String> data = dataTable.row(0);
        checkoutInformationPage.setLastNameTextBox(data.get(0));
        checkoutInformationPage.setZipCodeTextBox(data.get(1));
    }


    @When("I enter only first name and last name")
    public void fillOnlyFirstAndLastName(DataTable dataTable) {

        List<String> data = dataTable.row(0);
        checkoutInformationPage.setFirstNameTextBox(data.get(0));
        checkoutInformationPage.setLastNameTextBox(data.get(1));
    }


    @And("I click on the continue button")
    public void clickOnContinue(){
        checkoutInformationPage.clickOnContinueButton();
    }


    @Then("I should see an error message saying {string}")
    public void verifyWrongMessage(String message){
        Assert.assertTrue(checkoutInformationPage.verifyWrongMessage(message));
    }
}
