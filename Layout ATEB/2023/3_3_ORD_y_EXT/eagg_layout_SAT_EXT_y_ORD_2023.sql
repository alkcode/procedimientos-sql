--------------------------------------------version 3.3 ATEb-----------------------------------------
drop procedure if exists eagg_layout_sat_ext_y_ord_2023;
create procedure eagg_layout_sat_ext_y_ord_2023(wfec_pago date,wnomin varchar(1), wempresa varchar(2), wtipo varchar(1), wimpacum varchar(1))
returning char(265);
-----realizado por EAGG. Programa para ISSSTE ASEGURADOR PENSIONISSSTE Y TURISSSTE
-----el d�a 13/01/2022
-----usa GenLinSATu.sql y GenNOHu.sql, u al final es ultima version
-----modificado para tabla cosif_timbrado_2022 el 13/01/2022
   define wi1,wi2,wi3,wi4,wi5,wi6,wi7,wi8,wi9,wi10,wi11,wi12,wi13,wi14,wi15,wi16,wi17,wi18,wi19,wi20          money(18,2);
   define wi21,wi22,wi23,wi24,wi25,wi26,wi27,wi28,wi29,wi30,wi31,wi32,wi33,wi34,wi35,wi36,wi37,wi38,wi39,wi40 money(18,2);
   define wp1,wp2,wp3,wp4,wp5,wp6,wp7,wp8,wp9,wp10,wp11,wp12,wp13,wp14,wp15,wp16,wp17,wp18,wp19,wp20          varchar(01);
   define wp21,wp22,wp23,wp24,wp25,wp26,wp27,wp28,wp29,wp30,wp31,wp32,wp33,wp34,wp35,wp36,wp37,wp38,wp39,wp40 varchar(01);
   define wc1,wc2,wc3,wc4,wc5,wc6,wc7,wc8,wc9,wc10,wc11,wc12,wc13,wc14,wc15,wc16,wc17,wc18,wc19,wc20          varchar(02);
   define wc21,wc22,wc23,wc24,wc25,wc26,wc27,wc28,wc29,wc30,wc31,wc32,wc33,wc34,wc35,wc36,wc37,wc38,wc39,wc40 varchar(02);
   define wemp varchar(10); define w_cont,wdias_lab,wdias,wconse,wnum_cons,wgrav,wconse9,wcond,wconp,wcons,wnum_linea integer;
   define wlongmal,wcaracterr,wbandera, wbandera01, wnum_cons2, wnum_consi, wnum_consv integer;
   define ae date;
   
   define cadenaE01 char(116); define cadenaE02 char(187); define cadenaE04 char(32); define cadenaE05 char(40);
   define cadenaD01 char(230); define cadenaNOI,cadenaNOD char(163); define cadenaNOC char(47); define wkey,wtip_perc char(03);
   define cadenaNOH char(54); define cadenaE00 char(14); define cadE03a char(223); define cadE03b char(205);
   define cadEA1a char(20); define cadEA1b char(257); define cadNOEa char(243); define cadNOEb char(250); define cadNO2 char(5);
   define cadNO3 char(56); define wpagaduria varchar(5); define wramo integer; define wadscripcion varchar(10);
   define cadNO4 char(8); define cadNOP char(202); define wliqux, wdedux, wpercx decimal(14,2);
   define wliquido,wispt,wimporte,wimp_exe,wimp_gra,wdeduc,wperc,wzero,wporcent decimal(14,2); define wid_legal varchar(13);
   define wnombre,wnombre2,wdescrip,wn_concepto varchar(150); define wfec_inicio,wfec_fin,wfec_alta, wfec_impu date;
   define wfec_pagox datetime year to second; define wfec_iniciox,wfec_finx,wfec_alta2 datetime year to day;
   define wcurp varchar(18); define wnumero_ss varchar(14); define wperc_ded varchar(01); define wconcepto,wid_empresa varchar(02);
   define wcurp01 varchar(18); define wid_legal01 varchar(13);  
   define wbanco_c, westado_c char(03); define wperiod_c, wdivgeo char(02); define wfolio char(20); define wcp varchar(5);
   define wforpago, wforpago2 char(06); define wbanco, wbanco2 char(04); define wcuenta, wcuenta2 varchar(18);
   define salida char(230); define error_num integer; define desc_err varchar(32); 
   define wsindl, wsindn money(18,2); define wsindl_c, wsindn_c char(02); define wdiaantig integer;
   define wdia_alta, wmes_alta char(02); define wano_alta char(04); define wtipo_n varchar(01);
   
   define flg1,flg2,flg3,flg4,flg5,flg6,flg7,flg8,flg9,flg10,flg11,flg12,flg13,flg14,flg15,flg16,flg17,flg18,flg19,flg20          integer;
   define flg21,flg22,flg23,flg24,flg25,flg26,flg27,flg28,flg29,flg30,flg31,flg32,flg33,flg34,flg35,flg36,flg37,flg38,flg39,flg40 integer;
   define w_NomDes, w_TipCont, w_Period, w_TipNom, w_TipReg varchar(10,0); define w_TipCont1, w_Period1, w_Regim varchar(2,0); 
   define w_TipNom1 varchar(1,0);

   define wiserv char(5); define wdserv char(50); define wipuesto char(7); define wdpuesto char(50);
   define wi2puesto char(7); define wd2puesto varchar(50);
   define wcont_des_tot integer; define wcon_pag integer;   --- contadores prestamo personal 20210907 eagg
   define wfal_ret varchar (100);   ---faltas y retardo 20210907 eagg -----se cambio a 100 caracteres por falta de espacio
   define wcen_trab varchar (12);
   define wcen_pago varchar (12);
   define wid_zona varchar(5);
   define wfec_alta_empleado date;
   define wid_nivel_wid_grupo_grado_nivel varchar(5);
   define wid_sub_nivel_wid_integracion varchar(5);
   define wfec_imputacion date;
   

   
   set isolation to dirty read;
   
   ---set debug file to 'layout.log';
   ---trace on;


   let wemp=' '; let w_cont=1; let wconse=1; let wzero=0.0;

   let wfec_pagox=today;
   let wnum_linea=0;

   --let wtipo = '1';
   --let wtipo = '0';


   

   drop table info_sat9;
   ----truncate table valida_timbrado_ext;        ---------se comento para que deje el historico de fechas y montos
  
   create table info_sat9
     (num_linea integer,
      id_empresa varchar(02),
      id_empleado varchar(10),
      linea char(600)) fragment by round robin in bdbase,bdhist;
   revoke all on info_sat9 from "public";   

   if wnomin = 'O' then let w_NomDes = 'Ordinaria'; ---revisar los datos
      let w_TipCont = '01-TiemInd'; let w_Period = '04-Quincen'; let w_TipNom = 'O-Ordinari';
      let w_TipCont1 = '01'; let w_Period1 = '04'; let w_TipNom1 = 'O'; let w_Regim = '02';
      let wdias_lab=15; let wdias=15; end if;
   
   if wnomin = 'E' then let w_NomDes = 'Extraord'; ---revisar los datos
      let w_TipCont = '01-TiemInd'; let w_Period = '99-OtraPer'; let w_TipNom = 'E-Extraord';
      let w_TipCont1 = '01'; let w_Period1 = '99'; let w_TipNom1 = 'E'; let w_Regim = '02';
      let wdias_lab=15; let wdias=15; end if;
            
   if wnomin = 'H' then let w_NomDes = 'Honorario';
      let w_TipCont = '09-SinRela'; let w_Period = '04-Qincen'; let w_TipNom = 'O-Ordinari';
      let w_TipCont1 = '09'; let w_Period1 = '04'; let w_TipNom1 = 'O'; let w_Regim = '09';
      let wdias_lab=15; let wdias=15; end if;
      
   if wnomin = 'P' then let w_NomDes = 'PAOAM'; ---Internos
      let w_TipCont = '03-TiemDet'; let w_Period = '99-OtraPer'; let w_TipNom = 'E-Extraord';
      let w_TipCont1 = '03'; let w_Period1 = '99'; let w_TipNom1 = 'E'; let w_Regim = '02';
      let wdias_lab=15; let wdias=15; end if;
      
   if wnomin = 'T' then let w_NomDes = 'Temporal';
      let w_TipCont = '03-TiemDet'; let w_Period = '04-Quincen'; let w_TipNom = 'O-Ordinari';
      let w_TipCont1 = '03'; let w_Period1 = '04'; let w_TipNom1 = 'O'; let w_Regim = '02';
      let wdias_lab=15; let wdias=15; end if;
      
            
      
   select fec_inicio,fec_fin into wfec_inicio,wfec_fin
      from m4sys_hist_pagas where fec_paga=wfec_pago;

   
   let wdescrip = 'PAGO DE NOMINA';
   
      if wfec_pago = '15/01/2019' then
         delete timb_cons_2023 where fec_pago = '15/01/2019' and empresa = wempresa;
         let wnum_consi = 01;
         insert into timb_cons_2023 values(wempresa,'000000',wnum_consi, 0, 00.00, wfec_pago, wfec_pagox);
      else
         let wnum_consv = 0;
         select count(*) into wnum_consv from timb_cons_2023 
         where fec_pago = wfec_pago and fec_crea = wfec_pagox and empresa = wempresa and descripcion = w_NomDes;
         
         select max(num_consf) into wnum_consi from timb_cons_2023 where fec_pago >= '15/01/2019' and empresa = wempresa;
         
         let wnum_consi = wnum_consi + 1;
         let wnum_cons2 = wnum_consi;
         insert into timb_cons_2023 values(wempresa, w_NomDes,wnum_consi, 0, wnum_consv, wfec_pago, wfec_pagox);

      end if;
      
   
	let wramo    = 637;
	 if wempresa='01' then 
	    let cadE03a = 'E03'||rpad('JOSE MARIA LAFRAGUA',50,' ')||rpad('4',20,' ')||rpad(' ',50,' ')||rpad('TABACALERA',50,' ')||rpad(' ',50,' ');
	    let cadE03b = rpad(' ',50,' ')||rpad('CUAUHTEMOC',50,' ')||rpad('DISTRITO FEDERAL',50,' ')||rpad('MEXICO',50,' ');
	 end if;
	 
	 if wempresa='03' then
	    let cadE03a='E03'||rpad('PASEO DE LA REFORMA',50,' ')||rpad('19',20,' ')||rpad(' ',50,' ')||rpad('TABACALERA',50,' ')||rpad(' ',50,' ');
	    let cadE03b=rpad(' ',50,' ')||rpad('CUAUHTEMOC',50,' ')||rpad('DISTRITO FEDERAL',50,' ')||rpad('MEXICO',50,' ');
	 end if;
	          
         if wempresa='05' then 
	    let cadE03a='E03'||rpad('BOULEVARD ADOLFO LOPEZ MATEOS',50,' ')||rpad('2157',20,' ')||rpad('PISO 5',50,' ')||rpad('LOS ALPES',50,' ')||rpad(' ',50,' ');
	    let cadE03b=rpad(' ',50,' ')||rpad('ALVARO OBREGON',50,' ')||rpad('DISTRITO FEDERAL',50,' ')||rpad('MEXICO',50,' ');
	 end if;
	 
   foreach select id_empresa,rfc[1,6],num_cons,tot_net_cheque,tot_ded_cheque,tot_perc_cheque,trim(nom_emp),id_banco,cuenta,id_div_geografica, adscripcion,id_servicio, puesto,
                  p1,c1,i1,p2,c2,i2,p3,c3,i3,
                  p4,c4,i4,p5,c5,i5,p6,c6,i6,p7,c7,i7,p8,c8,i8,p9,c9,i9,p10,c10,i10,
                  p11,c11,i11,p12,c12,i12,p13,c13,i13,p14,c14,i14,
                  p15,c15,i15,p16,c16,i16,p17,c17,i17,p18,c18,i18,p19,c19,i19,p20,c20,i20,p21,c21,i21,p22,c22,i22,p23,c23,i23,p24,c24,
                  i24,p25,c25,i25,p26,c26,i26,p27,c27,i27,p28,c28,i28,p29,c29,i29,p30,c30,i30,p31,c31,i31,p32,c32,i32,p33,c33,i33,p34,
                  c34,i34,p35,c35,i35,p36,c36,i36,p37,c37,i37,p38,c38,i38,p39,c39,i39,p40,c40,i40
             into wid_empresa,wemp,wfolio,wliquido,wdeduc,wperc,wnombre,wbanco,wcuenta,wdivgeo,wadscripcion, wiserv, wipuesto,
                  wp1,wc1,wi1,wp2,wc2,wi2,wp3,wc3,wi3,wp4,wc4,wi4,wp5,wc5,wi5,wp6,wc6,wi6,wp7,wc7,wi7,wp8,wc8,wi8,wp9,wc9,wi9,wp10,wc10,
                  wi10,wp11,wc11,wi11,wp12,wc12,wi12,wp13,wc13,wi13,wp14,wc14,
                  wi14,wp15,wc15,wi15,wp16,wc16,wi16,wp17,wc17,wi17,wp18,wc18,wi18,wp19,wc19,wi19,wp20,wc20,wi20,wp21,wc21,wi21,wp22,
                  wc22,wi22,wp23,wc23,wi23,wp24,wc24,wi24,wp25,wc25,wi25,wp26,wc26,wi26,wp27,wc27,wi27,wp28,wc28,wi28,wp29,wc29,wi29,
                  wp30,wc30,wi30,wp31,wc31,wi31,wp32,wc32,wi32,wp33,wc33,wi33,wp34,wc34,wi34,wp35,wc35,wi35,wp36,wc36,wi36,wp37,wc37,
                  wi37,wp38,wc38,wi38,wp39,wc39,wi39,wp40,wc40,wi40
             --from cosif_timbrado_2022
             from cosif_timbrado_2023
            where fec_pago = wfec_pago
              and id_empresa = wempresa
              and tipo = wtipo
              And impacum_p5 = wimpacum
              ---and rfc in ('355290','202046','309352','161695','246291','367131','357819','385281')
              And (c1<>'26' And c2<>'26' And c3<>'26' And c4<>'26' And c5<>'26' And c6<>'26' And c7<>'26' And c8<>'26' And c9<>'26' And c10<>'26'
              And c11<>'26' And c12<>'26' And c13<>'26' And c14<>'26' And c15<>'26' And c16<>'26' And c17<>'26' And c18<>'26' And c19<>'26' And c20<>'26'
              And c21<>'26' And c22<>'26' And c23<>'26' And c24<>'26' And c25<>'26' And c26<>'26' And c27<>'26' And c28<>'26' And c29<>'26' And c30<>'26'
              And c31<>'26' And c32<>'26' And c33<>'26' And c34<>'26' And c35<>'26' And c36<>'26' And c37<>'26' And c38<>'26' And c39<>'26' And c40<>'26')
            order by 2

              
              
            ON EXCEPTION set error_num
	            return 'error en  ---> ' || w_cont||' '||wemp||' '||error_num  with resume;
	            let wnum_linea = wnum_linea + 1;
	            insert into info_sat9 (num_linea,id_empresa,id_empleado,linea) 
	            values (wnum_linea,wid_empresa,wemp,'Error-'||desc_err||':'||error_num|| '-emp:'||wemp||'-Cons:'||wnum_cons2);
            END EXCEPTION WITH RESUME;
            
            

	    select trim(id_c_u_r_p_st),numero_ss,trim(id_legal),
	       nvl(trim(apellido_1),' ')||' '||nvl(trim(apellido_2),' ')||' '||nvl(trim(nombre),' ')
	       into wcurp,wnumero_ss,wid_legal,wnombre2
	       from m4t_empleados
	       where id_sociedad = id_sociedad
               and id_empleado = wemp;

         
            
         
      return 'llevo lay---> ' || w_cont||' '||wemp  with resume;
      

      let wnum_cons2 = wnum_cons2 + 1;
      let wnum_cons = wnum_cons2;



     let wispt=0;
     if wc1='53' then let wispt=wi1; else if wc2='53' then let wispt=wi2; else if wc3='53' then let wispt=wi3;
     else if wc4='53' then let wispt=wi4; else if wc5='53' then let wispt=wi5; else if wc6='53' then let wispt=wi6;
     else if wc7='53' then let wispt=wi7; else if wc8='53' then let wispt=wi8; else  if wc9='53' then let wispt=wi9;
     else if wc10='53' then let wispt=wi10; else if wc11='53' then let wispt=wi11; else if wc12='53' then let wispt=wi12;
     else if wc13='53' then let wispt=wi13; else if wc14='53' then let wispt=wi14; else if wc15='53' then let wispt=wi15;
     else if wc16='53' then let wispt=wi16; else if wc17='53' then let wispt=wi17; else if wc18='53' then let wispt=wi18;
     else if wc19='53' then let wispt=wi19; else if wc20='53' then let wispt=wi20; else if wc21='53' then let wispt=wi21;
     else if wc22='53' then let wispt=wi22; else if wc23='53' then let wispt=wi23; else if wc24='53' then let wispt=wi24;
     else if wc25='53' then let wispt=wi25; else if wc26='53' then let wispt=wi26; else if wc27='53' then let wispt=wi27;
     else if wc28='53' then let wispt=wi28; else if wc29='53' then let wispt=wi29; else if wc30='53' then let wispt=wi30;
     else if wc31='53' then let wispt=wi31; else if wc32='53' then let wispt=wi32; else if wc33='53' then let wispt=wi33;
     else if wc34='53' then let wispt=wi34; else if wc35='53' then let wispt=wi35; else if wc36='53' then let wispt=wi36;
     else if wc37='53' then let wispt=wi37; else if wc38='53' then let wispt=wi38; else if wc39='53' then let wispt=wi39;
     else if wc40='53' then let wispt=wi40; end if; end if; end if; end if; end if; end if; end if; end if; end if; end if; end if; 
     end if; end if; end if; end if; end if; end if; end if; end if; end if; end if; end if; end if; end if; end if; end if; end if; 
     end if; end if; end if; end if; end if; end if; end if; end if; end if; end if; end if; end if; end if;

      
      if wispt < 0 then
         let wispt = 0;
      end if
      
      
      if wi1 < 0 then let wperc = wperc - wi1; let wdeduc = wdeduc - wi1;  end if;
      if wi2 < 0 then let wperc = wperc - wi2; let wdeduc = wdeduc - wi2;  end if;
      if wi3 < 0 then let wperc = wperc - wi3; let wdeduc = wdeduc - wi3;  end if;
      if wi4 < 0 then let wperc = wperc - wi4; let wdeduc = wdeduc - wi4;  end if;
      if wi5 < 0 then let wperc = wperc - wi5; let wdeduc = wdeduc - wi5;  end if;
      if wi6 < 0 then let wperc = wperc - wi6; let wdeduc = wdeduc - wi6;  end if;
      if wi7 < 0 then let wperc = wperc - wi7; let wdeduc = wdeduc - wi7;  end if;
      if wi8 < 0 then let wperc = wperc - wi8; let wdeduc = wdeduc - wi8;  end if;
      if wi9 < 0 then let wperc = wperc - wi9; let wdeduc = wdeduc - wi9;  end if;
      if wi10 < 0 then let wperc = wperc - wi10; let wdeduc = wdeduc - wi10;  end if;
      if wi11 < 0 then let wperc = wperc - wi11; let wdeduc = wdeduc - wi11;  end if;
      if wi12 < 0 then let wperc = wperc - wi12; let wdeduc = wdeduc - wi12;  end if;
      if wi13 < 0 then let wperc = wperc - wi13; let wdeduc = wdeduc - wi13;  end if;
      if wi14 < 0 then let wperc = wperc - wi14; let wdeduc = wdeduc - wi14;  end if;
      if wi15 < 0 then let wperc = wperc - wi15; let wdeduc = wdeduc - wi15;  end if;
      if wi16 < 0 then let wperc = wperc - wi16; let wdeduc = wdeduc - wi16;  end if;
      if wi17 < 0 then let wperc = wperc - wi17; let wdeduc = wdeduc - wi17;  end if;
      if wi18 < 0 then let wperc = wperc - wi18; let wdeduc = wdeduc - wi18;  end if;
      if wi19 < 0 then let wperc = wperc - wi19; let wdeduc = wdeduc - wi19;  end if;
      if wi20 < 0 then let wperc = wperc - wi20; let wdeduc = wdeduc - wi20;  end if;
      if wi21 < 0 then let wperc = wperc - wi21; let wdeduc = wdeduc - wi21;  end if;
      if wi22 < 0 then let wperc = wperc - wi22; let wdeduc = wdeduc - wi22;  end if;
      if wi23 < 0 then let wperc = wperc - wi23; let wdeduc = wdeduc - wi23;  end if;
      if wi24 < 0 then let wperc = wperc - wi24; let wdeduc = wdeduc - wi24;  end if;
      if wi25 < 0 then let wperc = wperc - wi25; let wdeduc = wdeduc - wi25;  end if;
      if wi26 < 0 then let wperc = wperc - wi26; let wdeduc = wdeduc - wi26;  end if;
      if wi27 < 0 then let wperc = wperc - wi27; let wdeduc = wdeduc - wi27;  end if;
      if wi28 < 0 then let wperc = wperc - wi28; let wdeduc = wdeduc - wi28;  end if;
      if wi29 < 0 then let wperc = wperc - wi29; let wdeduc = wdeduc - wi29;  end if;
      if wi30 < 0 then let wperc = wperc - wi30; let wdeduc = wdeduc - wi30;  end if;
      if wi31 < 0 then let wperc = wperc - wi31; let wdeduc = wdeduc - wi31;  end if;
      if wi32 < 0 then let wperc = wperc - wi32; let wdeduc = wdeduc - wi32;  end if;
      if wi33 < 0 then let wperc = wperc - wi33; let wdeduc = wdeduc - wi33;  end if;
      if wi34 < 0 then let wperc = wperc - wi34; let wdeduc = wdeduc - wi34;  end if;
      if wi35 < 0 then let wperc = wperc - wi35; let wdeduc = wdeduc - wi35;  end if;
      if wi36 < 0 then let wperc = wperc - wi36; let wdeduc = wdeduc - wi36;  end if;
      if wi37 < 0 then let wperc = wperc - wi37; let wdeduc = wdeduc - wi37;  end if;
      if wi38 < 0 then let wperc = wperc - wi38; let wdeduc = wdeduc - wi38;  end if;
      if wi39 < 0 then let wperc = wperc - wi39; let wdeduc = wdeduc - wi39;  end if;
      if wi40 < 0 then let wperc = wperc - wi40; let wdeduc = wdeduc - wi40;  end if;



     

   if wc1 = '26' then  let wperc = wperc-wi1; let  wliquido = wliquido-wi1; let flg1 = 1;
   else if (wc1='09' and wc2='Y1') or (wc1='14' and wc2='Y2') or (wc1='18' and wc2='Y3') then let flg1 = 3;
         else let flg1 = 0; end if; end if;
   
   if wc2 = '26' then  let wperc = wperc-wi2; let  wliquido = wliquido-wi2; let flg2 = 1;
   else if (wc2='09' and wc3='Y1') or (wc2='14' and wc3='Y2') or (wc2='18' and wc3='Y3') then let flg2 = 3;
         else let flg2 = 0; end if; end if;
   
   if wc3 = '26' then  let wperc = wperc-wi3; let  wliquido = wliquido-wi3; let flg3 = 1;
   else if (wc3='09' and wc4='Y1') or (wc3='14' and wc4='Y2') or (wc3='18' and wc4='Y3') then let flg3 = 3;
         else let flg3 = 0; end if; end if;
   
   if wc4 = '26' then  let wperc = wperc-wi4; let  wliquido = wliquido-wi4; let flg4 = 1;
   else if (wc4='09' and wc5='Y1') or (wc4='14' and wc5='Y2') or (wc4='18' and wc5='Y3') then let flg4 = 3;
         else let flg4 = 0; end if; end if;
   
   if wc5 = '26' then  let wperc = wperc-wi5; let  wliquido = wliquido-wi5; let flg5 = 1;
   else if (wc5='09' and wc6='Y1') or (wc5='14' and wc6='Y2') or (wc5='18' and wc6='Y3') then let flg5 = 3;
         else let flg5 = 0; end if; end if;
   
   if wc6 = '26' then  let wperc = wperc-wi6; let  wliquido = wliquido-wi6; let flg6 = 1;
   else if (wc6='09' and wc7='Y1') or (wc6='14' and wc7='Y2') or (wc6='18' and wc7='Y3') then let flg6 = 3;
         else let flg6 = 0; end if; end if;
   
   if wc7 = '26' then  let wperc = wperc-wi7; let  wliquido = wliquido-wi7; let flg7 = 1;
   else if (wc7='09' and wc8='Y1') or (wc7='14' and wc8='Y2') or (wc7='18' and wc8='Y3') then let flg7 = 3;
         else let flg7 = 0; end if; end if;
   
   if wc8 = '26' then  let wperc = wperc-wi8; let  wliquido = wliquido-wi8; let flg8 = 1;
   else if (wc8='09' and wc9='Y1') or (wc8='14' and wc9='Y2') or (wc8='18' and wc9='Y3') then let flg8 = 3;
         else let flg8 = 0; end if; end if;
   
   if wc9 = '26' then  let wperc = wperc-wi9; let  wliquido = wliquido-wi9; let flg9 = 1;
   else if (wc9='09' and wc10='Y1') or (wc9='14' and wc10='Y2') or (wc9='18' and wc10='Y3') then let flg9 = 3;
         else let flg9 = 0; end if; end if;
   
   if wc10 = '26' then  let wperc = wperc-wi10; let  wliquido = wliquido-wi10; let flg10 = 1;
   else if (wc10='09' and wc11='Y1') or (wc10='14' and wc11='Y2') or (wc10='18' and wc11='Y3') then let flg10 = 3;
         else let flg10 = 0; end if; end if;
   
   if wc11 = '26' then  let wperc = wperc-wi11; let  wliquido = wliquido-wi11; let flg11 = 1;
   else if (wc11='09' and wc12='Y1') or (wc11='14' and wc12='Y2') or (wc11='18' and wc12='Y3') then let flg11 = 3;
         else let flg11 = 0; end if; end if;
   
   if wc12 = '26' then  let wperc = wperc-wi12; let  wliquido = wliquido-wi12; let flg12 = 1;
   else if (wc12='09' and wc13='Y1') or (wc12='14' and wc13='Y2') or (wc12='18' and wc13='Y3') then let flg12 = 3;
         else let flg12 = 0; end if; end if;
   
   if wc13 = '26' then  let wperc = wperc-wi13; let  wliquido = wliquido-wi13; let flg13 = 1;
   else if (wc13='09' and wc14='Y1') or (wc13='14' and wc14='Y2') or (wc13='18' and wc14='Y3') then let flg13 = 3;
         else let flg13 = 0; end if; end if;
   
   if wc14 = '26' then  let wperc = wperc-wi14; let  wliquido = wliquido-wi14; let flg14 = 1;
   else if (wc14='09' and wc15='Y1') or (wc14='14' and wc15='Y2') or (wc14='18' and wc15='Y3') then let flg14 = 3;
         else let flg14 = 0; end if; end if;
   
   if wc15 = '26' then  let wperc = wperc-wi15; let  wliquido = wliquido-wi15; let flg15 = 1;
   else if (wc15='09' and wc16='Y1') or (wc15='14' and wc16='Y2') or (wc15='18' and wc16='Y3') then let flg15 = 3;
         else let flg15 = 0; end if; end if;
   
   if wc16 = '26' then  let wperc = wperc-wi16; let  wliquido = wliquido-wi16; let flg16 = 1;
   else if (wc16='09' and wc17='Y1') or (wc16='14' and wc17='Y2') or (wc16='18' and wc17='Y3') then let flg16 = 3;
         else let flg16 = 0; end if; end if;
   
   if wc17 = '26' then  let wperc = wperc-wi17; let  wliquido = wliquido-wi17; let flg17 = 1;
   else if (wc17='09' and wc18='Y1') or (wc17='14' and wc18='Y2') or (wc17='18' and wc18='Y3') then let flg17 = 3;
         else let flg17 = 0; end if; end if;
   
   if wc18 = '26' then  let wperc = wperc-wi18; let  wliquido = wliquido-wi18; let flg18 = 1;
   else if (wc18='09' and wc19='Y1') or (wc18='14' and wc19='Y2') or (wc18='18' and wc19='Y3') then let flg18 = 3;
         else let flg18 = 0; end if; end if;
   
   if wc19 = '26' then  let wperc = wperc-wi19; let  wliquido = wliquido-wi19; let flg19 = 1;
   else if (wc19='09' and wc20='Y1') or (wc19='14' and wc20='Y2') or (wc19='18' and wc20='Y3') then let flg19 = 3;
         else let flg19 = 0; end if; end if;
   
   if wc20 = '26' then  let wperc = wperc-wi20; let  wliquido = wliquido-wi20; let flg20 = 1;
   else if (wc20='09' and wc21='Y1') or (wc20='14' and wc21='Y2') or (wc20='18' and wc21='Y3') then  let flg20 = 3;
         else let flg20 = 0; end if; end if;
   
   if wc21 = '26' then  let wperc = wperc-wi21; let  wliquido = wliquido-wi21; let flg21 = 1;
   else if (wc21='09' and wc22='Y1') or (wc21='14' and wc22='Y2') or (wc21='18' and wc22='Y3') then  let flg21 = 3;
         else let flg21 = 0; end if; end if;
   
   if wc22 = '26' then  let wperc = wperc-wi22; let  wliquido = wliquido-wi22; let flg22 = 1;
   else if (wc22='09' and wc23='Y1') or (wc22='14' and wc23='Y2') or (wc22='18' and wc23='Y3') then  let flg22 = 3;
         else let flg22 = 0; end if; end if;
   
   if wc23 = '26' then  let wperc = wperc-wi23; let  wliquido = wliquido-wi23; let flg23 = 1;
   else if (wc23='09' and wc24='Y1') or (wc23='14' and wc24='Y2') or (wc23='18' and wc24='Y3') then  let flg23 = 3;
         else let flg23 = 0; end if; end if;
   
   if wc24 = '26' then  let wperc = wperc-wi24; let  wliquido = wliquido-wi24; let flg24 = 1;
   else if (wc24='09' and wc25='Y1') or (wc24='14' and wc25='Y2') or (wc24='18' and wc25='Y3') then  let flg24 = 3;
         else let flg24 = 0; end if; end if;
   
   if wc25 = '26' then  let wperc = wperc-wi25; let  wliquido = wliquido-wi25; let flg25 = 1;
   else if (wc25='09' and wc26='Y1') or (wc25='14' and wc26='Y2') or (wc25='18' and wc26='Y3') then  let flg25 = 3;
         else let flg25 = 0; end if; end if;
   
   if wc26 = '26' then  let wperc = wperc-wi26; let  wliquido = wliquido-wi26; let flg26 = 1;
   else if (wc26='09' and wc27='Y1') or (wc26='14' and wc27='Y2') or (wc26='18' and wc27='Y3') then  let flg26 = 3;
         else let flg26 = 0; end if; end if;
   
   if wc27 = '26' then  let wperc = wperc-wi27; let  wliquido = wliquido-wi27; let flg27 = 1;
   else if (wc27='09' and wc28='Y1') or (wc27='14' and wc28='Y2') or (wc27='18' and wc28='Y3') then  let flg27 = 3;
         else let flg27 = 0; end if; end if;
   
   if wc28 = '26' then  let wperc = wperc-wi28; let  wliquido = wliquido-wi28; let flg28 = 1;
   else if (wc28='09' and wc29='Y1') or (wc28='14' and wc29='Y2') or (wc28='18' and wc29='Y3') then  let flg28 = 3;
         else let flg28 = 0; end if; end if;
   
   if wc29 = '26' then  let wperc = wperc-wi29; let  wliquido = wliquido-wi29; let flg29 = 1;
   else if (wc29='09' and wc30='Y1') or (wc29='14' and wc30='Y2') or (wc29='18' and wc30='Y3') then  let flg29 = 3;
         else let flg29 = 0; end if; end if;
   
   if wc30 = '26' then  let wperc = wperc-wi30; let  wliquido = wliquido-wi30; let flg30 = 1;
   else if (wc30='09' and wc31='Y1') or (wc30='14' and wc31='Y2') or (wc30='18' and wc31='Y3') then  let flg30 = 3;
         else let flg30 = 0; end if; end if;
   
   if wc31 = '26' then  let wperc = wperc-wi31; let  wliquido = wliquido-wi31; let flg31 = 1;
   else if (wc31='09' and wc32='Y1') or (wc31='14' and wc32='Y2') or (wc31='18' and wc32='Y3') then  let flg31 = 3;
         else let flg31 = 0; end if; end if;
   
   if wc32 = '26' then  let wperc = wperc-wi32; let  wliquido = wliquido-wi32; let flg32 = 1;
   else if (wc32='09' and wc33='Y1') or (wc32='14' and wc33='Y2') or (wc32='18' and wc33='Y3') then  let flg32 = 3;
         else let flg32 = 0; end if; end if;
   
   if wc33 = '26' then  let wperc = wperc-wi33; let  wliquido = wliquido-wi33; let flg33 = 1;
   else if (wc33='09' and wc34='Y1') or (wc33='14' and wc34='Y2') or (wc33='18' and wc34='Y3') then  let flg33 = 3;
         else let flg33 = 0; end if; end if;
   
   if wc34 = '26' then  let wperc = wperc-wi34; let  wliquido = wliquido-wi34; let flg34 = 1;
   else if (wc34='09' and wc35='Y1') or (wc34='14' and wc35='Y2') or (wc34='18' and wc35='Y3') then  let flg34 = 3;
         else let flg34 = 0; end if; end if;
   
   if wc35 = '26' then  let wperc = wperc-wi35; let  wliquido = wliquido-wi35; let flg35 = 1;
   else if (wc35='09' and wc36='Y1') or (wc35='14' and wc36='Y2') or (wc35='18' and wc36='Y3') then  let flg35 = 3;
         else let flg35 = 0; end if; end if;
   
   if wc36 = '26' then  let wperc = wperc-wi36; let  wliquido = wliquido-wi36; let flg36 = 1;
   else if (wc36='09' and wc37='Y1') or (wc36='14' and wc37='Y2') or (wc36='18' and wc37='Y3') then  let flg36 = 3;
         else let flg36 = 0; end if; end if;
   
   if wc37 = '26' then  let wperc = wperc-wi37; let  wliquido = wliquido-wi37; let flg37 = 1;
   else if (wc37='09' and wc38='Y1') or (wc37='14' and wc38='Y2') or (wc37='18' and wc38='Y3') then  let flg37 = 3;
         else let flg37 = 0; end if; end if;
   
   if wc38 = '26' then  let wperc = wperc-wi38; let  wliquido = wliquido-wi38; let flg38 = 1;
   else if (wc38='09' and wc39='Y1') or (wc38='14' and wc39='Y2') or (wc38='18' and wc39='Y3') then  let flg38 = 3;
         else let flg38 = 0; end if; end if;
   
   if wc39 = '26' then  let wperc = wperc-wi39; let  wliquido = wliquido-wi39; let flg39 = 1;
   else if (wc39='09' and wc40='Y1') or (wc39='14' and wc40='Y2') or (wc39='18' and wc40='Y3') then  let flg39 = 3;
         else let flg39 = 0; end if; end if;
   
   if wc40 = '26' then  let wperc = wperc-wi40; let  wliquido = wliquido-wi40; let flg40 = 1;
   else if (wc40='09') or (wc40='14') or (wc40='18') then let flg40 = 0;
         else let flg40 = 0; end if; end if; 
     

      let desc_err = 'E01';


      insert into valida_timbrado_2023 (fec_pago,id_empleado,impacum_p5,tot_per,tot_ded,tot_net,isr,id_empresa,tipo) values (wfec_pago,wemp,wimpacum,wperc,wdeduc,wliquido,wispt,wid_empresa,wtipo);       ----validacion de timbrado

      let cadenaE01 = 'E01'||rpad(wnum_cons2,20,' ')||rpad(wfec_pagox,19,' ')||rpad(wperc,18,' ')||rpad(wdeduc,18,' ')||rpad(wliquido,18,' ')||rpad('NO',2,' ')||rpad('PUE',3,' ')||rpad('99',3,' ');

      let wnum_linea = wnum_linea + 1;
      insert into info_sat9 (num_linea,id_empresa,id_empleado,linea) values (wnum_linea,wid_empresa,wemp,cadenaE01);



                               

             if (wnumero_ss[1,2] = '  ' or wnumero_ss is null) then
                select nss into wnumero_ss from m4_inf_bmex
		   where id_empleado = wemp and u_version = 'I';
             end if;
             
             if length(wcurp) != 18 then
                select curp into wcurp from m4_inf_bmex
	     	   where id_empleado = wemp and u_version = 'I';
     	     end if;
     	     if length(wid_legal) != 13 then
     	        select filiacion into wid_legal from m4_inf_bmex
	           where id_empleado = wemp and u_version = 'I';
     	     end if;
             
             if length(wcurp) != 18 then
     	      let wcurp = "ERROR_CURP";
     	     end if;
     	           
     	     if (length(wid_legal) != 13) or (wid_legal is null)  or (wid_legal = '') then    	      
     	        let wid_legal = "ERROR_RFC";
     	     end if;
             
             
             let wlongmal = 0; let wcaracterr = 0;
     
             select count(*) into wlongmal from m4t_empleados 
                where id_sociedad=id_sociedad and id_empleado=wemp and length(id_c_u_r_p_st)!= 18;
             select count(*) into wcaracterr from m4t_empleados 
                where id_sociedad=id_sociedad and id_empleado=wemp and id_c_u_r_p_st matches'*�*';
     
             if (wcurp[1,2] = '  ' or wcurp is null or wlongmal = 1 or wcaracterr = 1) then let wcurp = ' '; end if;
             if (wnumero_ss[1,2] = '  ' or wnumero_ss is null) then let wnumero_ss = '99999999999'; end if;
             if (wnombre[1] = ' ' or wnombre is null or wnombre[1] = '') then let wnombre = wnombre2; end if;
             if (wnombre like '%  %') then let wnombre = wnombre2; end if;


     
      let wnum_linea = wnum_linea + 1;
      let cadenaE02 = 'E02'||rpad(wemp,20,' ')||rpad(wid_legal,13,' ')||rpad(trim(wnombre),150,' ')||'@';
      insert into info_sat9 (num_linea,id_empresa,id_empleado,linea) values (wnum_linea,wid_empresa,wemp,cadenaE02);
      
      
      select pagaduria into wpagaduria
         from ramo_ct_tim where ct10 = wadscripcion;       
      if wpagaduria is null then let wpagaduria = 'ERROR'; end if;
      
      
      select cp into wcp 
         from m4t_domicilios_issste where id_centro_pago = wpagaduria;
         
      if wcp is null then
         if wempresa='01' then let wcp = '06080'; end if;
         if wempresa='03' then let wcp = '06030'; end if;
         if wempresa='05' then let wcp = '01010'; end if; 
      end if;

      -------pruebame

      let wdpuesto = '';
      select n_puesto_plaza into wdpuesto
         from m4t_puestos_plaza where id_sociedad = '01' and id_empresa = wempresa and id_puesto_plaza = wipuesto;
         
      if wdpuesto is null then
         let wdpuesto = '';
      end if;
         
      let wdserv = '';
      select n_clave_servicio into wdserv
         from m4t_clave_servicio where id_sociedad = '01' and id_empresa = wempresa and id_clave_servicio = wiserv;
         
      if wdserv is null then
         let wdserv = '';
      end if;


      ---------pruebame
      
      
      let wnum_linea = wnum_linea + 1;
      insert into info_sat9 (num_linea,id_empresa,id_empleado,linea) values (wnum_linea,wid_empresa,wemp,cadE03a||cadE03b||rpad(wcp,5,' ')||'@');


      let cadenaE04='E04'||rpad(wispt,14,' ')||rpad(wzero,14,' ')||'@';
      let wnum_linea=wnum_linea+1;
      insert into info_sat9 (num_linea,id_empresa,id_empleado,linea) values (wnum_linea,wid_empresa,wemp,cadenaE04);

      select porcent into wporcent from porc_emp where id_empleado=wemp;

      let cadenaE05='E05'||rpad('001',5,' ')||rpad(wispt,14,' ')||lpad(wporcent,14,'0')||rpad('Si',3,' ')||'@';
      let wnum_linea=wnum_linea+1;
      insert into info_sat9 (num_linea,id_empresa,id_empleado,linea) values (wnum_linea,wid_empresa,wemp,cadenaE05);

      let cadEA1a='EA1'||rpad('MXN',3,' ')||'  '||rpad('1',14,' ');

      let cadEA1b=rpad(' ',256,' ')||'@';
      let wnum_linea=wnum_linea+1;
      insert into info_sat9 (num_linea,id_empresa,id_empleado,linea) values (wnum_linea,wid_empresa,wemp,cadEA1a||cadEA1b);


      let cadenaD01='D01'||rpad(' ',14,' ')||rpad('ACT',8,' ')||rpad(' ',20,' ')||rpad(' ',20,' ')||rpad(trim(wdescrip),150,' ')||rpad(wperc,14,' ')||'@';
      let wnum_linea=wnum_linea+1;
      insert into info_sat9 (num_linea,id_empresa,id_empleado,linea) values (wnum_linea,wid_empresa,wemp,cadenaD01);

      let wfec_iniciox=wfec_inicio; let wfec_finx=wfec_fin;
      

  if wempresa <> "02" then
     
     
     let desc_err = 'NOE inf_rl01';

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
         into wid_nivel_wid_grupo_grado_nivel, wid_sub_nivel_wid_integracion, wid_zona, wfec_imputacion
            from m4t_acumulado_rl1_2011 a, m4t_acumulado_rl_2011 b 
               where a.id_sociedad=b.id_sociedad and 
                     a.id_empleado=b.id_empleado and 
                     a.fec_alta_empleado=b.fec_alta_empleado and 
                     a.fec_pago=b.fec_pago and 
                     a.fec_imputacion=b.fec_imputacion and
                     a.id_empleado = wemp  and a.fec_pago  = wfec_pago and a.id_empresa = wempresa
               group by 1,2,3;


     ----este paso se deja para nominas ordinarias con fecha pago = a fecha imputacion
     select count(*) into wbandera01
         from m4t_acumulado_rl1_2011 a, m4t_acumulado_rl_2011 b 
            ---where a.id_empleado = wemp and a.fec_pago = wfec_pago and a.fec_pago = a.fec_imputacion and a.id_empresa = wempresa
            where a.id_empleado = wemp and a.fec_pago = wfec_pago and  a.id_empresa = wempresa and
                     ---a.id_empleado = b.id_empleado and a.fec_pago = b.fec_pago and a.fec_imputacion = b.fec_imputacion;
                     a.fec_pago = b.fec_pago and
                     a.id_sociedad=b.id_sociedad and
                     a.id_empleado = b.id_empleado and
                     a.fec_imputacion = b.fec_imputacion and
                     a.fec_alta_empleado=b.fec_alta_empleado;
     
     if wbandera01 = 1 then     
        let desc_err = 'NOE inf_rl102';
        select a.c_sindic_local, a.c_sindic_nacion, a.d_antig_gob_fed, b.fecha_ingreso_st,a.id_puesto_plaza , a.prme_cont_tot, a.prme_cont_per, nvl(a.comentario, ''), a.id_centro_trab,a.id_centro_pago,b.fec_alta_empleado--,--b.fecha_ini_ts, 
          into wsindl,           wsindn,            wdiaantig,         wfec_alta,         wi2puesto,          wcont_des_tot,   wcon_pag,        wfal_ret,              wcen_trab,       wcen_pago,       wfec_alta_empleado
            from m4t_acumulado_rl1_2011 a, m4t_acumulado_rl_2011 b 
            ---where a.id_empleado = wemp and a.fec_pago = wfec_pago and a.fec_pago = a.fec_imputacion and a.id_empresa = wempresa
               where a.id_empleado = wemp and a.fec_pago = wfec_pago and a.id_empresa = wempresa and
                     ---a.id_empleado = b.id_empleado and a.fec_pago = b.fec_pago and a.fec_imputacion = b.fec_imputacion;
                     a.fec_pago = b.fec_pago and
                     a.id_sociedad=b.id_sociedad and
                     a.id_empleado = b.id_empleado and
                     a.fec_imputacion = b.fec_imputacion and
                     a.fec_alta_empleado=b.fec_alta_empleado;
     
     else
     
        let wdiaantig = "999";
	let wsindl = "999";
	let wsindn = "999";
        let wfec_alta = "07/06/1971";
        
        select max(a.fec_imputacion), max(a.fec_alta_empleado) into wfec_impu, ae
        --select max(a.fec_imputacion) into wfec_impu
            from m4t_acumulado_rl1_2011 a, m4t_acumulado_rl_2011 b 
               where a.id_empleado = wemp and a.fec_pago = wfec_pago and a.id_empresa = wempresa and 
                     ---a.id_empleado = b.id_empleado and a.fec_pago = b.fec_pago and a.fec_imputacion = b.fec_imputacion;
                     a.fec_pago = b.fec_pago and
                     a.id_sociedad=b.id_sociedad and
                     a.id_empleado = b.id_empleado and
                     a.fec_imputacion = b.fec_imputacion and
                     a.fec_alta_empleado=b.fec_alta_empleado;
        
	     select a.c_sindic_local, a.c_sindic_nacion, a.d_antig_gob_fed, b.fecha_ingreso_st,a.id_puesto_plaza,  a.prme_cont_tot, a.prme_cont_per, nvl(a.comentario, ''), a.id_centro_trab,a.id_centro_pago,b.fec_alta_empleado--,--b.fecha_ini_ts, 
	        into wsindl, wsindn, wdiaantig, wfec_alta, wi2puesto,wcont_des_tot,wcon_pag,wfal_ret,wcen_trab,wcen_pago,wfec_alta_empleado
	        from m4t_acumulado_rl1_2011 a, m4t_acumulado_rl_2011 b 
	            --where a.id_empleado = wemp and a.fec_pago = wfec_pago and a.fec_imputacion = wfec_impu and a.id_empresa = wempresa
               where a.id_empleado = wemp and a.fec_pago = wfec_pago and a.fec_imputacion = wfec_impu and a.fec_alta_empleado = ae and a.id_empresa = wempresa and
                     ---a.id_empleado = b.id_empleado and a.fec_pago = b.fec_pago and a.fec_imputacion = b.fec_imputacion;
                     a.fec_pago = b.fec_pago and
                     a.id_sociedad=b.id_sociedad and
                     a.id_empleado = b.id_empleado and
                     a.fec_imputacion = b.fec_imputacion and
                     a.fec_alta_empleado=b.fec_alta_empleado;

        let desc_err = 'NOE acum_rl03';
     
        if wfec_impu is null then
        
           let desc_err = 'NOE acum_rl04';
           return 'error en  ---> ' || wfec_impu||'fec_alta2'  with resume;
           let wdiaantig = "999";
           let wsindl = "999";
           let wsindn = "999";
           let wfec_alta = "07/06/1971";
        
        end if;
     
     end if;
