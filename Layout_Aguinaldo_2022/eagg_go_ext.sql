---*              Parametros(fec_pago, Nomina, Empresa, tipo, tipo impacum_05)
---execute procedure tab_porcu('15/10/2019','O','01'); ---Cero Ordinarias
execute procedure tab_porcu_AGUI_2022_EAGG('07/11/2022','E','01','1'); ---Uno Extraordinarias
execute procedure layout_AGUI_2022_EAGG ('07/11/2022','E','01','1');


select count(*),' Errores Cifras  ' from error_cifras;
select count(*),' Errores Longitud' from tab_error;