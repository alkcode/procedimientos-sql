drop procedure if exists layout_AGUI_2022_EAGG;
create procedure layout_AGUI_2022_EAGG(wfec_pago date,wnomin varchar(1), wempresa varchar(2), wtipo varchar(1))
returning char(265);
-----realizado por EAGG. Programa para ISSSTE ASEGURADOR PENSIONISSSTE Y TURISSSTE
-----el dÌa 13/01/2022
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

   ------------------------------------------------------------
   -----------Variables creadas para aguinaldo
   define wfec_alta_qp date;
   define wpagaduria_qp varchar(10);
   define wn_clave_servicio_qp, wn_puesto_plaza_qp varchar(50);
   define wbanco_qp varchar(3);
   define wnum_cuenta_qp varchar(18);
   define a_xi1, a_xi1a, a_xi2, a_xi3, a_xi4, a_xi5 decimal(14,2);
   define a_xc1, a_xc2, a_xc3, a_xc4, a_xc5 varchar(2);
   define wn_div_geografica_qp varchar(50);
   define a_idtipopuesto, a_idtipoplaza varchar(02);
   define wtipcon char(02);
   -----------Variables creadas para aguinaldo
   ------------------------------------------------------------
   
   set isolation to dirty read;
   
   --set debug file to 'error_layout.log';
   --trace on;


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
         delete timb_cons where fec_pago = '15/01/2019' and empresa = wempresa;
         let wnum_consi = 01;
         insert into timb_cons values(wempresa,'000000',wnum_consi, 0, 00.00, wfec_pago, wfec_pagox);
      else
         let wnum_consv = 0;
         select count(*) into wnum_consv from timb_cons 
         where fec_pago = wfec_pago and fec_crea = wfec_pagox and empresa = wempresa and descripcion = w_NomDes;
         
         select max(num_consf) into wnum_consi from timb_cons where fec_crea >= '15/10/2019' and empresa = wempresa;
         
         let wnum_consi = wnum_consi + 1;
         let wnum_cons2 = wnum_consi;
         insert into timb_cons values(wempresa, w_NomDes,wnum_consi, 0, wnum_consv, wfec_pago, wfec_pagox);

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
	 
   foreach 
   SELECT b.id_legal, trim(b.apellido_1) ||' '|| trim(b.apellido_2) ||' '|| trim(b.nombre) nombre, b.id_c_u_r_p_st, max(e.fec_alta_empleado),a.rfc,        --5
       '00637' || f.pagaduria, nvl(b.numero_ss,'99999999999'), g.n_clave_servicio, h.n_puesto_plaza, nvl(substr(i.num_cuenta,1,3),''), nvl(i.num_cuenta,'999999999'),    --11
       c.grava_aguina_st, d.exento_aguinald,        --20
       c.COMPEN_ISR_AGUI,      --24
        c.ISR_AGUIN,d.TOTAL_P_ALIMEN,d.reten_judicial,   --36
       nvl(c.id_div_geografica,'99'),nvl(j.n_div_geografica,'99'), f.pagaduria, a.adscripcion, d.d_antig_gob_fed, d.id_tipo_puesto, c.id_tipo_plaza
