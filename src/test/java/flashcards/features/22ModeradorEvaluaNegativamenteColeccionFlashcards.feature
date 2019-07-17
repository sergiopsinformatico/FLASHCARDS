#Author: Sergio Perez Sanchez

Feature: Moderador evalua negativamente la coleccion

Scenario: Moderador evalua negativamente la coleccion
Given El moderador analiza la coleccion
When Lo valora negativamente
Then La coleccion se elimina por no cumplir los requisitos