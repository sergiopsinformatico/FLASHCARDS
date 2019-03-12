#Author: Sergio Perez Sanchez

Feature: Usuario busca a otros usuarios

Scenario: Usuario busca a otros usuarios
Given Un usuario conectado
When Lista a los usuarios
Then Encuentra a otros usuarios