--Linea 440
select pagaduria 
         from ramo_ct_tim where ct10 = '2702120100'; 

--Linea 444
select cp
  from m4t_domicilios_issste where id_centro_pago = '27000';
  
--Linea 452 
select n_puesto_plaza
         from m4t_puestos_plaza where id_sociedad = '01' and id_empresa = '01' and id_puesto_plaza = 'M01010';
         
--Linea 460   
select n_clave_servicio
  from m4t_clave_servicio where id_sociedad = '01' and id_empresa = '01' and id_clave_servicio = '17200';


--lINEA 518

select count(*) from m4t_empleados 
   where id_sociedad='01' and id_empleado='158125' and length(id_c_u_r_p_st)!= 18;

select count(*) from m4t_empleados 
                where id_sociedad='01' and id_empleado='158125' and id_c_u_r_p_st matches'*Ñ*';
               
--Linea 537
select porcent from porc_empn where id_empleado='158125';

--Linea 546
select  min(b.fecha_ini_ts)
        from m4t_acumulado_rl1_2011 a, m4t_acumulado_rl_2011 b 
        where a.id_empleado = '158125' and a.fec_pago = '2022-07-15' and a.id_empresa = '01'
        and a.id_empleado = b.id_empleado and a.fec_pago = b.fec_pago and a.fec_imputacion = b.fec_imputacion;
        --resultado -> 2022-05-01
 
--Linea 552
 SELECT case 
         when a.id_tipo_tabulador='A' then a.id_nivel
         when a.id_tipo_tabulador='B' then a.id_nivel
         when a.id_tipo_tabulador='E' then a.id_nivel
         when a.id_tipo_tabulador='F' then a.id_grupo_grado_nivel
         when a.id_tipo_tabulador='M' then a.id_nivel
         when a.id_tipo_tabulador='O' then a.id_nivel
         when a.id_tipo_tabulador='R' then a.id_nivel
         end, 
         case
         when a.id_tipo_tabulador='A' then a.id_sub_nivel
         when a.id_tipo_tabulador='B' then a.id_sub_nivel
         when a.id_tipo_tabulador='E' then a.id_sub_nivel
         when a.id_tipo_tabulador='F' then a.id_integracion
         when a.id_tipo_tabulador='M' then a.id_sub_nivel
         when a.id_tipo_tabulador='O' then a.id_sub_nivel
         when a.id_tipo_tabulador='R' then a.id_sub_nivel
         end 
         case, a.id_zona, max(a.fec_imputacion)
            from m4t_acumulado_rl1_2011 a, m4t_acumulado_rl_2011 b 
               where a.id_sociedad=b.id_sociedad and 
                     a.id_empleado=b.id_empleado and 
                     a.fec_alta_empleado=b.fec_alta_empleado and 
                     a.fec_pago=b.fec_pago and 
                     a.fec_imputacion=b.fec_imputacion and
                     a.id_empleado = '158125'  and a.fec_pago  = '2022-07-15' and a.id_empresa = '01'
               group by 1,2,3;
   --Resultado
   --(expression)	case	id_zona	   (max)
      --   20	     8	    3	    2022-05-15
      



--Linea 582 -> Aqui se asigna el valor de la bandera 
 select count(*) wbandera01
     from m4t_acumulado_rl1_2011 a, m4t_acumulado_rl_2011 b 
     where a.id_empleado = '158125' 
        and a.fec_pago = '2022-07-15'
        and a.fec_pago = a.fec_imputacion 
        and a.id_empresa = '01'
        and a.id_empleado = b.id_empleado 
        and a.fec_pago = b.fec_pago 
        and a.fec_imputacion = b.fec_imputacion;
     --Resultado ->
     --(count(*))
       --   0
       
 --Entra al else
 --Linea 622
