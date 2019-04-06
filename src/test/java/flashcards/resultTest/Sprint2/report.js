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
  "duration": 2868527450,
  "status": "passed"
});
formatter.match({
  "location": "Test01UsuarioCreaCuentaUsuario.introduce_los_datos_correctamente()"
});
formatter.result({
  "duration": 1110087328,
  "status": "passed"
});
formatter.match({
  "location": "Test01UsuarioCreaCuentaUsuario.se_registra_correctamente()"
});
formatter.result({
  "duration": 256975965,
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
  "duration": 3946790,
  "status": "passed"
});
formatter.match({
  "location": "Test01UsuarioCreaCuentaUsuario.introduce_un_username_existente()"
});
formatter.result({
  "duration": 674568273,
  "status": "passed"
});
formatter.match({
  "location": "Test01UsuarioCreaCuentaUsuario.no_se_registra()"
});
formatter.result({
  "duration": 40003190,
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
  "duration": 4495503,
  "status": "passed"
});
formatter.match({
  "location": "Test01UsuarioCreaCuentaUsuario.el_username_contiene_un_caracter_invalido()"
});
formatter.result({
  "duration": 43029,
  "status": "passed"
});
formatter.match({
  "location": "Test01UsuarioCreaCuentaUsuario.no_se_registra()"
});
formatter.result({
  "duration": 669373653,
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
  "duration": 3355048,
  "status": "passed"
});
formatter.match({
  "location": "Test01UsuarioCreaCuentaUsuario.la_longitud_del_username_es_incorrecta()"
});
formatter.result({
  "duration": 30791,
  "status": "passed"
});
formatter.match({
  "location": "Test01UsuarioCreaCuentaUsuario.no_se_registra()"
});
formatter.result({
  "duration": 769196486,
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
  "duration": 3190038,
  "status": "passed"
});
formatter.match({
  "location": "Test01UsuarioCreaCuentaUsuario.la_clave_contiene_un_caracter_invalido()"
});
formatter.result({
  "duration": 54477,
  "status": "passed"
});
formatter.match({
  "location": "Test01UsuarioCreaCuentaUsuario.no_se_registra()"
});
formatter.result({
  "duration": 668808360,
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
  "duration": 3274517,
  "status": "passed"
});
formatter.match({
  "location": "Test01UsuarioCreaCuentaUsuario.la_longitud_de_la_clave_es_incorrecta()"
});
formatter.result({
  "duration": 40265,
  "status": "passed"
});
formatter.match({
  "location": "Test01UsuarioCreaCuentaUsuario.no_se_registra()"
});
formatter.result({
  "duration": 1113806343,
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
  "duration": 3081085,
  "status": "passed"
});
formatter.match({
  "location": "Test01UsuarioCreaCuentaUsuario.introduce_un_email_existente()"
});
formatter.result({
  "duration": 1140853182,
  "status": "passed"
});
formatter.match({
  "location": "Test01UsuarioCreaCuentaUsuario.no_se_registra()"
});
formatter.result({
  "duration": 58779456,
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
  "name": "Como usuario quiero acceder al sistema para usar la aplicación",
  "description": "",
  "id": "como-usuario-quiero-acceder-al-sistema-para-usar-la-aplicación",
  "keyword": "Feature"
});
formatter.scenario({
  "line": 5,
  "name": "Login correcto. Login mediante email",
  "description": "",
  "id": "como-usuario-quiero-acceder-al-sistema-para-usar-la-aplicación;login-correcto.-login-mediante-email",
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
  "duration": 15885454,
  "status": "passed"
});
formatter.match({
  "location": "Test02UsuarioIniciaSesion.se_loguea_con_el_email()"
});
formatter.result({
  "duration": 1430425888,
  "status": "passed"
});
formatter.match({
  "location": "Test02UsuarioIniciaSesion.se_loguea_correctamente()"
});
formatter.result({
  "duration": 25264,
  "status": "passed"
});
formatter.scenario({
  "line": 10,
  "name": "Login correcto. Login mediante username",
  "description": "",
  "id": "como-usuario-quiero-acceder-al-sistema-para-usar-la-aplicación;login-correcto.-login-mediante-username",
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
  "duration": 3840995,
  "status": "passed"
});
formatter.match({
  "location": "Test02UsuarioIniciaSesion.se_loguea_con_el_username()"
});
formatter.result({
  "duration": 650932142,
  "status": "passed"
});
formatter.match({
  "location": "Test02UsuarioIniciaSesion.se_loguea_correctamente()"
});
formatter.result({
  "duration": 16580,
  "status": "passed"
});
formatter.scenario({
  "line": 15,
  "name": "Login incorrecto. Error en el email",
  "description": "",
  "id": "como-usuario-quiero-acceder-al-sistema-para-usar-la-aplicación;login-incorrecto.-error-en-el-email",
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
  "duration": 3052268,
  "status": "passed"
});
formatter.match({
  "location": "Test02UsuarioIniciaSesion.el_email_es_erroneo()"
});
formatter.result({
  "duration": 682341452,
  "status": "passed"
});
formatter.match({
  "location": "Test02UsuarioIniciaSesion.no_se_puede_loguear()"
});
formatter.result({
  "duration": 21317,
  "status": "passed"
});
formatter.scenario({
  "line": 20,
  "name": "Login incorrecto. Error en el username",
  "description": "",
  "id": "como-usuario-quiero-acceder-al-sistema-para-usar-la-aplicación;login-incorrecto.-error-en-el-username",
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
  "duration": 2736856,
  "status": "passed"
});
formatter.match({
  "location": "Test02UsuarioIniciaSesion.el_username_es_erroneo()"
});
formatter.result({
  "duration": 732984551,
  "status": "passed"
});
formatter.match({
  "location": "Test02UsuarioIniciaSesion.no_se_puede_loguear()"
});
formatter.result({
  "duration": 17370,
  "status": "passed"
});
formatter.scenario({
  "line": 25,
  "name": "Login incorrecto. Error en la clave",
  "description": "",
  "id": "como-usuario-quiero-acceder-al-sistema-para-usar-la-aplicación;login-incorrecto.-error-en-la-clave",
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
  "duration": 2565926,
  "status": "passed"
});
formatter.match({
  "location": "Test02UsuarioIniciaSesion.la_clave_es_erronea()"
});
formatter.result({
  "duration": 682074595,
  "status": "passed"
});
formatter.match({
  "location": "Test02UsuarioIniciaSesion.no_se_puede_loguear()"
});
formatter.result({
  "duration": 17370,
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
  "duration": 2887260,
  "status": "passed"
});
formatter.match({
  "location": "Test03UsuarioVePerfil.se_loguea_con_el_username()"
});
formatter.result({
  "duration": 642162990,
  "status": "passed"
});
formatter.match({
  "location": "Test03UsuarioVePerfil.ve_el_perfil_con_el_username()"
});
formatter.result({
  "duration": 115315898,
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
  "duration": 2985159,
  "status": "passed"
});
formatter.match({
  "location": "Test03UsuarioVePerfil.se_loguea_con_el_email()"
});
formatter.result({
  "duration": 686630102,
  "status": "passed"
});
formatter.match({
  "location": "Test03UsuarioVePerfil.ve_el_perfil_con_el_email()"
});
formatter.result({
  "duration": 131478866,
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
  "duration": 694863568,
  "status": "passed"
});
formatter.match({
  "location": "Test04UsuarioActualizaPerfil.cambia_los_datos()"
});
formatter.result({
  "duration": 34343,
  "status": "passed"
});
formatter.match({
  "location": "Test04UsuarioActualizaPerfil.se_actualiza_el_perfil_correctamente()"
});
formatter.result({
  "duration": 227321749,
  "status": "passed"
});
formatter.uri("05AdministradorCambiaRolUsuario.feature");
formatter.feature({
  "comments": [
    {
      "line": 1,
      "value": "#Author: Sergio Perez Sanchez"
    }
  ],
  "line": 3,
  "name": "Administrador Cambia Rol Usuario",
  "description": "",
  "id": "administrador-cambia-rol-usuario",
  "keyword": "Feature"
});
formatter.scenario({
  "line": 5,
  "name": "Administrador Cambia Rol Usuario",
  "description": "",
  "id": "administrador-cambia-rol-usuario;administrador-cambia-rol-usuario",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 6,
  "name": "Un administrador va a cambiar el rol de un usuario",
  "keyword": "Given "
});
formatter.step({
  "line": 7,
  "name": "Localiza al usuario",
  "keyword": "When "
});
formatter.step({
  "line": 8,
  "name": "Cambia el rol de este",
  "keyword": "Then "
});
formatter.match({
  "location": "Test05AdministradorCambiaRolUsuario.un_administrador_va_a_cambiar_el_rol_de_un_usuario()"
});
formatter.result({
  "duration": 757711004,
  "status": "passed"
});
formatter.match({
  "location": "Test05AdministradorCambiaRolUsuario.localiza_al_usuario()"
});
formatter.result({
  "duration": 165201062,
  "status": "passed"
});
formatter.match({
  "location": "Test05AdministradorCambiaRolUsuario.cambia_el_rol_de_este()"
});
formatter.result({
  "duration": 441803996,
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
  "name": "Administrador Elimina Usuario",
  "description": "",
  "id": "administrador-elimina-usuario",
  "keyword": "Feature"
});
formatter.scenario({
  "line": 5,
  "name": "Administrador Elimina Usuario",
  "description": "",
  "id": "administrador-elimina-usuario;administrador-elimina-usuario",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 6,
  "name": "El administrador va a eliminar un usuario",
  "keyword": "Given "
});
formatter.step({
  "line": 7,
  "name": "Encuentra al usuario",
  "keyword": "When "
});
formatter.step({
  "line": 8,
  "name": "Elimina al usuario",
  "keyword": "Then "
});
formatter.match({
  "location": "Test06AdministradorEliminaUsuario.el_administrador_va_a_eliminar_un_usuario()"
});
formatter.result({
  "duration": 756735952,
  "status": "passed"
});
formatter.match({
  "location": "Test06AdministradorEliminaUsuario.encuentra_al_usuario()"
});
formatter.result({
  "duration": 157752770,
  "status": "passed"
});
formatter.match({
  "location": "Test06AdministradorEliminaUsuario.elimina_al_usuario()"
});
formatter.result({
  "duration": 117730631,
  "status": "passed"
});
formatter.uri("07UsuarioBuscaUsuarios.feature");
formatter.feature({
  "comments": [
    {
      "line": 1,
      "value": "#Author: Sergio Perez Sanchez"
    }
  ],
  "line": 3,
  "name": "Usuario busca a otros usuarios",
  "description": "",
  "id": "usuario-busca-a-otros-usuarios",
  "keyword": "Feature"
});
formatter.scenario({
  "line": 5,
  "name": "Usuario busca a otros usuarios",
  "description": "",
  "id": "usuario-busca-a-otros-usuarios;usuario-busca-a-otros-usuarios",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 6,
  "name": "Un usuario conectado",
  "keyword": "Given "
});
formatter.step({
  "line": 7,
  "name": "Lista a los usuarios",
  "keyword": "When "
});
formatter.step({
  "line": 8,
  "name": "Encuentra a otros usuarios",
  "keyword": "Then "
});
formatter.match({
  "location": "Test07UsuarioBuscaUsuarios.un_usuario_conectado()"
});
formatter.result({
  "duration": 667365915,
  "status": "passed"
});
formatter.match({
  "location": "Test07UsuarioBuscaUsuarios.lista_a_los_usuarios()"
});
formatter.result({
  "duration": 397245300,
  "status": "passed"
});
formatter.match({
  "location": "Test07UsuarioBuscaUsuarios.encuentra_a_otros_usuarios()"
});
formatter.result({
  "duration": 19343,
  "status": "passed"
});
formatter.uri("08UsuarioEnviaPeticionAmistad.feature");
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
  "name": "Un usuario encuentra un usuario",
  "keyword": "Given "
});
formatter.step({
  "line": 7,
  "name": "Envia una peticion de amistad",
  "keyword": "When "
});
formatter.step({
  "line": 8,
  "name": "Otro usuario recibe esa invitacion",
  "keyword": "Then "
});
formatter.match({
  "location": "Test08UsuarioEnviaPeticionDeAmistad.un_usuario_encuentra_un_usuario()"
});
formatter.result({
  "duration": 720896669,
  "status": "passed"
});
formatter.match({
  "location": "Test08UsuarioEnviaPeticionDeAmistad.envia_una_peticion_de_amistad()"
});
formatter.result({
  "duration": 824372592,
  "status": "passed"
});
formatter.match({
  "location": "Test08UsuarioEnviaPeticionDeAmistad.otro_usuario_recibe_esa_invitacion()"
});
formatter.result({
  "duration": 138284492,
  "status": "passed"
});
formatter.uri("09UsuarioRecibePeticionAmistad.feature");
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
  "name": "Un usuario conectado a la aplicacion",
  "keyword": "Given "
});
formatter.step({
  "line": 7,
  "name": "Consulta las peticiones recibidas",
  "keyword": "When "
});
formatter.step({
  "line": 8,
  "name": "Lista las peticiones",
  "keyword": "Then "
});
formatter.match({
  "location": "Test09UsuarioRecibePeticionAmistad.un_usuario_conectado_a_la_aplicacion()"
});
formatter.result({
  "duration": 666464682,
  "status": "passed"
});
formatter.match({
  "location": "Test09UsuarioRecibePeticionAmistad.consulta_las_peticiones_recibidas()"
});
formatter.result({
  "duration": 687549888,
  "status": "passed"
});
formatter.match({
  "location": "Test09UsuarioRecibePeticionAmistad.lista_las_peticiones()"
});
formatter.result({
  "duration": 56845,
  "status": "passed"
});
formatter.uri("10UsuarioAceptaPeticion.feature");
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
  "name": "Un usuario tiene una peticion de amistad",
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
  "location": "Test10UsuarioAceptaPeticion.un_usuario_tiene_una_peticion_de_amistad()"
});
formatter.result({
  "duration": 1014524724,
  "status": "passed"
});
formatter.match({
  "location": "Test10UsuarioAceptaPeticion.acepta_la_peticion()"
});
formatter.result({
  "duration": 194543814,
  "status": "passed"
});
formatter.match({
  "location": "Test10UsuarioAceptaPeticion.son_amigos()"
});
formatter.result({
  "duration": 78657096,
  "status": "passed"
});
formatter.uri("11UsuarioRechazaPeticion.feature");
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
  "name": "Un usuario recibe peticiones de amistad",
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
  "location": "Test11UsuarioRechazaPeticionAmistad.un_usuario_recibe_peticiones_de_amistad()"
});
formatter.result({
  "duration": 904514767,
  "status": "passed"
});
formatter.match({
  "location": "Test11UsuarioRechazaPeticionAmistad.no_quiere_conectar()"
});
formatter.result({
  "duration": 263841200,
  "status": "passed"
});
formatter.match({
  "location": "Test11UsuarioRechazaPeticionAmistad.rechaza_la_peticion()"
});
formatter.result({
  "duration": 76632383,
  "status": "passed"
});
formatter.uri("12UsuarioEliminaAmigo.feature");
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
  "name": "Un usuario tiene un amigo",
  "keyword": "Given "
});
formatter.step({
  "line": 7,
  "name": "No quiere conectar mas",
  "keyword": "When "
});
formatter.step({
  "line": 8,
  "name": "Elimina amigo",
  "keyword": "Then "
});
formatter.match({
  "location": "Test12UsuarioEliminaAmigo.un_usuario_tiene_un_amigo()"
});
formatter.result({
  "duration": 651402693,
  "status": "passed"
});
formatter.match({
  "location": "Test12UsuarioEliminaAmigo.no_quiere_conectar_mas()"
});
formatter.result({
  "duration": 248917771,
  "status": "passed"
});
formatter.match({
  "location": "Test12UsuarioEliminaAmigo.elimina_amigo()"
});
formatter.result({
  "duration": 80584700,
  "status": "passed"
});
formatter.uri("13UsuarioBloqueaUsuario.feature");
formatter.feature({
  "comments": [
    {
      "line": 1,
      "value": "#Author: Sergio Perez Sanchez"
    }
  ],
  "line": 3,
  "name": "Usuario bloquea usuario",
  "description": "",
  "id": "usuario-bloquea-usuario",
  "keyword": "Feature"
});
formatter.scenario({
  "line": 5,
  "name": "Usuario bloquea usuario",
  "description": "",
  "id": "usuario-bloquea-usuario;usuario-bloquea-usuario",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 6,
  "name": "Usuario quiere bloquear a otro",
  "keyword": "Given "
});
formatter.step({
  "line": 7,
  "name": "Bloquea al usuario",
  "keyword": "When "
});
formatter.step({
  "line": 8,
  "name": "No pueden ser amigos",
  "keyword": "Then "
});
formatter.match({
  "location": "Test13UsuarioBloqueaUsuario.usuario_quiere_bloquear_a_otro()"
});
formatter.result({
  "duration": 693628765,
  "status": "passed"
});
formatter.match({
  "location": "Test13UsuarioBloqueaUsuario.bloquea_al_usuario()"
});
formatter.result({
  "duration": 403777360,
  "status": "passed"
});
formatter.match({
  "location": "Test13UsuarioBloqueaUsuario.no_pueden_ser_amigos()"
});
formatter.result({
  "duration": 119797978,
  "status": "passed"
});
formatter.uri("14UsuarioDesbloqueaBloqueado.feature");
formatter.feature({
  "comments": [
    {
      "line": 1,
      "value": "#Author: Sergio Perez Sanchez"
    }
  ],
  "line": 3,
  "name": "Usuario desbloquea usuario",
  "description": "",
  "id": "usuario-desbloquea-usuario",
  "keyword": "Feature"
});
formatter.scenario({
  "line": 5,
  "name": "Usuario desbloquea usuario",
  "description": "",
  "id": "usuario-desbloquea-usuario;usuario-desbloquea-usuario",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 6,
  "name": "Un usuario tiene bloqueado a otro",
  "keyword": "Given "
});
formatter.step({
  "line": 7,
  "name": "Quiere desbloquearlo",
  "keyword": "When "
});
formatter.step({
  "line": 8,
  "name": "Desbloquea al usuario",
  "keyword": "Then "
});
formatter.match({
  "location": "Test14UsuarioDesbloqueaBloqueado.un_usuario_tiene_bloqueado_a_otro()"
});
formatter.result({
  "duration": 705401631,
  "status": "passed"
});
formatter.match({
  "location": "Test14UsuarioDesbloqueaBloqueado.quiere_desbloquearlo()"
});
formatter.result({
  "duration": 394519496,
  "status": "passed"
});
formatter.match({
  "location": "Test14UsuarioDesbloqueaBloqueado.desbloquea_al_usuario()"
});
formatter.result({
  "duration": 118077623,
  "status": "passed"
});
formatter.uri("15UsuarioEliminaPerfil.feature");
formatter.feature({
  "comments": [
    {
      "line": 1,
      "value": "#Author: Sergio Perez Sanchez"
    }
  ],
  "line": 3,
  "name": "Como usuario quiero eliminar mi perfil para no acceder más",
  "description": "",
  "id": "como-usuario-quiero-eliminar-mi-perfil-para-no-acceder-más",
  "keyword": "Feature"
});
formatter.scenario({
  "line": 5,
  "name": "Eliminar Perfil",
  "description": "",
  "id": "como-usuario-quiero-eliminar-mi-perfil-para-no-acceder-más;eliminar-perfil",
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
  "location": "Test15UsuarioEliminaPerfil.una_persona_quiere_eliminar_su_perfil()"
});
formatter.result({
  "duration": 699840281,
  "status": "passed"
});
formatter.match({
  "location": "Test15UsuarioEliminaPerfil.da_a_eliminar()"
});
formatter.result({
  "duration": 361539445,
  "status": "passed"
});
formatter.match({
  "location": "Test15UsuarioEliminaPerfil.elimina_su_perfil()"
});
formatter.result({
  "duration": 91427911,
  "status": "passed"
});
});