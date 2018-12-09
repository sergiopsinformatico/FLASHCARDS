package test.java.runners;

import org.junit.runner.RunWith;

import cucumber.api.CucumberOptions;
import cucumber.api.junit.Cucumber;

@RunWith(Cucumber.class)
@CucumberOptions(features = "src/test/resources/features", glue ="test/java/stepDefinitions", plugin = {"pretty"})

public class TestRunner {

}
