package test.java.flashcards.runner;

import org.junit.runner.RunWith;

import cucumber.api.CucumberOptions;
import cucumber.api.junit.Cucumber;

@RunWith(Cucumber.class)
@CucumberOptions(features="src/test/java/flashcards/features",glue="test/java/flashcards/stepDefinitions",
				 format= {"pretty","html:src/test/java/flashcards/resultTest/Sprint4"})

public class TestRunner {}