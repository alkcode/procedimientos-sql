---*              Parametros(fec_pago, Nomina, Empresa, tipo, tipo impacum_05)
---execute procedure tab_porcu('15/10/2019','O','01'); ---Cero Ordinarias
execute procedure eagg_tab_porcu_sat_ext_y_ord_2023('06/01/2023','E','01','1','1'); ---Uno Extraordinarias
execute procedure eagg_layout_sat_ext_y_ord_2023 ('06/01/2023','E','01','1','1');
execute procedure verif_long1();
---*Comentar veri_cifras para ISSSTE ASEGURADOR se verifica en spm4_layoutSATu*
--execute procedure verif_cifras1_2022('06/12/2020','E','01');
select count(*),' Errores Cifras  ' from error_cifras;
select count(*),' Errores Longitud' from tab_error;