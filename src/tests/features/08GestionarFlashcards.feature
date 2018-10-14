#Author: Sergio Perez Sanchez

Feature: Crear una Coleccion de Flashcards

Scenario: Usuario crea una coleccion
Given Una usuario logueado
When No existe una coleccion
Then Crea la coleccion