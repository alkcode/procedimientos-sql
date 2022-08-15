--Linea 85
 Select fec_inicio,fec_fin
    From m4sys_hist_pagas where fec_paga='2022-07-15';
    --fec_inicio	fec_fin
    --2022-07-01	2022-07-15 

    
--Linea 96
Select count(*) 
      From timb_cons20 
      Where fec_pago = '2022-07-15'
        And fec_crea = current
        And empresa = '01'
        And descripcion = 'O';
        --0
        
--Linea 105
Select max(num_consf)
      From timb_cons20
      Where fec_pago >= '2019-01-15'
        And empresa = '01';
        --Devuelve -> 2324309
        
--Linea 448
Select nss, curp, filiacion
      From m4_inf_bmex
      Where id_empleado = '158125' and u_version = 'I'; 
--  nss           	curp	          filiacion
--80915230454	RACF520312HTCMLR06	RACF5203123P5

--Linea 484
 Select porcent From porc_empn Where id_empleado='158125';
 --Resultado vacio
 

--Linea 492
Select
          Case 
            When a.id_tipo_tabulador='F' Then a.id_grupo_grado_nivel
            Else a.id_nivel
          End GGN_Nivel,
          Case
            When a.id_tipo_tabulador='F' Then a.id_integracion
            Else a.id_sub_nivel
          End Int_SubNivel,
          a.id_zona, max(a.fec_imputacion), MIN(b.fecha_ini_ts), COUNT(*)
        From m4t_acumulado_rl1_2011 a, m4t_acumulado_rl_2011 b 
        where a.id_empleado = '158125'
          And a.fec_pago = '2022-07-15'
          And a.id_empresa = '01'
          And a.id_empleado = b.id_empleado
          And a.fec_pago = b.fec_pago
          And a.fec_imputacion = b.fec_imputacion
          And a.fec_alta_empleado=b.fec_alta_empleado
          And a.id_sociedad=b.id_sociedad
          group by GGN_Nivel,Int_SubNivel,id_zona;
--          ggn_nivel	int_subnivel	id_zona	   (max)	        (min)	  (count(*))
--              20	         8	        3	    2022-05-15	2022-05-01	  1


-------------------------------------------------------------------------------------
--SI LA BANDERA =1
--lINEA 517
 Select a.c_sindic_local, a.c_sindic_nacion, a.d_antig_gob_fed, b.fecha_ingreso_st, a.prme_cont_tot, a.prme_cont_per, nvl(a.comentario, ''), a.id_puesto_plaza, a.id_centro_trab,a.id_centro_pago,b.fec_alta_empleado
          From m4t_acumulado_rl1_2011 a, m4t_acumulado_rl_2011 b 
          Where a.id_empleado = '158125'
            And a.fec_pago = '2022-07-15'
            And a.fec_pago = a.fec_imputacion
            And a.id_empresa = '01'
            And a.id_empleado = b.id_empleado
            And a.fec_pago = b.fec_pago
            And a.fec_imputacion = b.fec_imputacion;        
            --c_sindic_local,c_sindic_nacion,d_antig_gob_fed,fecha_ingreso_st,prme_cont_tot,prme_cont_per,(expression),id_puesto_plaza,id_centro_trab,id_centro_pago,fec_alta_empleado
            --  VACIO
            
--SI LA BANDERA ES 0
 --lINEA 533 
Select max(a.fec_imputacion)
          From m4t_acumulado_rl1_2011 a, m4t_acumulado_rl_2011 b 
          where a.id_empleado = '158125'
            And a.fec_pago = '2022-07-15'
            And a.id_empresa = '01'
            And a.id_empleado = b.id_empleado
            And a.fec_pago = b.fec_pago
            And a.fec_imputacion = b.fec_imputacion;
            --(max)
            --2022-05-15
            
--LINEA 542
Select a.c_sindic_local, a.c_sindic_nacion, a.d_antig_gob_fed, b.fecha_ingreso_st--, a.prme_cont_tot, a.prme_cont_per, nvl(a.comentario, ''), a.id_puesto_plaza, a.id_centro_trab,a.id_centro_pago,b.fec_alta_empleado
          From m4t_acumulado_rl1_2011 a, m4t_acumulado_rl_2011 b
          Where a.id_empleado = '158125'
            And a.fec_pago = '2022-07-15'
            And a.fec_imputacion = '2022-05-15'
            And a.id_empresa = '01'
            And a.id_empleado = b.id_empleado
            And a.fec_pago = b.fec_pago
            And a.fec_imputacion = b.fec_imputacion;
           --c_sindic_local	c_sindic_nacion	d_antig_gob_fed	fecha_ingreso_st
           --       0.00	           0.00          	12826.00	    1986-10-01


