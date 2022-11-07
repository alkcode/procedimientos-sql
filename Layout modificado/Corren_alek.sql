---*              Parametros(fec_pago, tipo, Empresa)
--execute procedure tab_porcn_pruebas_2022_alek('31/05/2022','0','01'); ---Cero Ordinarias
---execute procedure tab_porcn('24/09/2018','1','01'); ---Uno Extraordinarias
execute procedure spm4_layoutsatn_pruebas_2022_alek("30/09/2022","0","01","'407986'");
---execute procedure verif_longn();
---*Comentar veri_cifras para ISSSTE ASEGURADOR se verifica en spm4_layoutSATn*
---execute procedure verif_cifrasn_2022('15/03/2021','0','01');
---select count(*),' Errores Cifras  ' from error_cifrasn;
---select count(*),' Errores Longitud' from tab_errorn;
