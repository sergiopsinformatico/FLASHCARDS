#Author: Sergio Perez Sanchez

Feature: Como usuario quiero ver mi perfil para ver mis datos

Scenario: Ver perfil con username
Given Una persona quiere ver su perfil
When Se logueó con el username
Then Ve el perfil con el username

Scenario: Ver perfil con email
Given Una persona quiere ver su perfil
When Se logueó con el email
Then Ve el perfil con el email