Select
        C.id_empresa, C.rfc[1,6],num_cons,tot_net_cheque,tot_ded_cheque,tot_perc_cheque,trim(nom_emp),id_banco,NVL(cuenta,''),id_div_geografica,
        adscripcion, id_servicio, puesto,
        p1,c1,i1,p2,c2,i2,p3,c3,i3,p4,c4,i4,p5,c5,i5,p6,c6,i6,p7,c7,i7,p8,c8,i8,p9,c9,i9,p10,c10,i10,
        p11,c11,i11,p12,c12,i12,p13,c13,i13,p14,c14,i14,p15,c15,i15,p16,c16,i16,p17,c17,i17,p18,c18,i18,p19,c19,i19,p20,c20,i20,
        p21,c21,i21,p22,c22,i22,p23,c23,i23,p24,c24,i24,p25,c25,i25,p26,c26,i26,p27,c27,i27,p28,c28,i28,p29,c29,i29,p30,c30,i30,
        p31,c31,i31,p32,c32,i32,p33,c33,i33,p34,c34,i34,p35,c35,i35,p36,c36,i36,p37,c37,i37,p38,c38,i38,p39,c39,i39,p40,c40,i40,
        trim(id_c_u_r_p_st),NVL(numero_ss,''),trim(id_legal),
        NVL(trim(apellido_1),' ') ||' '|| NVL(trim(apellido_2),' ') ||' '|| NVL(trim(nombre),' '),
        NVL(n_puesto_plaza, '') n_puesto_plaza, NVL(n_clave_servicio, '') n_clave_servicio, sem_trabajadas, antig_anio, antig_meses, antig_dias,
        NVL(pagaduria, 'ERROR') pagaduria,
        Case
          When cp Is Null And C.id_empresa = '01' Then '06080'
          Else ''
        End cp
      From cosif_timbrado_2022 C
        Left Outer Join m4t_puestos_plaza P
          ON P.id_puesto_plaza = 
            Case C.id_tipo_tabulador
              When 'F' Then Substr(C.puesto,1,2) || Substr(C.puesto,6,10)
              Else C.puesto
            End
          And C.id_empresa = P.id_empresa
        Left Join m4t_clave_servicio S
          ON C.id_servicio = S.id_clave_servicio
           And C.id_empresa = S.id_empresa
        Inner Join m4t_empleados E
          ON C.rfc = E.id_empleado
        Inner Join ramo_ct_tim R
          ON C.adscripcion = R.ct10
        Left Join m4t_domicilios_issste D
          ON D.id_centro_pago = R.pagaduria
        Left Join (
            Select --id_empleado, sum(dias)-sum(dias_descuento) dias_trabajados,
              id_empleado,
              trunc(((sum(dias)-sum(dias_descuento))/7)) sem_trabajadas,
              trunc((sum(dias)-sum(dias_descuento))/365) antig_anio,
              trunc(((sum(dias)-sum(dias_descuento))-trunc((sum(dias)-sum(dias_descuento))/365)*365)/30.4) antig_meses,
              trunc((((sum(dias)-sum(dias_descuento))-trunc((sum(dias)-sum(dias_descuento))/365)*365)/30.4-trunc(((sum(dias)-sum(dias_descuento))-trunc((sum(dias)-sum(dias_descuento))/365)*365)/30.4))*30.4) antig_dias
            From m4_antiguedades
            Where tipo_incidencia <> 'ANTIGUEDAD FEDERAL'
            Group by id_empleado
          ) A
          ON C.rfc = A.id_empleado
      Where fec_pago = wfec_pago
        And C.id_empresa = wempresa
        And tipo =  wtipo
        And (c1<>'26' And c2<>'26' And c3<>'26' And c4<>'26' And c5<>'26' And c6<>'26' And c7<>'26' And c8<>'26' And c9<>'26' And c10<>'26'
        And c11<>'26' And c12<>'26' And c13<>'26' And c14<>'26' And c15<>'26' And c16<>'26' And c17<>'26' And c18<>'26' And c19<>'26' And c20<>'26'
        And c21<>'26' And c22<>'26' And c23<>'26' And c24<>'26' And c25<>'26' And c26<>'26' And c27<>'26' And c28<>'26' And c29<>'26' And c30<>'26'
        And c31<>'26' And c32<>'26' And c33<>'26' And c34<>'26' And c35<>'26' And c36<>'26' And c37<>'26' And c38<>'26' And c39<>'26' And c40<>'26')
        --And C.rfc IN ('212537','161695','202046','357819','406529','309352','355290','407986','367131','246291','403504')
        And C.rfc IN ('158125', '181101', '188183', '204660', '207734', '210854', '213910', '294916', '314354', '357353', '359675', '360077', '369725', '391239', '394276', '396397', '403072', '403166', '404283', '405500', '409802', '410217', '411003', '411789', '411790', '411791', '411792', '502391', '503316')
        order by 2
