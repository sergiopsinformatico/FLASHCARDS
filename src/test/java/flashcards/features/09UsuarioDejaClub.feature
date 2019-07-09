#Author: Sergio Perez Sanchez

Feature: Usuario deja club

Scenario: Un usuario deja un club
Given Un usuario que pertenece a un club
When Deja el club
Then No pertenece al club