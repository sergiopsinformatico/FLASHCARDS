#Author: Sergio Perez Sanchez

@tag
Feature: Crear Usuario

  @tag1
  Scenario: Registrar un usuario exitosamente
    Given Una persona quiere registrarse
    When Introduce los datos
    Then Se registra correctamente

  @tag2
  Scenario Outline: Existe email
    Given Una persona desea registrarse
    When Introduce un email existente
    Then No puede registrarse
    
    @tag3
  Scenario Outline: Existe nombre de usuario
    Given Una persona va a registrarse
    When Introduce un nombre de usuario existente
    Then La cuenta no se crea
    
    @tag4
  Scenario Outline: La password no cumple con los requisitos
    Given Un usuario quiere registrarse
    When La clave no cumple los requisitos
    Then No se crea la cuenta