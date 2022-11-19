Drop Procedure If Exists spm4_layoutsatn_pruebas_2022_alek;
Create Procedure spm4_layoutsatn_pruebas_2022_alek(wfec_pago date,wtipo varchar(1), wempresa varchar(2), wempleados varchar(255)) --Parametro de entrada para usuarios
returning char(265);
   define wi1,wi2,wi3,wi4,wi5,wi6,wi7,wi8,wi9,wi10,wi11,wi12,wi13,wi14,wi15,wi16,wi17,wi18,wi19,wi20          money(18,2);
   define wi21,wi22,wi23,wi24,wi25,wi26,wi27,wi28,wi29,wi30,wi31,wi32,wi33,wi34,wi35,wi36,wi37,wi38,wi39,wi40 money(18,2);
   define wp1,wp2,wp3,wp4,wp5,wp6,wp7,wp8,wp9,wp10,wp11,wp12,wp13,wp14,wp15,wp16,wp17,wp18,wp19,wp20          varchar(01);
   define wp21,wp22,wp23,wp24,wp25,wp26,wp27,wp28,wp29,wp30,wp31,wp32,wp33,wp34,wp35,wp36,wp37,wp38,wp39,wp40 varchar(01);
   define wc1,wc2,wc3,wc4,wc5,wc6,wc7,wc8,wc9,wc10,wc11,wc12,wc13,wc14,wc15,wc16,wc17,wc18,wc19,wc20          varchar(02);
   define wc21,wc22,wc23,wc24,wc25,wc26,wc27,wc28,wc29,wc30,wc31,wc32,wc33,wc34,wc35,wc36,wc37,wc38,wc39,wc40 varchar(02);
   define wemp varchar(10); define w_cont,wdias_lab,wdias,wconse,wnum_cons,wgrav,wconse9,wcons,wnum_linea integer;
   define wnum_lini, wcon_tex integer;
   define wlongmal,wcaracterr,wbandera, wbandera01, wBanderaEmpleado, wnum_cons2, wnum_consi, wnum_consv integer;
   
   define wdias_ant, wmess_ant, wanos_ant, wmess_res, wsem_ant integer; define wantigf char(10);
   define wdia_p, wmes_p varchar(02); define wano_p varchar(04); 
   
   define cadenaC char(116); define cadenaK, cadenaC2 char(50); define cadenaQ char(35);
   define wiserv char(5); define wdserv char(50); define wipuesto char(7); define wdpuesto char(50);
   define cadenaE01 char(116); define cadenaE02 char(187); define cadenaE04 char(32); define cadenaE05 char(40);
   define cadenaD01 char(230); define cadenaNOI,cadenaNOD char(163); define cadenaNOC char(47); define wkey,wtip_perc char(03);
   define cadenaNOH char(54); define cadenaE00 char(14); define cadE03a char(223); define cadE03b char(205);
   define cadEA1a char(20); define cadEA1b char(257); define cadNOEa char(243); define cadNOEb char(250); define cadNOEc char(250); define cadNO2 char(20);
   define cadNO3 char(70); define wpagaduria varchar(5); define wramo integer; define wadscripcion varchar(10);
   define cadNO4 char(8); define cadNOP char(202); define wliqux, wdedux, wpercx decimal(14,2);
   define wliquido,wispt,wimporte,wimp_exe,wimp_gra,wdeduc,wperc,wzero,wporcent decimal(14,2); define wid_legal varchar(13);
   define wnombre,wnombre2,wdescrip,wn_concepto varchar(150); define wfec_inicio,wfec_fin,wfec_alta,wfec_impu date;
   define wfec_iniciox,wfec_finx,wfec_alta2, wfec_pagox datetime year to second; ---
   define wfec_pago02 char(19); define wcurp varchar(18); define wnumero_ss varchar(14); define wperc_ded varchar(01); define wconcepto,wid_empresa varchar(02);
   define wcurp01 varchar(18); define wid_legal01 varchar(13);  
   define wbanco_c, westado_c char(03); define wperiod_c, wdivgeo char(02); define wfolio char(20); define wcp varchar(5);
   define wforpago, wforpago2 char(06); define wbanco, wbanco2 char(04); define wcuenta, wcuenta2 varchar(18);
   define salida char(230); define error_num integer; define desc_err varchar(32); 
   define wsindl, wsindn money(18,2); define wsindl_c, wsindn_c char(02); define wdiaantig integer;
   define wcont_des_tot integer; define wcon_pag integer;   --- contadores prestamo personal 20210907 eagg
   define wi2puesto char(7); define wd2puesto char(50);
   define wfal_ret varchar (100);   ---faltas y retardo 20210907 eagg -----se cambio a 100 caracteres por falta de espacio
   define wcen_trab varchar (12);
   define wcen_pago varchar (12);
   define wfecha_ini_ts datetime year to day;
   define wid_nivel varchar(5); define wid_sub_nivel varchar(5); define wid_grupo_grado_nivel varchar(5); define wid_integracion varchar(5); define wid_zona varchar(5);
   define id_tipo_tabulador varchar(5);
   define wid_tipo_tabulador varchar(5);
   define wid_nivel_wid_grupo_grado_nivel varchar(5);
   define wid_sub_nivel_wid_integracion varchar(5);
   define wantig_anio varchar(5);define wantig_meses varchar(5);define wantig_dias varchar(5);
   define wfec_alta_empleado date;
   define wsem_trabajadas integer;
   define wfec_imputacion date;

   define flg1,flg2,flg3,flg4,flg5,flg6,flg7,flg8,flg9,flg10,flg11,flg12,flg13,flg14,flg15,flg16,flg17,flg18,flg19,flg20          integer;
   define flg21,flg22,flg23,flg24,flg25,flg26,flg27,flg28,flg29,flg30,flg31,flg32,flg33,flg34,flg35,flg36,flg37,flg38,flg39,flg40 integer;
   define w_NomDes, w_TipCont, w_Period, w_TipNom varchar(10,0); define w_TipCont1, w_Period1 varchar(2,0); define w_TipNom1 varchar(1,0);
   define wnumero_ss_bmex varchar(14); define wcurp_bmex varchar(18); define wid_legal_bmex varchar(13);

   define query_condicion char(2000);
   define _query_principal char(5000);
   define stmt_delete char(5000);

   Set Isolation To Dirty Read;

    --set debug file to 'prueba_alek_mq.log';
    --trace on;

   let wemp=' '; let w_cont=1; let wconse=1; let wzero=0.0;

   --let wfec_pagox=today;
   let wfec_pagox=current;
   let wnum_linea=0;

       -------------Comparamos si es que hay valores en el parametro empleado
    If Length(wempleados) = 0 Then
      let query_condicion='';
	  
      -- Drop Table info_satn;

      -- Create Table info_satn
      -- (num_linea integer,
      -- id_empresa varchar(02),
      -- id_empleado varchar(10),
      -- linea char(500)) fragment by round robin in bdbase,bdhist;
      -- Revoke all On info_satn From "public";   

    Else
      let query_condicion = " And C.rfc in (" || wempleados ||") ";

      -- let stmt_delete = "Delete From info_satn " ||
                        -- "Where id_empleado IN ( " || wempleados || " )"; 
      -- let stmt_delete = TRIM(stmt_delete);
      -- execute immediate stmt_delete;
    End If;
	
	-- Drop Table info_satn;

      -- Create Table info_satn
      -- (num_linea integer,
      -- id_empresa varchar(02),
      -- id_empleado varchar(10),
      -- linea char(500)) fragment by round robin in bdbase,bdhist;
      -- Revoke all On info_satn From "public";
	
	-- let desc_err = '';
	-- let error_num = 0;
	-- let wid_empresa = '';
    ------------

    let w_TipCont = '01-TiemInd'; let w_Period = '04-Quincen'; let w_TipNom = 'O-Ordinari';
    let w_TipCont1 = '01'; let w_Period1 = '04'; let w_TipNom1 = 'O'; let w_NomDes = 'O';

    Select fec_inicio,fec_fin Into wfec_inicio,wfec_fin
    From m4sys_hist_pagas where fec_paga=wfec_pago;

    let wdescrip = 'Pago de nómina'; --Si

    If wfec_pago = '15/01/2019' Then
      delete timb_cons20 where fec_pago = '15/01/2019' and empresa = wempresa;
      let wnum_consi = 01;
      -- Insert Into timb_cons20 values(wempresa,'000000',wnum_consi, 0, 00.00, wfec_pago, wfec_pagox);
    Else
      let wnum_consv = 0;
      Select count(*) Into wnum_consv
      From timb_cons20 
      Where fec_pago = wfec_pago
        And fec_crea = wfec_pagox
        And empresa = wempresa
        And descripcion = w_NomDes;

      If wnum_consv = 0 Then let wnum_consv = 1; End If;

      Select max(num_consf) Into wnum_consi
      From timb_cons20
      Where fec_pago >= '15/01/2019'
        And empresa = wempresa;

      If wnum_consi = 0 Then let wnum_consi = 1; End If;

      let wnum_consi = wnum_consi + 1;
      let wnum_cons2 = wnum_consi;

      -- Insert Into timb_cons20 values(wempresa, w_NomDes,wnum_consi, 0, wnum_consv, wfec_pago, wfec_pagox);
    End If;

    let wramo    = 637;
    If wempresa='01' Then 
	    let cadE03a = 'E03'||rpad('JOSE MARIA LAFRAGUA',50,' ')||rpad('4',20,' ')||rpad(' ',50,' ')||rpad('TABACALERA',50,' ')||rpad(' ',50,' ');
	    let cadE03b = rpad(' ',50,' ')||rpad('CUAUHTEMOC',50,' ')||rpad('DISTRITO FEDERAL',50,' ')||rpad('MEXICO',50,' ');
    End If;


      let _query_principal = "Select " ||
        "C.id_empresa, C.rfc[1,6],num_cons,tot_net_cheque,tot_ded_cheque,tot_perc_cheque,trim(nom_emp),id_banco,NVL(cuenta,''),id_div_geografica, " ||
        "adscripcion, id_servicio, puesto, " ||
        "p1,c1,i1,p2,c2,i2,p3,c3,i3,p4,c4,i4,p5,c5,i5,p6,c6,i6,p7,c7,i7,p8,c8,i8,p9,c9,i9,p10,c10,i10, " ||
        "p11,c11,i11,p12,c12,i12,p13,c13,i13,p14,c14,i14,p15,c15,i15,p16,c16,i16,p17,c17,i17,p18,c18,i18,p19,c19,i19,p20,c20,i20, " ||
        "p21,c21,i21,p22,c22,i22,p23,c23,i23,p24,c24,i24,p25,c25,i25,p26,c26,i26,p27,c27,i27,p28,c28,i28,p29,c29,i29,p30,c30,i30, " ||
        "p31,c31,i31,p32,c32,i32,p33,c33,i33,p34,c34,i34,p35,c35,i35,p36,c36,i36,p37,c37,i37,p38,c38,i38,p39,c39,i39,p40,c40,i40, " ||
        "trim(id_c_u_r_p_st),NVL(numero_ss,''),trim(id_legal), " ||
        "NVL(trim(apellido_1),' ') ||' '|| NVL(trim(apellido_2),' ') ||' '|| NVL(trim(nombre),' '), " ||
        "NVL(n_puesto_plaza, '') n_puesto_plaza, NVL(n_clave_servicio, '') n_clave_servicio, sem_trabajadas, antig_anio, antig_meses, antig_dias, " ||
        "NVL(pagaduria, 'ERROR') pagaduria, " ||
        "Case " ||
          "When cp Is Null And C.id_empresa = '01' Then '06080' " ||
          "Else '' " ||
        "End cp " ||
      "From cosif_timbrado_2022 C " ||
        "Left Outer Join m4t_puestos_plaza P " ||
          "ON P.id_puesto_plaza = " ||
            "Case C.id_tipo_tabulador " ||
              "When 'F' Then Substr(C.puesto,1,2) || Substr(C.puesto,6,10) " ||
              "Else C.puesto " ||
            "End " ||
          "And C.id_empresa = P.id_empresa " ||
        "Left Join m4t_clave_servicio S " ||
          "ON C.id_servicio = S.id_clave_servicio " ||
           "And C.id_empresa = S.id_empresa " ||
        "Inner Join m4t_empleados E " ||
          "ON C.rfc = E.id_empleado " ||
        "Inner Join ramo_ct_tim R " ||
          "ON C.adscripcion = R.ct10 " ||
        "Left Join m4t_domicilios_issste D " ||
          "ON D.id_centro_pago = R.pagaduria " ||
        "Left Join ( " ||
            "Select " ||
              "id_empleado, " ||
              "trunc(((sum(dias)-sum(dias_descuento))/7)) sem_trabajadas, " ||
              "trunc((sum(dias)-sum(dias_descuento))/365) antig_anio, " ||
              "trunc(((sum(dias)-sum(dias_descuento))-trunc((sum(dias)-sum(dias_descuento))/365)*365)/30.4) antig_meses, " ||
              "trunc((((sum(dias)-sum(dias_descuento))-trunc((sum(dias)-sum(dias_descuento))/365)*365)/30.4-trunc(((sum(dias)-sum(dias_descuento))-trunc((sum(dias)-sum(dias_descuento))/365)*365)/30.4))*30.4) antig_dias " ||
            "From m4_antiguedades " ||
            "Where tipo_incidencia <> 'ANTIGUEDAD FEDERAL' " ||
            "Group by id_empleado " ||
          ") A " ||
          "ON C.rfc = A.id_empleado " ||
      "Where fec_pago = '" || wfec_pago || "' " ||
        " And C.id_empresa = '" || wempresa || "' "||
        " And tipo = '" || wtipo || "' " || query_condicion || " " ||
        "And (c1<>'26' And c2<>'26' And c3<>'26' And c4<>'26' And c5<>'26' And c6<>'26' And c7<>'26' And c8<>'26' And c9<>'26' And c10<>'26' " ||
        "And c11<>'26' And c12<>'26' And c13<>'26' And c14<>'26' And c15<>'26' And c16<>'26' And c17<>'26' And c18<>'26' And c19<>'26' And c20<>'26' " ||
        "And c21<>'26' And c22<>'26' And c23<>'26' And c24<>'26' And c25<>'26' And c26<>'26' And c27<>'26' And c28<>'26' And c29<>'26' And c30<>'26' " ||
        "And c31<>'26' And c32<>'26' And c33<>'26' And c34<>'26' And c35<>'26' And c36<>'26' And c37<>'26' And c38<>'26' And c39<>'26' And c40<>'26') " ||
        "order by 2 ";
      -- "ON EXCEPTION set "|| error_num || --  <---Variables de error
        -- " return 'error en  ---> ' " || w_cont ||" ' ' || wemp || ' ' "|| error_num ||" with resume;" ||
        -- " let "|| wnum_linea ||" = " || wnum_linea + 1 || "; "||
        -- " Insert Into info_satn (num_linea,id_empresa,id_empleado,linea) " ||
        -- "values (" || wnum_linea || ", " || wid_empresa || " , || wemp || ,'Error-'"|| desc_err ||" ':' "|| error_num ||" '-emp:' || wemp || '-Cons:' " || wnum_cons2 ||");" ||
      -- " END EXCEPTION WITH RESUME";

        let _query_principal = TRIM(_query_principal);
        Prepare stmt_qry_principal From _query_principal;
        Declare query_principal_cursor cursor FOR stmt_qry_principal;
        Open query_principal_cursor;

          While( 1 = 1 )
		  
     	  ON EXCEPTION set error_num
			return 'error en  ---> ' || w_cont || ' '|| wemp|| ' ' || error_num with resume;
			let wnum_linea = wnum_linea + 1;
			Insert Into info_satn (num_linea,id_empresa,id_empleado,linea)
			values (wnum_linea,wid_empresa,wemp,'Error-'||desc_err||':'||error_num|| '-emp:'||wemp||'-Cons:'||wnum_cons2);
		  END EXCEPTION WITH RESUME;
			
            Fetch query_principal_cursor
            Into wid_empresa,wemp,wfolio,wliquido,wdeduc,wperc,wnombre,wbanco,wcuenta,wdivgeo,
            wadscripcion, wiserv, wipuesto,
            wp1,wc1,wi1,wp2,wc2,wi2,wp3,wc3,wi3,wp4,wc4,wi4,wp5,wc5,wi5,wp6,wc6,wi6,wp7,wc7,wi7,wp8,wc8,wi8,wp9,wc9,wi9,wp10,wc10,wi10,
            wp11,wc11,wi11,wp12,wc12,wi12,wp13,wc13,wi13,wp14,wc14,wi14,wp15,wc15,wi15,wp16,wc16,wi16,wp17,wc17,wi17,wp18,wc18,wi18,wp19,wc19,wi19,wp20,wc20,wi20,
            wp21,wc21,wi21,wp22,wc22,wi22,wp23,wc23,wi23,wp24,wc24,wi24,wp25,wc25,wi25,wp26,wc26,wi26,wp27,wc27,wi27,wp28,wc28,wi28,wp29,wc29,wi29,wp30,wc30,wi30,
            wp31,wc31,wi31,wp32,wc32,wi32,wp33,wc33,wi33,wp34,wc34,wi34,wp35,wc35,wi35,wp36,wc36,wi36,wp37,wc37,wi37,wp38,wc38,wi38,wp39,wc39,wi39,wp40,wc40,wi40,
            wcurp,wnumero_ss,wid_legal,wnombre2, wdpuesto, wdserv, wsem_trabajadas,wantig_anio, wantig_meses, wantig_dias,
            wpagaduria, wcp;

            If (SQLCODE != 100) Then
			  
              return 'llevo lay---> ' || w_cont||' '||wemp  with resume;

              let wnum_cons2 = wnum_cons2 + 1;
              let wnum_cons = wnum_cons2;
              let wdias_lab=15; let wdias=15;
              let wispt=0;

              If wc1='53' Then let wispt=wi1; Else If wc2='53' Then let wispt=wi2; Else If wc3='53' Then let wispt=wi3;
              Else If wc4='53' Then let wispt=wi4; Else If wc5='53' Then let wispt=wi5; Else If wc6='53' Then let wispt=wi6;
              Else If wc7='53' Then let wispt=wi7; Else If wc8='53' Then let wispt=wi8; Else  If wc9='53' Then let wispt=wi9;
              Else If wc10='53' Then let wispt=wi10; Else If wc11='53' Then let wispt=wi11; Else If wc12='53' Then let wispt=wi12;
              Else If wc13='53' Then let wispt=wi13; Else If wc14='53' Then let wispt=wi14; Else If wc15='53' Then let wispt=wi15;
              Else If wc16='53' Then let wispt=wi16; Else If wc17='53' Then let wispt=wi17; Else If wc18='53' Then let wispt=wi18;
              Else If wc19='53' Then let wispt=wi19; Else If wc20='53' Then let wispt=wi20; Else If wc21='53' Then let wispt=wi21;
              Else If wc22='53' Then let wispt=wi22; Else If wc23='53' Then let wispt=wi23; Else If wc24='53' Then let wispt=wi24;
              Else If wc25='53' Then let wispt=wi25; Else If wc26='53' Then let wispt=wi26; Else If wc27='53' Then let wispt=wi27;
              Else If wc28='53' Then let wispt=wi28; Else If wc29='53' Then let wispt=wi29; Else If wc30='53' Then let wispt=wi30;
              Else If wc31='53' Then let wispt=wi31; Else If wc32='53' Then let wispt=wi32; Else If wc33='53' Then let wispt=wi33;
              Else If wc34='53' Then let wispt=wi34; Else If wc35='53' Then let wispt=wi35; Else If wc36='53' Then let wispt=wi36;
              Else If wc37='53' Then let wispt=wi37; Else If wc38='53' Then let wispt=wi38; Else If wc39='53' Then let wispt=wi39;
              Else If wc40='53' Then let wispt=wi40; End If; End If; End If; End If; End If; End If; End If; End If; End If; End If; End If; 
              end If; End If; End If; End If; End If; End If; End If; End If; End If; End If; End If; End If; End If; End If; End If; End If; 
              end If; End If; End If; End If; End If; End If; End If; End If; End If; End If; End If; End If; End If;

              If wispt < 0 Then
                let wispt = 0;
              End If;

              If wi1 < 0 Then let wperc = wperc - wi1; let wdeduc = wdeduc - wi1;
                If wp1 = 'P' Then let wp1 = 'D'; Else let wp1 = 'P'; End If; End If;
              If wi2 < 0 Then let wperc = wperc - wi2; let wdeduc = wdeduc - wi2;
                If wp2 = 'P' Then let wp2 = 'D'; Else let wp2 = 'P'; End If; End If;
              If wi3 < 0 Then let wperc = wperc - wi3; let wdeduc = wdeduc - wi3;
                If wp3 = 'P' Then let wp3 = 'D'; Else let wp3 = 'P'; End If; End If;
              If wi4 < 0 Then let wperc = wperc - wi4; let wdeduc = wdeduc - wi4;
                If wp4 = 'P' Then let wp4 = 'D'; Else let wp4 = 'P'; End If; End If;
              If wi5 < 0 Then let wperc = wperc - wi5; let wdeduc = wdeduc - wi5;
                If wp5 = 'P' Then let wp5 = 'D'; Else let wp5 = 'P'; End If; End If;
              If wi6 < 0 Then let wperc = wperc - wi6; let wdeduc = wdeduc - wi6;
                If wp6 = 'P' Then let wp6 = 'D'; Else let wp6 = 'P'; End If; End If;
              If wi7 < 0 Then let wperc = wperc - wi7; let wdeduc = wdeduc - wi7;
                If wp7 = 'P' Then let wp7 = 'D'; Else let wp7 = 'P'; End If; End If;
              If wi8 < 0 Then let wperc = wperc - wi8; let wdeduc = wdeduc - wi8;
                If wp8 = 'P' Then let wp8 = 'D'; Else let wp8 = 'P'; End If; End If;
              If wi9 < 0 Then let wperc = wperc - wi9; let wdeduc = wdeduc - wi9;
                If wp9 = 'P' Then let wp9 = 'D'; Else let wp9 = 'P'; End If; End If;
              If wi10 < 0 Then let wperc = wperc - wi10; let wdeduc = wdeduc - wi10;
                If wp10 = 'P' Then let wp10 = 'D'; Else let wp10 = 'P'; End If; End If;
              If wi11 < 0 Then let wperc = wperc - wi11; let wdeduc = wdeduc - wi11;
                If wp11 = 'P' Then let wp11 = 'D'; Else let wp11 = 'P'; End If; End If;
              If wi12 < 0 Then let wperc = wperc - wi12; let wdeduc = wdeduc - wi12;
                If wp12 = 'P' Then let wp12 = 'D'; Else let wp12 = 'P'; End If; End If;
              If wi13 < 0 Then let wperc = wperc - wi13; let wdeduc = wdeduc - wi13;
                If wp13 = 'P' Then let wp13 = 'D'; Else let wp13 = 'P'; End If; End If;
              If wi14 < 0 Then let wperc = wperc - wi14; let wdeduc = wdeduc - wi14;  
                If wp14 = 'P' Then let wp14 = 'D'; Else let wp14 = 'P'; End If; End If;
              If wi15 < 0 Then let wperc = wperc - wi15; let wdeduc = wdeduc - wi15;  
                If wp15 = 'P' Then let wp15 = 'D'; Else let wp15 = 'P'; End If; End If;
              If wi16 < 0 Then let wperc = wperc - wi16; let wdeduc = wdeduc - wi16;  
                If wp16 = 'P' Then let wp16 = 'D'; Else let wp16 = 'P'; End If; End If;
              If wi17 < 0 Then let wperc = wperc - wi17; let wdeduc = wdeduc - wi17;  
                If wp17 = 'P' Then let wp17 = 'D'; Else let wp17 = 'P'; End If; End If;
              If wi18 < 0 Then let wperc = wperc - wi18; let wdeduc = wdeduc - wi18;  
                If wp18 = 'P' Then let wp18 = 'D'; Else let wp18 = 'P'; End If; End If;
              If wi19 < 0 Then let wperc = wperc - wi19; let wdeduc = wdeduc - wi19;  
                If wp19 = 'P' Then let wp19 = 'D'; Else let wp19 = 'P'; End If; End If;
              If wi20 < 0 Then let wperc = wperc - wi20; let wdeduc = wdeduc - wi20;  
                If wp20 = 'P' Then let wp20 = 'D'; Else let wp20 = 'P'; End If; End If;
              If wi21 < 0 Then let wperc = wperc - wi21; let wdeduc = wdeduc - wi21;  
                If wp21 = 'P' Then let wp21 = 'D'; Else let wp21 = 'P'; End If; End If;
              If wi22 < 0 Then let wperc = wperc - wi22; let wdeduc = wdeduc - wi22;  
                If wp22 = 'P' Then let wp22 = 'D'; Else let wp22 = 'P'; End If; End If;
              If wi23 < 0 Then let wperc = wperc - wi23; let wdeduc = wdeduc - wi23;  
                If wp23 = 'P' Then let wp23 = 'D'; Else let wp23 = 'P'; End If; End If;
              If wi24 < 0 Then let wperc = wperc - wi24; let wdeduc = wdeduc - wi24;  
                If wp24 = 'P' Then let wp24 = 'D'; Else let wp24 = 'P'; End If; End If;
              If wi25 < 0 Then let wperc = wperc - wi25; let wdeduc = wdeduc - wi25;  
                If wp25 = 'P' Then let wp25 = 'D'; Else let wp25 = 'P'; End If; End If;
              If wi26 < 0 Then let wperc = wperc - wi26; let wdeduc = wdeduc - wi26;  
                If wp26 = 'P' Then let wp26 = 'D'; Else let wp26 = 'P'; End If; End If;
              If wi27 < 0 Then let wperc = wperc - wi27; let wdeduc = wdeduc - wi27;  
                If wp27 = 'P' Then let wp27 = 'D'; Else let wp27 = 'P'; End If; End If;
              If wi28 < 0 Then let wperc = wperc - wi28; let wdeduc = wdeduc - wi28;  
                If wp28 = 'P' Then let wp28 = 'D'; Else let wp28 = 'P'; End If; End If;
              If wi29 < 0 Then let wperc = wperc - wi29; let wdeduc = wdeduc - wi29;  
                If wp29 = 'P' Then let wp29 = 'D'; Else let wp29 = 'P'; End If; End If;
              If wi30 < 0 Then let wperc = wperc - wi30; let wdeduc = wdeduc - wi30;  
                If wp30 = 'P' Then let wp30 = 'D'; Else let wp30 = 'P'; End If; End If;
              If wi31 < 0 Then let wperc = wperc - wi31; let wdeduc = wdeduc - wi31;  
                If wp31 = 'P' Then let wp31 = 'D'; Else let wp31 = 'P'; End If; End If;
              If wi32 < 0 Then let wperc = wperc - wi32; let wdeduc = wdeduc - wi32;  
                If wp32 = 'P' Then let wp32 = 'D'; Else let wp32 = 'P'; End If; End If;
              If wi33 < 0 Then let wperc = wperc - wi33; let wdeduc = wdeduc - wi33;  
                If wp33 = 'P' Then let wp33 = 'D'; Else let wp33 = 'P'; End If; End If;
              If wi34 < 0 Then let wperc = wperc - wi34; let wdeduc = wdeduc - wi34;  
                If wp34 = 'P' Then let wp34 = 'D'; Else let wp34 = 'P'; End If; End If;
              If wi35 < 0 Then let wperc = wperc - wi35; let wdeduc = wdeduc - wi35;  
                If wp35 = 'P' Then let wp35 = 'D'; Else let wp35 = 'P'; End If; End If;
              If wi36 < 0 Then let wperc = wperc - wi36; let wdeduc = wdeduc - wi36;  
                If wp36 = 'P' Then let wp36 = 'D'; Else let wp36 = 'P'; End If; End If;
              If wi37 < 0 Then let wperc = wperc - wi37; let wdeduc = wdeduc - wi37;  
                If wp37 = 'P' Then let wp37 = 'D'; Else let wp37 = 'P'; End If; End If;
              If wi38 < 0 Then let wperc = wperc - wi38; let wdeduc = wdeduc - wi38;  
                If wp38 = 'P' Then let wp38 = 'D'; Else let wp38 = 'P'; End If; End If;
              If wi39 < 0 Then let wperc = wperc - wi39; let wdeduc = wdeduc - wi39;  
                If wp39 = 'P' Then let wp39 = 'D'; Else let wp39 = 'P'; End If; End If;
              If wi40 < 0 Then let wperc = wperc - wi40; let wdeduc = wdeduc - wi40;  
                If wp40 = 'P' Then let wp40 = 'D'; Else let wp40 = 'P'; End If; End If;

              let wimporte = wdeduc - wispt;

              If wc1 = '26' Then  let wperc = wperc-wi1; let  wliquido = wliquido-wi1; let flg1 = 1; Else let flg1 = 0; End If;
              If wc2 = '26' Then  let wperc = wperc-wi2; let  wliquido = wliquido-wi2; let flg2 = 1; Else let flg2 = 0; End If;
              If wc3 = '26' Then  let wperc = wperc-wi3; let  wliquido = wliquido-wi3; let flg3 = 1; Else let flg3 = 0; End If;
              If wc4 = '26' Then  let wperc = wperc-wi4; let  wliquido = wliquido-wi4; let flg4 = 1; Else let flg4 = 0; End If;
              If wc5 = '26' Then  let wperc = wperc-wi5; let  wliquido = wliquido-wi5; let flg5 = 1; Else let flg5 = 0; End If;
              If wc6 = '26' Then  let wperc = wperc-wi6; let  wliquido = wliquido-wi6; let flg6 = 1; Else let flg6 = 0; End If;
              If wc7 = '26' Then  let wperc = wperc-wi7; let  wliquido = wliquido-wi7; let flg7 = 1; Else let flg7 = 0; End If;
              If wc8 = '26' Then  let wperc = wperc-wi8; let  wliquido = wliquido-wi8; let flg8 = 1; Else let flg8 = 0; End If;
              If wc9 = '26' Then  let wperc = wperc-wi9; let  wliquido = wliquido-wi9; let flg9 = 1; Else let flg9 = 0; End If;
              If wc10 = '26' Then  let wperc = wperc-wi10; let  wliquido = wliquido-wi10; let flg10 = 1; Else let flg10 = 0; End If;
              If wc11 = '26' Then  let wperc = wperc-wi11; let  wliquido = wliquido-wi11; let flg11 = 1; Else let flg11 = 0; End If;
              If wc12 = '26' Then  let wperc = wperc-wi12; let  wliquido = wliquido-wi12; let flg12 = 1; Else let flg12 = 0; End If;
              If wc13 = '26' Then  let wperc = wperc-wi13; let  wliquido = wliquido-wi13; let flg13 = 1; Else let flg13 = 0; End If;
              If wc14 = '26' Then  let wperc = wperc-wi14; let  wliquido = wliquido-wi14; let flg14 = 1; Else let flg14 = 0; End If;
              If wc15 = '26' Then  let wperc = wperc-wi15; let  wliquido = wliquido-wi15; let flg15 = 1; Else let flg15 = 0; End If;
              If wc16 = '26' Then  let wperc = wperc-wi16; let  wliquido = wliquido-wi16; let flg16 = 1; Else let flg16 = 0; End If;
              If wc17 = '26' Then  let wperc = wperc-wi17; let  wliquido = wliquido-wi17; let flg17 = 1; Else let flg17 = 0; End If;
              If wc18 = '26' Then  let wperc = wperc-wi18; let  wliquido = wliquido-wi18; let flg18 = 1; Else let flg18 = 0; End If;
              If wc19 = '26' Then  let wperc = wperc-wi19; let  wliquido = wliquido-wi19; let flg19 = 1; Else let flg19 = 0; End If;
              If wc20 = '26' Then  let wperc = wperc-wi20; let  wliquido = wliquido-wi20; let flg20 = 1; Else let flg20 = 0; End If;
              If wc21 = '26' Then  let wperc = wperc-wi21; let  wliquido = wliquido-wi21; let flg21 = 1; Else let flg21 = 0; End If;
              If wc22 = '26' Then  let wperc = wperc-wi22; let  wliquido = wliquido-wi22; let flg22 = 1; Else let flg22 = 0; End If;
              If wc23 = '26' Then  let wperc = wperc-wi23; let  wliquido = wliquido-wi23; let flg23 = 1; Else let flg23 = 0; End If;
              If wc24 = '26' Then  let wperc = wperc-wi24; let  wliquido = wliquido-wi24; let flg24 = 1; Else let flg24 = 0; End If;
              If wc25 = '26' Then  let wperc = wperc-wi25; let  wliquido = wliquido-wi25; let flg25 = 1; Else let flg25 = 0; End If;
              If wc26 = '26' Then  let wperc = wperc-wi26; let  wliquido = wliquido-wi26; let flg26 = 1; Else let flg26 = 0; End If;
              If wc27 = '26' Then  let wperc = wperc-wi27; let  wliquido = wliquido-wi27; let flg27 = 1; Else let flg27 = 0; End If;
              If wc28 = '26' Then  let wperc = wperc-wi28; let  wliquido = wliquido-wi28; let flg28 = 1; Else let flg28 = 0; End If;
              If wc29 = '26' Then  let wperc = wperc-wi29; let  wliquido = wliquido-wi29; let flg29 = 1; Else let flg29 = 0; End If;
              If wc30 = '26' Then  let wperc = wperc-wi30; let  wliquido = wliquido-wi30; let flg30 = 1; Else let flg30 = 0; End If;
              If wc31 = '26' Then  let wperc = wperc-wi31; let  wliquido = wliquido-wi31; let flg31 = 1; Else let flg31 = 0; End If;
              If wc32 = '26' Then  let wperc = wperc-wi32; let  wliquido = wliquido-wi32; let flg32 = 1; Else let flg32 = 0; End If;
              If wc33 = '26' Then  let wperc = wperc-wi33; let  wliquido = wliquido-wi33; let flg33 = 1; Else let flg33 = 0; End If;
              If wc34 = '26' Then  let wperc = wperc-wi34; let  wliquido = wliquido-wi34; let flg34 = 1; Else let flg34 = 0; End If;
              If wc35 = '26' Then  let wperc = wperc-wi35; let  wliquido = wliquido-wi35; let flg35 = 1; Else let flg35 = 0; End If;
              If wc36 = '26' Then  let wperc = wperc-wi36; let  wliquido = wliquido-wi36; let flg36 = 1; Else let flg36 = 0; End If; 
              If wc37 = '26' Then  let wperc = wperc-wi37; let  wliquido = wliquido-wi37; let flg37 = 1; Else let flg37 = 0; End If;
              If wc38 = '26' Then  let wperc = wperc-wi38; let  wliquido = wliquido-wi38; let flg38 = 1; Else let flg38 = 0; End If;
              If wc39 = '26' Then  let wperc = wperc-wi39; let  wliquido = wliquido-wi39; let flg39 = 1; Else let flg39 = 0; End If;
              If wc40 = '26' Then  let wperc = wperc-wi40; let  wliquido = wliquido-wi40; let flg40 = 1; Else let flg40 = 0; End If;

              If flg1 = 0 Then 
                If (wc1='09' and wc2='Y1') or (wc1='14' and wc2='Y2') or (wc1='18' and wc2='Y3') Then let flg1 = 3; Else let flg1 = 0; End If; End If;
              If flg2 = 0 Then
                If (wc2='09' and wc3='Y1') or (wc2='14' and wc3='Y2') or (wc2='18' and wc3='Y3') Then let flg2 = 3; Else let flg2 = 0; End If; End If;
              If flg3 = 0 Then
                If (wc3='09' and wc4='Y1') or (wc3='14' and wc4='Y2') or (wc3='18' and wc4='Y3') Then let flg3 = 3; Else let flg3 = 0; End If; End If;
              If flg4 = 0 Then
                If (wc4='09' and wc5='Y1') or (wc4='14' and wc5='Y2') or (wc4='18' and wc5='Y3') Then let flg4 = 3; Else let flg4 = 0; End If; End If;
              If flg5 = 0 Then
                If (wc5='09' and wc6='Y1') or (wc5='14' and wc6='Y2') or (wc5='18' and wc6='Y3') Then let flg5 = 3; Else let flg5 = 0; End If; End If;
              If flg6 = 0 Then
                If (wc6='09' and wc7='Y1') or (wc6='14' and wc7='Y2') or (wc6='18' and wc7='Y3') Then let flg6 = 3; Else let flg6 = 0; End If; End If;
              If flg7 = 0 Then
                If (wc7='09' and wc8='Y1') or (wc7='14' and wc8='Y2') or (wc7='18' and wc8='Y3') Then let flg7 = 3; Else let flg7 = 0; End If; End If;
              If flg8 = 0 Then
                If (wc8='09' and wc9='Y1') or (wc8='14' and wc9='Y2') or (wc8='18' and wc9='Y3') Then let flg8 = 3; Else let flg8 = 0; End If; End If;
              If flg9 = 0 Then
                If (wc9='09' and wc10='Y1') or (wc9='14' and wc10='Y2') or (wc9='18' and wc10='Y3') Then let flg9 = 3; Else let flg9 = 0; End If; End If;
              If flg10 = 0 Then
                If (wc10='09' and wc11='Y1') or (wc10='14' and wc11='Y2') or (wc10='18' and wc11='Y3') Then let flg10 = 3; Else let flg10 = 0; End If; End If;
              If flg11 = 0 Then
                If (wc11='09' and wc12='Y1') or (wc11='14' and wc12='Y2') or (wc11='18' and wc12='Y3') Then let flg11 = 3; Else let flg11 = 0; End If; End If;
              If flg12 = 0 Then
                If (wc12='09' and wc13='Y1') or (wc12='14' and wc13='Y2') or (wc12='18' and wc13='Y3') Then let flg12 = 3; Else let flg12 = 0; End If; End If;
              If flg13 = 0 Then
                If (wc13='09' and wc14='Y1') or (wc13='14' and wc14='Y2') or (wc13='18' and wc14='Y3') Then let flg13 = 3; Else let flg13 = 0; End If; End If;
              If flg14 = 0 Then
                If (wc14='09' and wc15='Y1') or (wc14='14' and wc15='Y2') or (wc14='18' and wc15='Y3') Then let flg14 = 3; Else let flg14 = 0; End If; End If;
              If flg15 = 0 Then
                If (wc15='09' and wc16='Y1') or (wc15='14' and wc16='Y2') or (wc15='18' and wc16='Y3') Then  let flg15 = 3; Else let flg15 = 0; End If; End If;
              If flg16 = 0 Then
                If (wc16='09' and wc17='Y1') or (wc16='14' and wc17='Y2') or (wc16='18' and wc17='Y3') Then  let flg16 = 3; Else let flg16 = 0; End If; End If;
              If flg17 = 0 Then
                If (wc17='09' and wc18='Y1') or (wc17='14' and wc18='Y2') or (wc17='18' and wc18='Y3') Then  let flg17 = 3; Else let flg17 = 0; End If; End If;
              If flg18 = 0 Then
                If (wc18='09' and wc19='Y1') or (wc18='14' and wc19='Y2') or (wc18='18' and wc19='Y3') Then  let flg18 = 3; Else let flg18 = 0; End If; End If;
              If flg19 = 0 Then
                If (wc19='09' and wc20='Y1') or (wc19='14' and wc20='Y2') or (wc19='18' and wc20='Y3') Then  let flg19 = 3; Else let flg19 = 0; End If; End If;
              If flg20 = 0 Then
                If (wc20='09' and wc21='Y1') or (wc20='14' and wc21='Y2') or (wc20='18' and wc21='Y3') Then  let flg20 = 3; Else let flg20 = 0; End If; End If;
              If flg21 = 0 Then
                If (wc21='09' and wc22='Y1') or (wc21='14' and wc22='Y2') or (wc21='18' and wc22='Y3') Then  let flg21 = 3; Else let flg21 = 0; End If; End If;
              If flg22 = 0 Then
                If (wc22='09' and wc23='Y1') or (wc22='14' and wc23='Y2') or (wc22='18' and wc23='Y3') Then  let flg22 = 3; Else let flg22 = 0; End If; End If;
              If flg23 = 0 Then
                If (wc23='09' and wc24='Y1') or (wc23='14' and wc24='Y2') or (wc23='18' and wc24='Y3') Then  let flg23 = 3; Else let flg23 = 0; End If; End If;
              If flg24 = 0 Then
                If (wc24='09' and wc25='Y1') or (wc24='14' and wc25='Y2') or (wc24='18' and wc25='Y3') Then  let flg24 = 3; Else let flg24 = 0; End If; End If;
              If flg25 = 0 Then
                If (wc25='09' and wc26='Y1') or (wc25='14' and wc26='Y2') or (wc25='18' and wc26='Y3') Then  let flg25 = 3; Else let flg25 = 0; End If; End If;
              If flg26 = 0 Then
                If (wc26='09' and wc27='Y1') or (wc26='14' and wc27='Y2') or (wc26='18' and wc27='Y3') Then  let flg26 = 3; Else let flg26 = 0; End If; End If;
              If flg27 = 0 Then
                If (wc27='09' and wc28='Y1') or (wc27='14' and wc28='Y2') or (wc27='18' and wc28='Y3') Then  let flg27 = 3; Else let flg27 = 0; End If; End If;
              If flg28 = 0 Then
                If (wc28='09' and wc29='Y1') or (wc28='14' and wc29='Y2') or (wc28='18' and wc29='Y3') Then  let flg28 = 3; Else let flg28 = 0; End If; End If;
              If flg29 = 0 Then
                If (wc29='09' and wc30='Y1') or (wc29='14' and wc30='Y2') or (wc29='18' and wc30='Y3') Then  let flg29 = 3; Else let flg29 = 0; End If; End If;
              If flg30 = 0 Then
                If (wc30='09' and wc31='Y1') or (wc30='14' and wc31='Y2') or (wc30='18' and wc31='Y3') Then  let flg30 = 3; Else let flg30 = 0; End If; End If;
              If flg31 = 0 Then
                If (wc31='09' and wc32='Y1') or (wc31='14' and wc32='Y2') or (wc31='18' and wc32='Y3') Then  let flg31 = 3; Else let flg31 = 0; End If; End If;
              If flg32 = 0 Then
                If (wc32='09' and wc33='Y1') or (wc32='14' and wc33='Y2') or (wc32='18' and wc33='Y3') Then  let flg32 = 3; Else let flg32 = 0; End If; End If;
              If flg33 = 0 Then
                If (wc33='09' and wc34='Y1') or (wc33='14' and wc34='Y2') or (wc33='18' and wc34='Y3') Then  let flg33 = 3; Else let flg33 = 0; End If; End If;
              If flg34 = 0 Then
                If (wc34='09' and wc35='Y1') or (wc34='14' and wc35='Y2') or (wc34='18' and wc35='Y3') Then  let flg34 = 3; Else let flg34 = 0; End If; End If;
              If flg35 = 0 Then
                If (wc35='09' and wc36='Y1') or (wc35='14' and wc36='Y2') or (wc35='18' and wc36='Y3') Then  let flg35 = 3; Else let flg35 = 0; End If; End If;
              If flg36 = 0 Then
                If (wc36='09' and wc37='Y1') or (wc36='14' and wc37='Y2') or (wc36='18' and wc37='Y3') Then  let flg36 = 3; Else let flg36 = 0; End If; End If;
              If flg37 = 0 Then
                If (wc37='09' and wc38='Y1') or (wc37='14' and wc38='Y2') or (wc37='18' and wc38='Y3') Then  let flg37 = 3; Else let flg37 = 0; End If; End If;
              If flg38 = 0 Then
                If (wc38='09' and wc39='Y1') or (wc38='14' and wc39='Y2') or (wc38='18' and wc39='Y3') Then  let flg38 = 3; Else let flg38 = 0; End If; End If;
              If flg39 = 0 Then
                If (wc39='09' and wc40='Y1') or (wc39='14' and wc40='Y2') or (wc39='18' and wc40='Y3') Then  let flg39 = 3; Else let flg39 = 0; End If; End If;
              If flg40 = 0 Then
                If (wc40='09') or (wc40='14') or (wc40='18') Then let flg40 = 0; End If;  end If;   

              let desc_err = 'E01';

              --Insert Into valida_timbrado_agui_jl (fec_pago,id_empleado,tot_per,tot_ded,tot_net,isr,id_empresa) values (wfec_pago,wemp,wperc,wdeduc,wliquido,wispt,wid_empresa);       ----validacion de timbrado
				
				If wdeduc = 0.00 Then
					let wdeduc = '';
				End If;
              ---let cadenaE01 = 'DC@3.3@'||'Serie@' || lpad(wnum_cons2,9,'0') || '@' || wfec_pagox || 'T00:00:00' || '@' || '99' || '@' || wperc || '@' || wdeduc || '@MXN@' || '@' || wliquido || '@N@' || 'PUE@'|| wcp || '@@@@';
              let cadenaE01 = 'DC@3.3@'||'Serie@' || lpad(wnum_cons2,9,'0') || '@' || substr(wfec_pagox,1,10) || 'T' || substr(wfec_pagox,12,19) || '@' || '99' || '@' || wperc || '@' || NVL(wdeduc,'') || '@MXN@' || '@' || wliquido || '@N@' || 'PUE@'|| wcp || '@@@@';

              let wnum_linea = wnum_linea + 1;
              let wnum_lini = wnum_linea;
              -- Insert Into info_satn (num_linea,id_empresa,id_empleado,linea) values (wnum_linea,wid_empresa,wemp,cadenaE01);

              let cadenaC = 'EM@ISS6001015A3@Instituto de Seguridad y Servicios Sociales de los Trabajadores del Estado';

              let wnum_linea = wnum_linea + 1;
              -- Insert Into info_satn (num_linea,id_empresa,id_empleado,linea) values (wnum_linea,wid_empresa,wemp,cadenaC);

              let cadenaC2 = 'CNE@603@@' || wramo || wpagaduria || '@@@';

              let wnum_linea = wnum_linea + 1;
              -- Insert Into info_satn (num_linea,id_empresa,id_empleado,linea) values (wnum_linea,wid_empresa,wemp,cadenaC2);

              Select nss, curp, filiacion Into wnumero_ss_bmex, wcurp_bmex, wid_legal_bmex
              From m4_inf_bmex
              Where id_empleado = wemp 
                And u_version = 'I'
                And fec_inicio <= wfec_pago
                And (fec_fin <= wfec_pago Or fec_fin is null);

              If (wnumero_ss[1,2] = '  ' or wnumero_ss is null) Then
                Let wnumero_ss = wnumero_ss_bmex;
              End If;

              If length(wcurp) != 18 Then
                Let wcurp = wcurp_bmex;
              End If;

              If length(wid_legal) != 13 Then
                Let wid_legal = wid_legal_bmex;
              End If;

              If length(wcurp) != 18 Then
                let wcurp = "ERROR_CURP";
              End If;

              If (length(wid_legal) != 13) or (wid_legal is null) Then
              -- If length(wid_legal) Then
                let wid_legal = "ERROR_RFC";
              End If;

              --If (wcurp[1,2] = '  ' or wcurp is null or (wcurp != 18) or (wcurp matches'*?*')) Then let wcurp = ' '; End If;
              --If (wcurp[1,2] = '  ' or wcurp is null or wcurp != 18 or wcurp matches'*?*') Then let wcurp = ' '; End If;
              If ((wcurp[1,2] = '  ') or (wcurp is null) or (Length(wcurp) != 18) or (wcurp matches'*Ñ*')) Then let wcurp = ' '; End If; --Si
              If (wnumero_ss[1,2] = '  ' or wnumero_ss is null) Then let wnumero_ss = '99999999999'; End If;
              If (wnombre[1] = ' ' or wnombre is null or wnombre[1] = '') Then let wnombre = wnombre2; End If;
              If (wnombre like '%  %') Then let wnombre = wnombre2; End If;

              let wnum_linea = wnum_linea + 1;

              let cadenaE02 = 'RC@'||wid_legal||'@'||trim(wnombre)||'@P01';
              -- Insert Into info_satn (num_linea,id_empresa,id_empleado,linea) values (wnum_linea,wid_empresa,wemp,cadenaE02);


              -- Select porcent Into wporcent From porc_empn Where id_empleado=wemp;   Esta variable no se usa

              let wfec_iniciox=wfec_inicio; let wfec_finx=wfec_fin;

              If wempresa <> "02" Then

                let desc_err = 'NOE inf_rl01';
				
				Select  Min(b.fecha_ini_ts) Into wfecha_ini_ts
				From m4t_acumulado_rl1_2011 a, m4t_acumulado_rl_2011 b 
					Where a.id_empleado = wemp And a.fec_pago = wfec_pago And a.id_empresa = wempresa
					And a.id_empleado = b.id_empleado And a.fec_pago = b.fec_pago And a.fec_imputacion = b.fec_imputacion;

                Select --First 1 --Para modificar
                  Case 
                    When a.id_tipo_tabulador='F' Then a.id_grupo_grado_nivel
                    Else a.id_nivel
                  End GGN_Nivel,
                  Case
                    When a.id_tipo_tabulador='F' Then a.id_integracion
                    Else a.id_sub_nivel
                  End Int_SubNivel,
                  a.id_zona, MAX(a.fec_imputacion)
				  --, MIN(b.fecha_ini_ts)
                  Into wid_nivel_wid_grupo_grado_nivel, wid_sub_nivel_wid_integracion, 
                  wid_zona, wfec_imputacion
				  --, wfecha_ini_ts
                From m4t_acumulado_rl1_2011 a, m4t_acumulado_rl_2011 b 
                Where a.id_empleado = b.id_empleado
                  And a.fec_pago = b.fec_pago
                  And a.fec_imputacion = b.fec_imputacion
                  And a.fec_alta_empleado=b.fec_alta_empleado
                  And a.id_sociedad=b.id_sociedad
                  And a.id_empleado = wemp
                  And a.fec_pago = wfec_pago
                  And a.id_empresa = wempresa
                Group By GGN_Nivel,Int_SubNivel,id_zona;

                -- Let wfec_alta_empleado = NULL;

                SELECT a.c_sindic_local, a.c_sindic_nacion, a.d_antig_gob_fed, b.fecha_ingreso_st, a.prme_cont_tot, a.prme_cont_per, 
                      nvl(a.comentario, ''), a.id_puesto_plaza, a.id_centro_trab,a.id_centro_pago,b.fec_alta_empleado, a.id_empleado
                    Into wsindl, wsindn, wdiaantig, wfec_alta, wcont_des_tot, wcon_pag, wfal_ret, wi2puesto, wcen_trab, wcen_pago, wfec_alta_empleado, wBanderaEmpleado
                FROM m4t_acumulado_rl1_2011 a,
                    m4t_acumulado_rl_2011 b
                WHERE a.id_sociedad = b.id_sociedad 
                  AND a.id_empleado = b.id_empleado 
                  AND a.fec_alta_empleado = b.fec_alta_empleado 
                  AND a.fec_pago = b.fec_pago 
                  AND a.fec_imputacion = b.fec_imputacion 
                  AND a.id_empleado = wemp
                  AND a.fec_pago = wfec_pago
                  AND a.fec_pago = a.fec_imputacion -- * PAGO CORRIENTE
                  AND a.id_empresa = wempresa;

                If (wBanderaEmpleado Is Not Null) Then --wbandera01 = 1 Then
                  let desc_err = 'NOE inf_rl102';
                Else
                  let wdiaantig = "999";
                  let wsindl = "999";
                  let wsindn = "999";
                  let wfec_alta = "01/01/2021";

                  Select a.c_sindic_local, a.c_sindic_nacion, a.d_antig_gob_fed, b.fecha_ingreso_st, a.prme_cont_tot, a.prme_cont_per, nvl(a.comentario, ''), a.id_puesto_plaza, a.id_centro_trab,a.id_centro_pago,b.fec_alta_empleado
                    Into wsindl, wsindn, wdiaantig, wfec_alta, wcont_des_tot, wcon_pag, wfal_ret, wi2puesto, wcen_trab, wcen_pago, wfec_alta_empleado
                  From m4t_acumulado_rl1_2011 a, m4t_acumulado_rl_2011 b
                  Where a.id_empleado = wemp
                    And a.fec_pago = wfec_pago
                    And a.fec_imputacion = wfec_imputacion
                    And a.id_empresa = wempresa
                    And a.id_empleado = b.id_empleado
                    And a.fec_pago = b.fec_pago
                    And a.fec_imputacion = b.fec_imputacion;

                  let desc_err = 'NOE acum_rl03';

                  If wfec_imputacion is null Then
                    let desc_err = 'NOE acum_rl04';
                    return 'error en  ---> ' || wfec_imputacion ||'fec_alta2'  with resume;
                    let wdiaantig = "999";
                    let wsindl = "999";
                    let wsindn = "999";
                    let wfec_alta = "01/01/2021";
                  End If;
                End If;

                let wd2puesto = '';
                Select n_puesto_plaza Into wd2puesto
                From m4t_puestos_plaza
                Where id_sociedad = '01'
                  And id_empresa = wempresa
                  And id_puesto_plaza = wi2puesto;

                let desc_err = 'NOE fec_alta';
                let wsindl_c = 'No';
                let wfec_alta2 = wfec_alta;

                If wsindl > 0 Then let wsindl_c = 'Sí'; End If; --Si
                If wsindn > 0 Then let wsindl_c = 'Sí'; End If;

              Else
                let desc_err = 'NOE inf_rl1_02';
                let wdiaantig = 100;
                let wfec_alta2 = wfec_pago;
                let wsindl_c = 'No';
              End If;

              let desc_err = "NOE Estado";
              Select c_estado Into westado_c
              From c_estado
              Where id_div_geografica = wdivgeo;

              If wempresa <> "02" Then
                Select count(*) Into wbandera01 
                From m4t_datos_pago
                Where id_empleado = wemp;
                  If wbandera01 = 1 Then
                    let desc_err = "NOE DatosPago";
                    Select id_forma_pago,id_banco,num_cuenta
                      Into wforpago, wbanco, wcuenta
                    From m4t_datos_pago
                    Where id_empleado = wemp;
                    If wcuenta = '' or wcuenta is null Then let wcuenta = "99999999999"; End If;
                Else
                  let wbanco = "ERROR BANCO";
                  let wcuenta = "ERROR CUENTA";
                End If

                If wforpago = "CHEQUE" Then
                  let wbanco = "BNMX";
                  Select c_banco Into wbanco_c
                  From c_banco
                  Where id_banco = wbanco;
                  let wcuenta = "99999999999";
                End If

                let desc_err = "NOE DatosPago02";
                If wforpago = 'TD' Then
                  If wbanco = 'SPEI' Then
                    let desc_err = "NOE DatosPago03";
                    Select count(*) Into wbandera01
                    From m4t_datos_pago
                    Where id_empleado = wemp;
                    If wbandera01 = 1 Then
                      let desc_err = "NOE CtaSPEI";         
                      Select substr(num_cuenta,1,3) Into wbanco_c
                      From m4t_datos_pago
                      Where id_empleado = wemp;
                    Else
                      let wbanco_c = "ERROR SPEI";         
                    End if;
                  Else
                    let desc_err = "NOE DatosPago04";
                    Select count(*) Into wbandera01
                    From c_banco
                    Where id_banco = wbanco;
                    If wbandera01 = 1 Then
                      let desc_err = "NOE CtaTD";         
                      Select c_banco Into wbanco_c
                      From c_banco
                      Where id_banco = wbanco;
                    Else
                      let wbanco_c = 'ERROR CUENTA2'; 
                    End If;
                  End If;

                  If substr(wcuenta,1,5) = '00000' Then let wcuenta = substr(wcuenta,6,(length(wcuenta)-5)); End If;
                  If substr(wcuenta,1,4) = '0000' Then let wcuenta = substr(wcuenta,5,(length(wcuenta)-4)); End If;
                  If substr(wcuenta,1,3) = '000' Then let wcuenta = substr(wcuenta,4,(length(wcuenta)-3)); End If;
                  If substr(wcuenta,1,2) = '00' Then let wcuenta = substr(wcuenta,3,(length(wcuenta)-2)); End If;
                  If substr(wcuenta,1,3) = '0' Then let wcuenta = substr(wcuenta,2,(length(wcuenta)-1)); End If;
                  let desc_err = "NOE DatosPago05";

                  If length(wcuenta) <= 10 Then 
                    let wcuenta = lpad(wcuenta,10,'0'); 
                  Else
                    If length(wcuenta) <= 11 Then 
                      let wcuenta = lpad(wcuenta,11,'0'); 
                    Else
                      If length(wcuenta) <= 16 Then 
                        let wcuenta = lpad(wcuenta,16,'0'); 
                      Else
                        If length(wcuenta) <= 18 Then 
                          let wcuenta = lpad(wcuenta,18,'0');
                        End If;
                      End If;
                    End If;
                  End If;
                End If;
              End If;

              If length(wcuenta) = 18 Then
                return 'MCLR ->' || length(wcuenta) with resume;
                Let wbanco_c = "";
              End If;

              If length(wcuenta) = 10  and wbanco ='SPEI' Then
                return 'EAGG ->'  || length(wcuenta) with resume;
                LET wbanco_c = "062";
              End If;

              let wsem_ant = ((wfec_pago-wfec_alta)+1)/7;
              let wantigf = 'P'||wsem_ant||'W';

              let desc_err = "NOE DatosPago06";
              let desc_err = "NOE Arma"||"-"||wforpago||"-"||wbanco||"-"||wcuenta;

              let cadNOEa = 'CNR'||'@'|| w_TipNom1 || '@' || substr(wfec_finx,1,10) || '@' || wfecha_ini_ts || '@' || substr(wfec_finx,1,10) || '@' || wdias || '@' || wperc || '@' || NVL(wdeduc,'') || '@0.00@' || wcurp || '@' || trim(wnumero_ss) || '@' || substr(wfec_alta2,1,10) || '@' || trim(wantigf) || '@' || w_TipCont1 ||'@'|| wsindl_c || '@01@02@' || wemp || '@';
              let cadNOEb = trim(wdserv) || '@' || trim(wd2puesto) || '@1@' || w_Period1 ||'@'||  trim(wbanco_c) ||'@'|| wcuenta || '@@0.00@' || westado_c || '@';
              let wnum_linea=wnum_linea+1;
              -- Insert Into info_satn (num_linea,id_empresa,id_empleado,linea) values (wnum_linea,wid_empresa,wemp,trim(cadNOEa)||trim(cadNOEb));
              let cadNOEc = 'OTROS'|| '@' || wcon_pag ||' DE '|| wcont_des_tot || '@' || trim(wfal_ret) || '@' || trim(wipuesto) || '@' || trim(wcen_pago) || '@' || trim(wcen_trab) || '@' || trim(wid_nivel_wid_grupo_grado_nivel) || '/' || trim(wid_sub_nivel_wid_integracion) || '@' || trim(wid_zona) || '/0' || '@' || trim(wantig_anio) || '@' || trim(wantig_meses) || '@' || trim(wantig_dias) || '@' || wfec_alta_empleado || '@' || wsem_trabajadas || '@'; --|| wfec_alta2 wfec_alta_empleado || '@';    --- || wi2puesto || '@' || trim(wd2puesto) || '@';
              let wnum_linea=wnum_linea+1;
              -- Insert Into info_satn (num_linea,id_empresa,id_empleado,linea) values (wnum_linea,wid_empresa,wemp,trim(cadNOEc));

              let cadenaD01= 'CN@' || "84111505@1@" || 'ACT@' || trim(wdescrip) || '@' || wperc || '@' || wperc || '@' || NVL(wdeduc,'') ||'@@';
              let wnum_linea=wnum_linea+1;
              -- Insert Into info_satn (num_linea,id_empresa,id_empleado,linea) values (wnum_linea,wid_empresa,wemp,cadenaD01);

              let cadenaK = 'CNP@' || wperc || '@@@' || wperc || '@0.00' || '@@@@@@@@@@';
              let wnum_linea=wnum_linea+1;
              -- Insert Into info_satn (num_linea,id_empresa,id_empleado,linea) values (wnum_linea,wid_empresa,wemp,cadenaK);

              If wp1 = 'P' Then
                If wi1 != 0 and flg1 = 0 Then
                  -- Call GenLinSATn(wemp,wp1,wi1,wc1,wnum_linea,wid_empresa) returning wnum_linea;
                Else
                  If flg1 = 3 Then
                    -- Call GenLinSATne(wemp,wp1,wi1,wc1,wi2,wc2,wnum_linea,wid_empresa) returning wnum_linea;
                    let flg2 = 2;
                  End If;
                End If;
              End If;

              If wp2 = 'P' Then
                If wi2 != 0 and flg2 = 0 Then
                  -- Call GenLinSATn(wemp,wp2,wi2,wc2,wnum_linea,wid_empresa) returning wnum_linea;
                Else
                  If flg2 = 3 Then
                    -- Call GenLinSATne(wemp,wp2,wi2,wc2,wi3,wc3,wnum_linea,wid_empresa) returning wnum_linea;
                    let flg3 = 2;
                  End If;
                End If;
              End If;

              If wp3 = 'P' Then
                If wi3 != 0 and flg3 = 0 Then
                  -- Call GenLinSATn(wemp,wp3,wi3,wc3,wnum_linea,wid_empresa) returning wnum_linea;
                Else
                  If flg3 = 3 Then
                    -- Call GenLinSATne(wemp,wp3,wi3,wc3,wi4,wc4,wnum_linea,wid_empresa) returning wnum_linea;
                    let flg4 = 2;
                  End If;
                End If;
              End If;

              If wp4 = 'P' Then
                If wi4 != 0 and flg4 = 0 Then
                  -- Call GenLinSATn(wemp,wp4,wi4,wc4,wnum_linea,wid_empresa) returning wnum_linea;
                Else
                  If flg4 = 3 Then
                    -- Call GenLinSATne(wemp,wp4,wi4,wc4,wi5,wc5,wnum_linea,wid_empresa) returning wnum_linea;
                    let flg5 = 2;
                  End If;
                End If;
              End If;

              If wp5 = 'P' Then
                If wi5 != 0 and flg5 = 0 Then
                  -- Call GenLinSATn(wemp,wp5,wi5,wc5,wnum_linea,wid_empresa) returning wnum_linea;
                Else
                  If flg5 = 3 Then
                    -- Call GenLinSATne(wemp,wp5,wi5,wc5,wi6,wc6,wnum_linea,wid_empresa) returning wnum_linea;
                    let flg6 = 2;
                  End If;
                End If;
              End If;

              If wp6 = 'P' Then
                If wi6 != 0 and flg6 = 0 Then
                  -- Call GenLinSATn(wemp,wp6,wi6,wc6,wnum_linea,wid_empresa) returning wnum_linea;
                Else
                  If flg6 = 3 Then
                    -- Call GenLinSATne(wemp,wp6,wi6,wc6,wi7,wc7,wnum_linea,wid_empresa) returning wnum_linea;
                    let flg7 = 2;
                  End If;
                End If;
              End If;

              If wp7 = 'P' Then
                If wi7 != 0 and flg7 = 0 Then
                  -- Call GenLinSATn(wemp,wp7,wi7,wc7,wnum_linea,wid_empresa) returning wnum_linea;
                Else
                  If flg7 = 3 Then
                    -- Call GenLinSATne(wemp,wp7,wi7,wc7,wi8,wc8,wnum_linea,wid_empresa) returning wnum_linea;
                    let flg8 = 2;
                  End If;
                End If;
              End If;

              If wp8 = 'P' Then
                If wi8 != 0 and flg8 = 0 Then
                  -- Call GenLinSATn(wemp,wp8,wi8,wc8,wnum_linea,wid_empresa) returning wnum_linea;
                Else
                  If flg8 = 3 Then
                    -- Call GenLinSATne(wemp,wp8,wi8,wc8,wi9,wc9,wnum_linea,wid_empresa) returning wnum_linea;
                    let flg9 = 2;
                  End If;
                End If;
              End If;

              If wp9 = 'P' Then
                If wi9 != 0 and flg9 = 0 Then
                  -- Call GenLinSATn(wemp,wp9,wi9,wc9,wnum_linea,wid_empresa) returning wnum_linea;
                Else
                  If flg9 = 3 Then
                    -- Call GenLinSATne(wemp,wp9,wi9,wc9,wi10,wc10,wnum_linea,wid_empresa) returning wnum_linea;
                    let flg10 = 2;
                  End If;
                End If;
              End If;

              If wp10 = 'P' Then
                If wi10 != 0 and flg10 = 0 Then
                  -- Call GenLinSATn(wemp,wp10,wi10,wc10,wnum_linea,wid_empresa) returning wnum_linea;
                Else
                  If flg10 = 3 Then
                    -- Call GenLinSATne(wemp,wp10,wi10,wc10,wi11,wc11,wnum_linea,wid_empresa) returning wnum_linea;
                    let flg11 = 2;
                  End If;
                End If;
              End If;

              If wp11 = 'P' Then
                If wi11 != 0 and flg11 = 0 Then
                  -- Call GenLinSATn(wemp,wp11,wi11,wc11,wnum_linea,wid_empresa) returning wnum_linea;
                Else
                  If flg11 = 3 Then
                    -- Call GenLinSATne(wemp,wp11,wi11,wc11,wi12,wc12,wnum_linea,wid_empresa) returning wnum_linea;
                    let flg12 = 2;
                  End If;
                End If;
              End If;

              If wp12 = 'P' Then
                If wi12 != 0 and flg12 = 0 Then
                  -- Call GenLinSATn(wemp,wp12,wi12,wc12,wnum_linea,wid_empresa) returning wnum_linea;
                Else 
                  If flg12 = 3 Then
                    -- Call GenLinSATne(wemp,wp12,wi12,wc12,wi13,wc13,wnum_linea,wid_empresa) returning wnum_linea;
                    let flg13 = 2;
                  End If;
                End If;
              End If;

              If wp13 = 'P' Then
                If wi13 != 0 and flg13 = 0 Then
                  -- Call GenLinSATn(wemp,wp13,wi13,wc13,wnum_linea,wid_empresa) returning wnum_linea;
                Else
                  If flg13 = 3 Then
                    -- Call GenLinSATne(wemp,wp13,wi13,wc13,wi14,wc14,wnum_linea,wid_empresa) returning wnum_linea;
                    let flg14 = 2;
                  End If;
                End If;
              End If;

              If wp14 = 'P' Then
                If wi14 != 0 and flg14 = 0 Then
                  -- Call GenLinSATn(wemp,wp14,wi14,wc14,wnum_linea,wid_empresa) returning wnum_linea;
                Else
                  If flg14 = 3 Then
                    -- Call GenLinSATne(wemp,wp14,wi14,wc14,wi15,wc15,wnum_linea,wid_empresa) returning wnum_linea;
                    let flg15 = 2;
                  End If;
                End If;
              End If;

              If wp15 = 'P' Then
                If wi15 != 0 and flg15 = 0 Then
                  -- Call GenLinSATn(wemp,wp15,wi15,wc15,wnum_linea,wid_empresa) returning wnum_linea;
                Else
                  If flg15 = 3 Then
                    -- Call GenLinSATne(wemp,wp15,wi15,wc15,wi16,wc16,wnum_linea,wid_empresa) returning wnum_linea;
                    let flg16 = 2;
                  End If;
                End If;
              End If;

              If wp16 = 'P' Then
                If wi16 != 0 and flg16 = 0 Then
                  -- Call GenLinSATn(wemp,wp16,wi16,wc16,wnum_linea,wid_empresa) returning wnum_linea;
                Else
                  If flg16 = 3 Then
                    -- Call GenLinSATne(wemp,wp16,wi16,wc16,wi17,wc17,wnum_linea,wid_empresa) returning wnum_linea;
                    let flg17 = 2;
                  End If;
                End If;
              End If;

              If wp17 = 'P' Then
                If wi17 != 0 and flg17 = 0 Then
                  -- Call GenLinSATn(wemp,wp17,wi17,wc17,wnum_linea,wid_empresa) returning wnum_linea;
                Else
                  If flg17 = 3 Then
                    -- Call GenLinSATne(wemp,wp17,wi17,wc17,wi18,wc18,wnum_linea,wid_empresa) returning wnum_linea;
                    let flg18 = 2;
                  End If;
                End If;
              End If;

              If wp18 = 'P' Then
                If wi18 != 0 and flg18 = 0 Then
                  -- Call GenLinSATn(wemp,wp18,wi18,wc18,wnum_linea,wid_empresa) returning wnum_linea;
                Else
                  If flg18 = 3 Then
                    -- Call GenLinSATne(wemp,wp18,wi18,wc18,wi19,wc19,wnum_linea,wid_empresa) returning wnum_linea;
                    let flg19 = 2;
                  End If;
                End If;
              End If;

              If wp19 = 'P' Then
                If wi19 != 0 and flg19 = 0 Then
                  -- Call GenLinSATn(wemp,wp19,wi19,wc19,wnum_linea,wid_empresa) returning wnum_linea;
                Else
                  If flg19 = 3 Then
                    -- Call GenLinSATne(wemp,wp19,wi19,wc19,wi20,wc20,wnum_linea,wid_empresa) returning wnum_linea;
                    let flg20 = 2;
                  End If;
                End If;
              End If;

              If wp20 = 'P' Then
                If wi20 != 0 and flg20 = 0 Then
                  -- Call GenLinSATn(wemp,wp20,wi20,wc20,wnum_linea,wid_empresa) returning wnum_linea;
                Else
                  If flg20 = 3 Then
                    -- Call GenLinSATne(wemp,wp20,wi20,wc20,wi21,wc21,wnum_linea,wid_empresa) returning wnum_linea;
                    let flg21 = 2;
                  End If;
                End If;
              End If;

              If wp21 = 'P' Then
                If wi21 != 0 and flg21 = 0 Then
                  -- Call GenLinSATn(wemp,wp21,wi21,wc21,wnum_linea,wid_empresa) returning wnum_linea;
                Else
                  If flg21 = 3 Then
                    -- Call GenLinSATne(wemp,wp21,wi21,wc21,wi22,wc22,wnum_linea,wid_empresa) returning wnum_linea;
                    let flg22 = 2;
                  End If;
                End If;
              End If;

              If wp22 = 'P' Then
                If wi22 != 0 and flg22 = 0 Then
                  -- Call GenLinSATn(wemp,wp22,wi22,wc22,wnum_linea,wid_empresa) returning wnum_linea;
                Else
                  If flg22 = 3 Then
                    -- Call GenLinSATne(wemp,wp22,wi22,wc22,wi23,wc23,wnum_linea,wid_empresa) returning wnum_linea;
                    let flg23 = 2;
                  End If;
                End If;
              End If;

              If wp23 = 'P' Then
                If wi23 != 0 and flg23 = 0 Then
                  -- Call GenLinSATn(wemp,wp23,wi23,wc23,wnum_linea,wid_empresa) returning wnum_linea;
                Else
                  If flg23 = 3 Then
                    -- Call GenLinSATne(wemp,wp23,wi23,wc23,wi24,wc24,wnum_linea,wid_empresa) returning wnum_linea;
                    let flg24 = 2;
                  End If;
                End If;
              End If;

              If wp24 = 'P' Then
                If wi24 != 0 and flg24 = 0 Then 
                  -- Call GenLinSATn(wemp,wp24,wi24,wc24,wnum_linea,wid_empresa) returning wnum_linea;
                Else
                  If flg24 = 3 Then
                  -- Call GenLinSATne(wemp,wp24,wi24,wc24,wi25,wc25,wnum_linea,wid_empresa) returning wnum_linea;
                  let flg25 = 2;
                  End If;
                End If;
              End If;

              If wp25 = 'P' Then
                If wi25 != 0 and flg25 = 0 Then
                  -- Call GenLinSATn(wemp,wp25,wi25,wc25,wnum_linea,wid_empresa) returning wnum_linea;
                Else
                  If flg25 = 3 Then
                    -- Call GenLinSATne(wemp,wp25,wi25,wc25,wi26,wc26,wnum_linea,wid_empresa) returning wnum_linea;
                    let flg26 = 2;
                  End If;
                End If;
              End If;

              If wp26 = 'P' Then
                If wi26 != 0 and flg26 = 0 Then 
                  -- Call GenLinSATn(wemp,wp26,wi26,wc26,wnum_linea,wid_empresa) returning wnum_linea;
                Else
                  If flg26 = 3 Then
                    -- Call GenLinSATne(wemp,wp26,wi26,wc26,wi27,wc27,wnum_linea,wid_empresa) returning wnum_linea;
                    let flg27 = 2;
                  End If;
                End If;
              End If;

              If wp27 = 'P' Then
                If wi27 != 0 and flg27 = 0 Then
                  -- Call GenLinSATn(wemp,wp27,wi27,wc27,wnum_linea,wid_empresa) returning wnum_linea;
                Else
                  If flg27 = 3 Then
                    -- Call GenLinSATne(wemp,wp27,wi27,wc27,wi28,wc28,wnum_linea,wid_empresa) returning wnum_linea;
                    let flg28 = 2;
                  End If;
                End If;
              End If;

              If wp28 = 'P' Then
                If wi28 != 0 and flg28 = 0 Then
                  -- Call GenLinSATn(wemp,wp28,wi28,wc28,wnum_linea,wid_empresa) returning wnum_linea;
                Else
                  If flg28 = 3 Then
                    -- Call GenLinSATne(wemp,wp28,wi28,wc28,wi29,wc29,wnum_linea,wid_empresa) returning wnum_linea;
                    let flg29 = 2;
                  End If;
                End If;
              End If;

              If wp29 = 'P' Then
                If wi29 != 0 and flg29 = 0 Then
                  -- Call GenLinSATn(wemp,wp29,wi29,wc29,wnum_linea,wid_empresa) returning wnum_linea;
                Else
                  If flg29 = 3 Then
                    -- Call GenLinSATne(wemp,wp29,wi29,wc29,wi30,wc30,wnum_linea,wid_empresa) returning wnum_linea;
                    let flg30 = 2;
                  End If;
                End If; 
              End If;

              If wp30 = 'P' Then
                If wi30 != 0 and flg30 = 0 Then
                  -- Call GenLinSATn(wemp,wp30,wi30,wc30,wnum_linea,wid_empresa) returning wnum_linea;
                Else If
                  flg30 = 3 Then
                    -- Call GenLinSATne(wemp,wp30,wi30,wc30,wi31,wc31,wnum_linea,wid_empresa) returning wnum_linea;
                    let flg31 = 2;
                  End If;
                End If;
              End If;

              If wp31 = 'P' Then
                If wi31 != 0 and flg31 = 0 Then
                  -- Call GenLinSATn(wemp,wp31,wi31,wc31,wnum_linea,wid_empresa) returning wnum_linea;
                Else
                  If flg31 = 3 Then
                    -- Call GenLinSATne(wemp,wp31,wi31,wc31,wi32,wc32,wnum_linea,wid_empresa) returning wnum_linea;
                    let flg32 = 2;
                  End If;
                End If;
              End If;

              If wp32 = 'P' Then
                If wi32 != 0 and flg32 = 0 Then
                  -- Call GenLinSATn(wemp,wp32,wi32,wc32,wnum_linea,wid_empresa) returning wnum_linea;
                Else
                  If flg32 = 3 Then
                    -- Call GenLinSATne(wemp,wp32,wi32,wc32,wi33,wc33,wnum_linea,wid_empresa) returning wnum_linea;
                    let flg33 = 2;
                  End If;
                End If;
              End If;

              If wp33 = 'P' Then
                If wi33 != 0 and flg33 = 0 Then
                  -- Call GenLinSATn(wemp,wp33,wi33,wc33,wnum_linea,wid_empresa) returning wnum_linea;
                Else
                  If flg33 = 3 Then
                    -- Call GenLinSATne(wemp,wp33,wi33,wc33,wi34,wc34,wnum_linea,wid_empresa) returning wnum_linea;
                    let flg34 = 2;
                  End If;
                End If;
              End If;

              If wp34 = 'P' Then
                If wi34 != 0 and flg34 = 0 Then
                  -- Call GenLinSATn(wemp,wp34,wi34,wc34,wnum_linea,wid_empresa) returning wnum_linea;
                Else
                  If flg34 = 3 Then
                    -- Call GenLinSATne(wemp,wp34,wi34,wc34,wi35,wc35,wnum_linea,wid_empresa) returning wnum_linea;
                    let flg35 = 2;
                  End If;
                End If;
              End If;

              If wp35 = 'P' Then
                If wi35 != 0 and flg35 = 0 Then
                  -- Call GenLinSATn(wemp,wp35,wi35,wc35,wnum_linea,wid_empresa) returning wnum_linea;
                Else
                  If flg35 = 3 Then
                    -- Call GenLinSATne(wemp,wp35,wi35,wc35,wi36,wc36,wnum_linea,wid_empresa) returning wnum_linea;
                    let flg36 = 2;
                  End If;
                End If;
              End If;

              If wp36 = 'P' Then
                If wi36 != 0 and flg36 = 0 Then
                  -- Call GenLinSATn(wemp,wp36,wi36,wc36,wnum_linea,wid_empresa) returning wnum_linea;
                Else
                  If flg36 = 3 Then
                    -- Call GenLinSATne(wemp,wp36,wi36,wc36,wi37,wc37,wnum_linea,wid_empresa) returning wnum_linea;
                    let flg37 = 2;
                  End If;
                End If;
              End If;

              If wp37 = 'P' Then
                If wi37 != 0 and flg37 = 0 Then
                  -- Call GenLinSATn(wemp,wp37,wi37,wc37,wnum_linea,wid_empresa) returning wnum_linea;
                Else
                  If flg37 = 3 Then
                    -- Call GenLinSATne(wemp,wp37,wi37,wc37,wi38,wc38,wnum_linea,wid_empresa) returning wnum_linea;
                    let flg38 = 2;
                  End If;
                End If;
              End If;

              If wp38 = 'P' Then
                If wi38 != 0 and flg38 = 0 Then
                  -- Call GenLinSATn(wemp,wp38,wi38,wc38,wnum_linea,wid_empresa) returning wnum_linea;
                Else
                  If flg38 = 3 Then
                    -- Call GenLinSATne(wemp,wp38,wi38,wc38,wi39,wc39,wnum_linea,wid_empresa) returning wnum_linea;
                    let flg39 = 2;
                  End If;
                End If;
              End If;

              If wp39 = 'P' Then
                If wi39 != 0 and flg39 = 0 Then
                  -- Call GenLinSATn(wemp,wp39,wi39,wc39,wnum_linea,wid_empresa) returning wnum_linea;
                Else
                  If flg39 = 3 Then
                    -- Call GenLinSATne(wemp,wp39,wi39,wc39,wi40,wc40,wnum_linea,wid_empresa) returning wnum_linea;
                    let flg40 = 2;
                  End If;
                End If;
              End If;

              If wp40 = 'P' Then
                If wi40 != 0 and flg40 = 0 Then 
                  -- Call GenLinSATn(wemp,wp40,wi40,wc40,wnum_linea,wid_empresa) returning wnum_linea;
                End If; 
              End If;

              -- If wc1='09' and wi1 > 0 Then Call GenNOHn(wemp,wfec_pago,wi1,wc1,wnum_linea,wid_empresa) returning wnum_linea; End If;
              -- If wc2='09' and wi2 > 0 Then Call GenNOHn(wemp,wfec_pago,wi2,wc2,wnum_linea,wid_empresa) returning wnum_linea; End If;
              -- If wc3='09' and wi3 > 0 Then Call GenNOHn(wemp,wfec_pago,wi3,wc3,wnum_linea,wid_empresa) returning wnum_linea; End If;
              -- If wc4='09' and wi4 > 0 Then Call GenNOHn(wemp,wfec_pago,wi4,wc4,wnum_linea,wid_empresa) returning wnum_linea; End If;
              -- If wc5='09' and wi5 > 0 Then Call GenNOHn(wemp,wfec_pago,wi5,wc5,wnum_linea,wid_empresa) returning wnum_linea; End If;
              -- If wc6='09' and wi6 > 0 Then Call GenNOHn(wemp,wfec_pago,wi6,wc6,wnum_linea,wid_empresa) returning wnum_linea; End If;
              -- If wc7='09' and wi7 > 0 Then Call GenNOHn(wemp,wfec_pago,wi7,wc7,wnum_linea,wid_empresa) returning wnum_linea; End If;
              -- If wc8='09' and wi8 > 0 Then Call GenNOHn(wemp,wfec_pago,wi8,wc8,wnum_linea,wid_empresa) returning wnum_linea; End If;
              -- If wc9='09' and wi9 > 0 Then Call GenNOHn(wemp,wfec_pago,wi9,wc9,wnum_linea,wid_empresa) returning wnum_linea; End If;
              -- If wc10='09' and wi10 > 0 Then Call GenNOHn(wemp,wfec_pago,wi10,wc10,wnum_linea,wid_empresa) returning wnum_linea; End If;
              -- If wc11='09' and wi11 > 0 Then Call GenNOHn(wemp,wfec_pago,wi11,wc11,wnum_linea,wid_empresa) returning wnum_linea; End If;
              -- If wc12='09' and wi12 > 0 Then Call GenNOHn(wemp,wfec_pago,wi12,wc12,wnum_linea,wid_empresa) returning wnum_linea; End If;
              -- If wc13='09' and wi13 > 0 Then Call GenNOHn(wemp,wfec_pago,wi13,wc13,wnum_linea,wid_empresa) returning wnum_linea; End If;
              -- If wc14='09' and wi14 > 0 Then Call GenNOHn(wemp,wfec_pago,wi14,wc14,wnum_linea,wid_empresa) returning wnum_linea; End If;
              -- If wc15='09' and wi15 > 0 Then Call GenNOHn(wemp,wfec_pago,wi15,wc15,wnum_linea,wid_empresa) returning wnum_linea; End If;
              -- If wc16='09' and wi16 > 0 Then Call GenNOHn(wemp,wfec_pago,wi16,wc16,wnum_linea,wid_empresa) returning wnum_linea; End If;
              -- If wc17='09' and wi17 > 0 Then Call GenNOHn(wemp,wfec_pago,wi17,wc17,wnum_linea,wid_empresa) returning wnum_linea; End If;
              -- If wc18='09' and wi18 > 0 Then Call GenNOHn(wemp,wfec_pago,wi18,wc18,wnum_linea,wid_empresa) returning wnum_linea; End If;
              -- If wc19='09' and wi19 > 0 Then Call GenNOHn(wemp,wfec_pago,wi19,wc19,wnum_linea,wid_empresa) returning wnum_linea; End If;
              -- If wc20='09' and wi20 > 0 Then Call GenNOHn(wemp,wfec_pago,wi20,wc20,wnum_linea,wid_empresa) returning wnum_linea; End If;
              -- If wc21='09' and wi21 > 0 Then Call GenNOHn(wemp,wfec_pago,wi21,wc21,wnum_linea,wid_empresa) returning wnum_linea; End If;
              -- If wc22='09' and wi22 > 0 Then Call GenNOHn(wemp,wfec_pago,wi22,wc22,wnum_linea,wid_empresa) returning wnum_linea; End If;
              -- If wc23='09' and wi23 > 0 Then Call GenNOHn(wemp,wfec_pago,wi23,wc23,wnum_linea,wid_empresa) returning wnum_linea; End If;
              -- If wc24='09' and wi24 > 0 Then Call GenNOHn(wemp,wfec_pago,wi24,wc24,wnum_linea,wid_empresa) returning wnum_linea; End If;
              -- If wc25='09' and wi25 > 0 Then Call GenNOHn(wemp,wfec_pago,wi25,wc25,wnum_linea,wid_empresa) returning wnum_linea; End If;
              -- If wc26='09' and wi26 > 0 Then Call GenNOHn(wemp,wfec_pago,wi26,wc26,wnum_linea,wid_empresa) returning wnum_linea; End If;
              -- If wc27='09' and wi27 > 0 Then Call GenNOHn(wemp,wfec_pago,wi27,wc27,wnum_linea,wid_empresa) returning wnum_linea; End If;
              -- If wc28='09' and wi28 > 0 Then Call GenNOHn(wemp,wfec_pago,wi28,wc28,wnum_linea,wid_empresa) returning wnum_linea; End If;
              -- If wc29='09' and wi29 > 0 Then Call GenNOHn(wemp,wfec_pago,wi29,wc29,wnum_linea,wid_empresa) returning wnum_linea; End If;
              -- If wc30='09' and wi30 > 0 Then Call GenNOHn(wemp,wfec_pago,wi30,wc30,wnum_linea,wid_empresa) returning wnum_linea; End If;
              -- If wc31='09' and wi31 > 0 Then Call GenNOHn(wemp,wfec_pago,wi31,wc31,wnum_linea,wid_empresa) returning wnum_linea; End If;
              -- If wc32='09' and wi32 > 0 Then Call GenNOHn(wemp,wfec_pago,wi32,wc32,wnum_linea,wid_empresa) returning wnum_linea; End If;
              -- If wc33='09' and wi33 > 0 Then Call GenNOHn(wemp,wfec_pago,wi33,wc33,wnum_linea,wid_empresa) returning wnum_linea; End If;
              -- If wc34='09' and wi34 > 0 Then Call GenNOHn(wemp,wfec_pago,wi34,wc34,wnum_linea,wid_empresa) returning wnum_linea; End If;
              -- If wc35='09' and wi35 > 0 Then Call GenNOHn(wemp,wfec_pago,wi35,wc35,wnum_linea,wid_empresa) returning wnum_linea; End If;
              -- If wc36='09' and wi36 > 0 Then Call GenNOHn(wemp,wfec_pago,wi36,wc36,wnum_linea,wid_empresa) returning wnum_linea; End If;
              -- If wc37='09' and wi37 > 0 Then Call GenNOHn(wemp,wfec_pago,wi37,wc37,wnum_linea,wid_empresa) returning wnum_linea; End If;
              -- If wc38='09' and wi38 > 0 Then Call GenNOHn(wemp,wfec_pago,wi38,wc38,wnum_linea,wid_empresa) returning wnum_linea; End If;
              -- If wc39='09' and wi39 > 0 Then Call GenNOHn(wemp,wfec_pago,wi39,wc39,wnum_linea,wid_empresa) returning wnum_linea; End If;
              -- If wc40='09' and wi40 > 0 Then Call GenNOHn(wemp,wfec_pago,wi40,wc40,wnum_linea,wid_empresa) returning wnum_linea; End If;      
				
				--------------
				If wimporte = 0 Then
				
				Else
				  let cadenaQ = 'CND@' || wimporte || '@'  || wispt;
				  let wnum_linea=wnum_linea+1;
				  -- Insert Into info_satn (num_linea,id_empresa,id_empleado,linea) values (wnum_linea,wid_empresa,wemp,cadenaQ);
				End If;
				----------
              If wp1 = 'D' Then
                If wi1 != 0 and flg1 = 0 Then
                  -- Call GenLinSATn(wemp,wp1,wi1,wc1,wnum_linea,wid_empresa) returning wnum_linea;
                End If;
              End If;

              If wp2 = 'D' Then
                If wi2 != 0 and flg2 = 0 Then
                  -- Call GenLinSATn(wemp,wp2,wi2,wc2,wnum_linea,wid_empresa) returning wnum_linea;
                End If;
              End If;

              If wp3 = 'D' Then
                If wi3 != 0 and flg3 = 0 Then
                  -- Call GenLinSATn(wemp,wp3,wi3,wc3,wnum_linea,wid_empresa) returning wnum_linea;
                End If;
              End If;

              If wp4 = 'D' Then
                If wi4 != 0 and flg4 = 0 Then
                  -- Call GenLinSATn(wemp,wp4,wi4,wc4,wnum_linea,wid_empresa) returning wnum_linea;
                End If;
              End If;

              If wp5 = 'D' Then
                If wi5 != 0 and flg5 = 0 Then
                  -- Call GenLinSATn(wemp,wp5,wi5,wc5,wnum_linea,wid_empresa) returning wnum_linea;
                End If;
              End If;

              If wp6 = 'D' Then
                If wi6 != 0 and flg6 = 0 Then
                  -- Call GenLinSATn(wemp,wp6,wi6,wc6,wnum_linea,wid_empresa) returning wnum_linea;
                End If;
              End If;

              If wp7 = 'D' Then
                If wi7 != 0 and flg7 = 0 Then
                  -- Call GenLinSATn(wemp,wp7,wi7,wc7,wnum_linea,wid_empresa) returning wnum_linea;
                End If;
              End If;

              If wp8 = 'D' Then
                If wi8 != 0 and flg8 = 0 Then
                  -- Call GenLinSATn(wemp,wp8,wi8,wc8,wnum_linea,wid_empresa) returning wnum_linea;
                End If;
              End If;

              If wp9 = 'D' Then
                If wi9 != 0 and flg9 = 0 Then
                  -- Call GenLinSATn(wemp,wp9,wi9,wc9,wnum_linea,wid_empresa) returning wnum_linea;
                End If;
              End If;

              If wp10 = 'D' Then
                If wi10 != 0 and flg10 = 0 Then
                  -- Call GenLinSATn(wemp,wp10,wi10,wc10,wnum_linea,wid_empresa) returning wnum_linea;
                End If;
              End If;

              If wp11 = 'D' Then
                If wi11 != 0 and flg11 = 0 Then
                  -- Call GenLinSATn(wemp,wp11,wi11,wc11,wnum_linea,wid_empresa) returning wnum_linea;
                End If;
              End If;

              If wp12 = 'D' Then
                If wi12 != 0 and flg12 = 0 Then
                  -- Call GenLinSATn(wemp,wp12,wi12,wc12,wnum_linea,wid_empresa) returning wnum_linea;
                End If;
              End If;

              If wp13 = 'D' Then
                If wi13 != 0 and flg13 = 0 Then
                  -- Call GenLinSATn(wemp,wp13,wi13,wc13,wnum_linea,wid_empresa) returning wnum_linea;
                End If;
              End If;

              If wp14 = 'D' Then
                If wi14 != 0 and flg14 = 0 Then
                  -- Call GenLinSATn(wemp,wp14,wi14,wc14,wnum_linea,wid_empresa) returning wnum_linea;
                End If;
              End If;

              If wp15 = 'D' Then
                If wi15 != 0 and flg15 = 0 Then
                  -- Call GenLinSATn(wemp,wp15,wi15,wc15,wnum_linea,wid_empresa) returning wnum_linea;
                End If;
              End If;

              If wp16 = 'D' Then
                If wi16 != 0 and flg16 = 0 Then
                  -- Call GenLinSATn(wemp,wp16,wi16,wc16,wnum_linea,wid_empresa) returning wnum_linea;
                End If;
              End If;

              If wp17 = 'D' Then
                If wi17 != 0 and flg17 = 0 Then
                  -- Call GenLinSATn(wemp,wp17,wi17,wc17,wnum_linea,wid_empresa) returning wnum_linea;
                End If;
              End If;

              If wp18 = 'D' Then
                If wi18 != 0 and flg18 = 0 Then
                  -- Call GenLinSATn(wemp,wp18,wi18,wc18,wnum_linea,wid_empresa) returning wnum_linea;
                End If;
              End If;

              If wp19 = 'D' Then
                If wi19 != 0 and flg19 = 0 Then
                  -- Call GenLinSATn(wemp,wp19,wi19,wc19,wnum_linea,wid_empresa) returning wnum_linea;
                End If;
              End If;

              If wp20 = 'D' Then
                If wi20 != 0 and flg20 = 0 Then
                  -- Call GenLinSATn(wemp,wp20,wi20,wc20,wnum_linea,wid_empresa) returning wnum_linea;
                End If;
              End If;

              If wp21 = 'D' Then
                If wi21 != 0 and flg21 = 0 Then
                  -- Call GenLinSATn(wemp,wp21,wi21,wc21,wnum_linea,wid_empresa) returning wnum_linea;
                End If;
              End If;

              If wp22 = 'D' Then
                If wi22 != 0 and flg22 = 0 Then
                  -- Call GenLinSATn(wemp,wp22,wi22,wc22,wnum_linea,wid_empresa) returning wnum_linea;
                End If;
              End If;

              If wp23 = 'D' Then
                If wi23 != 0 and flg23 = 0 Then
                  -- Call GenLinSATn(wemp,wp23,wi23,wc23,wnum_linea,wid_empresa) returning wnum_linea;
                End If;
              End If;

              If wp24 = 'D' Then
                If wi24 != 0 and flg24 = 0 Then
                  -- Call GenLinSATn(wemp,wp24,wi24,wc24,wnum_linea,wid_empresa) returning wnum_linea;
                End If;
              End If;

              If wp25 = 'D' Then
                If wi25 != 0 and flg25 = 0 Then
                  -- Call GenLinSATn(wemp,wp25,wi25,wc25,wnum_linea,wid_empresa) returning wnum_linea;
                End If;
              End If;

              If wp26 = 'D' Then
                If wi26 != 0 and flg26 = 0 Then
                  -- Call GenLinSATn(wemp,wp26,wi26,wc26,wnum_linea,wid_empresa) returning wnum_linea;
                End If;
              End If;

              If wp27 = 'D' Then
                If wi27 != 0 and flg27 = 0 Then
                  -- Call GenLinSATn(wemp,wp27,wi27,wc27,wnum_linea,wid_empresa) returning wnum_linea;
                End If;
              End If;

              If wp28 = 'D' Then
                If wi28 != 0 and flg28 = 0 Then
                  -- Call GenLinSATn(wemp,wp28,wi28,wc28,wnum_linea,wid_empresa) returning wnum_linea;
                End If;
              End If;

              If wp29 = 'D' Then
                If wi29 != 0 and flg29 = 0 Then
                  -- Call GenLinSATn(wemp,wp29,wi29,wc29,wnum_linea,wid_empresa) returning wnum_linea;
                End If;
              End If;

              If wp30 = 'D' Then
                If wi30 != 0 and flg30 = 0 Then
                  -- Call GenLinSATn(wemp,wp30,wi30,wc30,wnum_linea,wid_empresa) returning wnum_linea;
                End If;
              End If;

              If wp31 = 'D' Then
                If wi31 != 0 and flg31 = 0 Then
                  -- Call GenLinSATn(wemp,wp31,wi31,wc31,wnum_linea,wid_empresa) returning wnum_linea;
                End If;
              End If;

              If wp32 = 'D' Then
                If wi32 != 0 and flg32 = 0 Then
                  -- Call GenLinSATn(wemp,wp32,wi32,wc32,wnum_linea,wid_empresa) returning wnum_linea;
                End If;
              End If;

              If wp33 = 'D' Then
                If wi33 != 0 and flg33 = 0 Then
                  -- Call GenLinSATn(wemp,wp33,wi33,wc33,wnum_linea,wid_empresa) returning wnum_linea;
                End If;
              End If;

              If wp34 = 'D' Then
                If wi34 != 0 and flg34 = 0 Then
                  -- Call GenLinSATn(wemp,wp34,wi34,wc34,wnum_linea,wid_empresa) returning wnum_linea;
                End If;
              End If;

              If wp35 = 'D' Then
                If wi35 != 0 and flg35 = 0 Then
                  -- Call GenLinSATn(wemp,wp35,wi35,wc35,wnum_linea,wid_empresa) returning wnum_linea;
                End If;
              End If;

              If wp36 = 'D' Then
                If wi36 != 0 and flg36 = 0 Then
                  -- Call GenLinSATn(wemp,wp36,wi36,wc36,wnum_linea,wid_empresa) returning wnum_linea;
                End If;
              End If;

              If wp37 = 'D' Then
                If wi37 != 0 and flg37 = 0 Then
                  -- Call GenLinSATn(wemp,wp37,wi37,wc37,wnum_linea,wid_empresa) returning wnum_linea;
                End If;
              End If;

              If wp38 = 'D' Then
                If wi38 != 0 and flg38 = 0 Then
                  -- Call GenLinSATn(wemp,wp38,wi38,wc38,wnum_linea,wid_empresa) returning wnum_linea;
                End If;
              End If;

              If wp39 = 'D' Then
                If wi39 != 0 and flg39 = 0 Then
                  -- Call GenLinSATn(wemp,wp39,wi39,wc39,wnum_linea,wid_empresa) returning wnum_linea;
                End If;
              End If;

              If wp40 = 'D' Then
                If wi40 != 0 and flg40 = 0 Then
                  -- Call GenLinSATn(wemp,wp40,wi40,wc40,wnum_linea,wid_empresa) returning wnum_linea;
                End If;
              End If;

              let cadNOP = 'NOP@' ||'002'|| '@' || '00001518' || '@' || 'SUBSIDIO PARA EL EMPLEO (EFECTIVAMENTE ENTREGADO AL TRABAJADOR)'||'@0.00'||'@0.00' ||'@@@';
              let wnum_linea=wnum_linea+1;
              -- Insert Into info_satn (num_linea,id_empresa,id_empleado,linea) values (wnum_linea,wid_empresa,wemp,cadNOP);

              let w_cont = w_cont + 1;
            Else
                  EXIT;
            End If;
          End While;
 
    CLOSE query_principal_cursor;
    FREE stmt_qry_principal;
    FREE query_principal_cursor;


    SYSTEM "echo unload to 'Archivo.txt' > sql01.sql";
	SYSTEM "echo select linea from info_satn order by num_linea >> sql01.sql";
    SYSTEM "dbaccess m4prod sql01.sql";
    SYSTEM "sed '1,$s/|//g' Archivo.txt > Archivo1.txt";
    SYSTEM "sed '1,$s/@/|/g' Archivo1.txt > ArchivoSAT2022.txt";

    let w_cont = w_cont - 1;
    -- Update timb_cons20 set num_consf = wnum_cons2
    -- Where empresa = wid_empresa and fec_pago = wfec_pago and fec_crea = wfec_pagox and descripcion = w_NomDes and num_cons = wnum_consi;

    return 'Informe --> ' || w_NomDes || '; ' || w_TipCont || '; ' ||w_Period || '; ' ||w_TipNom || '.'with resume;
End Procedure;