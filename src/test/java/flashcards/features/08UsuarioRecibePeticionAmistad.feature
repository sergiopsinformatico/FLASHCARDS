#Author: Sergio Perez Sanchez

Feature: Un usuario recibe una petición de amistad

Scenario: Usuario acepta una peticion de amistad
Given Un usuario recibe una petición de amistad
When La acepta
Then Son amigos

Scenario: Usuario rechaza una peticion de amistad
Given Un usuario recibe la petición de amistad
When La rechaza
Then No son amigos