#Author: Sergio Perez Sanchez

Feature: Usuario busca colecciones Flashcards

Scenario: Un usuario busca colecciones Flashcards
Given Un usuario quiere visualizar una coleccion
When Lista las colecciones en el buscador
Then Encuentra la coleccion buscada