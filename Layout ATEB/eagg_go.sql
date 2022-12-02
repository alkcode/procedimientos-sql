---*              Parametros(fec_pago, tipo, Empresa)
execute procedure eagg_tab_porcu_ord_2022_ATEB('31/10/2022','0','01'); ---Cero Ordinarias
---execute procedure tab_porcu('24/09/2018','1','01'); ---Uno Extraordinarias
execute procedure eagg_layout_sat_ord_2022_ATEB('31/10/2022','0','01');
execute procedure verif_long1();
---*Comentar veri_cifras para ISSSTE ASEGURADOR se verifica en spm4_layoutSATu*
---execute procedure verif_cifras1('30/04/2020','0','01');
select count(*),' Errores Cifras  ' from error_cifras;
select count(*),' Errores Longitud' from tab_error;