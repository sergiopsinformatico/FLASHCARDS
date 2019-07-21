#Author: Sergio Perez Sanchez

Feature: Moderador consulta colecciones sin evaluar

Scenario: Moderador consulta colecciones sin evaluar
Given Un moderador consulta las colecciones
When Busca
Then Se lista todas sin evaluar