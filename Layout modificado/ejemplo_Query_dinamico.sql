DROP FUNCTION m4pr_exen_acum_fec_emp;

CREATE FUNCTION m4pr_exen_acum_fec_emp(p_fec_pag date, p_id_empleados char(1000))--, p_anio integer, p_mes integer, p_qna integer)
returning integer;
    DEFINE _fec_pago            DATE;
    DEFINE _conta               NUMERIC;
    DEFINE _qry_delete          CHAR(2000);
    DEFINE _query_condition     CHAR(2000);
    DEFINE _stmt_temp           CHAR(2000);
    DEFINE _qry_exentos         CHAR(2000);
    DEFINE _stmt_delete         CHAR(2000);
    DEFINE _stmt_exentos        CHAR(2000);
    DEFINE qry_cosif2           CHAR(2000);

    define cont integer;
    define iCont integer;
    define sValues char(1200);
    define sQuery char(3500);
    define existen integer;
    define existenAc integer;

    define w_rfc         CHAR(6);
    define w_fec_pago    DATE;
    define wid_empresa   VARCHAR(2);
    define wid_empleado  CHAR(6);
    define _tipoEmpresa  VARCHAR(2);
    define w_26 decimal(19,2);
    define w_ia decimal(19,2);
    define w_bg decimal(19,2);
    define w_be decimal(19,2);
    define eagg VARCHAR(4);

    define w_PRIMA_DOM_GRA decimal(19,2);
    define w_PRIMA_DOM_EX decimal(19,2);
    define w_HORAS_EXT_GRA decimal(19,2);
    define w_HORAS_EXT_EX decimal(19,2);
    define w_PRIMA_VAC_GRA decimal(19,2);
    define w_PRIMA_VAC_EX decimal(19,2);

    define _u_version           CHAR(1);
    define _tipo                CHAR(1);
    define _rfc                 CHAR(6);
    define _filiacion           CHAR(13);
    define _nom_emp             VARCHAR(60);
    define _qna_pago            CHAR(10);
    define _qna_proc            CHAR(10);
    define _cpto_p1             CHAR(2);
    define _tipo_p1             CHAR(20);
    define _qna_ini1            CHAR(10);
    define _qna_fin1            CHAR(10);
    define _impacum_p1          decimal(19,2);
    define _cpto_p2             CHAR(2);
    define _tipo_p2             CHAR(20);
    define _qna_ini2            CHAR(10);
    define _qna_fin2            CHAR(10);
    define _impacum_p2          decimal(19,2);
    define _cpto_p3             CHAR(2);
    define _tipo_p3             CHAR(20);
    define _qna_ini3            CHAR(10);
    define _qna_fin3            CHAR(10);
    define _impacum_p3          decimal(19,2);
    define _cpto_p4             CHAR(2);
    define _tipo_p4             CHAR(20);
    define _qna_ini4            CHAR(10);
    define _qna_fin4            CHAR(10);
    define _impacum_p4          decimal(19,2);
    define _cpto_p5             CHAR(2);
    define _tipo_p5             CHAR(20);
    define _qna_ini5            CHAR(10);
    define _qna_fin5            CHAR(10);
    define _impacum_p5          decimal(19,2);
    define _cpto_p6             CHAR(2);
    define _tipo_p6             CHAR(20);
    define _qna_ini6            CHAR(10);
    define _qna_fin6            CHAR(10);
    define _impacum_p6          decimal(19,2);
    define _cpto_p7             CHAR(2);
    define _tipo_p7             CHAR(20);
    define _qna_ini7            CHAR(10);
    define _qna_fin7            CHAR(10);
    define _impacum_p7          decimal(19,2);
    define _cpto_p8             CHAR(2);
    define _tipo_p8             CHAR(20);
    define _qna_ini8            CHAR(10);
    define _qna_fin8            CHAR(10);
    define _impacum_p8          decimal(19,2);
    define _cpto_p9             CHAR(2);
    define _tipo_p9             CHAR(20);
    define _qna_ini9            CHAR(10);
    define _qna_fin9            CHAR(10);
    define _impacum_p9          decimal(19,2);
    define _cpto_p10            CHAR(2);
    define _tipo_p10            CHAR(20);
    define _qna_ini10           CHAR(10);
    define _qna_fin10           CHAR(10);
    define _impacum_p10         decimal(19,2);
    define _cpto_p11            CHAR(2);
    define _tipo_p11            CHAR(20);
    define _qna_ini11           CHAR(10);
    define _qna_fin11           CHAR(10);
    define _impacum_p11         decimal(19,2);
    define _cpto_p12            CHAR(2);
    define _tipo_p12            CHAR(20);
    define _qna_ini12           CHAR(10);
    define _qna_fin12           CHAR(10);
    define _impacum_p12         decimal(19,2);
    define _adscripcion         CHAR(10);
    define _tot_perc_cheque     decimal(19,2);
    define _tot_ded_cheque      decimal(19,2);
    define _tot_net_cheque      decimal(19,2);
    define _num_cheque          INTEGER;
    define _cuenta              VARCHAR(18);
    define _num_clc             CHAR(14);
    define _puesto              VARCHAR(10);
    define _nivel               VARCHAR(7);
    define _sub_nivel           VARCHAR(7);
    define _jornada             VARCHAR(7);
    define _turno               VARCHAR(7);
    define _id_empresa          VARCHAR(2);
    define _id_banco            VARCHAR(10);
    define _id_tipo_tabulador   VARCHAR(2);
    define _id_forma_pago       VARCHAR(10);
    define _id_div_geografica   VARCHAR(2);
    define _num_cons            INTEGER;
    --define _fec_pago            DATE;
    define _descripcion         VARCHAR(100);
    define _aniocan             INTEGER;
    define _archivo             VARCHAR(50);
    define _memorandum          VARCHAR(100);
    define _quincena            INTEGER;
    define _mes                 INTEGER;
    define _anio                INTEGER;
    define _ord_ext             VARCHAR(2);
    define _id_area_generadora  VARCHAR(5);
    define _id_centro_pago      VARCHAR(10);
    define _id_tipo_puesto      VARCHAR(5);
    define _id_servicio         VARCHAR(5);

    define w_p1 CHAR(2);        define w_c1 CHAR(2);        define w_i1 decimal(19,2);
    define w_p2 CHAR(2);        define w_c2 CHAR(2);        define w_i2 decimal(19,2);
    define w_p3 CHAR(2);        define w_c3 CHAR(2);        define w_i3 decimal(19,2);
    define w_p4 CHAR(2);        define w_c4 CHAR(2);        define w_i4 decimal(19,2);
    define w_p5 CHAR(2);        define w_c5 CHAR(2);        define w_i5 decimal(19,2);
    define w_p6 CHAR(2);        define w_c6 CHAR(2);        define w_i6 decimal(19,2);
    define w_p7 CHAR(2);        define w_c7 CHAR(2);        define w_i7 decimal(19,2);
    define w_p8 CHAR(2);        define w_c8 CHAR(2);        define w_i8 decimal(19,2);
    define w_p9 CHAR(2);        define w_c9 CHAR(2);        define w_i9 decimal(19,2);
    define w_p10 CHAR(2);       define w_c10 CHAR(2);       define w_i10 decimal(19,2);

    define w_p11 CHAR(2);       define w_c11 CHAR(2);       define w_i11 decimal(19,2);
    define w_p12 CHAR(2);       define w_c12 CHAR(2);       define w_i12 decimal(19,2);
    define w_p13 CHAR(2);       define w_c13 CHAR(2);       define w_i13 decimal(19,2);
    define w_p14 CHAR(2);       define w_c14 CHAR(2);       define w_i14 decimal(19,2);
    define w_p15 CHAR(2);       define w_c15 CHAR(2);       define w_i15 decimal(19,2);
    define w_p16 CHAR(2);       define w_c16 CHAR(2);       define w_i16 decimal(19,2);
    define w_p17 CHAR(2);       define w_c17 CHAR(2);       define w_i17 decimal(19,2);
    define w_p18 CHAR(2);       define w_c18 CHAR(2);       define w_i18 decimal(19,2);
    define w_p19 CHAR(2);       define w_c19 CHAR(2);       define w_i19 decimal(19,2);
    define w_p20 CHAR(2);       define w_c20 CHAR(2);       define w_i20 decimal(19,2);

    define w_p21 CHAR(2);       define w_c21 CHAR(2);       define w_i21 decimal(19,2);
    define w_p22 CHAR(2);       define w_c22 CHAR(2);       define w_i22 decimal(19,2);
    define w_p23 CHAR(2);       define w_c23 CHAR(2);       define w_i23 decimal(19,2);
    define w_p24 CHAR(2);       define w_c24 CHAR(2);       define w_i24 decimal(19,2);
    define w_p25 CHAR(2);       define w_c25 CHAR(2);       define w_i25 decimal(19,2);
    define w_p26 CHAR(2);       define w_c26 CHAR(2);       define w_i26 decimal(19,2);
    define w_p27 CHAR(2);       define w_c27 CHAR(2);       define w_i27 decimal(19,2);
    define w_p28 CHAR(2);       define w_c28 CHAR(2);       define w_i28 decimal(19,2);
    define w_p29 CHAR(2);       define w_c29 CHAR(2);       define w_i29 decimal(19,2);
    define w_p30 CHAR(2);       define w_c30 CHAR(2);       define w_i30 decimal(19,2);

    define w_p31 CHAR(2);       define w_c31 CHAR(2);       define w_i31 decimal(19,2);
    define w_p32 CHAR(2);       define w_c32 CHAR(2);       define w_i32 decimal(19,2);
    define w_p33 CHAR(2);       define w_c33 CHAR(2);       define w_i33 decimal(19,2);
    define w_p34 CHAR(2);       define w_c34 CHAR(2);       define w_i34 decimal(19,2);
    define w_p35 CHAR(2);       define w_c35 CHAR(2);       define w_i35 decimal(19,2);
    define w_p36 CHAR(2);       define w_c36 CHAR(2);       define w_i36 decimal(19,2);
    define w_p37 CHAR(2);       define w_c37 CHAR(2);       define w_i37 decimal(19,2);
    define w_p38 CHAR(2);       define w_c38 CHAR(2);       define w_i38 decimal(19,2);
    define w_p39 CHAR(2);       define w_c39 CHAR(2);       define w_i39 decimal(19,2);
    define w_p40 CHAR(2);       define w_c40 CHAR(2);       define w_i40 decimal(19,2);

    --SET DEBUG FILE TO 'exen_acum.trace';
    --trace on;

    let cont = 0;
    let existen = 0;
    let existenAc = 0;

    Let _conta = 0;
    Let _query_condition = "";
    Let _qry_exentos = "";

    BEGIN

      If (LENGTH(p_id_empleados) > 0) then
        Let _query_condition = _query_condition || " And id_empleado IN ( " || p_id_empleados || ") ";
      End If;

      Let _query_condition = TRIM(_query_condition);

      Let _stmt_delete = "Delete From m4t_cptos_parcialm_exen" ||
        " Where fec_pago IN ( " ||
        "   Select Distinct fec_pago " ||
        "   From cosif_prueba2 " ||
        "   Where fec_pago= " || p_fec_pag ||
        "     And tipo IN ('0', '1') " ||
        "     And id_empresa <> '02' " ||
        "     And (c1 in ('09','14','18') Or  c2  in ('09','14','18') Or  c3  in ('09','14','18') Or  c4  in ('09','14','18') " ||
        "         Or  c5  in ('09','14','18') Or  c6  in ('09','14','18') Or  c7  in ('09','14','18') Or  c8  in ('09','14','18') " ||
        "         Or  c9  in ('09','14','18') Or  c10 in ('09','14','18') Or  c11 in ('09','14','18') Or  c12 in ('09','14','18') " ||
        "         Or  c13 in ('09','14','18') Or  c14 in ('09','14','18') Or  c15 in ('09','14','18') Or  c16 in ('09','14','18') " ||
        "         Or  c17 in ('09','14','18') Or  c18 in ('09','14','18') Or  c19 in ('09','14','18') Or  c20 in ('09','14','18') " ||
        "         Or  c21 in ('09','14','18') Or  c22 in ('09','14','18') Or  c23 in ('09','14','18') Or  c24 in ('09','14','18') " ||
        "         Or  c25 in ('09','14','18') Or  c26 in ('09','14','18') Or  c27 in ('09','14','18') Or  c28 in ('09','14','18') " ||
        "         Or  c29 in ('09','14','18') Or  c30 in ('09','14','18') Or  c31 in ('09','14','18') Or  c32 in ('09','14','18') " ||
        "         Or  c33 in ('09','14','18') Or  c34 in ('09','14','18') Or  c35 in ('09','14','18') Or  c36 in ('09','14','18') " ||
        "         Or  c37 in ('09','14','18') Or  c38 in ('09','14','18') Or  c39 in ('09','14','18') Or  c40 in ('09','14','18') " ||
        "      ) " ||
        ") " || _query_condition;

        LET _stmt_delete = TRIM(_stmt_delete);
        execute immediate _stmt_delete;


      Let _stmt_temp = "Select Distinct rfc, fec_pago" ||
        " From cosif_prueba2 " ||
        " Where fec_pago= " || p_fec_pag ||
        "   And tipo IN ('0', '1') " ||
        "   And id_empresa <> '02' " ||
        "   And (c1 in ('09','14','18') Or  c2  in ('09','14','18') Or  c3  in ('09','14','18') Or  c4  in ('09','14','18') " ||
        "       Or  c5  in ('09','14','18') Or  c6  in ('09','14','18') Or  c7  in ('09','14','18') Or  c8  in ('09','14','18') " ||
        "       Or  c9  in ('09','14','18') Or  c10 in ('09','14','18') Or  c11 in ('09','14','18') Or  c12 in ('09','14','18') " ||
        "       Or  c13 in ('09','14','18') Or  c14 in ('09','14','18') Or  c15 in ('09','14','18') Or  c16 in ('09','14','18') " ||
        "       Or  c17 in ('09','14','18') Or  c18 in ('09','14','18') Or  c19 in ('09','14','18') Or  c20 in ('09','14','18') " ||
        "       Or  c21 in ('09','14','18') Or  c22 in ('09','14','18') Or  c23 in ('09','14','18') Or  c24 in ('09','14','18') " ||
        "       Or  c25 in ('09','14','18') Or  c26 in ('09','14','18') Or  c27 in ('09','14','18') Or  c28 in ('09','14','18') " ||
        "       Or  c29 in ('09','14','18') Or  c30 in ('09','14','18') Or  c31 in ('09','14','18') Or  c32 in ('09','14','18') " ||
        "       Or  c33 in ('09','14','18') Or  c34 in ('09','14','18') Or  c35 in ('09','14','18') Or  c36 in ('09','14','18') " ||
        "       Or  c37 in ('09','14','18') Or  c38 in ('09','14','18') Or  c39 in ('09','14','18') Or  c40 in ('09','14','18') " ||
        "   ) " || _query_condition ||
        " Into Temp emp_parcialm_exen";

        LET _stmt_temp = TRIM(_stmt_temp);
        execute immediate _stmt_temp;

        Let _stmt_exentos = "INSERT INTO m4t_cptos_parcialm_exen " ||
                            "SELECT " ||
                            "    rl.id_empleado id_empleado, RL.FEC_PAGO, " ||
                            "    ROUND(SUM(RL1.PRIMA_DOM_GRA),2) PRIMA_DOM_GRA, " ||
                            "    TRUNC(SUM(RL1.PRIMA_DOM_GRA)+SUM(RL1.PRIMA_DOM_EX),2) - ROUND(SUM(RL1.PRIMA_DOM_GRA),2) PRIMA_DOM_EX, " ||
                            "    ROUND(SUM(RL1.IMP_HEXT_DOB - RL.GRAV_HRS_EXT_ST),2) HORAS_EXT_GRA, " ||
                            "    TRUNC(SUM(RL1.IMP_HEXT_DOB - RL.GRAV_HRS_EXT_ST) + SUM(RL.GRAV_HRS_EXT_ST),2) - ROUND(SUM(RL1.IMP_HEXT_DOB - RL.GRAV_HRS_EXT_ST),2) HORAS_EXT_EX, " ||
                            "    ROUND(SUM(RL1.GRAVA_VAC_ST - RL1.exento_utilidad),2) PRIMA_VAC_GRA, " ||
                            "    TRUNC(SUM(RL1.GRAVA_VAC_ST - RL1.exento_utilidad)+SUM(RL1.exento_utilidad), 2) - ROUND(SUM(RL1.GRAVA_VAC_ST - RL1.exento_utilidad),2) PRIMA_VAC_EX " ||
                            "FROM m4t_acumulado_rl_2011 RL " ||
                            "inner join m4t_acumulado_rl1_2011 RL1 on " ||
                            "      RL.ID_SOCIEDAD       = RL1.ID_SOCIEDAD        AND " ||
                            "      RL.ID_EMPLEADO       = RL1.ID_EMPLEADO        AND " ||
                            "      RL.FEC_ALTA_EMPLEADO = RL1.FEC_ALTA_EMPLEADO  AND " ||
                            "      RL.FEC_IMPUTACION    = RL1.FEC_IMPUTACION     AND " ||
                            "      RL.FEC_PAGO          = RL1.FEC_PAGO           AND " ||
                            "      RL1.ID_EMPRESA       <> '02' " ||
                            "WHERE " ||
                            "Exists ( " ||
                            "  Select 1 " ||
                            "  from emp_parcialm_exen PE " ||
                            "  Where RL.fec_pago = PE.fec_pago " ||
                            "      And RL.id_empleado = PE.rfc " ||
                            ") " || _query_condition ||
                            " GROUP BY RL.ID_EMPLEADO, RL.FEC_PAGO";

        LET _stmt_exentos = TRIM(_stmt_exentos);
        execute immediate _stmt_exentos;

        LET _stmt_delete = "Delete m4t_cosif_timbrado Where fec_pago = " || p_fec_pag || _query_condition;
        LET _stmt_delete = TRIM(_stmt_delete);
        execute immediate _stmt_delete;

        Let _stmt_exentos = "Insert Into m4t_cosif_timbrado " ||
                            "Select *, '', '', '' From cosif_prueba2 " ||
                            "Where fec_pago = " || p_fec_pag ||
                            "And tipo IN ('0', '1') " ||
                            "And id_empresa <> '02' " || _query_condition;


        LET qry_cosif2 = "Select " ||
                           "cp2.u_version,cp2.tipo,cp2.rfc,cp2.filiacion,cp2.nom_emp,cp2.qna_pago,cp2.qna_proc, " ||
                           "cp2.cpto_p1,cp2.tipo_p1,cp2.qna_ini1,cp2.qna_fin1,cp2.impacum_p1, " ||
                           "cp2.cpto_p2,cp2.tipo_p2,cp2.qna_ini2,cp2.qna_fin2,cp2.impacum_p2, " ||
                           "cp2.cpto_p3,cp2.tipo_p3,cp2.qna_ini3,cp2.qna_fin3,cp2.impacum_p3, " ||
                           "cp2.cpto_p4,cp2.tipo_p4,cp2.qna_ini4,cp2.qna_fin4,cp2.impacum_p4, " ||
                           "cp2.cpto_p5,cp2.tipo_p5,cp2.qna_ini5,cp2.qna_fin5,cp2.impacum_p5, " ||
                           "cp2.cpto_p6,cp2.tipo_p6,cp2.qna_ini6,cp2.qna_fin6,cp2.impacum_p6, " ||
                           "cp2.cpto_p7,cp2.tipo_p7,cp2.qna_ini7,cp2.qna_fin7,cp2.impacum_p7, " ||
                           "cp2.cpto_p8,cp2.tipo_p8,cp2.qna_ini8,cp2.qna_fin8,cp2.impacum_p8, " ||
                           "cp2.cpto_p9,cp2.tipo_p9,cp2.qna_ini9,cp2.qna_fin9,cp2.impacum_p9, " ||
                           "cp2.cpto_p10,cp2.tipo_p10,cp2.qna_ini10,cp2.qna_fin10,cp2.impacum_p10, " ||
                           "cp2.cpto_p11,cp2.tipo_p11,cp2.qna_ini11,cp2.qna_fin11,cp2.impacum_p11, " ||
                           "cp2.cpto_p12,cp2.tipo_p12,cp2.qna_ini12,cp2.qna_fin12,cp2.impacum_p12, " ||
                           "cp2.adscripcion,cp2.tot_perc_cheque,cp2.tot_ded_cheque,cp2.tot_net_cheque, " ||
                           "cp2.p1, cp2.c1, cp2.i1, cp2.p2, cp2.c2, cp2.i2, cp2.p3, cp2.c3, cp2.i3, cp2.p4, cp2.c4, cp2.i4, cp2.p5, cp2.c5, cp2.i5, cp2.p6, cp2.c6, cp2.i6, cp2.p7, cp2.c7, cp2.i7, cp2.p8, cp2.c8, cp2.i8, cp2.p9, cp2.c9, cp2.i9, cp2.p10,cp2.c10,cp2.i10, " ||
                           "cp2.p11,cp2.c11,cp2.i11,cp2.p12,cp2.c12,cp2.i12,cp2.p13,cp2.c13,cp2.i13,cp2.p14,cp2.c14,cp2.i14,cp2.p15,cp2.c15,cp2.i15,cp2.p16,cp2.c16,cp2.i16,cp2.p17,cp2.c17,cp2.i17,cp2.p18,cp2.c18,cp2.i18,cp2.p19,cp2.c19,cp2.i19,cp2.p20,cp2.c20,cp2.i20, " ||
                           "cp2.p21,cp2.c21,cp2.i21,cp2.p22,cp2.c22,cp2.i22,cp2.p23,cp2.c23,cp2.i23,cp2.p24,cp2.c24,cp2.i24,cp2.p25,cp2.c25,cp2.i25,cp2.p26,cp2.c26,cp2.i26,cp2.p27,cp2.c27,cp2.i27,cp2.p28,cp2.c28,cp2.i28,cp2.p29,cp2.c29,cp2.i29,cp2.p30,cp2.c30,cp2.i30, " ||
                           "cp2.p31,cp2.c31,cp2.i31,cp2.p32,cp2.c32,cp2.i32,cp2.p33,cp2.c33,cp2.i33,cp2.p34,cp2.c34,cp2.i34,cp2.p35,cp2.c35,cp2.i35,cp2.p36,cp2.c36,cp2.i36,cp2.p37,cp2.c37,cp2.i37,cp2.p38,cp2.c38,cp2.i38,cp2.p39,cp2.c39,cp2.i39,cp2.p40,cp2.c40,cp2.i40, " ||
                           "cp2.num_cheque,cp2.cuenta,cp2.num_clc,cp2.puesto,cp2.nivel,cp2.sub_nivel,cp2.jornada, " ||
                           "cp2.turno,cp2.id_empresa,cp2.id_banco,cp2.id_tipo_tabulador,cp2.id_forma_pago, " ||
                           "cp2.id_div_geografica,cp2.num_cons,cp2.fec_pago,cp2.descripcion,cp2.aniocan, " ||
                           "cp2.archivo,cp2.memorandum,cp2.quincena,cp2.mes,cp2.anio,cp2.ord_ext,cp2.id_area_generadora, " ||
                           "cp2.id_centro_pago,cp2.id_tipo_puesto,cp2.id_servicio, " ||
                           "acu.PRIMA_DOM_GRA, acu.PRIMA_DOM_EX, acu.HORAS_EXT_GRA, acu.HORAS_EXT_EX, acu.PRIMA_VAC_GRA, acu.PRIMA_VAC_EX " ||
                         "From eagg_cosif_timbrado_2022 cp2, eagg_cptos_parcialm_exen_2022 acu " ||
                         "Where cp2.rfc = acu.id_empleado " ||
                         "  And cp2.fec_pago = acu.fec_pago " ||
                         "   And cp2.fec_pago = " || p_fec_pag || _query_condition || 
                         " Order by rfc, fec_pago";

        LET qry_cosif2 = TRIM(qry_cosif2);
        PREPARE stmt_cosif2 FROM qry_cosif2;
        DECLARE cosif2_cursor cursor FOR stmt_cosif2;
        OPEN cosif2_cursor;

        WHILE (1 = 1)
          FETCH cosif2_cursor 
          Into _u_version, _tipo, _rfc, _filiacion, _nom_emp, _qna_pago, _qna_proc,
              _cpto_p1,  _tipo_p1,  _qna_ini1,  _qna_fin1,  _impacum_p1,
              _cpto_p2,  _tipo_p2,  _qna_ini2,  _qna_fin2,  _impacum_p2,
              _cpto_p3,  _tipo_p3,  _qna_ini3,  _qna_fin3,  _impacum_p3,
              _cpto_p4,  _tipo_p4,  _qna_ini4,  _qna_fin4,  _impacum_p4,
              _cpto_p5,  _tipo_p5,  _qna_ini5,  _qna_fin5,  _impacum_p5,
              _cpto_p6,  _tipo_p6,  _qna_ini6,  _qna_fin6,  _impacum_p6,
              _cpto_p7,  _tipo_p7,  _qna_ini7,  _qna_fin7,  _impacum_p7,
              _cpto_p8,  _tipo_p8,  _qna_ini8,  _qna_fin8,  _impacum_p8,
              _cpto_p9,  _tipo_p9,  _qna_ini9,  _qna_fin9,  _impacum_p9,
              _cpto_p10, _tipo_p10, _qna_ini10, _qna_fin10, _impacum_p10,
              _cpto_p11, _tipo_p11, _qna_ini11, _qna_fin11, _impacum_p11,
              _cpto_p12, _tipo_p12, _qna_ini12, _qna_fin12, _impacum_p12,
              _adscripcion, _tot_perc_cheque, _tot_ded_cheque, _tot_net_cheque,
              w_p1, w_c1, w_i1, w_p2, w_c2, w_i2, w_p3, w_c3, w_i3, w_p4, w_c4, w_i4, w_p5, w_c5, w_i5,
              w_p6, w_c6, w_i6, w_p7, w_c7, w_i7, w_p8, w_c8, w_i8, w_p9, w_c9, w_i9, w_p10,w_c10,w_i10,
              w_p11,w_c11,w_i11,w_p12,w_c12,w_i12,w_p13,w_c13,w_i13,w_p14,w_c14,w_i14,w_p15,w_c15,w_i15,
              w_p16,w_c16,w_i16,w_p17,w_c17,w_i17,w_p18,w_c18,w_i18,w_p19,w_c19,w_i19,w_p20,w_c20,w_i20,
              w_p21,w_c21,w_i21,w_p22,w_c22,w_i22,w_p23,w_c23,w_i23,w_p24,w_c24,w_i24,w_p25,w_c25,w_i25,
              w_p26,w_c26,w_i26,w_p27,w_c27,w_i27,w_p28,w_c28,w_i28,w_p29,w_c29,w_i29,w_p30,w_c30,w_i30,
              w_p31,w_c31,w_i31,w_p32,w_c32,w_i32,w_p33,w_c33,w_i33,w_p34,w_c34,w_i34,w_p35,w_c35,w_i35,
              w_p36,w_c36,w_i36,w_p37,w_c37,w_i37,w_p38,w_c38,w_i38,w_p39,w_c39,w_i39,w_p40,w_c40,w_i40,
              _num_cheque, _cuenta, _num_clc, _puesto, _nivel, _sub_nivel, _jornada,
              _turno, _id_empresa, _id_banco, _id_tipo_tabulador, _id_forma_pago,
              _id_div_geografica, _num_cons, _fec_pago, _descripcion, _aniocan,
              _archivo, _memorandum, _quincena, _mes, _anio, _ord_ext, _id_area_generadora,
              _id_centro_pago, _id_tipo_puesto, _id_servicio,
              w_PRIMA_DOM_GRA, w_PRIMA_DOM_EX, w_HORAS_EXT_GRA, w_HORAS_EXT_EX, w_PRIMA_VAC_GRA, w_PRIMA_VAC_EX;

          IF (SQLCODE != 100) THEN

            LET cont = cont + 1;
            LET iCont = 0;
            LET sValues = "";

            --TRACE 'w_PRIMA_DOM_GRA   --->>>' || w_PRIMA_DOM_GRA;
            --TRACE 'w_PRIMA_DOM_EX    --->>>' || w_PRIMA_DOM_EX;
            --TRACE 'w_HORAS_EXT_GRA   --->>>' || w_HORAS_EXT_GRA;
            --TRACE 'w_HORAS_EXT_EX    --->>>' || w_HORAS_EXT_EX;
            --TRACE 'w_PRIMA_VAC_GRA   --->>>' || w_PRIMA_VAC_GRA;
            --TRACE 'w_PRIMA_VAC_EX    --->>>' || w_PRIMA_VAC_EX;

            if (_rfc is null) then
                let _rfc = "";
            end if;
            if (_filiacion is null) then
                let _filiacion = "";
            end if;
            if (_nom_emp is null) then
                let _nom_emp = "";
            end if;
            if (_puesto is null) then
                let _puesto = "";
            end if;
            if (_nivel is null) then
                let _nivel = "";
            end if;
            if (_sub_nivel is null) then
                let _sub_nivel = "";
            end if;
            if (_jornada is null) then
                let _jornada = "";
            end if;
            if (_turno is null) then
                let _turno = "";
            end if;
            if (_id_div_geografica is null) then
                let _id_div_geografica = "";
            end if;
            if (_id_banco is null) then
                let _id_banco = "";
            end if;
            if (_id_tipo_tabulador is null) then
                let _id_tipo_tabulador = "";
            end if;
            if (_id_forma_pago is null) then
                let _id_forma_pago = "";
            end if;
            if (_id_empresa is null) then
                let _id_empresa = "";
            end if;

            if (_num_clc is null) then let _num_clc = ""; end if;
            if (_u_version is null) then let _u_version = ""; end if;
            if (_tipo is null) then let _tipo = ""; end if;
            if (_rfc is null) then let _rfc = ""; end if;
            if (_filiacion is null) then let _filiacion = ""; end if;
            if (_nom_emp is null) then let _nom_emp = ""; end if;
            if (_qna_pago is null) then let _qna_pago = ""; end if;
            if (_qna_proc is null) then let _qna_proc = ""; end if;
            if (_cpto_p1 is null) then let _cpto_p1 = ""; end if;
            if (_tipo_p1 is null) then let _tipo_p1 = ""; end if;
            if (_qna_ini1 is null) then let _qna_ini1 = ""; end if;
            if (_qna_fin1 is null) then let _qna_fin1 = ""; end if;
            if (_impacum_p1 is null) then let _impacum_p1 = 0; end if;
            if (_cpto_p2 is null) then let _cpto_p2 = ""; end if;
            if (_tipo_p2 is null) then let _tipo_p2 = ""; end if;
            if (_qna_ini2 is null) then let _qna_ini2 = ""; end if;
            if (_qna_fin2 is null) then let _qna_fin2 = ""; end if;
            if (_impacum_p2 is null) then let _impacum_p2 = 0; end if;
            if (_cpto_p3 is null) then let _cpto_p3 = ""; end if;
            if (_tipo_p3 is null) then let _tipo_p3 = ""; end if;
            if (_qna_ini3 is null) then let _qna_ini3 = ""; end if;
            if (_qna_fin3 is null) then let _qna_fin3 = ""; end if;
            if (_impacum_p3 is null) then let _impacum_p3 = 0; end if;
            if (_cpto_p4 is null) then let _cpto_p4 = ""; end if;
            if (_tipo_p4 is null) then let _tipo_p4 = ""; end if;
            if (_qna_ini4 is null) then let _qna_ini4 = ""; end if;
            if (_qna_fin4 is null) then let _qna_fin4 = ""; end if;
            if (_impacum_p4 is null) then let _impacum_p4 = 0; end if;
            if (_cpto_p5 is null) then let _cpto_p5 = ""; end if;
            if (_tipo_p5 is null) then let _tipo_p5 = ""; end if;
            if (_qna_ini5 is null) then let _qna_ini5 = ""; end if;
            if (_qna_fin5 is null) then let _qna_fin5 = ""; end if;
            if (_impacum_p5 is null) then let _impacum_p5 = 0; end if;
            if (_cpto_p6 is null) then let _cpto_p6 = ""; end if;
            if (_tipo_p6 is null) then let _tipo_p6 = ""; end if;
            if (_qna_ini6 is null) then let _qna_ini6 = ""; end if;
            if (_qna_fin6 is null) then let _qna_fin6 = ""; end if;
            if (_impacum_p6 is null) then let _impacum_p6 = 0; end if;
            if (_cpto_p7 is null) then let _cpto_p7 = ""; end if;
            if (_tipo_p7 is null) then let _tipo_p7 = ""; end if;
            if (_qna_ini7 is null) then let _qna_ini7 = ""; end if;
            if (_qna_fin7 is null) then let _qna_fin7 = ""; end if;
            if (_impacum_p7 is null) then let _impacum_p7 = 0; end if;
            if (_cpto_p8 is null) then let _cpto_p8 = ""; end if;
            if (_tipo_p8 is null) then let _tipo_p8 = ""; end if;
            if (_qna_ini8 is null) then let _qna_ini8 = ""; end if;
            if (_qna_fin8 is null) then let _qna_fin8 = ""; end if;
            if (_impacum_p8 is null) then let _impacum_p8 = 0; end if;
            if (_cpto_p9 is null) then let _cpto_p9 = ""; end if;
            if (_tipo_p9 is null) then let _tipo_p9 = ""; end if;
            if (_qna_ini9 is null) then let _qna_ini9 = ""; end if;
            if (_qna_fin9 is null) then let _qna_fin9 = ""; end if;
            if (_impacum_p9 is null) then let _impacum_p9 = 0; end if;
            if (_cpto_p10 is null) then let _cpto_p10 = ""; end if;
            if (_tipo_p10 is null) then let _tipo_p10 = ""; end if;
            if (_qna_ini10 is null) then let _qna_ini10 = ""; end if;
            if (_qna_fin10 is null) then let _qna_fin10 = ""; end if;
            if (_impacum_p10 is null) then let _impacum_p10 = 0; end if;
            if (_cpto_p11 is null) then let _cpto_p11 = ""; end if;
            if (_tipo_p11 is null) then let _tipo_p11 = ""; end if;
            if (_qna_ini11 is null) then let _qna_ini11 = ""; end if;
            if (_qna_fin11 is null) then let _qna_fin11 = ""; end if;
            if (_impacum_p11 is null) then let _impacum_p11 = 0; end if;
            if (_cpto_p12 is null) then let _cpto_p12 = ""; end if;
            if (_tipo_p12 is null) then let _tipo_p12 = ""; end if;
            if (_qna_ini12 is null) then let _qna_ini12 = ""; end if;
            if (_qna_fin12 is null) then let _qna_fin12 = ""; end if;
            if (_impacum_p12 is null) then let _impacum_p12 = 0; end if;
            if (_adscripcion is null) then let _adscripcion = ""; end if;
            if (_num_cheque is null) then let _num_cheque = 0; end if;
            if (_cuenta is null) then let _cuenta = ""; end if;
            if (_puesto is null) then let _puesto = ""; end if;
            if (_nivel is null) then let _nivel = ""; end if;
            if (_sub_nivel is null) then let _sub_nivel = ""; end if;
            if (_jornada is null) then let _jornada = ""; end if;
            if (_turno is null) then let _turno = ""; end if;
            if (_id_empresa is null) then let _id_empresa = ""; end if;
            if (_id_banco is null) then let _id_banco = ""; end if;
            if (_id_tipo_tabulador is null) then let _id_tipo_tabulador = ""; end if;
            if (_id_forma_pago is null) then let _id_forma_pago = ""; end if;
            if (_id_div_geografica is null) then let _id_div_geografica = ""; end if;
            if (_num_cons is null) then let _num_cons = ""; end if;
            if (_fec_pago is null) then let _fec_pago = ""; end if;
            if (_descripcion is null) then let _descripcion = ""; end if;
            if (_aniocan is null) then let _aniocan = 0; end if;
            if (_archivo is null) then let _archivo = ""; end if;
            if (_memorandum is null) then let _memorandum = ""; end if;
            if (_quincena is null) then let _quincena = ""; end if;
            if (_mes is null) then let _mes = ""; end if;
            if (_anio is null) then let _anio = ""; end if;
            if (_ord_ext is null) then let _ord_ext = ""; end if;
            if (_id_area_generadora is null) then let _id_area_generadora = ""; end if;
            if (_id_centro_pago is null) then let _id_centro_pago = ""; end if;
            if (_id_tipo_puesto is null) then let _id_tipo_puesto = ""; end if;
            if (_id_servicio is null) then let _id_servicio = ""; end if;

            --TRACE '_num_clc --->>>' || _num_clc;
            --TRACE '_u_version --->>>' || _u_version;
            --TRACE '_tipo --->>>' || _tipo;
            --TRACE '_rfc --->>>' || _rfc;
            --TRACE '_filiacion --->>>' || _filiacion;
            --TRACE '_nom_emp --->>>' || _nom_emp;
            --TRACE '_qna_pago --->>>' || _qna_pago;
            --TRACE '_qna_proc --->>>' || _qna_proc;
            --TRACE '_cpto_p1 --->>>' || _cpto_p1;
            --TRACE '_tipo_p1 --->>>' || _tipo_p1;
            --TRACE '_qna_ini1 --->>>' || _qna_ini1;
            --TRACE '_qna_fin1 --->>>' || _qna_fin1;
            --TRACE '_impacum_p1 --->>>' || _impacum_p1;
            --TRACE '_cpto_p2 --->>>' || _cpto_p2;
            --TRACE '_tipo_p2 --->>>' || _tipo_p2;
            --TRACE '_qna_ini2 --->>>' || _qna_ini2;
            --TRACE '_qna_fin2 --->>>' || _qna_fin2;
            --TRACE '_impacum_p2 --->>>' || _impacum_p2;
            --TRACE '_cpto_p3 --->>>' || _cpto_p3;
            --TRACE '_tipo_p3 --->>>' || _tipo_p3;
            --TRACE '_qna_ini3 --->>>' || _qna_ini3;
            --TRACE '_qna_fin3 --->>>' || _qna_fin3;
            --TRACE '_impacum_p3 --->>>' || _impacum_p3;
            --TRACE '_cpto_p4 --->>>' || _cpto_p4;
            --TRACE '_tipo_p4 --->>>' || _tipo_p4;
            --TRACE '_qna_ini4 --->>>' || _qna_ini4;
            --TRACE '_qna_fin4 --->>>' || _qna_fin4;
            --TRACE '_impacum_p4 --->>>' || _impacum_p4;
            --TRACE '_cpto_p5 --->>>' || _cpto_p5;
            --TRACE '_tipo_p5 --->>>' || _tipo_p5;
            --TRACE '_qna_ini5 --->>>' || _qna_ini5;
            --TRACE '_qna_fin5 --->>>' || _qna_fin5;
            --TRACE '_impacum_p5 --->>>' || _impacum_p5;
            --TRACE '_cpto_p6 --->>>' || _cpto_p6;
            --TRACE '_tipo_p6 --->>>' || _tipo_p6;
            --TRACE '_qna_ini6 --->>>' || _qna_ini6;
            --TRACE '_qna_fin6 --->>>' || _qna_fin6;
            --TRACE '_impacum_p6 --->>>' || _impacum_p6;
            --TRACE '_cpto_p7 --->>>' || _cpto_p7;
            --TRACE '_tipo_p7 --->>>' || _tipo_p7;
            --TRACE '_qna_ini7 --->>>' || _qna_ini7;
            --TRACE '_qna_fin7 --->>>' || _qna_fin7;
            --TRACE '_impacum_p7 --->>>' || _impacum_p7;
            --TRACE '_cpto_p8 --->>>' || _cpto_p8;
            --TRACE '_tipo_p8 --->>>' || _tipo_p8;
            --TRACE '_qna_ini8 --->>>' || _qna_ini8;
            --TRACE '_qna_fin8 --->>>' || _qna_fin8;
            --TRACE '_impacum_p8 --->>>' || _impacum_p8;
            --TRACE '_cpto_p9 --->>>' || _cpto_p9;
            --TRACE '_tipo_p9 --->>>' || _tipo_p9;
            --TRACE '_qna_ini9 --->>>' || _qna_ini9;
            --TRACE '_qna_fin9 --->>>' || _qna_fin9;
            --TRACE '_impacum_p9 --->>>' || _impacum_p9;
            --TRACE '_cpto_p10 --->>>' || _cpto_p10;
            --TRACE '_tipo_p10 --->>>' || _tipo_p10;
            --TRACE '_qna_ini10 --->>>' || _qna_ini10;
            --TRACE '_qna_fin10 --->>>' || _qna_fin10;
            --TRACE '_impacum_p10 --->>>' || _impacum_p10;
            --TRACE '_cpto_p11 --->>>' || _cpto_p11;
            --TRACE '_tipo_p11 --->>>' || _tipo_p11;
            --TRACE '_qna_ini11 --->>>' || _qna_ini11;
            --TRACE '_qna_fin11 --->>>' || _qna_fin11;
            --TRACE '_impacum_p11 --->>>' || _impacum_p11;
            --TRACE '_cpto_p12 --->>>' || _cpto_p12;
            --TRACE '_tipo_p12 --->>>' || _tipo_p12;
            --TRACE '_qna_ini12 --->>>' || _qna_ini12;
            --TRACE '_qna_fin12 --->>>' || _qna_fin12;
            --TRACE '_impacum_p12 --->>>' || _impacum_p12;
            --TRACE '_adscripcion --->>>' || _adscripcion;
            --TRACE '_num_cheque --->>>' || _num_cheque;
            --TRACE '_cuenta --->>>' || _cuenta;
            --TRACE '_puesto --->>>' || _puesto;
            --TRACE '_nivel --->>>' || _nivel;
            --TRACE '_sub_nivel --->>>' || _sub_nivel;
            --TRACE '_jornada --->>>' || _jornada;
            --TRACE '_turno --->>>' || _turno;
            --TRACE '_id_empresa --->>>' || _id_empresa;
            --TRACE '_id_banco --->>>' || _id_banco;
            --TRACE '_id_tipo_tabulador --->>>' || _id_tipo_tabulador;
            --TRACE '_id_forma_pago --->>>' || _id_forma_pago;
            --TRACE '_id_div_geografica --->>>' || _id_div_geografica;
            --TRACE '_num_cons --->>>' || _num_cons;
            --TRACE '_fec_pago --->>>' || _fec_pago;
            --TRACE '_descripcion --->>>' || _descripcion;
            --TRACE '_aniocan --->>>' || _aniocan;
            --TRACE '_archivo --->>>' || _archivo;
            --TRACE '_memorandum --->>>' || _memorandum;
            --TRACE '_quincena --->>>' || _quincena;
            --TRACE '_mes --->>>' || _mes;
            --TRACE '_anio --->>>' || _anio;
            --TRACE '_ord_ext --->>>' || _ord_ext;
            --TRACE '_id_area_generadora --->>>' || _id_area_generadora;
            --TRACE '_id_centro_pago --->>>' || _id_centro_pago;
            --TRACE '_id_tipo_puesto --->>>' || _id_tipo_puesto;
            --TRACE '_id_servicio --->>>' || _id_servicio;

            If (w_c1 = '09' Or w_c1 = '14' Or w_c1 = '18') Then
                If (w_c1 = '09') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '09', " || w_HORAS_EXT_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y1', " || w_HORAS_EXT_EX || ",";
                ElIf (w_c1 = '14') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '14', " || w_PRIMA_DOM_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y2', " || w_PRIMA_DOM_EX || ",";
                ElIf (w_c1 = '18') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '18', " || w_PRIMA_VAC_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y3', " || w_PRIMA_VAC_EX || ",";
                End If;
            Else
                If w_i1 <> 0 Then
                    LET iCont = iCont + 1;
                    LET sValues = TRIM(sValues) || "'"|| w_p1 ||"', '"|| w_c1 ||"', " || w_i1 || ",";
                End If;
            End If;

            If (w_c2 = '09' Or w_c2 = '14' Or w_c2 = '18') Then
                If (w_c2 = '09') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '09', " || w_HORAS_EXT_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y1', " || w_HORAS_EXT_EX || ",";
                ElIf (w_c2 = '14') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '14', " || w_PRIMA_DOM_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y2', " || w_PRIMA_DOM_EX || ",";
                ElIf (w_c2 = '18') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '18', " || w_PRIMA_VAC_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y3', " || w_PRIMA_VAC_EX || ",";
                End If;
            Else
                If w_i2 <> 0 Then
                    LET iCont = iCont + 1;
                    LET sValues = TRIM(sValues) || "'"|| w_p2 ||"', '"|| w_c2 ||"', " || w_i2 || ",";
                End If;
            End If;

            If (w_c3 = '09' Or w_c3 = '14' Or w_c3 = '18') Then
                If (w_c3 = '09') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '09', " || w_HORAS_EXT_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y1', " || w_HORAS_EXT_EX || ",";
                ElIf (w_c3 = '14') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '14', " || w_PRIMA_DOM_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y2', " || w_PRIMA_DOM_EX || ",";
                ElIf (w_c3 = '18') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '18', " || w_PRIMA_VAC_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y3', " || w_PRIMA_VAC_EX || ",";
                End If;
            Else
                If w_i3 <> 0 Then
                    LET iCont = iCont + 1;
                    LET sValues = TRIM(sValues) || "'"|| w_p3 ||"', '"|| w_c3 ||"', " || w_i3 || ",";
                End If;
            End If;

            If (w_c4 = '09' Or w_c4 = '14' Or w_c4 = '18') Then
                If (w_c4 = '09') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '09', " || w_HORAS_EXT_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y1', " || w_HORAS_EXT_EX || ",";
                ElIf (w_c4 = '14') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '14', " || w_PRIMA_DOM_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y2', " || w_PRIMA_DOM_EX || ",";
                ElIf (w_c4 = '18') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '18', " || w_PRIMA_VAC_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y3', " || w_PRIMA_VAC_EX || ",";
                End If;
            Else
                If w_i4 <> 0 Then
                    LET iCont = iCont + 1;
                    LET sValues = TRIM(sValues) || "'"|| w_p4 ||"', '"|| w_c4 ||"', " || w_i4 || ",";
                End If;
            End If;

            If (w_c5 = '09' Or w_c5 = '14' Or w_c5 = '18') Then
                If (w_c5 = '09') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '09', " || w_HORAS_EXT_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y1', " || w_HORAS_EXT_EX || ",";
                ElIf (w_c5 = '14') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '14', " || w_PRIMA_DOM_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y2', " || w_PRIMA_DOM_EX || ",";
                ElIf (w_c5 = '18') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '18', " || w_PRIMA_VAC_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y3', " || w_PRIMA_VAC_EX || ",";
                End If;
            Else
                If w_i5 <> 0 Then
                    LET iCont = iCont + 1;
                    LET sValues = TRIM(sValues) || "'"|| w_p5 ||"', '"|| w_c5 ||"', " || w_i5 || ",";
                End If;
            End If;

            If (w_c6 = '09' Or w_c6 = '14' Or w_c6 = '18') Then
                If (w_c6 = '09') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '09', " || w_HORAS_EXT_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y1', " || w_HORAS_EXT_EX || ",";
                ElIf (w_c6 = '14') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '14', " || w_PRIMA_DOM_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y2', " || w_PRIMA_DOM_EX || ",";
                ElIf (w_c6 = '18') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '18', " || w_PRIMA_VAC_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y3', " || w_PRIMA_VAC_EX || ",";
                End If;
            Else
                If w_i6 <> 0 Then
                    LET iCont = iCont + 1;
                    LET sValues = TRIM(sValues) || "'"|| w_p6 ||"', '"|| w_c6 ||"', " || w_i6 || ",";
                End If;
            End If;

            If (w_c7 = '09' Or w_c7 = '14' Or w_c7 = '18') Then
                If (w_c7 = '09') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '09', " || w_HORAS_EXT_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y1', " || w_HORAS_EXT_EX || ",";
                ElIf (w_c7 = '14') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '14', " || w_PRIMA_DOM_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y2', " || w_PRIMA_DOM_EX || ",";
                ElIf (w_c7 = '18') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '18', " || w_PRIMA_VAC_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y3', " || w_PRIMA_VAC_EX || ",";
                End If;
            Else
                If w_i7 <> 0 Then
                    LET iCont = iCont + 1;
                    LET sValues = TRIM(sValues) || "'"|| w_p7 ||"', '"|| w_c7 ||"', " || w_i7 || ",";
                End If;
            End If;

            If (w_c8 = '09' Or w_c8 = '14' Or w_c8 = '18') Then
                If (w_c8 = '09') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '09', " || w_HORAS_EXT_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y1', " || w_HORAS_EXT_EX || ",";
                ElIf (w_c8 = '14') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '14', " || w_PRIMA_DOM_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y2', " || w_PRIMA_DOM_EX || ",";
                ElIf (w_c8 = '18') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '18', " || w_PRIMA_VAC_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y3', " || w_PRIMA_VAC_EX || ",";
                End If;
            Else
                If w_i8 <> 0 Then
                    LET iCont = iCont + 1;
                    LET sValues = TRIM(sValues) || "'"|| w_p8 ||"', '"|| w_c8 ||"', " || w_i8 || ",";
                End If;
            End If;

            If (w_c9 = '09' Or w_c9 = '14' Or w_c9 = '18') Then
                If (w_c9 = '09') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '09', " || w_HORAS_EXT_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y1', " || w_HORAS_EXT_EX || ",";
                ElIf (w_c9 = '14') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '14', " || w_PRIMA_DOM_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y2', " || w_PRIMA_DOM_EX || ",";
                ElIf (w_c9 = '18') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '18', " || w_PRIMA_VAC_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y3', " || w_PRIMA_VAC_EX || ",";
                End If;
            Else
                If w_i9 <> 0 Then
                    LET iCont = iCont + 1;
                    LET sValues = TRIM(sValues) || "'"|| w_p9 ||"', '"|| w_c9 ||"', " || w_i9 || ",";
                End If;
            End If;

            If (w_c10 = '09' Or w_c10 = '14' Or w_c10 = '18') Then
                If (w_c10 = '09') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '09', " || w_HORAS_EXT_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y1', " || w_HORAS_EXT_EX || ",";
                ElIf (w_c10 = '14') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '14', " || w_PRIMA_DOM_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y2', " || w_PRIMA_DOM_EX || ",";
                ElIf (w_c10 = '18') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '18', " || w_PRIMA_VAC_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y3', " || w_PRIMA_VAC_EX || ",";
                End If;
            Else
                If w_i10 <> 0 Then
                    LET iCont = iCont + 1;
                    LET sValues = TRIM(sValues) || "'"|| w_p10 ||"', '"|| w_c10 ||"', " || w_i10 || ",";
                End If;
            End If;

            If (w_c11 = '09' Or w_c11 = '14' Or w_c11 = '18') Then
                If (w_c11 = '09') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '09', " || w_HORAS_EXT_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y1', " || w_HORAS_EXT_EX || ",";
                ElIf (w_c11 = '14') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '14', " || w_PRIMA_DOM_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y2', " || w_PRIMA_DOM_EX || ",";
                ElIf (w_c11 = '18') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '18', " || w_PRIMA_VAC_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y3', " || w_PRIMA_VAC_EX || ",";
                End If;
            Else
                If w_i11 <> 0 Then
                    LET iCont = iCont + 1;
                    LET sValues = TRIM(sValues) || "'"|| w_p11 ||"', '"|| w_c11 ||"', " || w_i11 || ",";
                End If;
            End If;

            If (w_c12 = '09' Or w_c12 = '14' Or w_c12 = '18') Then
                If (w_c12 = '09') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '09', " || w_HORAS_EXT_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y1', " || w_HORAS_EXT_EX || ",";
                ElIf (w_c12 = '14') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '14', " || w_PRIMA_DOM_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y2', " || w_PRIMA_DOM_EX || ",";
                ElIf (w_c12 = '18') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '18', " || w_PRIMA_VAC_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y3', " || w_PRIMA_VAC_EX || ",";
                End If;
            Else
                If w_i12 <> 0 Then
                    LET iCont = iCont + 1;
                    LET sValues = TRIM(sValues) || "'"|| w_p12 ||"', '"|| w_c12 ||"', " || w_i12 || ",";
                End If;
            End If;

            If (w_c13 = '09' Or w_c13 = '14' Or w_c13 = '18') Then
                If (w_c13 = '09') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '09', " || w_HORAS_EXT_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y1', " || w_HORAS_EXT_EX || ",";
                ElIf (w_c13 = '14') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '14', " || w_PRIMA_DOM_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y2', " || w_PRIMA_DOM_EX || ",";
                ElIf (w_c13 = '18') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '18', " || w_PRIMA_VAC_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y3', " || w_PRIMA_VAC_EX || ",";
                End If;
            Else
                If w_i13 <> 0 Then
                    LET iCont = iCont + 1;
                    LET sValues = TRIM(sValues) || "'"|| w_p13 ||"', '"|| w_c13 ||"', " || w_i13 || ",";
                End If;
            End If;

            If (w_c14 = '09' Or w_c14 = '14' Or w_c14 = '18') Then
                If (w_c14 = '09') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '09', " || w_HORAS_EXT_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y1', " || w_HORAS_EXT_EX || ",";
                ElIf (w_c14 = '14') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '14', " || w_PRIMA_DOM_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y2', " || w_PRIMA_DOM_EX || ",";
                ElIf (w_c14 = '18') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '18', " || w_PRIMA_VAC_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y3', " || w_PRIMA_VAC_EX || ",";
                End If;
            Else
                If w_i14 <> 0 Then
                    LET iCont = iCont + 1;
                    LET sValues = TRIM(sValues) || "'"|| w_p14 ||"', '"|| w_c14 ||"', " || w_i14 || ",";
                End If;
            End If;

            If (w_c15 = '09' Or w_c15 = '14' Or w_c15 = '18') Then
                If (w_c15 = '09') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '09', " || w_HORAS_EXT_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y1', " || w_HORAS_EXT_EX || ",";
                ElIf (w_c15 = '14') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '14', " || w_PRIMA_DOM_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y2', " || w_PRIMA_DOM_EX || ",";
                ElIf (w_c15 = '18') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '18', " || w_PRIMA_VAC_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y3', " || w_PRIMA_VAC_EX || ",";
                End If;
            Else
                If w_i15 <> 0 Then
                    LET iCont = iCont + 1;
                    LET sValues = TRIM(sValues) || "'"|| w_p15 ||"', '"|| w_c15 ||"', " || w_i15 || ",";
                End If;
            End If;

            If (w_c16 = '09' Or w_c16 = '14' Or w_c16 = '18') Then
                If (w_c16 = '09') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '09', " || w_HORAS_EXT_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y1', " || w_HORAS_EXT_EX || ",";
                ElIf (w_c16 = '14') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '14', " || w_PRIMA_DOM_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y2', " || w_PRIMA_DOM_EX || ",";
                ElIf (w_c16 = '18') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '18', " || w_PRIMA_VAC_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y3', " || w_PRIMA_VAC_EX || ",";
                End If;
            Else
                If w_i16 <> 0 Then
                    LET iCont = iCont + 1;
                    LET sValues = TRIM(sValues) || "'"|| w_p16 ||"', '"|| w_c16 ||"', " || w_i16 || ",";
                End If;
            End If;

            If (w_c17 = '09' Or w_c17 = '14' Or w_c17 = '18') Then
                If (w_c17 = '09') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '09', " || w_HORAS_EXT_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y1', " || w_HORAS_EXT_EX || ",";
                ElIf (w_c17 = '14') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '14', " || w_PRIMA_DOM_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y2', " || w_PRIMA_DOM_EX || ",";
                ElIf (w_c17 = '18') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '18', " || w_PRIMA_VAC_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y3', " || w_PRIMA_VAC_EX || ",";
                End If;
            Else
                If w_i17 <> 0 Then
                    LET iCont = iCont + 1;
                    LET sValues = TRIM(sValues) || "'"|| w_p17 ||"', '"|| w_c17 ||"', " || w_i17 || ",";
                End If;
            End If;

            If (w_c18 = '09' Or w_c18 = '14' Or w_c18 = '18') Then
                If (w_c18 = '09') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '09', " || w_HORAS_EXT_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y1', " || w_HORAS_EXT_EX || ",";
                ElIf (w_c18 = '14') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '14', " || w_PRIMA_DOM_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y2', " || w_PRIMA_DOM_EX || ",";
                ElIf (w_c18 = '18') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '18', " || w_PRIMA_VAC_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y3', " || w_PRIMA_VAC_EX || ",";
                End If;
            Else
                If w_i18 <> 0 Then
                    LET iCont = iCont + 1;
                    LET sValues = TRIM(sValues) || "'"|| w_p18 ||"', '"|| w_c18 ||"', " || w_i18 || ",";
                End If;
            End If;

            If (w_c19 = '09' Or w_c19 = '14' Or w_c19 = '18') Then
                If (w_c19 = '09') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '09', " || w_HORAS_EXT_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y1', " || w_HORAS_EXT_EX || ",";
                ElIf (w_c19 = '14') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '14', " || w_PRIMA_DOM_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y2', " || w_PRIMA_DOM_EX || ",";
                ElIf (w_c19 = '18') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '18', " || w_PRIMA_VAC_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y3', " || w_PRIMA_VAC_EX || ",";
                End If;
            Else
                If w_i19 <> 0 Then
                    LET iCont = iCont + 1;
                    LET sValues = TRIM(sValues) || "'"|| w_p19 ||"', '"|| w_c19 ||"', " || w_i19 || ",";
                End If;
            End If;

            If (w_c20 = '09' Or w_c20 = '14' Or w_c20 = '18') Then
                If (w_c20 = '09') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '09', " || w_HORAS_EXT_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y1', " || w_HORAS_EXT_EX || ",";
                ElIf (w_c20 = '14') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '14', " || w_PRIMA_DOM_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y2', " || w_PRIMA_DOM_EX || ",";
                ElIf (w_c20 = '18') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '18', " || w_PRIMA_VAC_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y3', " || w_PRIMA_VAC_EX || ",";
                End If;
            Else
                If w_i20 <> 0 Then
                    LET iCont = iCont + 1;
                    LET sValues = TRIM(sValues) || "'"|| w_p20 ||"', '"|| w_c20 ||"', " || w_i20 || ",";
                End If;
            End If;

            If (w_c21 = '09' Or w_c21 = '14' Or w_c21 = '18') Then
                If (w_c21 = '09') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '09', " || w_HORAS_EXT_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y1', " || w_HORAS_EXT_EX || ",";
                ElIf (w_c21 = '14') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '14', " || w_PRIMA_DOM_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y2', " || w_PRIMA_DOM_EX || ",";
                ElIf (w_c21 = '18') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '18', " || w_PRIMA_VAC_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y3', " || w_PRIMA_VAC_EX || ",";
                End If;
            Else
                If w_i21 <> 0 Then
                    LET iCont = iCont + 1;
                    LET sValues = TRIM(sValues) || "'"|| w_p21 ||"', '"|| w_c21 ||"', " || w_i21 || ",";
                End If;
            End If;

            If (w_c22 = '09' Or w_c22 = '14' Or w_c22 = '18') Then
                If (w_c22 = '09') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '09', " || w_HORAS_EXT_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y1', " || w_HORAS_EXT_EX || ",";
                ElIf (w_c22 = '14') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '14', " || w_PRIMA_DOM_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y2', " || w_PRIMA_DOM_EX || ",";
                ElIf (w_c22 = '18') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '18', " || w_PRIMA_VAC_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y3', " || w_PRIMA_VAC_EX || ",";
                End If;
            Else
                If w_i22 <> 0 Then
                    LET iCont = iCont + 1;
                    LET sValues = TRIM(sValues) || "'"|| w_p22 ||"', '"|| w_c22 ||"', " || w_i22 || ",";
                End If;
            End If;

            If (w_c23 = '09' Or w_c23 = '14' Or w_c23 = '18') Then
                If (w_c23 = '09') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '09', " || w_HORAS_EXT_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y1', " || w_HORAS_EXT_EX || ",";
                ElIf (w_c23 = '14') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '14', " || w_PRIMA_DOM_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y2', " || w_PRIMA_DOM_EX || ",";
                ElIf (w_c23 = '18') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '18', " || w_PRIMA_VAC_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y3', " || w_PRIMA_VAC_EX || ",";
                End If;
            Else
                If w_i23 <> 0 Then
                    LET iCont = iCont + 1;
                    LET sValues = TRIM(sValues) || "'"|| w_p23 ||"', '"|| w_c23 ||"', " || w_i23 || ",";
                End If;
            End If;

            If (w_c24 = '09' Or w_c24 = '14' Or w_c24 = '18') Then
                If (w_c24 = '09') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '09', " || w_HORAS_EXT_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y1', " || w_HORAS_EXT_EX || ",";
                ElIf (w_c24 = '14') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '14', " || w_PRIMA_DOM_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y2', " || w_PRIMA_DOM_EX || ",";
                ElIf (w_c24 = '18') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '18', " || w_PRIMA_VAC_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y3', " || w_PRIMA_VAC_EX || ",";
                End If;
            Else
                If w_i24 <> 0 Then
                    LET iCont = iCont + 1;
                    LET sValues = TRIM(sValues) || "'"|| w_p24 ||"', '"|| w_c24 ||"', " || w_i24 || ",";
                End If;
            End If;

            If (w_c25 = '09' Or w_c25 = '14' Or w_c25 = '18') Then
                If (w_c25 = '09') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '09', " || w_HORAS_EXT_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y1', " || w_HORAS_EXT_EX || ",";
                ElIf (w_c25 = '14') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '14', " || w_PRIMA_DOM_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y2', " || w_PRIMA_DOM_EX || ",";
                ElIf (w_c25 = '18') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '18', " || w_PRIMA_VAC_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y3', " || w_PRIMA_VAC_EX || ",";
                End If;
            Else
                If w_i25 <> 0 Then
                    LET iCont = iCont + 1;
                    LET sValues = TRIM(sValues) || "'"|| w_p25 ||"', '"|| w_c25 ||"', " || w_i25 || ",";
                End If;
            End If;

            If (w_c26 = '09' Or w_c26 = '14' Or w_c26 = '18') Then
                If (w_c26 = '09') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '09', " || w_HORAS_EXT_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y1', " || w_HORAS_EXT_EX || ",";
                ElIf (w_c26 = '14') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '14', " || w_PRIMA_DOM_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y2', " || w_PRIMA_DOM_EX || ",";
                ElIf (w_c26 = '18') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '18', " || w_PRIMA_VAC_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y3', " || w_PRIMA_VAC_EX || ",";
                End If;
            Else
                If w_i26 <> 0 Then
                    LET iCont = iCont + 1;
                    LET sValues = TRIM(sValues) || "'"|| w_p26 ||"', '"|| w_c26 ||"', " || w_i26 || ",";
                End If;
            End If;

            If (w_c27 = '09' Or w_c27 = '14' Or w_c27 = '18') Then
                If (w_c27 = '09') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '09', " || w_HORAS_EXT_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y1', " || w_HORAS_EXT_EX || ",";
                ElIf (w_c27 = '14') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '14', " || w_PRIMA_DOM_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y2', " || w_PRIMA_DOM_EX || ",";
                ElIf (w_c27 = '18') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '18', " || w_PRIMA_VAC_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y3', " || w_PRIMA_VAC_EX || ",";
                End If;
            Else
                If w_i27 <> 0 Then
                    LET iCont = iCont + 1;
                    LET sValues = TRIM(sValues) || "'"|| w_p27 ||"', '"|| w_c27 ||"', " || w_i27 || ",";
                End If;
            End If;

            If (w_c28 = '09' Or w_c28 = '14' Or w_c28 = '18') Then
                If (w_c28 = '09') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '09', " || w_HORAS_EXT_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y1', " || w_HORAS_EXT_EX || ",";
                ElIf (w_c28 = '14') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '14', " || w_PRIMA_DOM_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y2', " || w_PRIMA_DOM_EX || ",";
                ElIf (w_c28 = '18') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '18', " || w_PRIMA_VAC_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y3', " || w_PRIMA_VAC_EX || ",";
                End If;
            Else
                If w_i28 <> 0 Then
                    LET iCont = iCont + 1;
                    LET sValues = TRIM(sValues) || "'"|| w_p28 ||"', '"|| w_c28 ||"', " || w_i28 || ",";
                End If;
            End If;

            If (w_c29 = '09' Or w_c29 = '14' Or w_c29 = '18') Then
                If (w_c29 = '09') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '09', " || w_HORAS_EXT_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y1', " || w_HORAS_EXT_EX || ",";
                ElIf (w_c29 = '14') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '14', " || w_PRIMA_DOM_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y2', " || w_PRIMA_DOM_EX || ",";
                ElIf (w_c29 = '18') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '18', " || w_PRIMA_VAC_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y3', " || w_PRIMA_VAC_EX || ",";
                End If;
            Else
                If w_i29 <> 0 Then
                    LET iCont = iCont + 1;
                    LET sValues = TRIM(sValues) || "'"|| w_p29 ||"', '"|| w_c29 ||"', " || w_i29 || ",";
                End If;
            End If;

            If (w_c30 = '09' Or w_c30 = '14' Or w_c30 = '18') Then
                If (w_c30 = '09') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '09', " || w_HORAS_EXT_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y1', " || w_HORAS_EXT_EX || ",";
                ElIf (w_c30 = '14') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '14', " || w_PRIMA_DOM_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y2', " || w_PRIMA_DOM_EX || ",";
                ElIf (w_c30 = '18') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '18', " || w_PRIMA_VAC_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y3', " || w_PRIMA_VAC_EX || ",";
                End If;
            Else
                If w_i30 <> 0 Then
                    LET iCont = iCont + 1;
                    LET sValues = TRIM(sValues) || "'"|| w_p30 ||"', '"|| w_c30 ||"', " || w_i30 || ",";
                End If;
            End If;

            If (w_c31 = '09' Or w_c31 = '14' Or w_c31 = '18') Then
                If (w_c31 = '09') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '09', " || w_HORAS_EXT_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y1', " || w_HORAS_EXT_EX || ",";
                ElIf (w_c31 = '14') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '14', " || w_PRIMA_DOM_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y2', " || w_PRIMA_DOM_EX || ",";
                ElIf (w_c31 = '18') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '18', " || w_PRIMA_VAC_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y3', " || w_PRIMA_VAC_EX || ",";
                End If;
            Else
                If w_i31 <> 0 Then
                    LET iCont = iCont + 1;
                    LET sValues = TRIM(sValues) || "'"|| w_p31 ||"', '"|| w_c31 ||"', " || w_i31 || ",";
                End If;
            End If;

            If (w_c32 = '09' Or w_c32 = '14' Or w_c32 = '18') Then
                If (w_c32 = '09') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '09', " || w_HORAS_EXT_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y1', " || w_HORAS_EXT_EX || ",";
                ElIf (w_c32 = '14') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '14', " || w_PRIMA_DOM_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y2', " || w_PRIMA_DOM_EX || ",";
                ElIf (w_c32 = '18') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '18', " || w_PRIMA_VAC_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y3', " || w_PRIMA_VAC_EX || ",";
                End If;
            Else
                If w_i32 <> 0 Then
                    LET iCont = iCont + 1;
                    LET sValues = TRIM(sValues) || "'"|| w_p32 ||"', '"|| w_c32 ||"', " || w_i32 || ",";
                End If;
            End If;

            If (w_c33 = '09' Or w_c33 = '14' Or w_c33 = '18') Then
                If (w_c33 = '09') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '09', " || w_HORAS_EXT_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y1', " || w_HORAS_EXT_EX || ",";
                ElIf (w_c33 = '14') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '14', " || w_PRIMA_DOM_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y2', " || w_PRIMA_DOM_EX || ",";
                ElIf (w_c33 = '18') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '18', " || w_PRIMA_VAC_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y3', " || w_PRIMA_VAC_EX || ",";
                End If;
            Else
                If w_i33 <> 0 Then
                    LET iCont = iCont + 1;
                    LET sValues = TRIM(sValues) || "'"|| w_p33 ||"', '"|| w_c33 ||"', " || w_i33 || ",";
                End If;
            End If;

            If (w_c34 = '09' Or w_c34 = '14' Or w_c34 = '18') Then
                If (w_c34 = '09') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '09', " || w_HORAS_EXT_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y1', " || w_HORAS_EXT_EX || ",";
                ElIf (w_c34 = '14') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '14', " || w_PRIMA_DOM_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y2', " || w_PRIMA_DOM_EX || ",";
                ElIf (w_c34 = '18') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '18', " || w_PRIMA_VAC_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y3', " || w_PRIMA_VAC_EX || ",";
                End If;
            Else
                If w_i34 <> 0 Then
                    LET iCont = iCont + 1;
                    LET sValues = TRIM(sValues) || "'"|| w_p34 ||"', '"|| w_c34 ||"', " || w_i34 || ",";
                End If;
            End If;

            If (w_c35 = '09' Or w_c35 = '14' Or w_c35 = '18') Then
                If (w_c35 = '09') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '09', " || w_HORAS_EXT_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y1', " || w_HORAS_EXT_EX || ",";
                ElIf (w_c35 = '14') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '14', " || w_PRIMA_DOM_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y2', " || w_PRIMA_DOM_EX || ",";
                ElIf (w_c35 = '18') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '18', " || w_PRIMA_VAC_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y3', " || w_PRIMA_VAC_EX || ",";
                End If;
            Else
                If w_i35 <> 0 Then
                    LET iCont = iCont + 1;
                    LET sValues = TRIM(sValues) || "'"|| w_p35 ||"', '"|| w_c35 ||"', " || w_i35 || ",";
                End If;
            End If;

            If (w_c36 = '09' Or w_c36 = '14' Or w_c36 = '18') Then
                If (w_c36 = '09') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '09', " || w_HORAS_EXT_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y1', " || w_HORAS_EXT_EX || ",";
                ElIf (w_c36 = '14') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '14', " || w_PRIMA_DOM_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y2', " || w_PRIMA_DOM_EX || ",";
                ElIf (w_c36 = '18') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '18', " || w_PRIMA_VAC_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y3', " || w_PRIMA_VAC_EX || ",";
                End If;
            Else
                If w_i36 <> 0 Then
                    LET iCont = iCont + 1;
                    LET sValues = TRIM(sValues) || "'"|| w_p36 ||"', '"|| w_c36 ||"', " || w_i36 || ",";
                End If;
            End If;

            If (w_c37 = '09' Or w_c37 = '14' Or w_c37 = '18') Then
                If (w_c37 = '09') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '09', " || w_HORAS_EXT_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y1', " || w_HORAS_EXT_EX || ",";
                ElIf (w_c37 = '14') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '14', " || w_PRIMA_DOM_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y2', " || w_PRIMA_DOM_EX || ",";
                ElIf (w_c37 = '18') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '18', " || w_PRIMA_VAC_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y3', " || w_PRIMA_VAC_EX || ",";
                End If;
            Else
                If w_i37 <> 0 Then
                    LET iCont = iCont + 1;
                    LET sValues = TRIM(sValues) || "'"|| w_p37 ||"', '"|| w_c37 ||"', " || w_i37 || ",";
                End If;
            End If;

            If (w_c38 = '09' Or w_c38 = '14' Or w_c38 = '18') Then
                If (w_c38 = '09') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '09', " || w_HORAS_EXT_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y1', " || w_HORAS_EXT_EX || ",";
                ElIf (w_c38 = '14') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '14', " || w_PRIMA_DOM_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y2', " || w_PRIMA_DOM_EX || ",";
                ElIf (w_c38 = '18') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '18', " || w_PRIMA_VAC_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y3', " || w_PRIMA_VAC_EX || ",";
                End If;
            Else
                If w_i38 <> 0 Then
                    LET iCont = iCont + 1;
                    LET sValues = TRIM(sValues) || "'"|| w_p38 ||"', '"|| w_c38 ||"', " || w_i38 || ",";
                End If;
            End If;

            If (w_c39 = '09' Or w_c39 = '14' Or w_c39 = '18') Then
                If (w_c39 = '09') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '09', " || w_HORAS_EXT_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y1', " || w_HORAS_EXT_EX || ",";
                ElIf (w_c39 = '14') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '14', " || w_PRIMA_DOM_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y2', " || w_PRIMA_DOM_EX || ",";
                ElIf (w_c39 = '18') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '18', " || w_PRIMA_VAC_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y3', " || w_PRIMA_VAC_EX || ",";
                End If;
            Else
                If w_i39 <> 0 Then
                    LET iCont = iCont + 1;
                    LET sValues = TRIM(sValues) || "'"|| w_p39 ||"', '"|| w_c39 ||"', " || w_i39 || ",";
                End If;
            End If;

            If (w_c40 = '09' Or w_c40 = '14' Or w_c40 = '18') Then
                If (w_c40 = '09') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '09', " || w_HORAS_EXT_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y1', " || w_HORAS_EXT_EX || ",";
                ElIf (w_c40 = '14') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '14', " || w_PRIMA_DOM_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y2', " || w_PRIMA_DOM_EX || ",";
                ElIf (w_c40 = '18') Then
                  LET iCont = iCont + 2;
                  LET sValues = TRIM(sValues) || " 'P', '18', " || w_PRIMA_VAC_GRA || ",";
                  LET sValues = TRIM(sValues) || " 'P', 'Y3', " || w_PRIMA_VAC_EX || ",";
                End If;
            Else
                If w_i40 <> 0 Then
                    LET iCont = iCont + 1;
                    LET sValues = TRIM(sValues) || "'"|| w_p40 ||"', '"|| w_c40 ||"', " || w_i40 || ",";
                End If;
            End If;

            --TRACE 'sValues --->>>' || sValues;
            --TRACE 'iCont --->>>' || iCont;

            WHILE(iCont<40)
              LET sValues = TRIM(sValues) || " '', '', 0, ";
              LET iCont = iCont + 1;
            END WHILE

            --TRACE 'iCont --->>>' || iCont;

            LET sValues = TRIM(sValues);
            --TRACE 'sValues --->>>' || TRIM(sValues);

            Delete From eagg_cosif_timbrado_2022
            Where tipo IN ('0', '1')
                And rfc = _rfc
                And fec_pago = _fec_pago
                And id_empresa <> '02';

            LET sQuery = "Insert Into eagg_cosif_timbrado_2022 (u_version, tipo, rfc, filiacion, nom_emp, "
                || "qna_pago, qna_proc, cpto_p1, tipo_p1, qna_ini1, qna_fin1, impacum_p1, "
                || "cpto_p2, tipo_p2, qna_ini2, qna_fin2, impacum_p2, cpto_p3, tipo_p3, qna_ini3, qna_fin3, impacum_p3, "
                || "cpto_p4, tipo_p4, qna_ini4, qna_fin4, impacum_p4, cpto_p5, tipo_p5, qna_ini5, qna_fin5, impacum_p5, "
                || "cpto_p6, tipo_p6, qna_ini6, qna_fin6, impacum_p6, cpto_p7, tipo_p7, qna_ini7, qna_fin7, impacum_p7, "
                || "cpto_p8, tipo_p8, qna_ini8, qna_fin8, impacum_p8, cpto_p9, tipo_p9, qna_ini9, qna_fin9, impacum_p9, "
                || "cpto_p10, tipo_p10, qna_ini10, qna_fin10, impacum_p10, "
                || "cpto_p11, tipo_p11, qna_ini11, qna_fin11, impacum_p11, "
                || "cpto_p12, tipo_p12, qna_ini12, qna_fin12, impacum_p12, "
                || "adscripcion,  tot_perc_cheque,  tot_ded_cheque,  tot_net_cheque, "
                || "p1,c1,i1, p2,c2,i2, p3,c3,i3, p4,c4,i4, p5,c5,i5, p6,c6,i6, p7,c7,i7, p8,c8,i8, p9,c9,i9, p10,c10,i10, "
                || "p11,c11,i11, p12,c12,i12, p13,c13,i13, p14,c14,i14, p15,c15,i15, p16,c16,i16, p17,c17,i17, p18,c18,i18, p19,c19,i19, p20,c20,i20, "
                || "p21,c21,i21, p22,c22,i22, p23,c23,i23, p24,c24,i24, p25,c25,i25, p26,c26,i26, p27,c27,i27, p28,c28,i28, p29,c29,i29, p30,c30,i30, "
                || "p31,c31,i31, p32,c32,i32, p33,c33,i33, p34,c34,i34, p35,c35,i35, p36,c36,i36, p37,c37,i37, p38,c38,i38, p39,c39,i39, p40,c40,i40, "
                || "num_cheque, cuenta, num_clc, puesto, nivel, sub_nivel, jornada, turno, id_empresa, id_banco, id_tipo_tabulador, "
                || "id_forma_pago, id_div_geografica, num_cons, fec_pago, descripcion, aniocan, archivo, memorandum, quincena, "
                || "mes, anio, ord_ext, id_area_generadora, id_centro_pago, id_tipo_puesto, id_servicio) values ('"
                || _u_version || "', '" || _tipo || "', '" || _rfc || "', '" || _filiacion || "', '" || _nom_emp || "', '"
                || _qna_pago || "', '" || _qna_proc || "', '" || _cpto_p1 || "', '" || _tipo_p1 || "', '" || _qna_ini1 || "', '" || _qna_fin1 || "', " || _impacum_p1 || ", '"
                || _cpto_p2 || "', '" || _tipo_p2 || "', '" || _qna_ini2 || "', '" || _qna_fin2 || "', " || _impacum_p2 || ", '" || _cpto_p3 || "', '" || _tipo_p3 || "', '" || _qna_ini3 || "', '" || _qna_fin3 || "', " || _impacum_p3 || ", '"
                || _cpto_p4 || "', '" || _tipo_p4 || "', '" || _qna_ini4 || "', '" || _qna_fin4 || "', " || _impacum_p4 || ", '" || _cpto_p5 || "', '" || _tipo_p5 || "', '" || _qna_ini5 || "', '" || _qna_fin5 || "', " || _impacum_p5 || ", '"
                || _cpto_p6 || "', '" || _tipo_p6 || "', '" || _qna_ini6 || "', '" || _qna_fin6 || "', " || _impacum_p6 || ", '" || _cpto_p7 || "', '" || _tipo_p7 || "', '" || _qna_ini7 || "', '" || _qna_fin7 || "', " || _impacum_p7 || ", '"
                || _cpto_p8 || "', '" || _tipo_p8 || "', '" || _qna_ini8 || "', '" || _qna_fin8 || "', " || _impacum_p8 || ", '" || _cpto_p9 || "', '" || _tipo_p9 || "', '" || _qna_ini9 || "', '" || _qna_fin9 || "', " || _impacum_p9 || ", '"
                || _cpto_p10 || "', '" || _tipo_p10 || "', '" || _qna_ini10 || "', '" || _qna_fin10 || "', " || _impacum_p10 || ", '"
                || _cpto_p11 || "', '" || _tipo_p11 || "', '" || _qna_ini11 || "', '" || _qna_fin11 || "', " || _impacum_p11 || ", '"
                || _cpto_p12 || "', '" || _tipo_p12 || "', '" || _qna_ini12 || "', '" || _qna_fin12 || "', " || _impacum_p12 || ", '"
                || _adscripcion || "', " || _tot_perc_cheque || ", " || _tot_ded_cheque || ", " || _tot_net_cheque || ", "
                || TRIM(sValues)
                || _num_cheque || ", '" || _cuenta || "', '" || _num_clc || "', '" || _puesto || "', '" || _nivel || "', '" || _sub_nivel || "', '"
                || _jornada || "', '" || _turno || "', '" || _id_empresa || "', '" || _id_banco || "', '" || _id_tipo_tabulador || "', '"
                || _id_forma_pago || "', '" || _id_div_geografica || "', " || _num_cons || ", '" || _fec_pago || "', '" || _descripcion || "', "
                || _aniocan || ", '" || _archivo || "', '" || _memorandum || "', " || _quincena || ", " || _mes || ", " || _anio || ", '" || _ord_ext || "', '"
                || _id_area_generadora || "', '" || _id_centro_pago || "', '" || _id_tipo_puesto || "', '" || _id_servicio || "')";

            --TRACE 'sQuery --->>>' || TRIM(sQuery);
            EXECUTE IMMEDIATE TRIM(sQuery);
          ELSE
              EXIT;
          END IF
      END WHILE
      CLOSE cosif2_cursor;
      FREE stmt_cosif2;
      FREE cosif2_cursor;
    END;
    --trace "_conta = " || _conta;
    RETURN _conta;
END FUNCTION;                                                                                                                           
