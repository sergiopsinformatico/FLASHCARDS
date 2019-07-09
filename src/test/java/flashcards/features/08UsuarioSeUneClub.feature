#Author: Sergio Perez Sanchez

Feature: Un usuario se une a un club

Scenario: Un usuario se une a un club
Given Un usuario encuentra un club
When Solicita unirse
Then Forma parte de este club