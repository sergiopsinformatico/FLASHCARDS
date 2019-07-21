$(document).ready(function() {var formatter = new CucumberHTML.DOMFormatter($('.cucumber-report'));formatter.uri("01UsuarioCreaCuentaUsuario.feature");
formatter.feature({
  "comments": [
    {
      "line": 1,
      "value": "#Author: Sergio Perez Sanchez"
    }
  ],
  "line": 3,
  "name": "Como usuario quiero una cuenta nueva para acceder al sistema",
  "description": "",
  "id": "como-usuario-quiero-una-cuenta-nueva-para-acceder-al-sistema",
  "keyword": "Feature"
});
formatter.scenario({
  "line": 5,
  "name": "Registro correcto. Registrar un usuario exitosamente",
  "description": "",
  "id": "como-usuario-quiero-una-cuenta-nueva-para-acceder-al-sistema;registro-correcto.-registrar-un-usuario-exitosamente",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 6,
  "name": "Una persona quiere registrarse",
  "keyword": "Given "
});
formatter.step({
  "line": 7,
  "name": "Introduce los datos correctamente",
  "keyword": "When "
});
formatter.step({
  "line": 8,
  "name": "Se registra correctamente",
  "keyword": "Then "
});
formatter.match({
  "location": "Test01UsuarioCreaCuentaUsuario.una_persona_quiere_registrarse()"
});
formatter.result({
  "duration": 5283648296,
  "status": "passed"
});
formatter.match({
  "location": "Test01UsuarioCreaCuentaUsuario.introduce_los_datos_correctamente()"
});
formatter.result({
  "duration": 1595113540,
  "status": "passed"
});
formatter.match({
  "location": "Test01UsuarioCreaCuentaUsuario.se_registra_correctamente()"
});
formatter.result({
  "duration": 583444129,
  "status": "passed"
});
formatter.scenario({
  "line": 10,
  "name": "Error en el Registro. Existe username",
  "description": "",
  "id": "como-usuario-quiero-una-cuenta-nueva-para-acceder-al-sistema;error-en-el-registro.-existe-username",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 11,
  "name": "Una persona quiere registrarse",
  "keyword": "Given "
});
formatter.step({
  "line": 12,
  "name": "Introduce un username existente",
  "keyword": "When "
});
formatter.step({
  "line": 13,
  "name": "No se registra",
  "keyword": "Then "
});
formatter.match({
  "location": "Test01UsuarioCreaCuentaUsuario.una_persona_quiere_registrarse()"
});
formatter.result({
  "duration": 7852506,
  "status": "passed"
});
formatter.match({
  "location": "Test01UsuarioCreaCuentaUsuario.introduce_un_username_existente()"
});
formatter.result({
  "duration": 746042166,
  "status": "passed"
});
formatter.match({
  "location": "Test01UsuarioCreaCuentaUsuario.no_se_registra()"
});
formatter.result({
  "duration": 44194230,
  "status": "passed"
});
formatter.scenario({
  "line": 15,
  "name": "Error en el Registro. Caracter invalido en el username",
  "description": "",
  "id": "como-usuario-quiero-una-cuenta-nueva-para-acceder-al-sistema;error-en-el-registro.-caracter-invalido-en-el-username",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 16,
  "name": "Una persona quiere registrarse",
  "keyword": "Given "
});
formatter.step({
  "line": 17,
  "name": "El username contiene un caracter invalido",
  "keyword": "When "
});
formatter.step({
  "line": 18,
  "name": "No se registra",
  "keyword": "Then "
});
formatter.match({
  "location": "Test01UsuarioCreaCuentaUsuario.una_persona_quiere_registrarse()"
});
formatter.result({
  "duration": 11994297,
  "status": "passed"
});
formatter.match({
  "location": "Test01UsuarioCreaCuentaUsuario.el_username_contiene_un_caracter_invalido()"
});
formatter.result({
  "duration": 51713,
  "status": "passed"
});
formatter.match({
  "location": "Test01UsuarioCreaCuentaUsuario.no_se_registra()"
});
formatter.result({
  "duration": 748732040,
  "status": "passed"
});
formatter.scenario({
  "line": 20,
  "name": "Error en el Registro. Longitud incorrecta del username",
  "description": "",
  "id": "como-usuario-quiero-una-cuenta-nueva-para-acceder-al-sistema;error-en-el-registro.-longitud-incorrecta-del-username",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 21,
  "name": "Una persona quiere registrarse",
  "keyword": "Given "
});
formatter.step({
  "line": 22,
  "name": "La longitud del username es incorrecta",
  "keyword": "When "
});
formatter.step({
  "line": 23,
  "name": "No se registra",
  "keyword": "Then "
});
formatter.match({
  "location": "Test01UsuarioCreaCuentaUsuario.una_persona_quiere_registrarse()"
});
formatter.result({
  "duration": 9226261,
  "status": "passed"
});
formatter.match({
  "location": "Test01UsuarioCreaCuentaUsuario.la_longitud_del_username_es_incorrecta()"
});
formatter.result({
  "duration": 43423,
  "status": "passed"
});
formatter.match({
  "location": "Test01UsuarioCreaCuentaUsuario.no_se_registra()"
});
formatter.result({
  "duration": 909247341,
  "status": "passed"
});
formatter.scenario({
  "line": 25,
  "name": "Error en el Registro. Caracter invalido en la clave",
  "description": "",
  "id": "como-usuario-quiero-una-cuenta-nueva-para-acceder-al-sistema;error-en-el-registro.-caracter-invalido-en-la-clave",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 26,
  "name": "Una persona quiere registrarse",
  "keyword": "Given "
});
formatter.step({
  "line": 27,
  "name": "La clave contiene un caracter invalido",
  "keyword": "When "
});
formatter.step({
  "line": 28,
  "name": "No se registra",
  "keyword": "Then "
});
formatter.match({
  "location": "Test01UsuarioCreaCuentaUsuario.una_persona_quiere_registrarse()"
});
formatter.result({
  "duration": 9022172,
  "status": "passed"
});
formatter.match({
  "location": "Test01UsuarioCreaCuentaUsuario.la_clave_contiene_un_caracter_invalido()"
});
formatter.result({
  "duration": 48950,
  "status": "passed"
});
formatter.match({
  "location": "Test01UsuarioCreaCuentaUsuario.no_se_registra()"
});
formatter.result({
  "duration": 723396536,
  "status": "passed"
});
formatter.scenario({
  "line": 30,
  "name": "Error en el Registro. Longitud de la clave incorrecta",
  "description": "",
  "id": "como-usuario-quiero-una-cuenta-nueva-para-acceder-al-sistema;error-en-el-registro.-longitud-de-la-clave-incorrecta",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 31,
  "name": "Una persona quiere registrarse",
  "keyword": "Given "
});
formatter.step({
  "line": 32,
  "name": "La longitud de la clave es incorrecta",
  "keyword": "When "
});
formatter.step({
  "line": 33,
  "name": "No se registra",
  "keyword": "Then "
});
formatter.match({
  "location": "Test01UsuarioCreaCuentaUsuario.una_persona_quiere_registrarse()"
});
formatter.result({
  "duration": 8558331,
  "status": "passed"
});
formatter.match({
  "location": "Test01UsuarioCreaCuentaUsuario.la_longitud_de_la_clave_es_incorrecta()"
});
formatter.result({
  "duration": 40660,
  "status": "passed"
});
formatter.match({
  "location": "Test01UsuarioCreaCuentaUsuario.no_se_registra()"
});
formatter.result({
  "duration": 730743359,
  "status": "passed"
});
formatter.scenario({
  "line": 35,
  "name": "Error en el Registro. Existe email",
  "description": "",
  "id": "como-usuario-quiero-una-cuenta-nueva-para-acceder-al-sistema;error-en-el-registro.-existe-email",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 36,
  "name": "Una persona quiere registrarse",
  "keyword": "Given "
});
formatter.step({
  "line": 37,
  "name": "Introduce un email existente",
  "keyword": "When "
});
formatter.step({
  "line": 38,
  "name": "No se registra",
  "keyword": "Then "
});
formatter.match({
  "location": "Test01UsuarioCreaCuentaUsuario.una_persona_quiere_registrarse()"
});
formatter.result({
  "duration": 6444408,
  "status": "passed"
});
formatter.match({
  "location": "Test01UsuarioCreaCuentaUsuario.introduce_un_email_existente()"
});
formatter.result({
  "duration": 746160594,
  "status": "passed"
});
formatter.match({
  "location": "Test01UsuarioCreaCuentaUsuario.no_se_registra()"
});
formatter.result({
  "duration": 44536485,
  "status": "passed"
});
formatter.uri("02UsuarioIniciaSesion.feature");
formatter.feature({
  "comments": [
    {
      "line": 1,
      "value": "#Author: Sergio Perez Sanchez"
    }
  ],
  "line": 3,
  "name": "Como usuario quiero acceder al sistema para usar la aplicacion",
  "description": "",
  "id": "como-usuario-quiero-acceder-al-sistema-para-usar-la-aplicacion",
  "keyword": "Feature"
});
formatter.scenario({
  "line": 5,
  "name": "Login correcto. Login mediante email",
  "description": "",
  "id": "como-usuario-quiero-acceder-al-sistema-para-usar-la-aplicacion;login-correcto.-login-mediante-email",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 6,
  "name": "Una persona quiere loguearse",
  "keyword": "Given "
});
formatter.step({
  "line": 7,
  "name": "Se loguea con el email",
  "keyword": "When "
});
formatter.step({
  "line": 8,
  "name": "Se loguea correctamente",
  "keyword": "Then "
});
formatter.match({
  "location": "Test02UsuarioIniciaSesion.una_persona_quiere_loguearse()"
});
formatter.result({
  "duration": 3915989,
  "status": "passed"
});
formatter.match({
  "location": "Test02UsuarioIniciaSesion.se_loguea_con_el_email()"
});
formatter.result({
  "duration": 803795905,
  "status": "passed"
});
formatter.match({
  "location": "Test02UsuarioIniciaSesion.se_loguea_correctamente()"
});
formatter.result({
  "duration": 35134,
  "status": "passed"
});
formatter.scenario({
  "line": 10,
  "name": "Login correcto. Login mediante username",
  "description": "",
  "id": "como-usuario-quiero-acceder-al-sistema-para-usar-la-aplicacion;login-correcto.-login-mediante-username",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 11,
  "name": "Una persona quiere loguearse",
  "keyword": "Given "
});
formatter.step({
  "line": 12,
  "name": "Se loguea con el username",
  "keyword": "When "
});
formatter.step({
  "line": 13,
  "name": "Se loguea correctamente",
  "keyword": "Then "
});
formatter.match({
  "location": "Test02UsuarioIniciaSesion.una_persona_quiere_loguearse()"
});
formatter.result({
  "duration": 3046734,
  "status": "passed"
});
formatter.match({
  "location": "Test02UsuarioIniciaSesion.se_loguea_con_el_username()"
});
formatter.result({
  "duration": 737626342,
  "status": "passed"
});
formatter.match({
  "location": "Test02UsuarioIniciaSesion.se_loguea_correctamente()"
});
formatter.result({
  "duration": 23686,
  "status": "passed"
});
formatter.scenario({
  "line": 15,
  "name": "Login incorrecto. Error en el email",
  "description": "",
  "id": "como-usuario-quiero-acceder-al-sistema-para-usar-la-aplicacion;login-incorrecto.-error-en-el-email",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 16,
  "name": "Una persona quiere loguearse",
  "keyword": "Given "
});
formatter.step({
  "line": 17,
  "name": "El email es erroneo",
  "keyword": "When "
});
formatter.step({
  "line": 18,
  "name": "No se puede loguear",
  "keyword": "Then "
});
formatter.match({
  "location": "Test02UsuarioIniciaSesion.una_persona_quiere_loguearse()"
});
formatter.result({
  "duration": 2796458,
  "status": "passed"
});
formatter.match({
  "location": "Test02UsuarioIniciaSesion.el_email_es_erroneo()"
});
formatter.result({
  "duration": 1021325562,
  "status": "passed"
});
formatter.match({
  "location": "Test02UsuarioIniciaSesion.no_se_puede_loguear()"
});
formatter.result({
  "duration": 22501,
  "status": "passed"
});
formatter.scenario({
  "line": 20,
  "name": "Login incorrecto. Error en el username",
  "description": "",
  "id": "como-usuario-quiero-acceder-al-sistema-para-usar-la-aplicacion;login-incorrecto.-error-en-el-username",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 21,
  "name": "Una persona quiere loguearse",
  "keyword": "Given "
});
formatter.step({
  "line": 22,
  "name": "El username es erroneo",
  "keyword": "When "
});
formatter.step({
  "line": 23,
  "name": "No se puede loguear",
  "keyword": "Then "
});
formatter.match({
  "location": "Test02UsuarioIniciaSesion.una_persona_quiere_loguearse()"
});
formatter.result({
  "duration": 2584080,
  "status": "passed"
});
formatter.match({
  "location": "Test02UsuarioIniciaSesion.el_username_es_erroneo()"
});
formatter.result({
  "duration": 780275493,
  "status": "passed"
});
formatter.match({
  "location": "Test02UsuarioIniciaSesion.no_se_puede_loguear()"
});
formatter.result({
  "duration": 29212,
  "status": "passed"
});
formatter.scenario({
  "line": 25,
  "name": "Login incorrecto. Error en la clave",
  "description": "",
  "id": "como-usuario-quiero-acceder-al-sistema-para-usar-la-aplicacion;login-incorrecto.-error-en-la-clave",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 26,
  "name": "Una persona quiere loguearse",
  "keyword": "Given "
});
formatter.step({
  "line": 27,
  "name": "La clave es erronea",
  "keyword": "When "
});
formatter.step({
  "line": 28,
  "name": "No se puede loguear",
  "keyword": "Then "
});
formatter.match({
  "location": "Test02UsuarioIniciaSesion.una_persona_quiere_loguearse()"
});
formatter.result({
  "duration": 3235034,
  "status": "passed"
});
formatter.match({
  "location": "Test02UsuarioIniciaSesion.la_clave_es_erronea()"
});
formatter.result({
  "duration": 793268130,
  "status": "passed"
});
formatter.match({
  "location": "Test02UsuarioIniciaSesion.no_se_puede_loguear()"
});
formatter.result({
  "duration": 16974,
  "status": "passed"
});
formatter.uri("03UsuarioVerPerfil.feature");
formatter.feature({
  "comments": [
    {
      "line": 1,
      "value": "#Author: Sergio Perez Sanchez"
    }
  ],
  "line": 3,
  "name": "Como usuario quiero ver mi perfil para ver mis datos",
  "description": "",
  "id": "como-usuario-quiero-ver-mi-perfil-para-ver-mis-datos",
  "keyword": "Feature"
});
formatter.scenario({
  "line": 5,
  "name": "Ver perfil con username",
  "description": "",
  "id": "como-usuario-quiero-ver-mi-perfil-para-ver-mis-datos;ver-perfil-con-username",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 6,
  "name": "Una persona quiere ver su perfil",
  "keyword": "Given "
});
formatter.step({
  "line": 7,
  "name": "Se ha logueado con el username",
  "keyword": "When "
});
formatter.step({
  "line": 8,
  "name": "Ve el perfil con el username",
  "keyword": "Then "
});
formatter.match({
  "location": "Test03UsuarioVePerfil.una_persona_quiere_ver_su_perfil()"
});
formatter.result({
  "duration": 4000467,
  "status": "passed"
});
formatter.match({
  "location": "Test03UsuarioVePerfil.se_loguea_con_el_username()"
});
formatter.result({
  "duration": 741828135,
  "status": "passed"
});
formatter.match({
  "location": "Test03UsuarioVePerfil.ve_el_perfil_con_el_username()"
});
formatter.result({
  "duration": 137692030,
  "status": "passed"
});
formatter.scenario({
  "line": 10,
  "name": "Ver perfil con email",
  "description": "",
  "id": "como-usuario-quiero-ver-mi-perfil-para-ver-mis-datos;ver-perfil-con-email",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 11,
  "name": "Una persona quiere ver su perfil",
  "keyword": "Given "
});
formatter.step({
  "line": 12,
  "name": "Se ha logueado con el email",
  "keyword": "When "
});
formatter.step({
  "line": 13,
  "name": "Ve el perfil con el email",
  "keyword": "Then "
});
formatter.match({
  "location": "Test03UsuarioVePerfil.una_persona_quiere_ver_su_perfil()"
});
formatter.result({
  "duration": 3558340,
  "status": "passed"
});
formatter.match({
  "location": "Test03UsuarioVePerfil.se_loguea_con_el_email()"
});
formatter.result({
  "duration": 777849711,
  "status": "passed"
});
formatter.match({
  "location": "Test03UsuarioVePerfil.ve_el_perfil_con_el_email()"
});
formatter.result({
  "duration": 131743041,
  "status": "passed"
});
formatter.uri("04UsuarioActualizaPerfil.feature");
formatter.feature({
  "comments": [
    {
      "line": 1,
      "value": "#Author: Sergio Perez Sanchez"
    }
  ],
  "line": 3,
  "name": "Como usuario quiero cambiar mis datos para actualizarlos",
  "description": "",
  "id": "como-usuario-quiero-cambiar-mis-datos-para-actualizarlos",
  "keyword": "Feature"
});
formatter.scenario({
  "line": 5,
  "name": "Actualizar Perfil",
  "description": "",
  "id": "como-usuario-quiero-cambiar-mis-datos-para-actualizarlos;actualizar-perfil",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 6,
  "name": "Una persona quiere actualizar su perfil",
  "keyword": "Given "
});
formatter.step({
  "line": 7,
  "name": "Cambia los datos",
  "keyword": "When "
});
formatter.step({
  "line": 8,
  "name": "Se actualiza el perfil correctamente",
  "keyword": "Then "
});
formatter.match({
  "location": "Test04UsuarioActualizaPerfil.una_persona_quiere_actualizar_su_perfil()"
});
formatter.result({
  "duration": 786413569,
  "status": "passed"
});
formatter.match({
  "location": "Test04UsuarioActualizaPerfil.cambia_los_datos()"
});
formatter.result({
  "duration": 45397,
  "status": "passed"
});
formatter.match({
  "location": "Test04UsuarioActualizaPerfil.se_actualiza_el_perfil_correctamente()"
});
formatter.result({
  "duration": 248795991,
  "status": "passed"
});
formatter.uri("05AdministradorCambiaRol.feature");
formatter.feature({
  "comments": [
    {
      "line": 1,
      "value": "#Author: Sergio Perez Sanchez"
    }
  ],
  "line": 3,
  "name": "Administrador cambia el rol a un usuario",
  "description": "",
  "id": "administrador-cambia-el-rol-a-un-usuario",
  "keyword": "Feature"
});
formatter.scenario({
  "line": 5,
  "name": "Administrador cambia el rol a un usuario",
  "description": "",
  "id": "administrador-cambia-el-rol-a-un-usuario;administrador-cambia-el-rol-a-un-usuario",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 6,
  "name": "Un administrador quiere cambiar el rol de un usuario",
  "keyword": "Given "
});
formatter.step({
  "line": 7,
  "name": "Localiza a ese usuario",
  "keyword": "When "
});
formatter.step({
  "line": 8,
  "name": "Cambia su rol",
  "keyword": "Then "
});
formatter.match({
  "location": "Test05AdministradorCambiaRol.un_administrador_quiere_cambiar_el_rol_de_un_usuario()"
});
formatter.result({
  "duration": 970993256,
  "status": "passed"
});
formatter.match({
  "location": "Test05AdministradorCambiaRol.localiza_a_ese_usuario()"
});
formatter.result({
  "duration": 84219431,
  "status": "passed"
});
formatter.match({
  "location": "Test05AdministradorCambiaRol.cambia_su_rol()"
});
formatter.result({
  "duration": 121295402,
  "status": "passed"
});
formatter.uri("06AdministradorEliminaUsuario.feature");
formatter.feature({
  "comments": [
    {
      "line": 1,
      "value": "#Author: Sergio Perez Sanchez"
    }
  ],
  "line": 3,
  "name": "Administrador elimina a un usuario",
  "description": "",
  "id": "administrador-elimina-a-un-usuario",
  "keyword": "Feature"
});
formatter.scenario({
  "line": 5,
  "name": "Administrador elimina un usuario",
  "description": "",
  "id": "administrador-elimina-a-un-usuario;administrador-elimina-un-usuario",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 6,
  "name": "Un administrador quiere eliminar a un usuario",
  "keyword": "Given "
});
formatter.step({
  "line": 7,
  "name": "Encuentra a ese usuario",
  "keyword": "When "
});
formatter.step({
  "line": 8,
  "name": "Le elimina del sistema",
  "keyword": "Then "
});
formatter.match({
  "location": "Test06AdministradorEliminaUsuario.un_administrador_quiere_eliminar_a_un_usuario()"
});
formatter.result({
  "duration": 939209002,
  "status": "passed"
});
formatter.match({
  "location": "Test06AdministradorEliminaUsuario.encuentra_a_ese_usuario()"
});
formatter.result({
  "duration": 40628390,
  "status": "passed"
});
formatter.match({
  "location": "Test06AdministradorEliminaUsuario.le_elimina_del_sistema()"
});
formatter.result({
  "duration": 81416262,
  "status": "passed"
});
formatter.uri("07UsuarioCreaClub.feature");
formatter.feature({
  "comments": [
    {
      "line": 1,
      "value": "#Author: Sergio Perez Sanchez"
    }
  ],
  "line": 3,
  "name": "Usuario crea un club",
  "description": "",
  "id": "usuario-crea-un-club",
  "keyword": "Feature"
});
formatter.scenario({
  "line": 5,
  "name": "Un usuario crea un club",
  "description": "",
  "id": "usuario-crea-un-club;un-usuario-crea-un-club",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 6,
  "name": "Un usuario no encuentra club",
  "keyword": "Given "
});
formatter.step({
  "line": 7,
  "name": "Crea un club",
  "keyword": "When "
});
formatter.step({
  "line": 8,
  "name": "Existe el club",
  "keyword": "Then "
});
formatter.match({
  "location": "Test07UsuarioCreaClub.un_usuario_no_encuentra_club()"
});
formatter.result({
  "duration": 1130244939,
  "status": "passed"
});
formatter.match({
  "location": "Test07UsuarioCreaClub.crea_un_club()"
});
formatter.result({
  "duration": 90342113,
  "status": "passed"
});
formatter.match({
  "location": "Test07UsuarioCreaClub.existe_el_club()"
});
formatter.result({
  "duration": 44032775,
  "status": "passed"
});
formatter.uri("08UsuarioSeUneClub.feature");
formatter.feature({
  "comments": [
    {
      "line": 1,
      "value": "#Author: Sergio Perez Sanchez"
    }
  ],
  "line": 3,
  "name": "Un usuario se une a un club",
  "description": "",
  "id": "un-usuario-se-une-a-un-club",
  "keyword": "Feature"
});
formatter.scenario({
  "line": 5,
  "name": "Un usuario se une a un club",
  "description": "",
  "id": "un-usuario-se-une-a-un-club;un-usuario-se-une-a-un-club",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 6,
  "name": "Un usuario encuentra un club",
  "keyword": "Given "
});
formatter.step({
  "line": 7,
  "name": "Solicita unirse",
  "keyword": "When "
});
formatter.step({
  "line": 8,
  "name": "Forma parte de este club",
  "keyword": "Then "
});
formatter.match({
  "location": "Test08UsuarioSeUneAClub.un_usuario_encuentra_un_club()"
});
formatter.result({
  "duration": 761275839,
  "status": "passed"
});
formatter.match({
  "location": "Test08UsuarioSeUneAClub.solicita_unirse()"
});
formatter.result({
  "duration": 135991021,
  "status": "passed"
});
formatter.match({
  "location": "Test08UsuarioSeUneAClub.forma_parte_de_este_club()"
});
formatter.result({
  "duration": 50561660,
  "status": "passed"
});
formatter.uri("09UsuarioDejaClub.feature");
formatter.feature({
  "comments": [
    {
      "line": 1,
      "value": "#Author: Sergio Perez Sanchez"
    }
  ],
  "line": 3,
  "name": "Usuario deja club",
  "description": "",
  "id": "usuario-deja-club",
  "keyword": "Feature"
});
formatter.scenario({
  "line": 5,
  "name": "Un usuario deja un club",
  "description": "",
  "id": "usuario-deja-club;un-usuario-deja-un-club",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 6,
  "name": "Un usuario que pertenece a un club",
  "keyword": "Given "
});
formatter.step({
  "line": 7,
  "name": "Deja el club",
  "keyword": "When "
});
formatter.step({
  "line": 8,
  "name": "No pertenece al club",
  "keyword": "Then "
});
formatter.match({
  "location": "Test09UsuarioDejaClub.un_usuario_que_pertenece_a_un_club()"
});
formatter.result({
  "duration": 715922602,
  "status": "passed"
});
formatter.match({
  "location": "Test09UsuarioDejaClub.deja_el_club()"
});
formatter.result({
  "duration": 152890174,
  "status": "passed"
});
formatter.match({
  "location": "Test09UsuarioDejaClub.no_pertenece_al_club()"
});
formatter.result({
  "duration": 45594828,
  "status": "passed"
});
formatter.uri("10AdministradorEliminaClub.feature");
formatter.feature({
  "comments": [
    {
      "line": 1,
      "value": "#Author: Sergio Perez Sanchez"
    }
  ],
  "line": 3,
  "name": "Administrador elimina club",
  "description": "",
  "id": "administrador-elimina-club",
  "keyword": "Feature"
});
formatter.scenario({
  "line": 5,
  "name": "El administrador elimina el club",
  "description": "",
  "id": "administrador-elimina-club;el-administrador-elimina-el-club",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 6,
  "name": "Un administrador quiere eliminar el club",
  "keyword": "Given "
});
formatter.step({
  "line": 7,
  "name": "Elimina el club",
  "keyword": "When "
});
formatter.step({
  "line": 8,
  "name": "El club ya no existe",
  "keyword": "Then "
});
formatter.match({
  "location": "Test10AdministradorEliminaClub.un_administrador_de_un_club_quiere_eliminar_el_club()"
});
formatter.result({
  "duration": 751541921,
  "status": "passed"
});
formatter.match({
  "location": "Test10AdministradorEliminaClub.elimina_el_club()"
});
formatter.result({
  "duration": 39299638,
  "status": "passed"
});
formatter.match({
  "location": "Test10AdministradorEliminaClub.el_club_ya_no_existe()"
});
formatter.result({
  "duration": 40100994,
  "status": "passed"
});
formatter.uri("11UsuarioEnviaPeticionDeAmistad.feature");
formatter.feature({
  "comments": [
    {
      "line": 1,
      "value": "#Author: Sergio Perez Sanchez"
    }
  ],
  "line": 3,
  "name": "Usuario envia peticion de amistad",
  "description": "",
  "id": "usuario-envia-peticion-de-amistad",
  "keyword": "Feature"
});
formatter.scenario({
  "line": 5,
  "name": "Usuario envia peticion de amistad",
  "description": "",
  "id": "usuario-envia-peticion-de-amistad;usuario-envia-peticion-de-amistad",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 6,
  "name": "Un usuario conoce a otro",
  "keyword": "Given "
});
formatter.step({
  "line": 7,
  "name": "Envia una peticion de amistad",
  "keyword": "When "
});
formatter.step({
  "line": 8,
  "name": "El otro usuario recibe una peticion de amistad",
  "keyword": "Then "
});
formatter.match({
  "location": "Test11UsuarioEnviaPeticionAmistad.un_usuario_conoce_a_otro()"
});
formatter.result({
  "duration": 1015945419,
  "status": "passed"
});
formatter.match({
  "location": "Test11UsuarioEnviaPeticionAmistad.envia_una_peticion_de_amistad()"
});
formatter.result({
  "duration": 3829167331,
  "status": "passed"
});
formatter.match({
  "location": "Test11UsuarioEnviaPeticionAmistad.el_otro_usuario_recibe_una_peticion_de_amistad()"
});
formatter.result({
  "duration": 45644173,
  "status": "passed"
});
formatter.uri("12UsuarioRecibePeticionDeAmistad.feature");
formatter.feature({
  "comments": [
    {
      "line": 1,
      "value": "#Author: Sergio Perez Sanchez"
    }
  ],
  "line": 3,
  "name": "Usuario recibe peticion de amistad",
  "description": "",
  "id": "usuario-recibe-peticion-de-amistad",
  "keyword": "Feature"
});
formatter.scenario({
  "line": 5,
  "name": "Usuario recibe peticion de amistad",
  "description": "",
  "id": "usuario-recibe-peticion-de-amistad;usuario-recibe-peticion-de-amistad",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 6,
  "name": "Un usuario del sistema",
  "keyword": "Given "
});
formatter.step({
  "line": 7,
  "name": "Otro usuario le haya enviado una peticion de amistad",
  "keyword": "When "
});
formatter.step({
  "line": 8,
  "name": "Este usuario la recibe",
  "keyword": "Then "
});
formatter.match({
  "location": "Test12UsuarioRecibePeticionAmistad.un_usuario_del_sistema()"
});
formatter.result({
  "duration": 1021047259,
  "status": "passed"
});
formatter.match({
  "location": "Test12UsuarioRecibePeticionAmistad.otro_usuario_le_haya_enviado_una_peticion_de_amistad()"
});
formatter.result({
  "duration": 719857935,
  "status": "passed"
});
formatter.match({
  "location": "Test12UsuarioRecibePeticionAmistad.este_usuario_la_recibe()"
});
formatter.result({
  "duration": 40644180,
  "status": "passed"
});
formatter.uri("13UsuarioAceptaPeticionDeAmistad.feature");
formatter.feature({
  "comments": [
    {
      "line": 1,
      "value": "#Author: Sergio Perez Sanchez"
    }
  ],
  "line": 3,
  "name": "Usuario acepta peticion de amistad",
  "description": "",
  "id": "usuario-acepta-peticion-de-amistad",
  "keyword": "Feature"
});
formatter.scenario({
  "line": 5,
  "name": "Usuario acepta peticion de amistad",
  "description": "",
  "id": "usuario-acepta-peticion-de-amistad;usuario-acepta-peticion-de-amistad",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 6,
  "name": "Un usuario recibe una peticion",
  "keyword": "Given "
});
formatter.step({
  "line": 7,
  "name": "Acepta la peticion",
  "keyword": "When "
});
formatter.step({
  "line": 8,
  "name": "Son amigos",
  "keyword": "Then "
});
formatter.match({
  "location": "Test13UsuarioAceptaPeticionAmistad.un_usuario_recibe_una_peticion()"
});
formatter.result({
  "duration": 1168173585,
  "status": "passed"
});
formatter.match({
  "location": "Test13UsuarioAceptaPeticionAmistad.acepta_la_peticion()"
});
formatter.result({
  "duration": 2546447897,
  "status": "passed"
});
formatter.match({
  "location": "Test13UsuarioAceptaPeticionAmistad.son_amigos()"
});
formatter.result({
  "duration": 92224708,
  "status": "passed"
});
formatter.uri("14UsuarioRechazaPeticionDeAmistad.feature");
formatter.feature({
  "comments": [
    {
      "line": 1,
      "value": "#Author: Sergio Perez Sanchez"
    }
  ],
  "line": 3,
  "name": "Usuario rechaza peticion de amistad",
  "description": "",
  "id": "usuario-rechaza-peticion-de-amistad",
  "keyword": "Feature"
});
formatter.scenario({
  "line": 5,
  "name": "Usuario rechaza peticion de amistad",
  "description": "",
  "id": "usuario-rechaza-peticion-de-amistad;usuario-rechaza-peticion-de-amistad",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 6,
  "name": "Un usuario recibe una peticion de amistad",
  "keyword": "Given "
});
formatter.step({
  "line": 7,
  "name": "Rechaza la peticion",
  "keyword": "When "
});
formatter.step({
  "line": 8,
  "name": "No son amigos",
  "keyword": "Then "
});
formatter.match({
  "location": "Test14UsuarioRechazaPeticionAmistad.un_usuario_recibe_una_peticion_de_amistad()"
});
formatter.result({
  "duration": 4087768297,
  "status": "passed"
});
formatter.match({
  "location": "Test14UsuarioRechazaPeticionAmistad.rechaza_la_peticion()"
});
formatter.result({
  "duration": 2545537982,
  "status": "passed"
});
formatter.match({
  "location": "Test14UsuarioRechazaPeticionAmistad.no_son_amigos()"
});
formatter.result({
  "duration": 88228188,
  "status": "passed"
});
formatter.uri("15UsuarioEliminaAmigo.feature");
formatter.feature({
  "comments": [
    {
      "line": 1,
      "value": "#Author: Sergio Perez Sanchez"
    }
  ],
  "line": 3,
  "name": "Usuario elimina amigo",
  "description": "",
  "id": "usuario-elimina-amigo",
  "keyword": "Feature"
});
formatter.scenario({
  "line": 5,
  "name": "Usuario elimina amigo",
  "description": "",
  "id": "usuario-elimina-amigo;usuario-elimina-amigo",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 6,
  "name": "Un usuario no quiere tener a un usuario de amigo",
  "keyword": "Given "
});
formatter.step({
  "line": 7,
  "name": "Elimina al amigo",
  "keyword": "When "
});
formatter.step({
  "line": 8,
  "name": "Ya no son amigos",
  "keyword": "Then "
});
formatter.match({
  "location": "Test15UsuarioEliminaAmigo.un_usuario_no_quiere_tener_a_un_usuario_de_amigo()"
});
formatter.result({
  "duration": 964011978,
  "status": "passed"
});
formatter.match({
  "location": "Test15UsuarioEliminaAmigo.elimina_al_amigo()"
});
formatter.result({
  "duration": 3167379335,
  "status": "passed"
});
formatter.match({
  "location": "Test15UsuarioEliminaAmigo.ya_no_son_amigos()"
});
formatter.result({
  "duration": 86452177,
  "status": "passed"
});
formatter.uri("16UsuarioBloqueaUsuario.feature");
formatter.feature({
  "comments": [
    {
      "line": 1,
      "value": "#Author: Sergio Perez Sanchez"
    }
  ],
  "line": 3,
  "name": "Usuario bloquea a otro usuario",
  "description": "",
  "id": "usuario-bloquea-a-otro-usuario",
  "keyword": "Feature"
});
formatter.scenario({
  "line": 5,
  "name": "Usuario bloquea a otro usuario",
  "description": "",
  "id": "usuario-bloquea-a-otro-usuario;usuario-bloquea-a-otro-usuario",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 6,
  "name": "Un usuario no quiere que otro usuario sea su amigo",
  "keyword": "Given "
});
formatter.step({
  "line": 7,
  "name": "Bloquea",
  "keyword": "When "
});
formatter.step({
  "line": 8,
  "name": "El usuario bloqueado no ve su perfil",
  "keyword": "Then "
});
formatter.match({
  "location": "Test16UsuarioBloqueaUsuario.un_usuario_no_quiere_que_otro_usuario_sea_su_amigo()"
});
formatter.result({
  "duration": 990607547,
  "status": "passed"
});
formatter.match({
  "location": "Test16UsuarioBloqueaUsuario.bloquea()"
});
formatter.result({
  "duration": 3139013676,
  "status": "passed"
});
formatter.match({
  "location": "Test16UsuarioBloqueaUsuario.el_usuario_bloqueado_no_ver_su_perfil()"
});
formatter.result({
  "duration": 88181608,
  "status": "passed"
});
formatter.uri("17UsuarioDesbloqueaUsuario.feature");
formatter.feature({
  "comments": [
    {
      "line": 1,
      "value": "#Author: Sergio Perez Sanchez"
    }
  ],
  "line": 3,
  "name": "Usuario desbloquea a usuario bloqueado",
  "description": "",
  "id": "usuario-desbloquea-a-usuario-bloqueado",
  "keyword": "Feature"
});
formatter.scenario({
  "line": 5,
  "name": "Usuario desbloquea a usuario bloqueado",
  "description": "",
  "id": "usuario-desbloquea-a-usuario-bloqueado;usuario-desbloquea-a-usuario-bloqueado",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 6,
  "name": "Un usuario quiere desbloquear a uno bloqueado",
  "keyword": "Given "
});
formatter.step({
  "line": 7,
  "name": "Lo desbloquea",
  "keyword": "When "
});
formatter.step({
  "line": 8,
  "name": "El usuario queda desbloqueado",
  "keyword": "Then "
});
formatter.match({
  "location": "Test17UsuarioDesbloqueaUsuario.un_usuario_quiere_desbloquear_a_uno_bloqueado()"
});
formatter.result({
  "duration": 1036371725,
  "status": "passed"
});
formatter.match({
  "location": "Test17UsuarioDesbloqueaUsuario.lo_desbloquea()"
});
formatter.result({
  "duration": 3933845438,
  "status": "passed"
});
formatter.match({
  "location": "Test17UsuarioDesbloqueaUsuario.el_usuario_queda_desbloqueado()"
});
formatter.result({
  "duration": 92153258,
  "status": "passed"
});
formatter.uri("18UsuarioCreaColeccionFlashcards.feature");
formatter.feature({
  "comments": [
    {
      "line": 1,
      "value": "#Author: Sergio Perez Sanchez"
    }
  ],
  "line": 3,
  "name": "Usuario crea una coleccion de Flashcards",
  "description": "",
  "id": "usuario-crea-una-coleccion-de-flashcards",
  "keyword": "Feature"
});
formatter.scenario({
  "line": 5,
  "name": "Usuario crea una coleccion de Flashcards",
  "description": "",
  "id": "usuario-crea-una-coleccion-de-flashcards;usuario-crea-una-coleccion-de-flashcards",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 6,
  "name": "Un usuario va a crear una coleccion",
  "keyword": "Given "
});
formatter.step({
  "line": 7,
  "name": "Inserta las tarjetas e indica con quien compartirlo",
  "keyword": "When "
});
formatter.step({
  "line": 8,
  "name": "Se crea la coleccion",
  "keyword": "Then "
});
formatter.match({
  "location": "Test18UsuarioCreaColeccionesFlashcards.un_usuario_va_a_crear_una_coleccion()"
});
formatter.result({
  "duration": 691449643,
  "status": "passed"
});
formatter.match({
  "location": "Test18UsuarioCreaColeccionesFlashcards.inserta_las_tarjetas_e_indica_con_quien_compartirlo()"
});
formatter.result({
  "duration": 721817114,
  "status": "passed"
});
formatter.match({
  "location": "Test18UsuarioCreaColeccionesFlashcards.se_crea_la_coleccion()"
});
formatter.result({
  "duration": 772147841,
  "status": "passed"
});
formatter.uri("19UsuarioEliminaColeccionFlashcards.feature");
formatter.feature({
  "comments": [
    {
      "line": 1,
      "value": "#Author: Sergio Perez Sanchez"
    }
  ],
  "line": 3,
  "name": "Usuario elimina coleccion de Flashcards",
  "description": "",
  "id": "usuario-elimina-coleccion-de-flashcards",
  "keyword": "Feature"
});
formatter.scenario({
  "line": 5,
  "name": "Usuario elimina coleccion de Flashcards",
  "description": "",
  "id": "usuario-elimina-coleccion-de-flashcards;usuario-elimina-coleccion-de-flashcards",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 6,
  "name": "Un usuario quiere eliminar una coleccion de Flashcards",
  "keyword": "Given "
});
formatter.step({
  "line": 7,
  "name": "Encuentra la coleccion",
  "keyword": "When "
});
formatter.step({
  "line": 8,
  "name": "La elimina",
  "keyword": "Then "
});
formatter.match({
  "location": "Test19UsuarioEliminaColeccionFlashcards.un_usuario_quiere_eliminar_una_coleccion_de_Flashcards()"
});
formatter.result({
  "duration": 1168631504,
  "status": "passed"
});
formatter.match({
  "location": "Test19UsuarioEliminaColeccionFlashcards.encuentra_la_coleccion()"
});
formatter.result({
  "duration": 807627021,
  "status": "passed"
});
formatter.match({
  "location": "Test19UsuarioEliminaColeccionFlashcards.la_elimina()"
});
formatter.result({
  "duration": 1758388981,
  "status": "passed"
});
formatter.uri("20ModeradorConsultaColeccionesSinEvaluar.feature");
formatter.feature({
  "comments": [
    {
      "line": 1,
      "value": "#Author: Sergio Perez Sanchez"
    }
  ],
  "line": 3,
  "name": "Moderador consulta colecciones sin evaluar",
  "description": "",
  "id": "moderador-consulta-colecciones-sin-evaluar",
  "keyword": "Feature"
});
formatter.scenario({
  "line": 5,
  "name": "Moderador consulta colecciones sin evaluar",
  "description": "",
  "id": "moderador-consulta-colecciones-sin-evaluar;moderador-consulta-colecciones-sin-evaluar",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 6,
  "name": "Un moderador consulta las colecciones",
  "keyword": "Given "
});
formatter.step({
  "line": 7,
  "name": "Busca",
  "keyword": "When "
});
formatter.step({
  "line": 8,
  "name": "Se lista todas sin evaluar",
  "keyword": "Then "
});
formatter.match({
  "location": "Test20ModeradorConsultaColeccionesSinEvaluar.un_moderador_consulta_las_colecciones()"
});
formatter.result({
  "duration": 842628940,
  "status": "passed"
});
formatter.match({
  "location": "Test20ModeradorConsultaColeccionesSinEvaluar.busca()"
});
formatter.result({
  "duration": 1451831752,
  "status": "passed"
});
formatter.match({
  "location": "Test20ModeradorConsultaColeccionesSinEvaluar.se_lista_todas_sin_evaluar()"
});
formatter.result({
  "duration": 52503,
  "status": "passed"
});
formatter.uri("21ModeradorEvaluaPositivamenteColeccionFlashcards.feature");
formatter.feature({
  "comments": [
    {
      "line": 1,
      "value": "#Author: Sergio Perez Sanchez"
    }
  ],
  "line": 3,
  "name": "Moderador evalua positivamente la coleccion",
  "description": "",
  "id": "moderador-evalua-positivamente-la-coleccion",
  "keyword": "Feature"
});
formatter.scenario({
  "line": 5,
  "name": "Moderador evalua positivamente la coleccion",
  "description": "",
  "id": "moderador-evalua-positivamente-la-coleccion;moderador-evalua-positivamente-la-coleccion",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 6,
  "name": "El moderador evalua la coleccion",
  "keyword": "Given "
});
formatter.step({
  "line": 7,
  "name": "Lo valora positivamente",
  "keyword": "When "
});
formatter.step({
  "line": 8,
  "name": "La coleccion puede visualizarse",
  "keyword": "Then "
});
formatter.match({
  "location": "Test21ModeradorEvaluaPositivamenteColeccion.el_moderador_evalua_la_coleccion()"
});
formatter.result({
  "duration": 849527318,
  "status": "passed"
});
formatter.match({
  "location": "Test21ModeradorEvaluaPositivamenteColeccion.lo_valora_positivamente()"
});
formatter.result({
  "duration": 795116777,
  "status": "passed"
});
formatter.match({
  "location": "Test21ModeradorEvaluaPositivamenteColeccion.la_coleccion_puede_visualizarse()"
});
formatter.result({
  "duration": 718599055,
  "status": "passed"
});
formatter.uri("22ModeradorEvaluaNegativamenteColeccionFlashcards.feature");
formatter.feature({
  "comments": [
    {
      "line": 1,
      "value": "#Author: Sergio Perez Sanchez"
    }
  ],
  "line": 3,
  "name": "Moderador evalua negativamente la coleccion",
  "description": "",
  "id": "moderador-evalua-negativamente-la-coleccion",
  "keyword": "Feature"
});
formatter.scenario({
  "line": 5,
  "name": "Moderador evalua negativamente la coleccion",
  "description": "",
  "id": "moderador-evalua-negativamente-la-coleccion;moderador-evalua-negativamente-la-coleccion",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 6,
  "name": "El moderador analiza la coleccion",
  "keyword": "Given "
});
formatter.step({
  "line": 7,
  "name": "Lo valora negativamente",
  "keyword": "When "
});
formatter.step({
  "line": 8,
  "name": "La coleccion se elimina por no cumplir los requisitos",
  "keyword": "Then "
});
formatter.match({
  "location": "Test22ModeradorEvaluaNegativamenteColeccion.el_moderador_analiza_la_coleccion()"
});
formatter.result({
  "duration": 835538709,
  "status": "passed"
});
formatter.match({
  "location": "Test22ModeradorEvaluaNegativamenteColeccion.lo_valora_negativamente()"
});
formatter.result({
  "duration": 746631934,
  "status": "passed"
});
formatter.match({
  "location": "Test22ModeradorEvaluaNegativamenteColeccion.la_coleccion_se_elimina_por_no_cumplir_los_requisitos()"
});
formatter.result({
  "duration": 734360912,
  "status": "passed"
});
formatter.uri("23ModeradorEliminaColecciones.feature");
formatter.feature({
  "comments": [
    {
      "line": 1,
      "value": "#Author: Sergio Perez Sanchez"
    }
  ],
  "line": 3,
  "name": "Moderador elimina colecciones",
  "description": "",
  "id": "moderador-elimina-colecciones",
  "keyword": "Feature"
});
formatter.scenario({
  "line": 5,
  "name": "Moderador elimina colecciones",
  "description": "",
  "id": "moderador-elimina-colecciones;moderador-elimina-colecciones",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 6,
  "name": "Un moderador lista las colecciones",
  "keyword": "Given "
});
formatter.step({
  "line": 7,
  "name": "Considere oportuno eliminar una coleccion",
  "keyword": "When "
});
formatter.step({
  "line": 8,
  "name": "Elimina la coleccion",
  "keyword": "Then "
});
formatter.match({
  "location": "Test23ModeradorEliminaColecciones.un_moderador_lista_las_colecciones()"
});
formatter.result({
  "duration": 2346326628,
  "status": "passed"
});
formatter.match({
  "location": "Test23ModeradorEliminaColecciones.considere_oportuno_eliminar_una_coleccion()"
});
formatter.result({
  "duration": 47371,
  "status": "passed"
});
formatter.match({
  "location": "Test23ModeradorEliminaColecciones.elimina_la_coleccion()"
});
formatter.result({
  "duration": 14270870803,
  "status": "passed"
});
formatter.uri("24UsuarioBuscaColeccionesFlashcards.feature");
formatter.feature({
  "comments": [
    {
      "line": 1,
      "value": "#Author: Sergio Perez Sanchez"
    }
  ],
  "line": 3,
  "name": "Usuario busca colecciones Flashcards",
  "description": "",
  "id": "usuario-busca-colecciones-flashcards",
  "keyword": "Feature"
});
formatter.scenario({
  "line": 5,
  "name": "Un usuario busca colecciones Flashcards",
  "description": "",
  "id": "usuario-busca-colecciones-flashcards;un-usuario-busca-colecciones-flashcards",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 6,
  "name": "Un usuario quiere visualizar una coleccion",
  "keyword": "Given "
});
formatter.step({
  "line": 7,
  "name": "Lista las colecciones en el buscador",
  "keyword": "When "
});
formatter.step({
  "line": 8,
  "name": "Encuentra la coleccion buscada",
  "keyword": "Then "
});
formatter.match({
  "location": "Test24UsuarioBuscaColeccionesFlashcards.un_usuario_quiere_visualizar_una_coleccion()"
});
formatter.result({
  "duration": 5918269117,
  "status": "passed"
});
formatter.match({
  "location": "Test24UsuarioBuscaColeccionesFlashcards.lista_las_colecciones_en_el_buscador()"
});
formatter.result({
  "duration": 2470062814,
  "status": "passed"
});
formatter.match({
  "location": "Test24UsuarioBuscaColeccionesFlashcards.encuentra_la_coleccion_buscada()"
});
formatter.result({
  "duration": 70661,
  "status": "passed"
});
formatter.uri("25UsuarioVisualizaColecciónFlashcards.feature");
formatter.feature({
  "comments": [
    {
      "line": 1,
      "value": "#Author: Sergio Perez Sanchez"
    }
  ],
  "line": 3,
  "name": "Usuario visualiza una coleccion",
  "description": "",
  "id": "usuario-visualiza-una-coleccion",
  "keyword": "Feature"
});
formatter.scenario({
  "line": 5,
  "name": "Usuario visualiza una coleccion",
  "description": "",
  "id": "usuario-visualiza-una-coleccion;usuario-visualiza-una-coleccion",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 6,
  "name": "Un usuario localiza una coleccion",
  "keyword": "Given "
});
formatter.step({
  "line": 7,
  "name": "La abre",
  "keyword": "When "
});
formatter.step({
  "line": 8,
  "name": "Puede ver las tarjetas y los datos acerca de esta",
  "keyword": "Then "
});
formatter.match({
  "location": "Test25UsuarioVisualizaColeccionFlashcards.un_usuario_localiza_una_coleccion()"
});
formatter.result({
  "duration": 1235949414,
  "status": "passed"
});
formatter.match({
  "location": "Test25UsuarioVisualizaColeccionFlashcards.la_abre()"
});
formatter.result({
  "duration": 701672270,
  "status": "passed"
});
formatter.match({
  "location": "Test25UsuarioVisualizaColeccionFlashcards.puede_ver_las_tarjetas_y_los_datos_acerca_de_esta()"
});
formatter.result({
  "duration": 1128147989,
  "status": "passed"
});
formatter.uri("26UsuarioEliminaPerfil.feature");
formatter.feature({
  "comments": [
    {
      "line": 1,
      "value": "#Author: Sergio Perez Sanchez"
    }
  ],
  "line": 3,
  "name": "Como usuario quiero eliminar mi perfil para no acceder mas",
  "description": "",
  "id": "como-usuario-quiero-eliminar-mi-perfil-para-no-acceder-mas",
  "keyword": "Feature"
});
formatter.scenario({
  "line": 5,
  "name": "Un usuario va a eliminar su perfil",
  "description": "",
  "id": "como-usuario-quiero-eliminar-mi-perfil-para-no-acceder-mas;un-usuario-va-a-eliminar-su-perfil",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 6,
  "name": "Una persona quiere eliminar su perfil",
  "keyword": "Given "
});
formatter.step({
  "line": 7,
  "name": "Da a eliminar",
  "keyword": "When "
});
formatter.step({
  "line": 8,
  "name": "Elimina su perfil",
  "keyword": "Then "
});
formatter.match({
  "location": "Test26UsuarioEliminaPerfil.una_persona_quiere_eliminar_su_perfil()"
});
formatter.result({
  "duration": 1046164857,
  "status": "passed"
});
formatter.match({
  "location": "Test26UsuarioEliminaPerfil.da_a_eliminar()"
});
formatter.result({
  "duration": 1549700695,
  "status": "passed"
});
formatter.match({
  "location": "Test26UsuarioEliminaPerfil.elimina_su_perfil()"
});
formatter.result({
  "duration": 88307535,
  "status": "passed"
});
});