--c.id_div_geografica--,nvl(j.n_div_geografica,'99')
   Into wid_legal, wnombre, wcurp,wfec_alta_qp,wemp,
         wpagaduria_qp, wnumero_ss, wn_clave_servicio_qp, wn_puesto_plaza_qp, wbanco_qp, wnum_cuenta_qp,
         a_xi1, a_xi1a, a_xi2, a_xi3, a_xi4, a_xi5, wdivgeo, wn_div_geografica_qp, wpagaduria, wadscripcion,wdiaantig,a_idtipopuesto, a_idtipoplaza
             FROM cosif_prueba2 a
        inner join m4t_empleados b on 
            a.rfc=b.id_empleado
        left outer join m4t_acumulado_rl_2011 c on 
            a.rfc=c.id_empleado and
            a.fec_pago=c.fec_pago
        --left outer join m4t_acumulado_rl1_2011 d on
         inner join m4t_acumulado_rl1_2011 d on
            a.rfc=d.id_empleado and
            a.fec_pago=d.fec_pago
        inner join m4t_fases_alta e on 
            a.rfc=e.id_empleado
        left outer join ramo_ct_tim f on
            --b.id_agrup_seguridad=f.ct5
            a.adscripcion=f.ct10
        left outer join m4t_clave_servicio g on
            d.id_clave_servicio=g.id_clave_servicio and
            g.id_empresa='01'
        left outer join m4t_puestos_plaza h on
            d.id_puesto_plaza=h.id_puesto_plaza and
            g.id_empresa=h.id_empresa
            --g.id_empresa=h.id_empresa
        left outer join m4t_datos_pago i on
            c.id_empleado=i.id_empleado
        left outer join m4_div_geografic j on
            c.id_div_geografica=j.id_div_geografica
    WHERE
    a.fec_pago=wfec_pago
    and a.id_empresa=wempresa
    and a.tipo=wtipo
    and a.rfc in ('355290','407986','309352')
    --and d.cancelado is null
    group by 1,2,3,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24 --107487
    order by 5

              
              
            -- ON EXCEPTION set error_num
	           --  return 'error en  ---> ' || w_cont||' '||wemp||' '||error_num  with resume;
	           --  let wnum_linea = wnum_linea + 1;
	           --  insert into info_sat9 (num_linea,id_empresa,id_empleado,linea) 
	           --  values (wnum_linea,wempresa,wemp,'Error-'||desc_err||':'||error_num|| '-emp:'||wemp||'-Cons:'||wnum_cons2);
            -- END EXCEPTION WITH RESUME;
            
            

            
         
      return 'llevo lay---> ' || w_cont||' '||wemp  with resume;
      
        select cp into wcp 
         from m4t_domicilios_issste where id_centro_pago = wpagaduria;

      let wnum_cons2 = wnum_cons2 + 1;
      let wnum_cons = wnum_cons2;

      let a_xc1 = '26';
      let a_xc2 = 'CC';
      let a_xc3 = '53';
      let a_xc4 = '69';
      let a_xc5 = 'RM';

     

      let desc_err = 'E01';



      let wperc= a_xi1+a_xi1a+a_xi2;
      let wdeduc=a_xi3+a_xi4+a_xi5;
      let wliquido=wperc-wdeduc;


      --insert into valida_timbrado_ext (fec_pago,id_empleado,tot_per,tot_ded,tot_net,isr,id_empresa) values (wfec_pago,wemp,wperc,wdeduc,wliquido,a_xi3,wempresa);       ----validacion de timbrado

      --let cadenaE01 = 'E01'||rpad(wnum_cons2,20,' ')||rpad(wfec_pagox,19,' ')||rpad(wperc,18,' ')||rpad(wdeduc,18,' ')||rpad(wliquido,18,' ')||rpad('NO',2,' ')||rpad('PUE',3,' ')||rpad('99',3,' ');
      let cadenaE01 = 'E01'||rpad(wnum_cons2,20,' ')|| wfec_pagox ||rpad(wperc,18,' ')||rpad(wdeduc,18,' ')||rpad(wliquido,18,' ')||rpad('NO',2,' ')||rpad('PUE',3,' ')||rpad('99',3,' ');

      let wnum_linea = wnum_linea + 1;
      insert into info_sat9 (num_linea,id_empresa,id_empleado,linea) values (wnum_linea,wempresa,wemp,cadenaE01);
      
            
      let wnum_linea = wnum_linea + 1;
      let cadenaE02 = 'E02'||rpad(wemp,20,' ')||rpad(wid_legal,13,' ')||rpad(trim(wnombre),150,' ')||'@';
      insert into info_sat9 (num_linea,id_empresa,id_empleado,linea) values (wnum_linea,wempresa,wemp,cadenaE02);
      
    -- select pagaduria into wpagaduria
    --      from ramo_ct_tim where ct10 = wadscripcion;       
      
      
      ---se obtiene codigo postal para lugar de emisi√≥n.
      
      select cp into wcp 
         from m4t_domicilios_issste where id_centro_pago = wpagaduria;
         
      if wcp is null then
         if wempresa='01' then let wcp = '06080'; end if;  ---ISSSTE ASEGURADOR
          ---   if wempresa='02' then let wcp = '14050'; end if;  ---SUPERISSSTE
         if wempresa='03' then let wcp = '06030'; end if;  ---TURISSSTE
          if wempresa='05' then let wcp = '01010'; end if;  ---PENSIONISSSTE
      end if;    
      
      
      let wnum_linea = wnum_linea + 1;
      insert into info_sat9 (num_linea,id_empresa,id_empleado,linea) values (wnum_linea,wempresa,wemp,cadE03a||cadE03b||rpad(wcp,5,' ')||'@');


      let cadenaE04='E04'||rpad(a_xi3,14,' ')||rpad(wzero,14,' ')||'@';
      let wnum_linea=wnum_linea+1;
      insert into info_sat9 (num_linea,id_empresa,id_empleado,linea) values (wnum_linea,wempresa,wemp,cadenaE04);

      select porcent into wporcent from porc_emp where id_empleado=wemp;

       let cadenaE05='E05'||rpad('001',5,' ')||rpad(a_xi3,14,' ')||lpad(wporcent,14,'0')||rpad('Si',3,' ')||'@';
       let wnum_linea=wnum_linea+1;
       insert into info_sat9 (num_linea,id_empresa,id_empleado,linea) values (wnum_linea,wempresa,wemp,cadenaE05);

       let cadEA1a='EA1'||rpad('MXN',3,' ')||'  '||rpad('1',14,' ');
       let cadEA1b=rpad(' ',256,' ')||'@';
       let wnum_linea=wnum_linea+1;
       insert into info_sat9 (num_linea,id_empresa,id_empleado,linea) values (wnum_linea,wempresa,wemp,cadEA1a||cadEA1b);


       let cadenaD01='D01'||rpad(' ',14,' ')||rpad('ACT',8,' ')||rpad(' ',20,' ')||rpad(' ',20,' ')||rpad(trim(wdescrip),150,' ')||rpad(wperc,14,' ')||'@';
       let wnum_linea=wnum_linea+1;
       insert into info_sat9 (num_linea,id_empresa,id_empleado,linea) values (wnum_linea,wempresa,wemp,cadenaD01);

        let wtipcon = '04'; 
        let wperiod_c = '99'; 

       -- let desc_err = "NOE DatosPago06";
       -- let desc_err = "NOE Arma"||"-"||wforpago||"-"||wbanco||"-"||wcuenta;

        -- SELECT a.id_tipo_puesto, b.id_tipo_plaza
        --     Into a_idtipopuesto, a_idtipoplaza
        --     FROM m4t_acumulado_rl1_2011 a,m4t_acumulado_rl_2011 b 
        --         WHERE a.fec_pago=b.fec_pago 
        --             and a.id_empleado=b.id_empleado 
        --             and a.fec_imputacion=b.fec_imputacion 
        --             and a.fec_alta_empleado=b.fec_alta_empleado 
        --             and a.id_sociedad=b.id_sociedad
        --             and  a.fec_pago = wfec_pago
        --             and a.id_empleado=wemp
        --             and a.id_empleado in (SELECT rfc FROM cosif_prueba2 
        --                                     WHERE fec_pago =wfec_pago and tipo = wtipo and id_empresa = wempresa) group by 1,2;

        if a_idtipopuesto = 'B' and a_idtipoplaza = '1' then
            let wsindl_c='SÌ';
        else 
            let wsindl_c='No';
        end if;

          select c_estado into westado_c from c_estado where id_div_geografica = wdivgeo; 


      --let cadNOEa= 'NOE' ||rpad(wemp,15,' ')||rpad(wcurp,18,' ')||rpad('02',3,' ')||rpad(wnumero_ss,15,' ')||To_char(wfec_pago,'%Y-%m-%d')||To_char(wfec_pago,'%Y-%m-%d')||To_char(wfec_pago,'%Y-%m-%d')||lpad(wdias,18,'0')||rpad(' ',100,' ')||rpad(wnum_cuenta_qp,18,' ')||rpad(wbanco_qp,3,' ')||rpad(To_char(wfec_alta_qp,'%Y-%m-%d'),10,' ')||rpad(wdiaantig,10,' ');
      let cadNOEa= 'NOE' ||rpad(wemp,15,' ')||rpad(wcurp,18,' ')||rpad('02',3,' ')||rpad(wnumero_ss,15,' ')||To_char(wfec_pago,'%Y-%m-%d')||To_char(wfec_pago,'%Y-%m-%d')||To_char(wfec_pago,'%Y-%m-%d')||lpad(wdias,18,'0')||rpad(' ',100,' ')||rpad(' ',18,' ')||rpad(' ',3,' ')||rpad(To_char(wfec_alta_qp,'%Y-%m-%d'),10,' ')||rpad(wdiaantig,10,' ');
      let cadNOEb=rpad(' ',100,' ')||rpad(wtipcon,20,' ')||rpad(' ',20,' ')||rpad(wperiod_c,20,' ')||rpad(' ',18,' ')||rpad('1',4,' ')||rpad(' ',18,' ')||rpad('  ',2,'  ')||rpad(wsindl_c,2,' ')||rpad(westado_c,3,' ')||'@';
   
      let wnum_linea=wnum_linea+1;
      -- let desc_err = "inserta NOEa";
      insert into info_sat9 (num_linea,id_empresa,id_empleado,linea) values (wnum_linea,wempresa,wemp,cadNOEa||cadNOEb);
   
      
      
      
      let cadNO2 = 'NO2'||rpad(w_TipNom1,2,' ')||'@';
      let wnum_linea=wnum_linea+1;
      insert into info_sat9 (num_linea,id_empresa,id_empleado,linea) values (wnum_linea,wempresa,wemp,cadNO2);


      
      
       let cadNO3 = 'NO3'||rpad(' ',18,' ')||rpad('00'||wramo||wpagaduria,20,' ')||rpad(' ',13,' ')||rpad('IF',2,' ')||rpad(' ',18,' ')||'@';
       let wnum_linea=wnum_linea+1;
       insert into info_sat9 (num_linea,id_empresa,id_empleado,linea) values (wnum_linea,wempresa,wemp,cadNO3);
      
            
      
      let wconp = 0;
      let wcond = 0;
      let wcons = 0;

      if wemp <> '' then
         call GenLinSAT_AGUI_2022_EAGG (wemp, wfec_pago, a_xc1, a_xi1, a_xi1a, a_xc2, a_xi2, a_xc3, a_xi3, a_xc4, a_xi4, a_xc5, a_xi5, wnum_linea, wempresa, wconp, wcond) returning wnum_linea,wcond,wconp; 
      end if;


      
       let cadNOP = 'NOP' ||rpad('1',4,' ')||rpad('002',3,' ')||rpad('046',15,' ')||rpad('Subsidio para el empleo',100,' ')||rpad('0.00',18,' ')||rpad('0.00',18,' ')||rpad('0.00',18,' ')||rpad(' ',22,' ')||'@';
       let wnum_linea=wnum_linea+1;
       insert into info_sat9 (num_linea,id_empresa,id_empleado,linea) values (wnum_linea,wempresa,wemp,cadNOP);

      -- if wemp <> ''   then
      -- return 'EAGG ->'  || wemp with resume;
      -- end if;
      
      -- ---end if;
      
       let w_cont = w_cont + 1;
      
   end foreach;
   
   update timb_cons set num_consf = wnum_cons2 
   where empresa = wempresa and fec_pago = wfec_pago and fec_crea = wfec_pagox and descripcion = w_NomDes and num_cons = wnum_consi;
   return 'Informe --> ' || wnomin || '; ' || w_NomDes || '; ' || w_TipCont || '; ' ||w_Period || '; ' ||w_TipNom || '.'with resume;   
   
   SYSTEM "echo unload to 'Archivo.txt' > sql01.sql";
   SYSTEM "echo select linea from info_sat9 order by num_linea >> sql01.sql";
   SYSTEM "dbaccess m4prod sql01.sql";

   SYSTEM "sed '1,$s/|//g' Archivo.txt > Archivo1.txt";
   SYSTEM "sed '1,$s/@//g' Archivo1.txt > ArchivoSAT_2022.txt";
end procedure;