--------------------------------------------------------------
--LINEA 566
   Select n_puesto_plaza
        From m4t_puestos_plaza
        Where id_sociedad = '01'
          And id_empresa = '01'
          And id_puesto_plaza = 'M01010' ;
          
          --n_puesto_plaza
          --MEDICO ESPECIALISTA "B"

          

--lINEA 587
Select c_estado
      From c_estado
      Where id_div_geografica = 27;
      --c_estado
       -- TAB

      
--lINEA 592
Select count(*)
        From m4t_datos_pago
        Where id_empleado = '158125';
        --(count(*))
        --    1


--lINEA 597        
    Select id_forma_pago,id_banco,num_cuenta
            From m4t_datos_pago
            Where id_empleado = '158125';
            --id_forma_pago	id_banco	num_cuenta
            --      CHEQUE	   BNTE	 000000000665660982


--LINEA 609
 Select c_banco 
          From c_banco
          Where id_banco = 'BNMX';
          --c_banco
          --  002


 Select substr(num_cuenta,1,3) 
               From m4t_datos_pago
              Where id_empleado = '158125';



--Consulta de prueba Linea 542
Select max(a.fec_imputacion)
          From m4t_acumulado_rl1_2011 a, m4t_acumulado_rl_2011 b 
          where a.id_empleado = '181101'
            And a.fec_pago = '2022-07-15'
            And a.id_empresa = '01'
            And a.id_empleado = b.id_empleado
            And a.fec_pago = b.fec_pago
            And a.fec_imputacion = b.fec_imputacion;


Select a.c_sindic_local, a.c_sindic_nacion, a.d_antig_gob_fed, b.fecha_ingreso_st, a.prme_cont_tot, a.prme_cont_per, nvl(a.comentario, ''), a.id_puesto_plaza, a.id_centro_trab,a.id_centro_pago,b.fec_alta_empleado
          From m4t_acumulado_rl1_2011 a, m4t_acumulado_rl_2011 b 
          Where a.id_empleado = '158125'
            And a.fec_pago = '2022-07-15'
            And a.fec_pago = a.fec_imputacion
            And a.id_empresa = '01'
            And a.id_empleado = b.id_empleado
            And a.fec_pago = b.fec_pago
            And a.fec_imputacion = b.fec_imputacion ;


------------------
select a.c_sindic_local, a.c_sindic_nacion, a.d_antig_gob_fed, b.fecha_ingreso_st, a.prme_cont_tot, a.prme_cont_per, nvl(a.comentario, ''), a.id_puesto_plaza, a.id_centro_trab,a.id_centro_pago,b.fec_alta_empleado--,--b.fecha_ini_ts, 
            ---a.id_nivel, a.id_sub_nivel, a.id_grupo_grado_nivel, a.id_integracion, a.id_zona,a.id_tipo_tabulador---, a.comentario
            ---wid_nivel, wid_sub_nivel, wid_grupo_grado_nivel, wid_integracion, wid_zona, wid_tipo_tabulador
        from m4t_acumulado_rl1_2011 a, m4t_acumulado_rl_2011 b 
        where a.id_empleado = '158125'
         and a.fec_pago = '2022-07-15'
         and a.fec_pago = a.fec_imputacion 
         and a.id_empresa = '01'
         and a.id_empleado = b.id_empleado 
         and a.fec_pago = b.fec_pago 
         and a.fec_imputacion = b.fec_imputacion;


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


 select count(*) i
     from m4t_acumulado_rl1_2011 a, m4t_acumulado_rl_2011 b 
     where a.id_empleado = '158125' and a.fec_pago = '2022-07-15' and a.fec_pago = a.fec_imputacion and a.id_empresa = '01'
     and a.id_empleado = b.id_empleado and a.fec_pago = b.fec_pago and a.fec_imputacion = b.fec_imputacion;