select max(a.fec_imputacion)
        from m4t_acumulado_rl1_2011 a, m4t_acumulado_rl_2011 b 
        where a.id_empleado = '158125' and a.fec_pago = '2022-07-15' and a.id_empresa = '01'
        and a.id_empleado = b.id_empleado and a.fec_pago = b.fec_pago and a.fec_imputacion = b.fec_imputacion;
        --Resultado
        --(max)
      --2022-05-15


--Si entra en el IF linea 589
select a.c_sindic_local, a.c_sindic_nacion, a.d_antig_gob_fed, b.fecha_ingreso_st, a.prme_cont_tot, a.prme_cont_per, nvl(a.comentario, ''), a.id_puesto_plaza, a.id_centro_trab,a.id_centro_pago,b.fec_alta_empleado--,--b.fecha_ini_ts, 
               ---a.id_nivel, a.id_sub_nivel, a.id_grupo_grado_nivel, a.id_integracion, a.id_zona,a.id_tipo_tabulador---, a.comentario 
         --, --wfecha_ini_ts
               ---wid_nivel, wid_sub_nivel, wid_grupo_grado_nivel, wid_integracion, wid_zona, wid_tipo_tabulador
         from m4t_acumulado_rl1_2011 a, m4t_acumulado_rl_2011 b 
         where a.id_empleado = '158125'
            and a.fec_pago = '2022-07-15' 
            and a.fec_pago = a.fec_imputacion 
            and a.id_empresa = '01'
            and a.id_empleado = b.id_empleado 
            and a.fec_pago = b.fec_pago 
            and a.fec_imputacion = b.fec_imputacion;

--Else
--Linea 622
select max(a.fec_imputacion) 
        from m4t_acumulado_rl1_2011 a, m4t_acumulado_rl_2011 b 
        where a.id_empleado = '158125' 
            and a.fec_pago = '2022-07-15' 
            and a.id_empresa = '01'
            and a.id_empleado = b.id_empleado 
            and a.fec_pago = b.fec_pago 
            and a.fec_imputacion = b.fec_imputacion;
           -- (max)
           --2022-05-15

--Linea 627

select a.c_sindic_local, a.c_sindic_nacion, a.d_antig_gob_fed, b.fecha_ingreso_st --, a.prme_cont_tot, a.prme_cont_per, nvl(a.comentario, ''), a.id_puesto_plaza, a.id_centro_trab,a.id_centro_pago,b.fec_alta_empleado
	from m4t_acumulado_rl1_2011 a, m4t_acumulado_rl_2011 b 
	where a.id_empleado = '158125'
	   and a.fec_pago = '2022-07-15' 
	   and a.fec_imputacion = '2022-05-15' 
	   and a.id_empresa = '01'
     and a.id_empleado = b.id_empleado 
     and a.fec_pago = b.fec_pago 
     and a.fec_imputacion = b.fec_imputacion;
        --c_sindic_local	c_sindic_nacion	d_antig_gob_fed	fecha_ingreso_st
        --      0.00	           0.00	         12826.00	     1986-10-01

--Liena 644
select n_puesto_plaza
        from m4t_puestos_plaza where id_sociedad = '01' and id_empresa = '01' and id_puesto_plaza = 'M01010';
--Se deberia usar wipuesto que es una variable de la consulta general

--Linea 670      
select c_estado from c_estado where id_div_geografica = '27';
--c_estado
--  TAB


--Linea 675
select count(*) from m4t_datos_pago where id_empleado = '158125'; --Linea670
--Resultado 1


--Linea 674
select id_forma_pago,id_banco,num_cuenta from m4t_datos_pago where id_empleado = '158125'; --Linea 674
--id_forma_pago	id_banco  	   num_cuenta
--  CHEQUE	       BNTE	   000000000665660982


--Linea 691
--LOG 744
select c_banco from c_banco where id_banco = 'BNMX';


select n_clave_servicio 
  from m4t_clave_servicio where id_sociedad = '01' and id_empresa = '01' and id_clave_servicio = '17200';
         
     
 

     


       
         
