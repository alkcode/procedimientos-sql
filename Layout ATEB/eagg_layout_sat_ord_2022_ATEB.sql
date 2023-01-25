drop procedure if exists eagg_layout_sat_ord_2022_ATEB_dinamico;
create procedure eagg_layout_sat_ord_2022_ATEB_dinamico(wfec_pago date,wtipo varchar(1), wempresa varchar(2), wempleados varchar(254))
returning char(265);
-----modificado por EAGG. Programa para ISSSTE ASEGURADOR, TURISSSTE Y PENSIONISSSTE el d?a 11/01/2022
-----usa GenLinSATu.sql y GenNOHu.sql, u al final es ultima version
-----modificado para tabla cosif_timbrado_2022 el 11/01/2022
   define wi1,wi2,wi3,wi4,wi5,wi6,wi7,wi8,wi9,wi10,wi11,wi12,wi13,wi14,wi15,wi16,wi17,wi18,wi19,wi20          money(18,2);
   define wi21,wi22,wi23,wi24,wi25,wi26,wi27,wi28,wi29,wi30,wi31,wi32,wi33,wi34,wi35,wi36,wi37,wi38,wi39,wi40 money(18,2);
   define wp1,wp2,wp3,wp4,wp5,wp6,wp7,wp8,wp9,wp10,wp11,wp12,wp13,wp14,wp15,wp16,wp17,wp18,wp19,wp20          varchar(01);
   define wp21,wp22,wp23,wp24,wp25,wp26,wp27,wp28,wp29,wp30,wp31,wp32,wp33,wp34,wp35,wp36,wp37,wp38,wp39,wp40 varchar(01);
   define wc1,wc2,wc3,wc4,wc5,wc6,wc7,wc8,wc9,wc10,wc11,wc12,wc13,wc14,wc15,wc16,wc17,wc18,wc19,wc20          varchar(02);
   define wc21,wc22,wc23,wc24,wc25,wc26,wc27,wc28,wc29,wc30,wc31,wc32,wc33,wc34,wc35,wc36,wc37,wc38,wc39,wc40 varchar(02);
   define wemp varchar(10); define w_cont,wdias_lab,wdias,wconse,wnum_cons,wgrav,wconse9,wcond,wconp,wcons,wnum_linea integer;
   define wlongmal,wcaracterr,wbandera, wbandera01, wnum_cons2, wnum_consi, wnum_consv integer;
   
   define cadenaE01 char(108); define cadenaE02 char(197); define cadenaE04 char(32); define cadenaE05 char(40);
   define cadenaD01 char(239); define cadenaNOI,cadenaNOD char(163); define cadenaNOC char(47); define wkey,wtip_perc char(03);
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
   define w_NomDes, w_TipCont, w_Period, w_TipNom varchar(10,0); define w_TipCont1, w_Period1 varchar(2,0); define w_TipNom1 varchar(1,0);
   define wcp_emp varchar(10);

   define query_condicion char(2000);
   define _query_principal char(5000);
   define stmt_delete char(5000);


   Set Isolation To dirty Read;

   SET DEBUG FILE TO '2022_ATEB_ORD_layout.log';
   TRACE ON;

   let wemp=' '; let w_cont=1; let wconse=1; let wzero=0.0;

   let wfec_pagox=today;
   let wnum_linea=0;
   let w_NomDes="O";

   If Length(wempleados) = 0 Then
      let query_condicion='';
   Else
      let query_condicion = " And rfc in (" || wempleados ||") ";
      let query_condicion = TRIM(query_condicion);
   End If;
	
   

   Drop Table info_sat9;
  
   Create Table info_sat9
      (num_linea Integer,
      id_empresa Varchar(02),
      id_empleado Varchar(10),
      linea char(500)) fragment by round robin in bdbase,bdhist;
   Revoke all On info_sat9 From "public";   
   
   
      let w_TipCont = '01-TiemInd'; let w_Period = '04-Quincen'; let w_TipNom = 'O-Ordinari';
      let w_TipCont1 = '01'; let w_Period1 = '04'; let w_TipNom1 = 'O';
            
      
   Select fec_inicio,fec_fin Into wfec_inicio,wfec_fin
      From m4sys_hist_pagas Where fec_paga=wfec_pago;

   
   let wdescrip = 'PAGO DE NOMINA';
   
   
   If wfec_pago = '15/01/2018' Then
         Delete timb_cons_turissste Where fec_pago = '15/01/2019' And empresa = wempresa;
         let wnum_consi = 01;
         Insert Into timb_cons_turissste Values(wempresa,'000000',wnum_consi, 0, 00.00, wfec_pago, wfec_pagox);
   Else
         let wnum_consv = 0;
         select count(*) into wnum_consv from timb_cons_turissste 
         where fec_pago = wfec_pago and fec_crea = wfec_pagox and empresa = wempresa and descripcion = w_NomDes;         
         
         select max(num_consf) into wnum_consi from timb_cons_turissste where fec_pago >= '15/01/2019' and empresa = wempresa;

         let wnum_consi = wnum_consi + 1;
         let wnum_cons2 = wnum_consi;
         insert into timb_cons_turissste values(wempresa, w_NomDes,wnum_consi, 0, wnum_consv, wfec_pago, wfec_pagox);

   End If;
      
   

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
	 
   --Foreach 
      -- let _query_principal = "Select id_empresa,rfc[1,6],num_cons,tot_net_cheque,tot_ded_cheque,tot_perc_cheque,trim(nom_emp),id_banco,cuenta,id_div_geografica, adscripcion, " ||
      --    "p1,c1,i1,p2,c2,i2,p3,c3,i3,p4,c4,i4,p5,c5,i5,p6,c6,i6,p7,c7,i7,p8,c8,i8,p9,c9,i9,p10,c10,i10, " ||
      --    "p11,c11,i11,p12,c12,i12,p13,c13,i13,p14,c14,i14,p15,c15,i15,p16,c16,i16,p17,c17,i17,p18,c18,i18,p19,c19,i19,p20,c20,i20, " ||
      --    "p21,c21,i21,p22,c22,i22,p23,c23,i23,p24,c24,i24,p25,c25,i25,p26,c26,i26,p27,c27,i27,p28,c28,i28,p29,c29,i29,p30,c30,i30, " ||
      --    "p31,c31,i31,p32,c32,i32,p33,c33,i33,p34,c34,i34,p35,c35,i35,p36,c36,i36,p37,c37,i37,p38,c38,i38,p39,c39,i39,p40,c40,i40 " ||
      --    "From eagg_cosif_timbrado_2022 " ||
      --    "Where fec_pago = '" || wfec_pago || "' " ||
      --       "And id_empresa = '" || wempresa || "' " ||
      --       "And tipo = '" || wtipo || "' " || query_condicion || " " ||
      --       "Order By 2 ";
      
      let _query_principal = "Select " ||
         "id_empresa,rfc[1,6],num_cons,tot_net_cheque,tot_ded_cheque,tot_perc_cheque,trim(nom_emp),id_banco,cuenta,id_div_geografica, adscripcion, " ||
         "p1,c1,i1,p2,c2,i2,p3,c3,i3, " ||
         "p4,c4,i4,p5,c5,i5,p6,c6,i6,p7,c7,i7,p8,c8,i8,p9,c9,i9,p10,c10,i10, " ||
         "p11,c11,i11,p12,c12,i12,p13,c13,i13,p14,c14,i14, " ||
         "p15,c15,i15,p16,c16,i16,p17,c17,i17,p18,c18,i18,p19,c19,i19,p20,c20,i20, " ||
         "p21,c21,i21,p22,c22,i22,p23,c23,i23,p24,c24,i24,p25,c25,i25,p26,c26,i26,p27,c27,i27,p28,c28,i28,p29,c29,i29,p30,c30,i30, " ||
         "p31,c31,i31,p32,c32,i32,p33,c33,i33,p34,c34,i34,p35,c35,i35,p36,c36,i36,p37,c37,i37,p38,c38,i38,p39,c39,i39,p40,c40,i40, " ||
         "trim(id_c_u_r_p_st),numero_ss,trim(id_legal), " ||
	      "nvl(trim(apellido_1),' ')||' '||nvl(trim(apellido_2),' ')||' '||nvl(trim(nombre),' '),nvl(trim(codigo_postal),' ')CP, NVL(pagaduria, 'ERROR') pagaduria, " ||
	      "Case " ||
         "  When cp Is Null And C.id_empresa = '01' Then '06080' " ||
         "  When cp Is Null And C.id_empresa = '03' Then '06030' " ||
         "  When cp Is Null And C.id_empresa = '05' Then '01010' " ||
         "Else cp " ||
         "End cp " ||
         "From eagg_cosif_timbrado_2022 C " ||
         "  Left Outer Join m4t_empleados E " ||
         "     On C.rfc = E.id_empleado " ||
         "  Left Outer Join ramo_ct_tim R " ||
         "     On C.adscripcion = R.ct10 " ||
         "  Left Join m4t_domicilios_issste D " ||
         "     On D.id_centro_pago = R.pagaduria " ||
         " Where fec_pago = '" || wfec_pago || "' " ||
         "  And id_empresa = '" || wempresa || "' " ||
         "  And tipo = '" || wtipo || "' " || query_condicion || " " ||
         "  Order By 2 ";

      let _query_principal = TRIM(_query_principal);
      Prepare stmt_qry_principal From _query_principal;
      Declare query_principal_cursor Cursor FOR stmt_qry_principal;
      Open query_principal_cursor;

      While( 1 = 1 )

         On EXCEPTION Set error_num
	         Return 'error en  ---> ' || w_cont||' '||wemp||' '||error_num  With Resume;
	         let wnum_linea = wnum_linea + 1;
	         Insert Into info_sat9 (num_linea,id_empresa,id_empleado,linea) 
	         Values (wnum_linea,wid_empresa,wemp,'Error-'||desc_err||':'||error_num|| '-emp:'||wemp||'-Cons:'||wnum_cons2);
         End EXCEPTION With Resume;

         Fetch query_principal_cursor
         Into wid_empresa,wemp,wfolio,wliquido,wdeduc,wperc,wnombre,wbanco,wcuenta,wdivgeo,wadscripcion,
            wp1,wc1,wi1,wp2,wc2,wi2,wp3,wc3,wi3,wp4,wc4,wi4,wp5,wc5,wi5,wp6,wc6,wi6,wp7,wc7,wi7,wp8,wc8,wi8,wp9,wc9,wi9,wp10,wc10,wi10,
            wp11,wc11,wi11,wp12,wc12,wi12,wp13,wc13,wi13,wp14,wc14,wi14,wp15,wc15,wi15,wp16,wc16,wi16,wp17,wc17,wi17,wp18,wc18,wi18,wp19,wc19,wi19,wp20,wc20,wi20,
            wp21,wc21,wi21,wp22,wc22,wi22,wp23,wc23,wi23,wp24,wc24,wi24,wp25,wc25,wi25,wp26,wc26,wi26,wp27,wc27,wi27,wp28,wc28,wi28,wp29,wc29,wi29,wp30,wc30,wi30,
            wp31,wc31,wi31,wp32,wc32,wi32,wp33,wc33,wi33,wp34,wc34,wi34,wp35,wc35,wi35,wp36,wc36,wi36,wp37,wc37,wi37,wp38,wc38,wi38,wp39,wc39,wi39,wp40,wc40,wi40,
            wcurp,wnumero_ss,wid_legal,wnombre2,wcp_emp, wpagaduria, wcp;
         
         If (SQLCODE != 100) Then
                        
            -- Select trim(id_c_u_r_p_st),numero_ss,trim(id_legal),
            --    nvl(trim(apellido_1),' ')||' '||nvl(trim(apellido_2),' ')||' '||nvl(trim(nombre),' '),nvl(trim(codigo_postal),' ')
            --    Into wcurp,wnumero_ss,wid_legal,wnombre2,wcp_emp
            --    From m4t_empleados
            --    Where id_sociedad = id_sociedad
            --       And id_empleado = wemp;

            If (wcp_emp Is null) Or (Length(wcp_emp) != 5) Then 
               let wcp_emp = 'SINCP'; 
            End If;
            
            Return 'llevo lay---> ' || w_cont||' '||wemp  With Resume;
               
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
            Else If wc40='53' Then let wispt=wi40; end if; end if; end if; end if; end if; end if; end if; end if; end if; end if; end if; 
            end if; end if; end if; end if; end if; end if; end if; end if; end if; end if; end if; end if; end if; end if; end if; end if; 
            end if; end if; end if; end if; end if; end if; end if; end if; end if; end if; end if; end if; end if;

         
            If wispt < 0 Then
               let wispt = 0;
            End If
         
         
            If wi1 < 0 Then let wperc = wperc - wi1; let wdeduc = wdeduc - wi1;  End If;
            If wi2 < 0 Then let wperc = wperc - wi2; let wdeduc = wdeduc - wi2;  End If;
            If wi3 < 0 Then let wperc = wperc - wi3; let wdeduc = wdeduc - wi3;  End If;
            If wi4 < 0 Then let wperc = wperc - wi4; let wdeduc = wdeduc - wi4;  End If;
            If wi5 < 0 Then let wperc = wperc - wi5; let wdeduc = wdeduc - wi5;  End If;
            If wi6 < 0 Then let wperc = wperc - wi6; let wdeduc = wdeduc - wi6;  End If;
            If wi7 < 0 Then let wperc = wperc - wi7; let wdeduc = wdeduc - wi7;  End If;
            If wi8 < 0 Then let wperc = wperc - wi8; let wdeduc = wdeduc - wi8;  End If;
            If wi9 < 0 Then let wperc = wperc - wi9; let wdeduc = wdeduc - wi9;  End If;
            If wi10 < 0 Then let wperc = wperc - wi10; let wdeduc = wdeduc - wi10;  End If;
            If wi11 < 0 Then let wperc = wperc - wi11; let wdeduc = wdeduc - wi11;  End If;
            If wi12 < 0 Then let wperc = wperc - wi12; let wdeduc = wdeduc - wi12;  End If;
            If wi13 < 0 Then let wperc = wperc - wi13; let wdeduc = wdeduc - wi13;  End If;
            If wi14 < 0 Then let wperc = wperc - wi14; let wdeduc = wdeduc - wi14;  End If;
            If wi15 < 0 Then let wperc = wperc - wi15; let wdeduc = wdeduc - wi15;  End If;
            If wi16 < 0 Then let wperc = wperc - wi16; let wdeduc = wdeduc - wi16;  End If;
            If wi17 < 0 Then let wperc = wperc - wi17; let wdeduc = wdeduc - wi17;  End If;
            If wi18 < 0 Then let wperc = wperc - wi18; let wdeduc = wdeduc - wi18;  End If;
            If wi19 < 0 Then let wperc = wperc - wi19; let wdeduc = wdeduc - wi19;  End If;
            If wi20 < 0 Then let wperc = wperc - wi20; let wdeduc = wdeduc - wi20;  End If;
            If wi21 < 0 Then let wperc = wperc - wi21; let wdeduc = wdeduc - wi21;  End If;
            If wi22 < 0 Then let wperc = wperc - wi22; let wdeduc = wdeduc - wi22;  End If;
            If wi23 < 0 Then let wperc = wperc - wi23; let wdeduc = wdeduc - wi23;  End If;
            If wi24 < 0 Then let wperc = wperc - wi24; let wdeduc = wdeduc - wi24;  End If;
            If wi25 < 0 Then let wperc = wperc - wi25; let wdeduc = wdeduc - wi25;  End If;
            If wi26 < 0 Then let wperc = wperc - wi26; let wdeduc = wdeduc - wi26;  End If;
            If wi27 < 0 Then let wperc = wperc - wi27; let wdeduc = wdeduc - wi27;  End If;
            If wi28 < 0 Then let wperc = wperc - wi28; let wdeduc = wdeduc - wi28;  End If;
            If wi29 < 0 Then let wperc = wperc - wi29; let wdeduc = wdeduc - wi29;  End If;
            If wi30 < 0 Then let wperc = wperc - wi30; let wdeduc = wdeduc - wi30;  End If;
            If wi31 < 0 Then let wperc = wperc - wi31; let wdeduc = wdeduc - wi31;  End If;
            If wi32 < 0 Then let wperc = wperc - wi32; let wdeduc = wdeduc - wi32;  End If;
            If wi33 < 0 Then let wperc = wperc - wi33; let wdeduc = wdeduc - wi33;  End If;
            If wi34 < 0 Then let wperc = wperc - wi34; let wdeduc = wdeduc - wi34;  End If;
            If wi35 < 0 Then let wperc = wperc - wi35; let wdeduc = wdeduc - wi35;  End If;
            If wi36 < 0 Then let wperc = wperc - wi36; let wdeduc = wdeduc - wi36;  End If;
            If wi37 < 0 Then let wperc = wperc - wi37; let wdeduc = wdeduc - wi37;  End If;
            If wi38 < 0 Then let wperc = wperc - wi38; let wdeduc = wdeduc - wi38;  End If;
            If wi39 < 0 Then let wperc = wperc - wi39; let wdeduc = wdeduc - wi39;  End If;
            If wi40 < 0 Then let wperc = wperc - wi40; let wdeduc = wdeduc - wi40;  End If;
         

         
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
            

            if flg1 = 0 then 
               if (wc1='09' and wc2='Y1') or (wc1='14' and wc2='Y2') or (wc1='18' and wc2='Y3') then let flg1 = 3; else let flg1 = 0; end if; end if;
            if flg2 = 0 then
               if (wc2='09' and wc3='Y1') or (wc2='14' and wc3='Y2') or (wc2='18' and wc3='Y3') then let flg2 = 3; else let flg2 = 0; end if; end if;
            if flg3 = 0 then
               if (wc3='09' and wc4='Y1') or (wc3='14' and wc4='Y2') or (wc3='18' and wc4='Y3') then let flg3 = 3; else let flg3 = 0; end if; end if;
            if flg4 = 0 then
               if (wc4='09' and wc5='Y1') or (wc4='14' and wc5='Y2') or (wc4='18' and wc5='Y3') then let flg4 = 3; else let flg4 = 0; end if; end if;
            if flg5 = 0 then
               if (wc5='09' and wc6='Y1') or (wc5='14' and wc6='Y2') or (wc5='18' and wc6='Y3') then let flg5 = 3; else let flg5 = 0; end if; end if;
            if flg6 = 0 then
               if (wc6='09' and wc7='Y1') or (wc6='14' and wc7='Y2') or (wc6='18' and wc7='Y3') then let flg6 = 3; else let flg6 = 0; end if; end if;
            if flg7 = 0 then
               if (wc7='09' and wc8='Y1') or (wc7='14' and wc8='Y2') or (wc7='18' and wc8='Y3') then let flg7 = 3; else let flg7 = 0; end if; end if;
            if flg8 = 0 then
               if (wc8='09' and wc9='Y1') or (wc8='14' and wc9='Y2') or (wc8='18' and wc9='Y3') then let flg8 = 3; else let flg8 = 0; end if; end if;
            if flg9 = 0 then
               if (wc9='09' and wc10='Y1') or (wc9='14' and wc10='Y2') or (wc9='18' and wc10='Y3') then let flg9 = 3; else let flg9 = 0; end if; end if;
            if flg10 = 0 then
               if (wc10='09' and wc11='Y1') or (wc10='14' and wc11='Y2') or (wc10='18' and wc11='Y3') then let flg10 = 3; else let flg10 = 0; end if; end if;
            if flg11 = 0 then
               if (wc11='09' and wc12='Y1') or (wc11='14' and wc12='Y2') or (wc11='18' and wc12='Y3') then let flg11 = 3; else let flg11 = 0; end if; end if;
            if flg12 = 0 then
               if (wc12='09' and wc13='Y1') or (wc12='14' and wc13='Y2') or (wc12='18' and wc13='Y3') then let flg12 = 3; else let flg12 = 0; end if; end if;
            if flg13 = 0 then
               if (wc13='09' and wc14='Y1') or (wc13='14' and wc14='Y2') or (wc13='18' and wc14='Y3') then let flg13 = 3; else let flg13 = 0; end if; end if;
            if flg14 = 0 then
               if (wc14='09' and wc15='Y1') or (wc14='14' and wc15='Y2') or (wc14='18' and wc15='Y3') then let flg14 = 3; else let flg14 = 0; end if; end if;
            if flg15 = 0 then
               if (wc15='09' and wc16='Y1') or (wc15='14' and wc16='Y2') or (wc15='18' and wc16='Y3') then  let flg15 = 3; else let flg15 = 0; end if; end if;
            if flg16 = 0 then
               if (wc16='09' and wc17='Y1') or (wc16='14' and wc17='Y2') or (wc16='18' and wc17='Y3') then  let flg16 = 3; else let flg16 = 0; end if; end if;
            if flg17 = 0 then
               if (wc17='09' and wc18='Y1') or (wc17='14' and wc18='Y2') or (wc17='18' and wc18='Y3') then  let flg17 = 3; else let flg17 = 0; end if; end if;
            if flg18 = 0 then
               if (wc18='09' and wc19='Y1') or (wc18='14' and wc19='Y2') or (wc18='18' and wc19='Y3') then  let flg18 = 3; else let flg18 = 0; end if; end if;
            if flg19 = 0 then
               if (wc19='09' and wc20='Y1') or (wc19='14' and wc20='Y2') or (wc19='18' and wc20='Y3') then  let flg19 = 3; else let flg19 = 0; end if; end if;
            if flg20 = 0 then
               if (wc20='09' and wc21='Y1') or (wc20='14' and wc21='Y2') or (wc20='18' and wc21='Y3') then  let flg20 = 3; else let flg20 = 0; end if; end if;
            if flg21 = 0 then
               if (wc21='09' and wc22='Y1') or (wc21='14' and wc22='Y2') or (wc21='18' and wc22='Y3') then  let flg21 = 3; else let flg21 = 0; end if; end if;
            if flg22 = 0 then
               if (wc22='09' and wc23='Y1') or (wc22='14' and wc23='Y2') or (wc22='18' and wc23='Y3') then  let flg22 = 3; else let flg22 = 0; end if; end if;
            if flg23 = 0 then
               if (wc23='09' and wc24='Y1') or (wc23='14' and wc24='Y2') or (wc23='18' and wc24='Y3') then  let flg23 = 3; else let flg23 = 0; end if; end if;
            if flg24 = 0 then
               if (wc24='09' and wc25='Y1') or (wc24='14' and wc25='Y2') or (wc24='18' and wc25='Y3') then  let flg24 = 3; else let flg24 = 0; end if; end if;
            if flg25 = 0 then
               if (wc25='09' and wc26='Y1') or (wc25='14' and wc26='Y2') or (wc25='18' and wc26='Y3') then  let flg25 = 3; else let flg25 = 0; end if; end if;
            if flg26 = 0 then
               if (wc26='09' and wc27='Y1') or (wc26='14' and wc27='Y2') or (wc26='18' and wc27='Y3') then  let flg26 = 3; else let flg26 = 0; end if; end if;
            if flg27 = 0 then
               if (wc27='09' and wc28='Y1') or (wc27='14' and wc28='Y2') or (wc27='18' and wc28='Y3') then  let flg27 = 3; else let flg27 = 0; end if; end if;
            if flg28 = 0 then
               if (wc28='09' and wc29='Y1') or (wc28='14' and wc29='Y2') or (wc28='18' and wc29='Y3') then  let flg28 = 3; else let flg28 = 0; end if; end if;
            if flg29 = 0 then
               if (wc29='09' and wc30='Y1') or (wc29='14' and wc30='Y2') or (wc29='18' and wc30='Y3') then  let flg29 = 3; else let flg29 = 0; end if; end if;
            if flg30 = 0 then
               if (wc30='09' and wc31='Y1') or (wc30='14' and wc31='Y2') or (wc30='18' and wc31='Y3') then  let flg30 = 3; else let flg30 = 0; end if; end if;
            if flg31 = 0 then
               if (wc31='09' and wc32='Y1') or (wc31='14' and wc32='Y2') or (wc31='18' and wc32='Y3') then  let flg31 = 3; else let flg31 = 0; end if; end if;
            if flg32 = 0 then
               if (wc32='09' and wc33='Y1') or (wc32='14' and wc33='Y2') or (wc32='18' and wc33='Y3') then  let flg32 = 3; else let flg32 = 0; end if; end if;
            if flg33 = 0 then
               if (wc33='09' and wc34='Y1') or (wc33='14' and wc34='Y2') or (wc33='18' and wc34='Y3') then  let flg33 = 3; else let flg33 = 0; end if; end if;
            if flg34 = 0 then
               if (wc34='09' and wc35='Y1') or (wc34='14' and wc35='Y2') or (wc34='18' and wc35='Y3') then  let flg34 = 3; else let flg34 = 0; end if; end if;
            if flg35 = 0 then
               if (wc35='09' and wc36='Y1') or (wc35='14' and wc36='Y2') or (wc35='18' and wc36='Y3') then  let flg35 = 3; else let flg35 = 0; end if; end if;
            if flg36 = 0 then
               if (wc36='09' and wc37='Y1') or (wc36='14' and wc37='Y2') or (wc36='18' and wc37='Y3') then  let flg36 = 3; else let flg36 = 0; end if; end if;
            if flg37 = 0 then
               if (wc37='09' and wc38='Y1') or (wc37='14' and wc38='Y2') or (wc37='18' and wc38='Y3') then  let flg37 = 3; else let flg37 = 0; end if; end if;
            if flg38 = 0 then
               if (wc38='09' and wc39='Y1') or (wc38='14' and wc39='Y2') or (wc38='18' and wc39='Y3') then  let flg38 = 3; else let flg38 = 0; end if; end if;
            if flg39 = 0 then
               if (wc39='09' and wc40='Y1') or (wc39='14' and wc40='Y2') or (wc39='18' and wc40='Y3') then  let flg39 = 3; else let flg39 = 0; end if; end if;
            if flg40 = 0 then
               if (wc40='09') or (wc40='14') or (wc40='18') then let flg40 = 0; end if;  end if;   


            let desc_err = 'E01';
            
            -- let wcp = 0;

            -- If wcp = 0 Then
            --    if wempresa='01' then let wcp = '06080'; end if;
            --    if wempresa='03' then let wcp = '06030'; end if;
            --    if wempresa='05' then let wcp = '01010'; end if; 
            -- End If;

         --insert into valida_timbrado (fec_pago,id_empleado,tot_per,tot_ded,tot_net,isr,id_empresa) values (wfec_pago,wemp,wperc,wdeduc,wliquido,wispt,wid_empresa);       ----validacion de timbrado

         --let cadenaE01 = 'E01'||rpad(wnum_cons2,20,' ')||rpad(wfec_pagox,19,' ')||rpad(wperc,18,' ')||rpad(wdeduc,18,' ')||rpad(wliquido,18,' ')||rpad('NO',2,' ')||rpad('PUE',3,' ')||rpad('99',3,' ');
            let cadenaE01 = 'E01'||rpad(wnum_cons2,20,' ')||rpad(wfec_pagox,19,' ')||rpad(wperc,18,' ')||rpad(wdeduc,18,' ')||rpad('MXN',3,' ')||rpad(wliquido,18,' ')||rpad('N',2,' ')||rpad('01',2,' ')||rpad(wcp,5,' ');
                                   --Folio y serie(10 y 10) --Fecha                  --Subtotal          --Descuento          --Moneda            --Total          --Tipo de comprobante --Exportacion    --Lugar de expedicion
            let wnum_linea = wnum_linea + 1;
            insert into info_sat9 (num_linea,id_empresa,id_empleado,linea) values (wnum_linea,wid_empresa,wemp,cadenaE01);


            If (wnumero_ss[1,2] = '  ' or wnumero_ss is null) then
               Select nss into wnumero_ss from m4_inf_bmex
               Where id_empleado = wemp and u_version = 'I';

            End If;
                  
            If length(wcurp) != 18 then
               select curp into wcurp from m4_inf_bmex
               where id_empleado = wemp and u_version = 'I';

            End If;

            If length(wid_legal) != 13 then
               Select filiacion into wid_legal from m4_inf_bmex
               Where id_empleado = wemp and u_version = 'I';

            End if;
                  
            If Length(wcurp) != 18 Then
               let wcurp = "ERROR_CURP";
            End If;
                     
            If length(wid_legal) != 13 then    	      
               let wid_legal = "ERROR_RFC";
            End if;
                  
                  
            let wlongmal = 0; let wcaracterr = 0;
         
            Select count(*) Into wlongmal From m4t_empleados 
               Where id_sociedad=id_sociedad And id_empleado=wemp And Length(id_c_u_r_p_st)!= 18;
            Select count(*) Into wcaracterr From m4t_empleados 
               Where id_sociedad=id_sociedad And id_empleado=wemp And id_c_u_r_p_st matches'*?*'; --Si
         
            If (wcurp[1,2] = '  ' Or wcurp Is Null Or wlongmal = 1 Or wcaracterr = 1) Then let wcurp = ' '; End If;
            If (wnumero_ss[1,2] = '  ' Or wnumero_ss is null) then let wnumero_ss = '99999999999'; End If;
            If (wnombre[1] = ' ' Or wnombre Is Null Or wnombre[1] = '') Then let wnombre = wnombre2; End If;
            If (wnombre Like '%  %') Then let wnombre = wnombre2; End If;


         
            let wnum_linea = wnum_linea + 1;

            --let cadenaE02 = 'E02'||rpad(wemp,20,' ')||rpad(wid_legal,13,' ')||rpad(trim(wnombre),150,' ')||'@';
                                   --No. empleado     --RFC                   --Nombre               --DomicilioFiscalReceptor  --RegimenFiscalReceptor
            let cadenaE02 = 'E02'||rpad(wemp,20,' ')||rpad(wid_legal,13,' ')||rpad(trim(wnombre),150,' ')||rpad(wcp_emp,5,' ')||rpad('605',3,' ')||'@';
            Insert Into info_sat9 (num_linea,id_empresa,id_empleado,linea) Values (wnum_linea,wid_empresa,wemp,cadenaE02);
            
            

            -- Select pagaduria Into wpagaduria
            --    From ramo_ct_ok Where ct10 = wadscripcion;       
            -- If wpagaduria Is Null Then let wpagaduria = 'ERROR'; End If;
            
            Select cp Into wcp 
               From m4t_domicilios_issste Where id_centro_pago = wpagaduria;
               
            If wcp Is Null Then
               If wempresa='01' Then let wcp = '06080'; End If;
               If wempresa='03' Then let wcp = '06030'; End If;
               If wempresa='05' Then let wcp = '01010'; End If; 
            End If;
            
            
            let wnum_linea = wnum_linea + 1;
            Insert Into info_sat9 (num_linea,id_empresa,id_empleado,linea) Values (wnum_linea,wid_empresa,wemp,cadE03a||cadE03b||rpad(wcp,5,' ')||'@');

                                 --Retencion         Impuesto
            let cadenaE04='E04'||rpad(wispt,14,' ')||rpad(wzero,14,' ')||'@';
            let wnum_linea=wnum_linea+1;
            Insert Into info_sat9 (num_linea,id_empresa,id_empleado,linea) values (wnum_linea,wid_empresa,wemp,cadenaE04);

            Select porcent Into wporcent From porc_emp Where id_empleado=wemp;

                           --IdentificacionImpuesto --MontoImpuesto     --PorcentajeImpuesto --TipoImpuesto
            let cadenaE05='E05'||rpad('001',5,' ')||rpad(wispt,14,' ')||lpad(wporcent,14,'0')||rpad('Si',3,' ')||'@';
            let wnum_linea=wnum_linea+1;
            Insert Into info_sat9 (num_linea,id_empresa,id_empleado,linea) Values (wnum_linea,wid_empresa,wemp,cadenaE05);
                               --Moneda                 --TipoCambio     --CustomField15            
            let cadEA1a='EA1'||rpad('MXN',3,' ')||'  '||rpad('1',14,' ');
            let cadEA1b=rpad(' ',256,' ')||'@';
            let wnum_linea=wnum_linea+1;
            Insert Into info_sat9 (num_linea,id_empresa,id_empleado,linea) Values (wnum_linea,wid_empresa,wemp,cadEA1a||cadEA1b);

            --let cadenaD01='D01'||rpad(' ',14,' ')||rpad('ACT',8,' ')||rpad(' ',20,' ')||rpad(' ',20,' ')||rpad(trim(wdescrip),150,' ')||rpad(wperc,14,' ')||'@';
                                 --Cantidad        --ClaveProdServ    --Descripcion     --Precio          --Monto                       --Descuento         --ObjetoImp
            let cadenaD01='D01'||rpad(' ',14,' ')||rpad('ACT',8,' ')||rpad(' ',20,' ')||rpad(' ',20,' ')||rpad(trim(wdescrip),150,' ')||rpad(wperc,14,' ')||rpad('01',2,' ')||'@';
            let wnum_linea=wnum_linea+1;
            Insert Into info_sat9 (num_linea,id_empresa,id_empleado,linea) Values (wnum_linea,wid_empresa,wemp,cadenaD01);

            let wfec_iniciox=wfec_inicio; let wfec_finx=wfec_fin;
            
            If wempresa <> "02" Then
                let desc_err = 'NOE inf_rl01';

               Select count(*) into wbandera01
               From m4t_acumulado_rl1_2011 a, m4t_acumulado_rl_2011 b 
               Where a.id_empleado = wemp 
                  And a.fec_pago = wfec_pago 
                  And a.id_empresa = wempresa
                  And a.fec_pago = a.fec_imputacion And a.id_empleado = b.id_empleado and a.fec_pago = b.fec_pago and a.fec_imputacion = b.fec_imputacion;
               
               If wbandera01 = 1 Then     
                  let desc_err = 'NOE inf_rl102';
                  select a.c_sindic_local, a.c_sindic_nacion, a.d_antig_gob_fed, b.fecha_ingreso_st
                  into wsindl, wsindn, wdiaantig, wfec_alta
                  from m4t_acumulado_rl1_2011 a, m4t_acumulado_rl_2011 b 
                  where a.id_empleado = wemp and a.fec_pago = wfec_pago and a.fec_pago = a.fec_imputacion and a.id_empresa = wempresa
                  and a.id_empleado = b.id_empleado and a.fec_pago = b.fec_pago and a.fec_imputacion = b.fec_imputacion;
               
               Else
                  let wdiaantig = "999";
                  let wsindl = "999";
                  let wsindn = "999";
                  let wfec_alta = "07/06/1971";
            
                  Select max(a.fec_imputacion) Into wfec_impu
                  From m4t_acumulado_rl1_2011 a, m4t_acumulado_rl_2011 b 
                  Where a.id_empleado = wemp 
                  And a.fec_pago = wfec_pago 
                  And a.id_empresa = wempresa
                  And a.id_empleado = b.id_empleado and a.fec_pago = b.fec_pago and a.fec_imputacion = b.fec_imputacion;
            
                  Select a.c_sindic_local, a.c_sindic_nacion, a.d_antig_gob_fed, b.fecha_ingreso_st
                  Into wsindl, wsindn, wdiaantig, wfec_alta
                  From m4t_acumulado_rl1_2011 a, m4t_acumulado_rl_2011 b 
                  Where a.id_empleado = wemp 
                     And a.fec_pago = wfec_pago 
                     And a.fec_imputacion = wfec_impu 
                     And a.id_empresa = wempresa
                     And a.id_empleado = b.id_empleado And a.fec_pago = b.fec_pago And a.fec_imputacion = b.fec_imputacion;
            
                  let desc_err = 'NOE acum_rl03';
         
                  If wfec_impu Is Null Then
                  
                     let desc_err = 'NOE acum_rl04';
                     Return 'error en  ---> ' || wfec_impu||'fec_alta2'  With Resume;
                     let wdiaantig = "999";
                     let wsindl = "999";
                     let wsindn = "999";
                     let wfec_alta = "07/06/1971";
                  
                  End If;
            End if;
      
            let desc_err = 'NOE fec_alta';
            let wsindl_c = 'No';
            let wfec_alta2 = wfec_alta;

            if wsindl > 0 then let wsindl_c = 'S?'; end if; --Si
            if wsindn > 0 then let wsindl_c = 'S?'; end if; --Si
      
         Else

            let desc_err = 'NOE inf_rl1_02';
            let wdiaantig = 100;
            let wfec_alta2 = wfec_pago;
            let wsindl_c = 'No';

         End If;
      
         let desc_err = "NOE Estado";
         select c_estado into westado_c from c_estado where id_div_geografica = wdivgeo; 
         
         
         If wempresa <> "02" Then

            Select count(*) Into wbandera01 From m4t_datos_pago Where id_empleado = wemp;
            If wbandera01 = 1 Then
               let desc_err = "NOE DatosPago";

               Select id_forma_pago,id_banco,num_cuenta Into wforpago, wbanco, wcuenta From m4t_datos_pago Where id_empleado = wemp;

               If wcuenta = '' Or wcuenta Is Null Then
                  let wcuenta = "99999999999";
               End If;
            Else
               let wbanco = "ERROR BANCO";
               let wcuenta = "ERROR CUENTA";
            End If

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

         
         
            let desc_err = "NOE DatosPago06";
            let desc_err = "NOE Arma"||"-"||wforpago||"-"||wbanco||"-"||wcuenta;
                                 --NumEmpleado      --CURP              --TipoRegimen     --NumSeguroSocial        --FechaPago             --FechaInicialPago         --FechaFinalPago         --NumDiasPagados   --Departamento     --CuentaBancaria      --Banco            --FechaInicioRelLaboral        --Antiguedad
            let cadNOEa= 'NOE' ||rpad(wemp,15,' ')||rpad(wcurp,18,' ')||rpad('02',3,' ')||rpad(wnumero_ss,15,' ')||rpad(wfec_finx,10,' ')||rpad(wfec_iniciox,10,' ')||rpad(wfec_finx,10,' ')||lpad(wdias,18,'0')||rpad(' ',100,' ')||rpad(wcuenta,18,' ')||rpad(wbanco_c,3,' ')||rpad(wfec_alta2,10,' ')||rpad(wdiaantig,10,' ');
            let cadNOEb=rpad(' ',100,' ')||rpad(w_TipCont1,20,' ')||rpad(' ',20,' ')||rpad(w_Period1,20,' ')||rpad(' ',18,' ')||rpad('1',4,' ')||rpad(' ',18,' ')||rpad('  ',2,'  ')||rpad(wsindl_c,2,' ')||rpad(westado_c,3,' ')||'@';
                        --Puesto           --TipoContrato           TipoJornada       Periodicidad        --SalarioBaseCotApor --RiesgoPuesto  --SalarioDiarioIntegrado --TipoRecibo  --Sindicalizado       --ClaveEntFed
            let wnum_linea=wnum_linea+1;
            let desc_err = "inserta NOEa";
            insert into info_sat9 (num_linea,id_empresa,id_empleado,linea) values (wnum_linea,wid_empresa,wemp,cadNOEa||cadNOEb);
          
         
            -- let cadNO2 = 'NO2'||rpad(w_TipNom1,2,' ')||'@';
                                --TipoNomina           --TotalPercep       --TotalDed           --TotalOtrosPagos --TotalSueldos    --TotalSepInd     --TotalJubPenRet  --TotalOtrasDed   --TotalImpRet     --TotalGravado    --TotalGravado
            let cadNO2 = 'NO2'||rpad(w_TipNom1,2,' ')||rpad(wperc,18,' ')||rpad(wdeduc,18,' ')||rpad(' ',18,' ')||rpad(' ',18,' ')||rpad(' ',18,' ')||rpad(' ',18,' ')||rpad(' ',18,' ')||rpad(' ',18,' ')||rpad(' ',18,' ')||rpad(' ',18,' ')'@';

            let wnum_linea=wnum_linea+1;
            insert into info_sat9 (num_linea,id_empresa,id_empleado,linea) values (wnum_linea,wid_empresa,wemp,cadNO2);

                                --CURP            --RegistroPatronal                   --RFCPatronOrigen  --OrigenRecurso  --MontoRecursoPropio
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

                              --Consecutivo    --TipoOtroPago     --Clave             --Concepto                               --Importe            --SubsidioCausado    --SaldoAFavor        --A?o y RemanenteSalFav(4 y 18)
         let cadNOP = 'NOP' ||rpad('1',4,' ')||rpad('002',3,' ')||rpad('046',15,' ')||rpad('Subsidio para el empleo',100,' ')||rpad('0.00',18,' ')||rpad('0.00',18,' ')||rpad('0.00',18,' ')||rpad(' ',22,' ')||'@';
         let wnum_linea=wnum_linea+1;
         insert into info_sat9 (num_linea,id_empresa,id_empleado,linea) values (wnum_linea,wid_empresa,wemp,cadNOP);
         
            
         let w_cont = w_cont + 1;
      Else
         EXIT;
      End If;

   End While;
 
   CLOSE query_principal_cursor;
   FREE stmt_qry_principal;
   FREE query_principal_cursor; 
   --end foreach;
   
   update timb_cons_turissste set num_consf = wnum_cons2 
   where empresa = wid_empresa and fec_pago = wfec_pago and fec_crea = wfec_pagox and descripcion = w_NomDes and num_cons = wnum_consi;

   return 'Informe --> ' || w_NomDes || '; ' || w_TipCont || '; ' ||w_Period || '; ' ||w_TipNom || '.'with resume;   
   
   SYSTEM "echo unload to 'Archivo.txt' > sql01.sql";
   SYSTEM "echo select linea from info_sat9 order by num_linea >> sql01.sql";
   SYSTEM "dbaccess m4prod sql01.sql";

   SYSTEM "sed '1,$s/|//g' Archivo.txt > Archivo1.txt";
   SYSTEM "sed '1,$s/@//g' Archivo1.txt > ArchivoSAT_.txt";
end procedure;