-------------pruebame--------------
        let wd2puesto = '';
        select n_puesto_plaza into wd2puesto
        from m4t_puestos_plaza where id_sociedad = '01' and id_empresa = wempresa and id_puesto_plaza = wi2puesto;
-------------pruebame--------------

     let desc_err = 'NOE fec_alta';
     let wsindl_c = 'No';
     let wfec_alta2 = wfec_alta;
     if wsindl > 0 then let wsindl_c = 'Si'; end if;
     if wsindn > 0 then let wsindl_c = 'Si'; end if;
     -- if wsind4 > 0 then let wsindl_c = 'Si'; end if;
     -- if wsind3 > 0 then let wsindl_c = 'Si'; end if;
     -- if wsind5 > 0 then let wsindl_c = 'Si'; end if;
     -- if wsind2 > 0 then let wsindl_c = 'Si'; end if;


   else

     let desc_err = 'NOE inf_rl1_02';
     let wdiaantig = 100;
     let wfec_alta2 = wfec_pago;
     let wsindl_c = 'No';
   end if;
   
      let desc_err = "NOE Estado";
      select c_estado into westado_c from c_estado where id_div_geografica = wdivgeo; 
   
      
    if wempresa <> "02" then
    
      select count(*) into wbandera01 from m4t_datos_pago where id_empleado = wemp;
      if wbandera01 = 1 then
         let desc_err = "NOE DatosPago";
         
            select id_forma_pago,id_banco,num_cuenta into wforpago, wbanco, wcuenta from m4t_datos_pago where id_empleado = wemp;
         if wcuenta = '' or wcuenta is null then
	    let wcuenta = "99999999999";
         end if;
      else
         let wbanco = "ERROR BANCO";
         let wcuenta = "ERROR CUENTA";
      end if
      
      if wforpago = "CHEQUE" then
         let wbanco = "BNMX";
         select c_banco into wbanco_c from c_banco where id_banco = wbanco;
         let wcuenta = "99999999999";

      end if
      
      let desc_err = "NOE DatosPago02";                       
      if wforpago = 'TD' then

         if wbanco = 'SPEI' then
            let desc_err = "NOE DatosPago03";
            select count(*) into wbandera01 from m4t_datos_pago where id_empleado = wemp;
            if wbandera01 = 1 then
               let desc_err = "NOE CtaSPEI";         
               select substr(num_cuenta,1,3) into wbanco_c from m4t_datos_pago where id_empleado = wemp;
            else
               let wbanco_c = "ERROR SPEI";
               
            end if;               
         else
            let desc_err = "NOE DatosPago04";
            select count(*) into wbandera01 from c_banco where id_banco = wbanco;
            if wbandera01 = 1 then
               let desc_err = "NOE CtaTD";         
               select c_banco into wbanco_c from c_banco where id_banco = wbanco;
            else
	       let wbanco_c = 'ERROR CUENTA2'; 
            end if;
         end if;
         

	 if substr(wcuenta,1,5) = '00000' then let wcuenta = substr(wcuenta,6,(length(wcuenta)-5)); end if;
	 if substr(wcuenta,1,4) = '0000' then let wcuenta = substr(wcuenta,5,(length(wcuenta)-4)); end if;
	 if substr(wcuenta,1,3) = '000' then let wcuenta = substr(wcuenta,4,(length(wcuenta)-3)); end if;
	 if substr(wcuenta,1,2) = '00' then let wcuenta = substr(wcuenta,3,(length(wcuenta)-2)); end if;
	 if substr(wcuenta,1,3) = '0' then let wcuenta = substr(wcuenta,2,(length(wcuenta)-1)); end if;
	 let desc_err = "NOE DatosPago05";  

         if length(wcuenta) <= 10 then 
            let wcuenta = lpad(wcuenta,10,'0'); 
         else
            if length(wcuenta) <= 11 then 
               let wcuenta = lpad(wcuenta,11,'0'); 
            else
               if length(wcuenta) <= 16 then 
                  let wcuenta = lpad(wcuenta,16,'0'); 
               else
                  if length(wcuenta) <= 18 then 
                     let wcuenta = lpad(wcuenta,18,'0'); end if;
               end if;
            end if;
         end if;

      end if;
      
    end if;

   If length(wcuenta) = 18 then
      return 'MCLR ->' || length(wcuenta) with resume;
      Let wbanco_c = "";
   end if;

   if length(wcuenta) = 10  and wbanco ='SPEI' then
     return 'EAGG ->'  || length(wcuenta) with resume;
     LET wbanco_c = "062";
   end if;

    -----------------INICIO----se aplica en ISSSTE y se comenta en PENSIONISSSTE------------------------
   If length(wcuenta) = 18 then
      return 'SPEI ->' || length(wcuenta) with resume;
      Let wbanco_c = "";
   end if;
    -----------------FIN-------se aplica en ISSSTE y se comenta en PENSIONISSSTE------------------------

      let desc_err = "NOE DatosPago06";
      let desc_err = "NOE Arma"||"-"||wforpago||"-"||wbanco||"-"||wcuenta;

      let cadNOEa= 'NOE' ||rpad(wemp,15,' ')||rpad(wcurp,18,' ')||rpad(w_Regim,3,' ')||rpad(wnumero_ss,15,' ')||rpad(wfec_finx,10,' ')||rpad(wfec_iniciox,10,' ')||rpad(wfec_finx,10,' ')||lpad(wdias,18,'0')||rpad(wdserv,100,' ')||rpad(wcuenta,18,' ')||rpad(wbanco_c,3,' ')||rpad(wfec_alta2,10,' ')||rpad(wdiaantig,10,' ');
      --let cadNOEb=rpad(wd2puesto,100,' ')||rpad(w_TipCont1,20,' ')||rpad(' ',20,' ')||rpad(w_Period1,20,' ')||rpad(' ',18,' ')||rpad('1',4,' ')||rpad(' ',18,' ')||rpad('  ',2,'  ')||rpad(wsindl_c,2,' ')||rpad(westado_c,3,' ')||'@';
      let cadNOEb=rpad(trim(wd2puesto)|| '/' || trim(wipuesto) || '/' || trim(wcen_pago) || '/' || trim(wcen_trab) || '/' || trim(wid_nivel_wid_grupo_grado_nivel) || '/' || trim(wid_sub_nivel_wid_integracion) || '/' || trim(wid_zona) || '/0' ,100,' ')||rpad(w_TipCont1,20,' ')||rpad(' ',20,' ')||rpad(w_Period1,20,' ')||rpad(' ',18,' ')||rpad('1',4,' ')||rpad(' ',18,' ')||rpad('  ',2,'  ')||rpad(wsindl_c,2,' ')||rpad(westado_c,3,' ')||'@';
      
      let wnum_linea=wnum_linea+1;
      let desc_err = "inserta NOEa";
      insert into info_sat9 (num_linea,id_empresa,id_empleado,linea) values (wnum_linea,wid_empresa,wemp,cadNOEa||cadNOEb);
   
      
      
      
      let cadNO2 = 'NO2'||rpad(w_TipNom1,2,' ')||'@';
      let wnum_linea=wnum_linea+1;
      insert into info_sat9 (num_linea,id_empresa,id_empleado,linea) values (wnum_linea,wid_empresa,wemp,cadNO2);


      
      
      let cadNO3 = 'NO3'||rpad(' ',18,' ')||rpad('00'||wramo||wpagaduria,20,' ')||rpad(' ',13,' ')||rpad('IF',2,' ')||rpad(' ',18,' ')||'@';
      let wnum_linea=wnum_linea+1;
      insert into info_sat9 (num_linea,id_empresa,id_empleado,linea) values (wnum_linea,wid_empresa,wemp,cadNO3);
      
            
      
      let wconp = 0;
      let wcond = 0;
      let wcons = 0;
      
      if wi1 != 0 and flg1 = 0 then call GenLinSATu(wemp,wfec_pago,wp1,wi1,wc1,wnum_linea,wid_empresa,wconp,wcond) returning wnum_linea,wcond,wconp;
      else if flg1 = 3 then
         call GenLinSATue(wemp,wfec_pago,wp1,wi1,wc1,wi2,wc2,wnum_linea,wid_empresa,wconp,wcond) returning wnum_linea,wcond,wconp;
         if wc1='09' and wi1 > 0 then call GenNOHu(wemp,wfec_pago,wi1,wc1,wnum_linea,wid_empresa,wconp) returning wnum_linea; end if;
         let flg2 = 2;
      end if; end if;
      
      if wi2 != 0 and flg2 = 0 then call GenLinSATu(wemp,wfec_pago,wp2,wi2,wc2,wnum_linea,wid_empresa,wconp,wcond) returning wnum_linea,wcond,wconp;
      else if flg2 = 3 then
         call GenLinSATue(wemp,wfec_pago,wp2,wi2,wc2,wi3,wc3,wnum_linea,wid_empresa,wconp,wcond) returning wnum_linea,wcond,wconp;
         if wc2='09' and wi2 > 0 then call GenNOHu(wemp,wfec_pago,wi2,wc2,wnum_linea,wid_empresa,wconp) returning wnum_linea; end if;
         let flg3 = 2;
      end if; end if;
      
      if wi3 != 0 and flg3 = 0 then call GenLinSATu(wemp,wfec_pago,wp3,wi3,wc3,wnum_linea,wid_empresa,wconp,wcond) returning wnum_linea,wcond,wconp;
      else if flg3 = 3 then
         call GenLinSATue(wemp,wfec_pago,wp3,wi3,wc3,wi4,wc4,wnum_linea,wid_empresa,wconp,wcond) returning wnum_linea,wcond,wconp;
         if wc3='09' and wi3 > 0 then call GenNOHu(wemp,wfec_pago,wi3,wc3,wnum_linea,wid_empresa,wconp) returning wnum_linea; end if;
         let flg4 = 2;
      end if; end if;
      
      if wi4 != 0 and flg4 = 0 then call GenLinSATu(wemp,wfec_pago,wp4,wi4,wc4,wnum_linea,wid_empresa,wconp,wcond) returning wnum_linea,wcond,wconp;
      else if flg4 = 3 then
         call GenLinSATue(wemp,wfec_pago,wp4,wi4,wc4,wi5,wc5,wnum_linea,wid_empresa,wconp,wcond) returning wnum_linea,wcond,wconp;
         if wc4='09' and wi4 > 0 then call GenNOHu(wemp,wfec_pago,wi4,wc4,wnum_linea,wid_empresa,wconp) returning wnum_linea; end if; 
         let flg5 = 2;
      end if; end if;
      
      if wi5 != 0 and flg5 = 0 then call GenLinSATu(wemp,wfec_pago,wp5,wi5,wc5,wnum_linea,wid_empresa,wconp,wcond) returning wnum_linea,wcond,wconp;
      else if flg5 = 3 then
         call GenLinSATue(wemp,wfec_pago,wp5,wi5,wc5,wi6,wc6,wnum_linea,wid_empresa,wconp,wcond) returning wnum_linea,wcond,wconp;
         if wc5='09' and wi5 > 0 then call GenNOHu(wemp,wfec_pago,wi5,wc5,wnum_linea,wid_empresa,wconp) returning wnum_linea; end if;  
         let flg6 = 2;
      end if; end if;
      
      if wi6 != 0 and flg6 = 0 then call GenLinSATu(wemp,wfec_pago,wp6,wi6,wc6,wnum_linea,wid_empresa,wconp,wcond) returning wnum_linea,wcond,wconp;
      else if flg6 = 3 then
         call GenLinSATue(wemp,wfec_pago,wp6,wi6,wc6,wi7,wc7,wnum_linea,wid_empresa,wconp,wcond) returning wnum_linea,wcond,wconp;
         if wc6='09' and wi6 > 0 then call GenNOHu(wemp,wfec_pago,wi6,wc6,wnum_linea,wid_empresa,wconp) returning wnum_linea; end if;  
         let flg7 = 2;
      end if; end if;
      
      if wi7 != 0 and flg7 = 0 then call GenLinSATu(wemp,wfec_pago,wp7,wi7,wc7,wnum_linea,wid_empresa,wconp,wcond) returning wnum_linea,wcond,wconp;
      else if flg7 = 3 then
         call GenLinSATue(wemp,wfec_pago,wp7,wi7,wc7,wi8,wc8,wnum_linea,wid_empresa,wconp,wcond) returning wnum_linea,wcond,wconp;
         if wc7='09' and wi7 > 0 then call GenNOHu(wemp,wfec_pago,wi7,wc7,wnum_linea,wid_empresa,wconp) returning wnum_linea; end if;  
         let flg8 = 2;
      end if; end if;
      
      if wi8 != 0 and flg8 = 0 then call GenLinSATu(wemp,wfec_pago,wp8,wi8,wc8,wnum_linea,wid_empresa,wconp,wcond) returning wnum_linea,wcond,wconp;
      else if flg8 = 3 then
         call GenLinSATue(wemp,wfec_pago,wp8,wi8,wc8,wi9,wc9,wnum_linea,wid_empresa,wconp,wcond) returning wnum_linea,wcond,wconp;
         if wc8='09' and wi8 > 0 then call GenNOHu(wemp,wfec_pago,wi8,wc8,wnum_linea,wid_empresa,wconp) returning wnum_linea; end if;  
         let flg9 = 2;
      end if; end if;
      
      if wi9 != 0 and flg9 = 0 then call GenLinSATu(wemp,wfec_pago,wp9,wi9,wc9,wnum_linea,wid_empresa,wconp,wcond) returning wnum_linea,wcond,wconp;
      else if flg9 = 3 then
         call GenLinSATue(wemp,wfec_pago,wp9,wi9,wc9,wi10,wc10,wnum_linea,wid_empresa,wconp,wcond) returning wnum_linea,wcond,wconp;
         if wc9='09' and wi9 > 0 then call GenNOHu(wemp,wfec_pago,wi9,wc9,wnum_linea,wid_empresa,wconp) returning wnum_linea; end if;  
         let flg10 = 2;
      end if; end if;
      
      if wi10 != 0 and flg10 = 0 then call GenLinSATu(wemp,wfec_pago,wp10,wi10,wc10,wnum_linea,wid_empresa,wconp,wcond) returning wnum_linea,wcond,wconp;
      else if flg10 = 3 then
         call GenLinSATue(wemp,wfec_pago,wp10,wi10,wc10,wi11,wc11,wnum_linea,wid_empresa,wconp,wcond) returning wnum_linea,wcond,wconp;
         if wc10='09' and wi10 > 0 then call GenNOHu(wemp,wfec_pago,wi10,wc10,wnum_linea,wid_empresa,wconp) returning wnum_linea; end if;  
         let flg11 = 2;
      end if; end if;
      
      if wi11 != 0 and flg11 = 0 then call GenLinSATu(wemp,wfec_pago,wp11,wi11,wc11,wnum_linea,wid_empresa,wconp,wcond) returning wnum_linea,wcond,wconp;
      else if flg11 = 3 then
         call GenLinSATue(wemp,wfec_pago,wp11,wi11,wc11,wi12,wc12,wnum_linea,wid_empresa,wconp,wcond) returning wnum_linea,wcond,wconp;
         if wc11='09' and wi11 > 0 then call GenNOHu(wemp,wfec_pago,wi11,wc11,wnum_linea,wid_empresa,wconp) returning wnum_linea; end if;  
         let flg12 = 2;
      end if; end if;
      
      if wi12 != 0 and flg12 = 0 then call GenLinSATu(wemp,wfec_pago,wp12,wi12,wc12,wnum_linea,wid_empresa,wconp,wcond) returning wnum_linea,wcond,wconp;
      else if flg12 = 3 then
         call GenLinSATue(wemp,wfec_pago,wp12,wi12,wc12,wi13,wc13,wnum_linea,wid_empresa,wconp,wcond) returning wnum_linea,wcond,wconp;
         if wc12='09' and wi12 > 0 then call GenNOHu(wemp,wfec_pago,wi12,wc12,wnum_linea,wid_empresa,wconp) returning wnum_linea; end if;  
         let flg13 = 2;
      end if; end if;
      
      if wi13 != 0 and flg13 = 0 then call GenLinSATu(wemp,wfec_pago,wp13,wi13,wc13,wnum_linea,wid_empresa,wconp,wcond) returning wnum_linea,wcond,wconp;
      else if flg13 = 3 then
         call GenLinSATue(wemp,wfec_pago,wp13,wi13,wc13,wi14,wc14,wnum_linea,wid_empresa,wconp,wcond) returning wnum_linea,wcond,wconp;
         if wc13='09' and wi13 > 0 then call GenNOHu(wemp,wfec_pago,wi13,wc13,wnum_linea,wid_empresa,wconp) returning wnum_linea; end if;  
         let flg14 = 2;
      end if; end if;
      
      if wi14 != 0 and flg14 = 0 then call GenLinSATu(wemp,wfec_pago,wp14,wi14,wc14,wnum_linea,wid_empresa,wconp,wcond) returning wnum_linea,wcond,wconp;
      else if flg14 = 3 then
         call GenLinSATue(wemp,wfec_pago,wp14,wi14,wc14,wi15,wc15,wnum_linea,wid_empresa,wconp,wcond) returning wnum_linea,wcond,wconp;
         if wc14='09' and wi14 > 0 then call GenNOHu(wemp,wfec_pago,wi14,wc14,wnum_linea,wid_empresa,wconp) returning wnum_linea; end if;  
         let flg15 = 2;
      end if; end if;
      
      if wi15 != 0 and flg15 = 0 then call GenLinSATu(wemp,wfec_pago,wp15,wi15,wc15,wnum_linea,wid_empresa,wconp,wcond) returning wnum_linea,wcond,wconp;
      else if flg15 = 3 then
         call GenLinSATue(wemp,wfec_pago,wp15,wi15,wc15,wi16,wc16,wnum_linea,wid_empresa,wconp,wcond) returning wnum_linea,wcond,wconp;
         if wc15='09' and wi15 > 0 then call GenNOHu(wemp,wfec_pago,wi15,wc15,wnum_linea,wid_empresa,wconp) returning wnum_linea; end if;  
         let flg16 = 2;
      end if; end if;
      
      if wi16 != 0 and flg16 = 0 then call GenLinSATu(wemp,wfec_pago,wp16,wi16,wc16,wnum_linea,wid_empresa,wconp,wcond) returning wnum_linea,wcond,wconp;
      else if flg16 = 3 then
         call GenLinSATue(wemp,wfec_pago,wp16,wi16,wc16,wi17,wc17,wnum_linea,wid_empresa,wconp,wcond) returning wnum_linea,wcond,wconp;
         if wc16='09' and wi16 > 0 then call GenNOHu(wemp,wfec_pago,wi16,wc16,wnum_linea,wid_empresa,wconp) returning wnum_linea; end if;  
         let flg17 = 2;
      end if; end if;
      
      if wi17 != 0 and flg17 = 0 then call GenLinSATu(wemp,wfec_pago,wp17,wi17,wc17,wnum_linea,wid_empresa,wconp,wcond) returning wnum_linea,wcond,wconp;
      else if flg17 = 3 then
         call GenLinSATue(wemp,wfec_pago,wp17,wi17,wc17,wi18,wc18,wnum_linea,wid_empresa,wconp,wcond) returning wnum_linea,wcond,wconp;
         if wc17='09' and wi17 > 0 then call GenNOHu(wemp,wfec_pago,wi17,wc17,wnum_linea,wid_empresa,wconp) returning wnum_linea; end if;  
         let flg18 = 2;
      end if; end if;
      
      if wi18 != 0 and flg18 = 0 then call GenLinSATu(wemp,wfec_pago,wp18,wi18,wc18,wnum_linea,wid_empresa,wconp,wcond) returning wnum_linea,wcond,wconp;
      else if flg18 = 3 then
         call GenLinSATue(wemp,wfec_pago,wp18,wi18,wc18,wi19,wc19,wnum_linea,wid_empresa,wconp,wcond) returning wnum_linea,wcond,wconp;
         if wc18='09' and wi18 > 0 then call GenNOHu(wemp,wfec_pago,wi18,wc18,wnum_linea,wid_empresa,wconp) returning wnum_linea; end if;  
         let flg19 = 2;
      end if; end if;
      
      if wi19 != 0 and flg19 = 0 then call GenLinSATu(wemp,wfec_pago,wp19,wi19,wc19,wnum_linea,wid_empresa,wconp,wcond) returning wnum_linea,wcond,wconp;
      else if flg19 = 3 then
         call GenLinSATue(wemp,wfec_pago,wp19,wi19,wc19,wi20,wc20,wnum_linea,wid_empresa,wconp,wcond) returning wnum_linea,wcond,wconp;
         if wc19='09' and wi19 > 0 then call GenNOHu(wemp,wfec_pago,wi19,wc19,wnum_linea,wid_empresa,wconp) returning wnum_linea; end if;  
         let flg20 = 2;
      end if; end if;
      
      if wi20 != 0 and flg20 = 0 then call GenLinSATu(wemp,wfec_pago,wp20,wi20,wc20,wnum_linea,wid_empresa,wconp,wcond) returning wnum_linea,wcond,wconp;
      else if flg20 = 3 then
         call GenLinSATue(wemp,wfec_pago,wp20,wi20,wc20,wi21,wc21,wnum_linea,wid_empresa,wconp,wcond) returning wnum_linea,wcond,wconp;
         if wc20='09' and wi20 > 0 then call GenNOHu(wemp,wfec_pago,wi20,wc20,wnum_linea,wid_empresa,wconp) returning wnum_linea; end if;  
         let flg21 = 2;
      end if; end if;
      
      if wi21 != 0 and flg21 = 0 then call GenLinSATu(wemp,wfec_pago,wp21,wi21,wc21,wnum_linea,wid_empresa,wconp,wcond) returning wnum_linea,wcond,wconp;
      else if flg21 = 3 then
         call GenLinSATue(wemp,wfec_pago,wp21,wi21,wc21,wi22,wc22,wnum_linea,wid_empresa,wconp,wcond) returning wnum_linea,wcond,wconp;
         if wc21='09' and wi21 > 0 then call GenNOHu(wemp,wfec_pago,wi21,wc21,wnum_linea,wid_empresa,wconp) returning wnum_linea; end if;  
         let flg22 = 2;
      end if; end if;
      
      if wi22 != 0 and flg22 = 0 then call GenLinSATu(wemp,wfec_pago,wp22,wi22,wc22,wnum_linea,wid_empresa,wconp,wcond) returning wnum_linea,wcond,wconp;
      else if flg22 = 3 then
         call GenLinSATue(wemp,wfec_pago,wp22,wi22,wc22,wi23,wc23,wnum_linea,wid_empresa,wconp,wcond) returning wnum_linea,wcond,wconp;
         if wc22='09' and wi22 > 0 then call GenNOHu(wemp,wfec_pago,wi22,wc22,wnum_linea,wid_empresa,wconp) returning wnum_linea; end if;  
         let flg23 = 2;
      end if; end if;
      
      if wi23 != 0 and flg23 = 0 then call GenLinSATu(wemp,wfec_pago,wp23,wi23,wc23,wnum_linea,wid_empresa,wconp,wcond) returning wnum_linea,wcond,wconp;
      else if flg23 = 3 then
         call GenLinSATue(wemp,wfec_pago,wp23,wi23,wc23,wi24,wc24,wnum_linea,wid_empresa,wconp,wcond) returning wnum_linea,wcond,wconp;
         if wc23='09' and wi23 > 0 then call GenNOHu(wemp,wfec_pago,wi23,wc23,wnum_linea,wid_empresa,wconp) returning wnum_linea; end if;  
         let flg24 = 2;
      end if; end if;
      
      if wi24 != 0 and flg24 = 0 then call GenLinSATu(wemp,wfec_pago,wp24,wi24,wc24,wnum_linea,wid_empresa,wconp,wcond) returning wnum_linea,wcond,wconp;
      else if flg24 = 3 then
         call GenLinSATue(wemp,wfec_pago,wp24,wi24,wc24,wi25,wc25,wnum_linea,wid_empresa,wconp,wcond) returning wnum_linea,wcond,wconp;
         if wc24='09' and wi24 > 0 then call GenNOHu(wemp,wfec_pago,wi24,wc24,wnum_linea,wid_empresa,wconp) returning wnum_linea; end if;  
         let flg25 = 2;
      end if; end if;
      
      if wi25 != 0 and flg25 = 0 then call GenLinSATu(wemp,wfec_pago,wp25,wi25,wc25,wnum_linea,wid_empresa,wconp,wcond) returning wnum_linea,wcond,wconp;
      else if flg25 = 3 then
         call GenLinSATue(wemp,wfec_pago,wp25,wi25,wc25,wi26,wc26,wnum_linea,wid_empresa,wconp,wcond) returning wnum_linea,wcond,wconp;
         if wc25='09' and wi25 > 0 then call GenNOHu(wemp,wfec_pago,wi25,wc25,wnum_linea,wid_empresa,wconp) returning wnum_linea; end if;  
         let flg26 = 2;
      end if; end if;
      
      if wi26 != 0 and flg26 = 0 then call GenLinSATu(wemp,wfec_pago,wp26,wi26,wc26,wnum_linea,wid_empresa,wconp,wcond) returning wnum_linea,wcond,wconp;
      else if flg26 = 3 then
         call GenLinSATue(wemp,wfec_pago,wp26,wi26,wc26,wi27,wc27,wnum_linea,wid_empresa,wconp,wcond) returning wnum_linea,wcond,wconp;
         if wc26='09' and wi26 > 0 then call GenNOHu(wemp,wfec_pago,wi26,wc26,wnum_linea,wid_empresa,wconp) returning wnum_linea; end if;  
         let flg27 = 2;
      end if; end if;
      
      if wi27 != 0 and flg27 = 0 then call GenLinSATu(wemp,wfec_pago,wp27,wi27,wc27,wnum_linea,wid_empresa,wconp,wcond) returning wnum_linea,wcond,wconp;
      else if flg27 = 3 then
         call GenLinSATue(wemp,wfec_pago,wp27,wi27,wc27,wi28,wc28,wnum_linea,wid_empresa,wconp,wcond) returning wnum_linea,wcond,wconp;
         if wc27='09' and wi27 > 0 then call GenNOHu(wemp,wfec_pago,wi27,wc27,wnum_linea,wid_empresa,wconp) returning wnum_linea; end if;  
         let flg28 = 2;
      end if; end if;
      
      if wi28 != 0 and flg28 = 0 then call GenLinSATu(wemp,wfec_pago,wp28,wi28,wc28,wnum_linea,wid_empresa,wconp,wcond) returning wnum_linea,wcond,wconp;
      else if flg28 = 3 then
         call GenLinSATue(wemp,wfec_pago,wp28,wi28,wc28,wi29,wc29,wnum_linea,wid_empresa,wconp,wcond) returning wnum_linea,wcond,wconp;
         if wc28='09' and wi28 > 0 then call GenNOHu(wemp,wfec_pago,wi28,wc28,wnum_linea,wid_empresa,wconp) returning wnum_linea; end if;  
         let flg29 = 2;
      end if; end if;
      
      if wi29 != 0 and flg29 = 0 then call GenLinSATu(wemp,wfec_pago,wp29,wi29,wc29,wnum_linea,wid_empresa,wconp,wcond) returning wnum_linea,wcond,wconp;
      else if flg29 = 3 then
         call GenLinSATue(wemp,wfec_pago,wp29,wi29,wc29,wi30,wc30,wnum_linea,wid_empresa,wconp,wcond) returning wnum_linea,wcond,wconp;
         if wc29='09' and wi29 > 0 then call GenNOHu(wemp,wfec_pago,wi29,wc29,wnum_linea,wid_empresa,wconp) returning wnum_linea; end if;  
         let flg30 = 2;
      end if;   end if;
      
      if wi30 != 0 and flg30 = 0 then call GenLinSATu(wemp,wfec_pago,wp30,wi30,wc30,wnum_linea,wid_empresa,wconp,wcond) returning wnum_linea,wcond,wconp;
      else if flg30 = 3 then
         call GenLinSATue(wemp,wfec_pago,wp30,wi30,wc30,wi31,wc31,wnum_linea,wid_empresa,wconp,wcond) returning wnum_linea,wcond,wconp;
         if wc30='09' and wi30 > 0 then call GenNOHu(wemp,wfec_pago,wi30,wc30,wnum_linea,wid_empresa,wconp) returning wnum_linea; end if;  
         let flg31 = 2;
      end if; end if;
      
      if wi31 != 0 and flg31 = 0 then call GenLinSATu(wemp,wfec_pago,wp31,wi31,wc31,wnum_linea,wid_empresa,wconp,wcond) returning wnum_linea,wcond,wconp;
      else if flg31 = 3 then
         call GenLinSATue(wemp,wfec_pago,wp31,wi31,wc31,wi32,wc32,wnum_linea,wid_empresa,wconp,wcond) returning wnum_linea,wcond,wconp;
         if wc31='09' and wi31 > 0 then call GenNOHu(wemp,wfec_pago,wi31,wc31,wnum_linea,wid_empresa,wconp) returning wnum_linea; end if;  
         let flg32 = 2;
      end if; end if;
      
      if wi32 != 0 and flg32 = 0 then call GenLinSATu(wemp,wfec_pago,wp32,wi32,wc32,wnum_linea,wid_empresa,wconp,wcond) returning wnum_linea,wcond,wconp;
      else if flg32 = 3 then
         call GenLinSATue(wemp,wfec_pago,wp32,wi32,wc32,wi33,wc33,wnum_linea,wid_empresa,wconp,wcond) returning wnum_linea,wcond,wconp;
         if wc32='09' and wi32 > 0 then call GenNOHu(wemp,wfec_pago,wi32,wc32,wnum_linea,wid_empresa,wconp) returning wnum_linea; end if;  
         let flg33 = 2;
      end if; end if;
      
      if wi33 != 0 and flg33 = 0 then call GenLinSATu(wemp,wfec_pago,wp33,wi33,wc33,wnum_linea,wid_empresa,wconp,wcond) returning wnum_linea,wcond,wconp;
      else if flg33 = 3 then
         call GenLinSATue(wemp,wfec_pago,wp33,wi33,wc33,wi34,wc34,wnum_linea,wid_empresa,wconp,wcond) returning wnum_linea,wcond,wconp;
         if wc33='09' and wi33 > 0 then call GenNOHu(wemp,wfec_pago,wi33,wc33,wnum_linea,wid_empresa,wconp) returning wnum_linea; end if;  
         let flg34 = 2;
      end if; end if;
      
      if wi34 != 0 and flg34 = 0 then call GenLinSATu(wemp,wfec_pago,wp34,wi34,wc34,wnum_linea,wid_empresa,wconp,wcond) returning wnum_linea,wcond,wconp;
      else if flg34 = 3 then
         call GenLinSATue(wemp,wfec_pago,wp34,wi34,wc34,wi35,wc35,wnum_linea,wid_empresa,wconp,wcond) returning wnum_linea,wcond,wconp;
         if wc34='09' and wi34 > 0 then call GenNOHu(wemp,wfec_pago,wi34,wc34,wnum_linea,wid_empresa,wconp) returning wnum_linea; end if;  
         let flg35 = 2;
      end if; end if;
      
      if wi35 != 0 and flg35 = 0 then call GenLinSATu(wemp,wfec_pago,wp35,wi35,wc35,wnum_linea,wid_empresa,wconp,wcond) returning wnum_linea,wcond,wconp;
      else if flg35 = 3 then
         call GenLinSATue(wemp,wfec_pago,wp35,wi35,wc35,wi36,wc36,wnum_linea,wid_empresa,wconp,wcond) returning wnum_linea,wcond,wconp;
         if wc35='09' and wi35 > 0 then call GenNOHu(wemp,wfec_pago,wi35,wc35,wnum_linea,wid_empresa,wconp) returning wnum_linea; end if;  
         let flg36 = 2;
      end if; end if;
      
      if wi36 != 0 and flg36 = 0 then call GenLinSATu(wemp,wfec_pago,wp36,wi36,wc36,wnum_linea,wid_empresa,wconp,wcond) returning wnum_linea,wcond,wconp;
      else if flg36 = 3 then
         call GenLinSATue(wemp,wfec_pago,wp36,wi36,wc36,wi37,wc37,wnum_linea,wid_empresa,wconp,wcond) returning wnum_linea,wcond,wconp;
         if wc36='09' and wi36 > 0 then call GenNOHu(wemp,wfec_pago,wi36,wc36,wnum_linea,wid_empresa,wconp) returning wnum_linea; end if;  
         let flg37 = 2;
      end if; end if;
      
      if wi37 != 0 and flg37 = 0 then call GenLinSATu(wemp,wfec_pago,wp37,wi37,wc37,wnum_linea,wid_empresa,wconp,wcond) returning wnum_linea,wcond,wconp;
      else if flg37 = 3 then
         call GenLinSATue(wemp,wfec_pago,wp37,wi37,wc37,wi38,wc38,wnum_linea,wid_empresa,wconp,wcond) returning wnum_linea,wcond,wconp;
         if wc37='09' and wi37 > 0 then call GenNOHu(wemp,wfec_pago,wi37,wc37,wnum_linea,wid_empresa,wconp) returning wnum_linea; end if;  
         let flg38 = 2;
      end if; end if;
      
      if wi38 != 0 and flg38 = 0 then call GenLinSATu(wemp,wfec_pago,wp38,wi38,wc38,wnum_linea,wid_empresa,wconp,wcond) returning wnum_linea,wcond,wconp;
      else if flg38 = 3 then
         call GenLinSATue(wemp,wfec_pago,wp38,wi38,wc38,wi39,wc39,wnum_linea,wid_empresa,wconp,wcond) returning wnum_linea,wcond,wconp;
         if wc38='09' and wi38 > 0 then call GenNOHu(wemp,wfec_pago,wi38,wc38,wnum_linea,wid_empresa,wconp) returning wnum_linea; end if;  
         let flg39 = 2;
      end if; end if;
      
      if wi39 != 0 and flg39 = 0 then call GenLinSATu(wemp,wfec_pago,wp39,wi39,wc39,wnum_linea,wid_empresa,wconp,wcond) returning wnum_linea,wcond,wconp;
      else if flg39 = 3 then
         call GenLinSATue(wemp,wfec_pago,wp39,wi39,wc39,wi40,wc40,wnum_linea,wid_empresa,wconp,wcond) returning wnum_linea,wcond,wconp;
         if wc39='09' and wi39 > 0 then call GenNOHu(wemp,wfec_pago,wi39,wc39,wnum_linea,wid_empresa,wconp) returning wnum_linea; end if;  
         let flg40 = 2;
      end if; end if;
      
      if wi40 != 0 and flg40 = 0 then call GenLinSATu(wemp,wfec_pago,wp40,wi40,wc40,wnum_linea,wid_empresa,wconp,wcond) returning wnum_linea,wcond,wconp;
         if wc40='09' and wi40 > 0 then call GenNOHu(wemp,wfec_pago,wi40,wc40,wnum_linea,wid_empresa,wconp) returning wnum_linea; end if;  
      end if;
            
      ---if wnomin = 'E' then
      
      let cadNOP = 'NOP' ||rpad('1',4,' ')||rpad('002',3,' ')||rpad('046',15,' ')||rpad('Subsidio para el empleo',100,' ')||rpad('0.00',18,' ')||rpad('0.00',18,' ')||rpad('0.00',18,' ')||rpad(' ',22,' ')||'@';
      let wnum_linea=wnum_linea+1;
      insert into info_sat9 (num_linea,id_empresa,id_empleado,linea) values (wnum_linea,wid_empresa,wemp,cadNOP);
      
      ---end if;
      
      let w_cont = w_cont + 1;
      
   end foreach;
   
   update timb_cons_2023 set num_consf = wnum_cons2 
   where empresa = wid_empresa and fec_pago = wfec_pago and fec_crea = wfec_pagox and descripcion = w_NomDes and num_cons = wnum_consi;
   return 'Informe --> ' || wnomin || '; ' || w_NomDes || '; ' || w_TipCont || '; ' ||w_Period || '; ' ||w_TipNom || '.'with resume;   
   
   SYSTEM "echo unload to 'Archivo.txt' > sql01.sql";
   SYSTEM "echo select linea from info_sat9 order by num_linea >> sql01.sql";
   SYSTEM "dbaccess m4prod sql01.sql";

   SYSTEM "sed '1,$s/|//g' Archivo.txt > Archivo1.txt";
   SYSTEM "sed '1,$s/@//g' Archivo1.txt > ArchivoSAT_2023.txt";
end procedure;
