-----------------------------------------------------------------------------------------------------------------------------------------------------------------
 
------------------------------------------------Paso Número 2 Resultado Totales Nomina Meta4---------------------------------------------------------------------

SELECT a.fec_pago, COUNT(*) Registros, 
    SUM(
        CASE WHEN a.c1 in ('53') THEN CASE WHEN a.i1<0 THEN 0 WHEN a.i1 = '' THEN 0 WHEN a.i1 IS NULL THEN 0 ELSE a.i1 END ELSE 0 END +
        CASE WHEN a.c2 in ('53') THEN CASE WHEN a.i2<0 THEN 0 WHEN a.i2 = '' THEN 0 WHEN a.i2 IS NULL THEN 0 ELSE a.i2 END ELSE 0 END +
        CASE WHEN a.c3 in ('53') THEN CASE WHEN a.i3<0 THEN 0 WHEN a.i3 = '' THEN 0 WHEN a.i3 IS NULL THEN 0 ELSE a.i3 END ELSE 0 END +
        CASE WHEN a.c4 in ('53') THEN CASE WHEN a.i4<0 THEN 0 WHEN a.i4 = '' THEN 0 WHEN a.i4 IS NULL THEN 0 ELSE a.i4 END ELSE 0 END +
        CASE WHEN a.c5 in ('53') THEN CASE WHEN a.i5<0 THEN 0 WHEN a.i5 = '' THEN 0 WHEN a.i5 IS NULL THEN 0 ELSE a.i5 END ELSE 0 END +
        CASE WHEN a.c6 in ('53') THEN CASE WHEN a.i6<0 THEN 0 WHEN a.i6 = '' THEN 0 WHEN a.i6 IS NULL THEN 0 ELSE a.i6 END ELSE 0 END +
        CASE WHEN a.c7 in ('53') THEN CASE WHEN a.i7<0 THEN 0 WHEN a.i7 = '' THEN 0 WHEN a.i7 IS NULL THEN 0 ELSE a.i7 END ELSE 0 END +
        CASE WHEN a.c8 in ('53') THEN CASE WHEN a.i8<0 THEN 0 WHEN a.i8 = '' THEN 0 WHEN a.i8 IS NULL THEN 0 ELSE a.i8 END ELSE 0 END +
        CASE WHEN a.c9 in ('53') THEN CASE WHEN a.i9<0 THEN 0 WHEN a.i9 = '' THEN 0 WHEN a.i9 IS NULL THEN 0 ELSE a.i9 END ELSE 0 END +
        CASE WHEN a.c10 in ('53') THEN CASE WHEN a.i10<0 THEN 0 WHEN a.i10 = '' THEN 0 WHEN a.i10 IS NULL THEN 0 ELSE a.i10 END ELSE 0 END +
        CASE WHEN a.c11 in ('53') THEN CASE WHEN a.i11<0 THEN 0 WHEN a.i11 = '' THEN 0 WHEN a.i11 IS NULL THEN 0 ELSE a.i11 END ELSE 0 END +
        CASE WHEN a.c12 in ('53') THEN CASE WHEN a.i12<0 THEN 0 WHEN a.i12 = '' THEN 0 WHEN a.i12 IS NULL THEN 0 ELSE a.i12 END ELSE 0 END +
        CASE WHEN a.c13 in ('53') THEN CASE WHEN a.i13<0 THEN 0 WHEN a.i13 = '' THEN 0 WHEN a.i13 IS NULL THEN 0 ELSE a.i13 END ELSE 0 END +
        CASE WHEN a.c14 in ('53') THEN CASE WHEN a.i14<0 THEN 0 WHEN a.i14 = '' THEN 0 WHEN a.i14 IS NULL THEN 0 ELSE a.i14 END ELSE 0 END +
        CASE WHEN a.c15 in ('53') THEN CASE WHEN a.i15<0 THEN 0 WHEN a.i15 = '' THEN 0 WHEN a.i15 IS NULL THEN 0 ELSE a.i15 END ELSE 0 END +
        CASE WHEN a.c16 in ('53') THEN CASE WHEN a.i16<0 THEN 0 WHEN a.i16 = '' THEN 0 WHEN a.i16 IS NULL THEN 0 ELSE a.i16 END ELSE 0 END +
        CASE WHEN a.c17 in ('53') THEN CASE WHEN a.i17<0 THEN 0 WHEN a.i17 = '' THEN 0 WHEN a.i17 IS NULL THEN 0 ELSE a.i17 END ELSE 0 END +
        CASE WHEN a.c18 in ('53') THEN CASE WHEN a.i18<0 THEN 0 WHEN a.i18 = '' THEN 0 WHEN a.i18 IS NULL THEN 0 ELSE a.i18 END ELSE 0 END +
        CASE WHEN a.c19 in ('53') THEN CASE WHEN a.i19<0 THEN 0 WHEN a.i19 = '' THEN 0 WHEN a.i19 IS NULL THEN 0 ELSE a.i19 END ELSE 0 END +
        CASE WHEN a.c20 in ('53') THEN CASE WHEN a.i20<0 THEN 0 WHEN a.i20 = '' THEN 0 WHEN a.i20 IS NULL THEN 0 ELSE a.i20 END ELSE 0 END +
        CASE WHEN a.c21 in ('53') THEN CASE WHEN a.i21<0 THEN 0 WHEN a.i21 = '' THEN 0 WHEN a.i21 IS NULL THEN 0 ELSE a.i21 END ELSE 0 END +
        CASE WHEN a.c22 in ('53') THEN CASE WHEN a.i22<0 THEN 0 WHEN a.i22 = '' THEN 0 WHEN a.i22 IS NULL THEN 0 ELSE a.i22 END ELSE 0 END +
        CASE WHEN a.c23 in ('53') THEN CASE WHEN a.i23<0 THEN 0 WHEN a.i23 = '' THEN 0 WHEN a.i23 IS NULL THEN 0 ELSE a.i23 END ELSE 0 END +
        CASE WHEN a.c24 in ('53') THEN CASE WHEN a.i24<0 THEN 0 WHEN a.i24 = '' THEN 0 WHEN a.i24 IS NULL THEN 0 ELSE a.i24 END ELSE 0 END +
        CASE WHEN a.c25 in ('53') THEN CASE WHEN a.i25<0 THEN 0 WHEN a.i25 = '' THEN 0 WHEN a.i25 IS NULL THEN 0 ELSE a.i25 END ELSE 0 END +
        CASE WHEN a.c26 in ('53') THEN CASE WHEN a.i26<0 THEN 0 WHEN a.i26 = '' THEN 0 WHEN a.i26 IS NULL THEN 0 ELSE a.i26 END ELSE 0 END +
        CASE WHEN a.c27 in ('53') THEN CASE WHEN a.i27<0 THEN 0 WHEN a.i27 = '' THEN 0 WHEN a.i27 IS NULL THEN 0 ELSE a.i27 END ELSE 0 END +
        CASE WHEN a.c28 in ('53') THEN CASE WHEN a.i28<0 THEN 0 WHEN a.i28 = '' THEN 0 WHEN a.i28 IS NULL THEN 0 ELSE a.i28 END ELSE 0 END +
        CASE WHEN a.c29 in ('53') THEN CASE WHEN a.i29<0 THEN 0 WHEN a.i29 = '' THEN 0 WHEN a.i29 IS NULL THEN 0 ELSE a.i29 END ELSE 0 END +
        CASE WHEN a.c30 in ('53') THEN CASE WHEN a.i30<0 THEN 0 WHEN a.i30 = '' THEN 0 WHEN a.i30 IS NULL THEN 0 ELSE a.i30 END ELSE 0 END +
        CASE WHEN a.c31 in ('53') THEN CASE WHEN a.i31<0 THEN 0 WHEN a.i31 = '' THEN 0 WHEN a.i31 IS NULL THEN 0 ELSE a.i31 END ELSE 0 END +
        CASE WHEN a.c32 in ('53') THEN CASE WHEN a.i32<0 THEN 0 WHEN a.i32 = '' THEN 0 WHEN a.i32 IS NULL THEN 0 ELSE a.i32 END ELSE 0 END +
        CASE WHEN a.c33 in ('53') THEN CASE WHEN a.i33<0 THEN 0 WHEN a.i33 = '' THEN 0 WHEN a.i33 IS NULL THEN 0 ELSE a.i33 END ELSE 0 END +
        CASE WHEN a.c34 in ('53') THEN CASE WHEN a.i34<0 THEN 0 WHEN a.i34 = '' THEN 0 WHEN a.i34 IS NULL THEN 0 ELSE a.i34 END ELSE 0 END +
        CASE WHEN a.c35 in ('53') THEN CASE WHEN a.i35<0 THEN 0 WHEN a.i35 = '' THEN 0 WHEN a.i35 IS NULL THEN 0 ELSE a.i35 END ELSE 0 END +
        CASE WHEN a.c36 in ('53') THEN CASE WHEN a.i36<0 THEN 0 WHEN a.i36 = '' THEN 0 WHEN a.i36 IS NULL THEN 0 ELSE a.i36 END ELSE 0 END +
        CASE WHEN a.c37 in ('53') THEN CASE WHEN a.i37<0 THEN 0 WHEN a.i37 = '' THEN 0 WHEN a.i37 IS NULL THEN 0 ELSE a.i37 END ELSE 0 END +
        CASE WHEN a.c38 in ('53') THEN CASE WHEN a.i38<0 THEN 0 WHEN a.i38 = '' THEN 0 WHEN a.i38 IS NULL THEN 0 ELSE a.i38 END ELSE 0 END +
        CASE WHEN a.c39 in ('53') THEN CASE WHEN a.i39<0 THEN 0 WHEN a.i39 = '' THEN 0 WHEN a.i39 IS NULL THEN 0 ELSE a.i39 END ELSE 0 END +
        CASE WHEN a.c40 in ('53') THEN CASE WHEN a.i40<0 THEN 0 WHEN a.i40 = '' THEN 0 WHEN a.i40 IS NULL THEN 0 ELSE a.i40 END ELSE 0 END )--ISR_meta4
      From cosif_prueba2 a
      Where a.quincena = '22'
      And a.anio = '2022'
      And a.tipo In (0,1)
      And a.id_empresa = '01'
      And a.impacum_p5 in (1,2,3,5)
      --AND a.fec_pago BETWEEN   AND   
      And a.fec_pago IN('2022-11-30') 
      Group By a.fec_pago--, a.impacum_p5
      Order By a.fec_pago;
      
select * from cosif_timbrado_2022 where rfc = 407986;


 --------------------------------------------------------------------------------------------------------------------------------------------------------
 --------------------------------------------------------  Suma Totales de lo Timbrado   ----------------------------------------------------------------
Select a.fec_pago, Count(*) Registros, Sum(T1.ImpRete) Isr, Sum(T1.Netopago) Neto
  From cosif_prueba2 a
  Inner Join timbrado_nomina_2022 T1 On a.rfc=T1.id_empleado And a.fec_pago=T1.FechaPago 
  Where a.tipo IN (0,1)
    And a.id_empresa = '01'
    --And a.impacum_p5 = 1
    And a.fec_pago In('2022-11-30')
    --And a.impacum_p5 in (1,2,3,5)
    --And a.fec_pago Between '' And ''
    And (T1.estatus Is Null Or T1.estatus='Cancelado') 
    Group By a.fec_pago, a.impacum_p5
    Order By a.fec_pago;


select * from timbrado_nomina_2022 where id_empleado in ('278273', '') and fechapago='2022-11-30'

 ----------------------------------------------------------------------------------------------------------------------------------------------------------------
 ---------------------------------Consulta para Contar Registros que no se timbraron----Ejecutar esta consulta---------------------------------------------------
Select a.fec_pago, Count(*) Registros, 
  Sum(
        CASE WHEN a.c1 in ('53') THEN CASE WHEN a.i1<0 THEN 0 WHEN a.i1 = '' THEN 0 WHEN a.i1 IS NULL THEN 0 ELSE a.i1 END ELSE 0 END +
        CASE WHEN a.c2 in ('53') THEN CASE WHEN a.i2<0 THEN 0 WHEN a.i2 = '' THEN 0 WHEN a.i2 IS NULL THEN 0 ELSE a.i2 END ELSE 0 END +
        CASE WHEN a.c3 in ('53') THEN CASE WHEN a.i3<0 THEN 0 WHEN a.i3 = '' THEN 0 WHEN a.i3 IS NULL THEN 0 ELSE a.i3 END ELSE 0 END +
        CASE WHEN a.c4 in ('53') THEN CASE WHEN a.i4<0 THEN 0 WHEN a.i4 = '' THEN 0 WHEN a.i4 IS NULL THEN 0 ELSE a.i4 END ELSE 0 END +
        CASE WHEN a.c5 in ('53') THEN CASE WHEN a.i5<0 THEN 0 WHEN a.i5 = '' THEN 0 WHEN a.i5 IS NULL THEN 0 ELSE a.i5 END ELSE 0 END +
        CASE WHEN a.c6 in ('53') THEN CASE WHEN a.i6<0 THEN 0 WHEN a.i6 = '' THEN 0 WHEN a.i6 IS NULL THEN 0 ELSE a.i6 END ELSE 0 END +
        CASE WHEN a.c7 in ('53') THEN CASE WHEN a.i7<0 THEN 0 WHEN a.i7 = '' THEN 0 WHEN a.i7 IS NULL THEN 0 ELSE a.i7 END ELSE 0 END +
        CASE WHEN a.c8 in ('53') THEN CASE WHEN a.i8<0 THEN 0 WHEN a.i8 = '' THEN 0 WHEN a.i8 IS NULL THEN 0 ELSE a.i8 END ELSE 0 END +
        CASE WHEN a.c9 in ('53') THEN CASE WHEN a.i9<0 THEN 0 WHEN a.i9 = '' THEN 0 WHEN a.i9 IS NULL THEN 0 ELSE a.i9 END ELSE 0 END +
        CASE WHEN a.c10 in ('53') THEN CASE WHEN a.i10<0 THEN 0 WHEN a.i10 = '' THEN 0 WHEN a.i10 IS NULL THEN 0 ELSE a.i10 END ELSE 0 END +
        CASE WHEN a.c11 in ('53') THEN CASE WHEN a.i11<0 THEN 0 WHEN a.i11 = '' THEN 0 WHEN a.i11 IS NULL THEN 0 ELSE a.i11 END ELSE 0 END +
        CASE WHEN a.c12 in ('53') THEN CASE WHEN a.i12<0 THEN 0 WHEN a.i12 = '' THEN 0 WHEN a.i12 IS NULL THEN 0 ELSE a.i12 END ELSE 0 END +
        CASE WHEN a.c13 in ('53') THEN CASE WHEN a.i13<0 THEN 0 WHEN a.i13 = '' THEN 0 WHEN a.i13 IS NULL THEN 0 ELSE a.i13 END ELSE 0 END +
        CASE WHEN a.c14 in ('53') THEN CASE WHEN a.i14<0 THEN 0 WHEN a.i14 = '' THEN 0 WHEN a.i14 IS NULL THEN 0 ELSE a.i14 END ELSE 0 END +
        CASE WHEN a.c15 in ('53') THEN CASE WHEN a.i15<0 THEN 0 WHEN a.i15 = '' THEN 0 WHEN a.i15 IS NULL THEN 0 ELSE a.i15 END ELSE 0 END +
        CASE WHEN a.c16 in ('53') THEN CASE WHEN a.i16<0 THEN 0 WHEN a.i16 = '' THEN 0 WHEN a.i16 IS NULL THEN 0 ELSE a.i16 END ELSE 0 END +
        CASE WHEN a.c17 in ('53') THEN CASE WHEN a.i17<0 THEN 0 WHEN a.i17 = '' THEN 0 WHEN a.i17 IS NULL THEN 0 ELSE a.i17 END ELSE 0 END +
        CASE WHEN a.c18 in ('53') THEN CASE WHEN a.i18<0 THEN 0 WHEN a.i18 = '' THEN 0 WHEN a.i18 IS NULL THEN 0 ELSE a.i18 END ELSE 0 END +
        CASE WHEN a.c19 in ('53') THEN CASE WHEN a.i19<0 THEN 0 WHEN a.i19 = '' THEN 0 WHEN a.i19 IS NULL THEN 0 ELSE a.i19 END ELSE 0 END +
        CASE WHEN a.c20 in ('53') THEN CASE WHEN a.i20<0 THEN 0 WHEN a.i20 = '' THEN 0 WHEN a.i20 IS NULL THEN 0 ELSE a.i20 END ELSE 0 END +
        CASE WHEN a.c21 in ('53') THEN CASE WHEN a.i21<0 THEN 0 WHEN a.i21 = '' THEN 0 WHEN a.i21 IS NULL THEN 0 ELSE a.i21 END ELSE 0 END +
        CASE WHEN a.c22 in ('53') THEN CASE WHEN a.i22<0 THEN 0 WHEN a.i22 = '' THEN 0 WHEN a.i22 IS NULL THEN 0 ELSE a.i22 END ELSE 0 END +
        CASE WHEN a.c23 in ('53') THEN CASE WHEN a.i23<0 THEN 0 WHEN a.i23 = '' THEN 0 WHEN a.i23 IS NULL THEN 0 ELSE a.i23 END ELSE 0 END +
        CASE WHEN a.c24 in ('53') THEN CASE WHEN a.i24<0 THEN 0 WHEN a.i24 = '' THEN 0 WHEN a.i24 IS NULL THEN 0 ELSE a.i24 END ELSE 0 END +
        CASE WHEN a.c25 in ('53') THEN CASE WHEN a.i25<0 THEN 0 WHEN a.i25 = '' THEN 0 WHEN a.i25 IS NULL THEN 0 ELSE a.i25 END ELSE 0 END +
        CASE WHEN a.c26 in ('53') THEN CASE WHEN a.i26<0 THEN 0 WHEN a.i26 = '' THEN 0 WHEN a.i26 IS NULL THEN 0 ELSE a.i26 END ELSE 0 END +
        CASE WHEN a.c27 in ('53') THEN CASE WHEN a.i27<0 THEN 0 WHEN a.i27 = '' THEN 0 WHEN a.i27 IS NULL THEN 0 ELSE a.i27 END ELSE 0 END +
        CASE WHEN a.c28 in ('53') THEN CASE WHEN a.i28<0 THEN 0 WHEN a.i28 = '' THEN 0 WHEN a.i28 IS NULL THEN 0 ELSE a.i28 END ELSE 0 END +
        CASE WHEN a.c29 in ('53') THEN CASE WHEN a.i29<0 THEN 0 WHEN a.i29 = '' THEN 0 WHEN a.i29 IS NULL THEN 0 ELSE a.i29 END ELSE 0 END +
        CASE WHEN a.c30 in ('53') THEN CASE WHEN a.i30<0 THEN 0 WHEN a.i30 = '' THEN 0 WHEN a.i30 IS NULL THEN 0 ELSE a.i30 END ELSE 0 END +
        CASE WHEN a.c31 in ('53') THEN CASE WHEN a.i31<0 THEN 0 WHEN a.i31 = '' THEN 0 WHEN a.i31 IS NULL THEN 0 ELSE a.i31 END ELSE 0 END +
        CASE WHEN a.c32 in ('53') THEN CASE WHEN a.i32<0 THEN 0 WHEN a.i32 = '' THEN 0 WHEN a.i32 IS NULL THEN 0 ELSE a.i32 END ELSE 0 END +
        CASE WHEN a.c33 in ('53') THEN CASE WHEN a.i33<0 THEN 0 WHEN a.i33 = '' THEN 0 WHEN a.i33 IS NULL THEN 0 ELSE a.i33 END ELSE 0 END +
        CASE WHEN a.c34 in ('53') THEN CASE WHEN a.i34<0 THEN 0 WHEN a.i34 = '' THEN 0 WHEN a.i34 IS NULL THEN 0 ELSE a.i34 END ELSE 0 END +
        CASE WHEN a.c35 in ('53') THEN CASE WHEN a.i35<0 THEN 0 WHEN a.i35 = '' THEN 0 WHEN a.i35 IS NULL THEN 0 ELSE a.i35 END ELSE 0 END +
        CASE WHEN a.c36 in ('53') THEN CASE WHEN a.i36<0 THEN 0 WHEN a.i36 = '' THEN 0 WHEN a.i36 IS NULL THEN 0 ELSE a.i36 END ELSE 0 END +
        CASE WHEN a.c37 in ('53') THEN CASE WHEN a.i37<0 THEN 0 WHEN a.i37 = '' THEN 0 WHEN a.i37 IS NULL THEN 0 ELSE a.i37 END ELSE 0 END +
        CASE WHEN a.c38 in ('53') THEN CASE WHEN a.i38<0 THEN 0 WHEN a.i38 = '' THEN 0 WHEN a.i38 IS NULL THEN 0 ELSE a.i38 END ELSE 0 END +
        CASE WHEN a.c39 in ('53') THEN CASE WHEN a.i39<0 THEN 0 WHEN a.i39 = '' THEN 0 WHEN a.i39 IS NULL THEN 0 ELSE a.i39 END ELSE 0 END +
        CASE WHEN a.c40 in ('53') THEN CASE WHEN a.i40<0 THEN 0 WHEN a.i40 = '' THEN 0 WHEN a.i40 IS NULL THEN 0 ELSE a.i40 END ELSE 0 END ) ISR_meta4
  From cosif_prueba2 a
  Left Outer Join timbrado_nomina_2022 T1 On a.rfc=T1.id_Empleado And a.fec_pago=t1.fechapago
    Where a.tipo IN (0,1) 
    And a.id_empresa = '01'
    And a.fec_pago In('2022-11-30')
    --And a.impacum_p5 in (1,2,3,5)
    --And a.fec_pago BETWEEN '' AND '' 
    And T1.UUID Is Null 
    Group By a.fec_pago, a.impacum_p5
    Order By a.fec_pago;




----------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------
-------------------------2.1 Consulta para mostrar los registros que no se timbraron a nivel Detalle------------------------------------------
Select a.rfc,
 Sum(
        CASE WHEN a.c1 in ('53') THEN CASE WHEN a.i1<0 THEN 0 WHEN a.i1 = '' THEN 0 WHEN a.i1 IS NULL THEN 0 ELSE a.i1 END ELSE 0 END +
        CASE WHEN a.c2 in ('53') THEN CASE WHEN a.i2<0 THEN 0 WHEN a.i2 = '' THEN 0 WHEN a.i2 IS NULL THEN 0 ELSE a.i2 END ELSE 0 END +
        CASE WHEN a.c3 in ('53') THEN CASE WHEN a.i3<0 THEN 0 WHEN a.i3 = '' THEN 0 WHEN a.i3 IS NULL THEN 0 ELSE a.i3 END ELSE 0 END +
        CASE WHEN a.c4 in ('53') THEN CASE WHEN a.i4<0 THEN 0 WHEN a.i4 = '' THEN 0 WHEN a.i4 IS NULL THEN 0 ELSE a.i4 END ELSE 0 END +
        CASE WHEN a.c5 in ('53') THEN CASE WHEN a.i5<0 THEN 0 WHEN a.i5 = '' THEN 0 WHEN a.i5 IS NULL THEN 0 ELSE a.i5 END ELSE 0 END +
        CASE WHEN a.c6 in ('53') THEN CASE WHEN a.i6<0 THEN 0 WHEN a.i6 = '' THEN 0 WHEN a.i6 IS NULL THEN 0 ELSE a.i6 END ELSE 0 END +
        CASE WHEN a.c7 in ('53') THEN CASE WHEN a.i7<0 THEN 0 WHEN a.i7 = '' THEN 0 WHEN a.i7 IS NULL THEN 0 ELSE a.i7 END ELSE 0 END +
        CASE WHEN a.c8 in ('53') THEN CASE WHEN a.i8<0 THEN 0 WHEN a.i8 = '' THEN 0 WHEN a.i8 IS NULL THEN 0 ELSE a.i8 END ELSE 0 END +
        CASE WHEN a.c9 in ('53') THEN CASE WHEN a.i9<0 THEN 0 WHEN a.i9 = '' THEN 0 WHEN a.i9 IS NULL THEN 0 ELSE a.i9 END ELSE 0 END +
        CASE WHEN a.c10 in ('53') THEN CASE WHEN a.i10<0 THEN 0 WHEN a.i10 = '' THEN 0 WHEN a.i10 IS NULL THEN 0 ELSE a.i10 END ELSE 0 END +
        CASE WHEN a.c11 in ('53') THEN CASE WHEN a.i11<0 THEN 0 WHEN a.i11 = '' THEN 0 WHEN a.i11 IS NULL THEN 0 ELSE a.i11 END ELSE 0 END +
        CASE WHEN a.c12 in ('53') THEN CASE WHEN a.i12<0 THEN 0 WHEN a.i12 = '' THEN 0 WHEN a.i12 IS NULL THEN 0 ELSE a.i12 END ELSE 0 END +
        CASE WHEN a.c13 in ('53') THEN CASE WHEN a.i13<0 THEN 0 WHEN a.i13 = '' THEN 0 WHEN a.i13 IS NULL THEN 0 ELSE a.i13 END ELSE 0 END +
        CASE WHEN a.c14 in ('53') THEN CASE WHEN a.i14<0 THEN 0 WHEN a.i14 = '' THEN 0 WHEN a.i14 IS NULL THEN 0 ELSE a.i14 END ELSE 0 END +
        CASE WHEN a.c15 in ('53') THEN CASE WHEN a.i15<0 THEN 0 WHEN a.i15 = '' THEN 0 WHEN a.i15 IS NULL THEN 0 ELSE a.i15 END ELSE 0 END +
        CASE WHEN a.c16 in ('53') THEN CASE WHEN a.i16<0 THEN 0 WHEN a.i16 = '' THEN 0 WHEN a.i16 IS NULL THEN 0 ELSE a.i16 END ELSE 0 END +
        CASE WHEN a.c17 in ('53') THEN CASE WHEN a.i17<0 THEN 0 WHEN a.i17 = '' THEN 0 WHEN a.i17 IS NULL THEN 0 ELSE a.i17 END ELSE 0 END +
        CASE WHEN a.c18 in ('53') THEN CASE WHEN a.i18<0 THEN 0 WHEN a.i18 = '' THEN 0 WHEN a.i18 IS NULL THEN 0 ELSE a.i18 END ELSE 0 END +
        CASE WHEN a.c19 in ('53') THEN CASE WHEN a.i19<0 THEN 0 WHEN a.i19 = '' THEN 0 WHEN a.i19 IS NULL THEN 0 ELSE a.i19 END ELSE 0 END +
        CASE WHEN a.c20 in ('53') THEN CASE WHEN a.i20<0 THEN 0 WHEN a.i20 = '' THEN 0 WHEN a.i20 IS NULL THEN 0 ELSE a.i20 END ELSE 0 END +
        CASE WHEN a.c21 in ('53') THEN CASE WHEN a.i21<0 THEN 0 WHEN a.i21 = '' THEN 0 WHEN a.i21 IS NULL THEN 0 ELSE a.i21 END ELSE 0 END +
        CASE WHEN a.c22 in ('53') THEN CASE WHEN a.i22<0 THEN 0 WHEN a.i22 = '' THEN 0 WHEN a.i22 IS NULL THEN 0 ELSE a.i22 END ELSE 0 END +
        CASE WHEN a.c23 in ('53') THEN CASE WHEN a.i23<0 THEN 0 WHEN a.i23 = '' THEN 0 WHEN a.i23 IS NULL THEN 0 ELSE a.i23 END ELSE 0 END +
        CASE WHEN a.c24 in ('53') THEN CASE WHEN a.i24<0 THEN 0 WHEN a.i24 = '' THEN 0 WHEN a.i24 IS NULL THEN 0 ELSE a.i24 END ELSE 0 END +
        CASE WHEN a.c25 in ('53') THEN CASE WHEN a.i25<0 THEN 0 WHEN a.i25 = '' THEN 0 WHEN a.i25 IS NULL THEN 0 ELSE a.i25 END ELSE 0 END +
        CASE WHEN a.c26 in ('53') THEN CASE WHEN a.i26<0 THEN 0 WHEN a.i26 = '' THEN 0 WHEN a.i26 IS NULL THEN 0 ELSE a.i26 END ELSE 0 END +
        CASE WHEN a.c27 in ('53') THEN CASE WHEN a.i27<0 THEN 0 WHEN a.i27 = '' THEN 0 WHEN a.i27 IS NULL THEN 0 ELSE a.i27 END ELSE 0 END +
        CASE WHEN a.c28 in ('53') THEN CASE WHEN a.i28<0 THEN 0 WHEN a.i28 = '' THEN 0 WHEN a.i28 IS NULL THEN 0 ELSE a.i28 END ELSE 0 END +
        CASE WHEN a.c29 in ('53') THEN CASE WHEN a.i29<0 THEN 0 WHEN a.i29 = '' THEN 0 WHEN a.i29 IS NULL THEN 0 ELSE a.i29 END ELSE 0 END +
        CASE WHEN a.c30 in ('53') THEN CASE WHEN a.i30<0 THEN 0 WHEN a.i30 = '' THEN 0 WHEN a.i30 IS NULL THEN 0 ELSE a.i30 END ELSE 0 END +
        CASE WHEN a.c31 in ('53') THEN CASE WHEN a.i31<0 THEN 0 WHEN a.i31 = '' THEN 0 WHEN a.i31 IS NULL THEN 0 ELSE a.i31 END ELSE 0 END +
        CASE WHEN a.c32 in ('53') THEN CASE WHEN a.i32<0 THEN 0 WHEN a.i32 = '' THEN 0 WHEN a.i32 IS NULL THEN 0 ELSE a.i32 END ELSE 0 END +
        CASE WHEN a.c33 in ('53') THEN CASE WHEN a.i33<0 THEN 0 WHEN a.i33 = '' THEN 0 WHEN a.i33 IS NULL THEN 0 ELSE a.i33 END ELSE 0 END +
        CASE WHEN a.c34 in ('53') THEN CASE WHEN a.i34<0 THEN 0 WHEN a.i34 = '' THEN 0 WHEN a.i34 IS NULL THEN 0 ELSE a.i34 END ELSE 0 END +
        CASE WHEN a.c35 in ('53') THEN CASE WHEN a.i35<0 THEN 0 WHEN a.i35 = '' THEN 0 WHEN a.i35 IS NULL THEN 0 ELSE a.i35 END ELSE 0 END +
        CASE WHEN a.c36 in ('53') THEN CASE WHEN a.i36<0 THEN 0 WHEN a.i36 = '' THEN 0 WHEN a.i36 IS NULL THEN 0 ELSE a.i36 END ELSE 0 END +
        CASE WHEN a.c37 in ('53') THEN CASE WHEN a.i37<0 THEN 0 WHEN a.i37 = '' THEN 0 WHEN a.i37 IS NULL THEN 0 ELSE a.i37 END ELSE 0 END +
        CASE WHEN a.c38 in ('53') THEN CASE WHEN a.i38<0 THEN 0 WHEN a.i38 = '' THEN 0 WHEN a.i38 IS NULL THEN 0 ELSE a.i38 END ELSE 0 END +
        CASE WHEN a.c39 in ('53') THEN CASE WHEN a.i39<0 THEN 0 WHEN a.i39 = '' THEN 0 WHEN a.i39 IS NULL THEN 0 ELSE a.i39 END ELSE 0 END +
        CASE WHEN a.c40 in ('53') THEN CASE WHEN a.i40<0 THEN 0 WHEN a.i40 = '' THEN 0 WHEN a.i40 IS NULL THEN 0 ELSE a.i40 END ELSE 0 END ) ISR_meta4,
        Sum(Tot_net_cheque) Neto, a.fec_pago
From cosif_prueba2 a
Left Outer Join timbrado_nomina_2022 T1 On a.rfc=T1.id_Empleado And a.fec_pago=T1.FechaPago
  Where a.tipo IN (0,1) 
  And a.id_empresa = '01'
  And a.fec_pago In('2022-11-30')
  --And a.fec_pago Between '' And ''
  And T1.UUID Is Null
  Group By a.rfc,a.fec_pago;

select * from timbrado_nomina_2022 ;



select count(*) from timbrado_nomina_2022 where estatus is null and fechapago = '2022-11-30';




Select
  Case tipo
     When '1' Then 'EXTRAORDINARIA'
     When '2' Then 'MANDATO JUDICIAL'
     When '3' Then 'PENSION ALIMENTICIA'
     When '4' Then 'CANCELADAS'    
  End nomina,
  Case impacum_p5
     When '01' Then 'PRESUPUESTAL'
     When '02' Then 'TEMPORAL'
     When '03' Then 'COVID'
     When '04' Then 'TMPENSIONISSSTE'
     When '05' Then 'HONORARIOS'
  End typo,
  Case id_empresa
     When '01' Then 'ISSSTE ASEGURADOR'
     When '02' Then 'SUPERISSSTE'
     When '03' Then 'TURISSSTE'
     When '04' Then 'FOVISSSTE'
     When '05' Then 'PENSIONISSSTE'
  End empresa, 
  perc_ded, concepto, count(concepto) registros, n_concepto, SUM(importe)
  From cosif_prueba2 m, cosifdetalled d, m4t_conceptos_nomina c
  Where m.num_cons = d.num_cons
    And d.concepto = c.id_concepto
    And c.id_ordinal = 1
    And m.impacum_p5 In (0,1,2,3,5)
    And fec_pago = '2022/12/31' --Between '2022/03/10' and '2022/03/13'
    And tipo IN ('0', '1')
    And concepto in ('53','IA')
--and tipo = '2'
  Group by nomina, typo, empresa, perc_ded, concepto, n_concepto
  Order by 2,3,4 desc,5 asc,1;


SELECT 
        m4_acumulado_rl1.id_empresa,
        m4_acumulado_rl.id_tipo_plaza,
        sum(m4_acumulado_rl.ISPT),
        sum(m4_acumulado_rl.ISR_AGUIN)
       FROM
        m4t_acumulado_rl_2011 m4_acumulado_rl,
        m4t_acumulado_rl1_2011 m4_acumulado_rl1
       WHERE
        m4_acumulado_rl.id_sociedad=m4_acumulado_rl1.id_sociedad AND
        m4_acumulado_rl.id_empleado=m4_acumulado_rl1.id_empleado AND
        m4_acumulado_rl.fec_alta_empleado=m4_acumulado_rl1.fec_alta_empleado AND
        m4_acumulado_rl.fec_imputacion=m4_acumulado_rl1.fec_imputacion AND
        m4_acumulado_rl.fec_pago=m4_acumulado_rl1.fec_pago AND
        m4_acumulado_rl.fec_pago = "2022/11/30" and
        m4_acumulado_rl1.id_empresa = '01' and
        m4_acumulado_rl1.id_empleado In('407986')
group by 1,2;


----------------------------------------------------------------------------------------------------------------------------------------------------

Select *  
    From ( 
    Select Count(*) registros_Meta4, a.fec_pago fec_pago_proceso, 
    Sum( 
        Case When a.c1 in ('53') Then Case When a.i1<0 Then 0 When a.i1 = '' Then 0 When a.i1 Is Null Then 0 Else a.i1 End Else 0 End +  
        Case When a.c2 in ('53') Then Case When a.i2<0 Then 0 When a.i2 = '' Then 0 When a.i2 Is Null Then 0 Else a.i2 End Else 0 End +  
        Case When a.c3 in ('53') Then Case When a.i3<0 Then 0 When a.i3 = '' Then 0 When a.i3 Is Null Then 0 Else a.i3 End Else 0 End +  
        Case When a.c4 in ('53') Then Case When a.i4<0 Then 0 When a.i4 = '' Then 0 When a.i4 Is Null Then 0 Else a.i4 End Else 0 End +  
        Case When a.c5 in ('53') Then Case When a.i5<0 Then 0 When a.i5 = '' Then 0 When a.i5 Is Null Then 0 Else a.i5 End Else 0 End +  
        Case When a.c6 in ('53') Then Case When a.i6<0 Then 0 When a.i6 = '' Then 0 When a.i6 Is Null Then 0 Else a.i6 End Else 0 End +  
        Case When a.c7 in ('53') Then Case When a.i7<0 Then 0 When a.i7 = '' Then 0 When a.i7 Is Null Then 0 Else a.i7 End Else 0 End +  
        Case When a.c8 in ('53') Then Case When a.i8<0 Then 0 When a.i8 = '' Then 0 When a.i8 Is Null Then 0 Else a.i8 End Else 0 End +  
        Case When a.c9 in ('53') Then Case When a.i9<0 Then 0 When a.i9 = '' Then 0 When a.i9 Is Null Then 0 Else a.i9 End Else 0 End +  
        Case When a.c10 in ('53') Then Case When a.i10<0 Then 0 When a.i10 = '' Then 0 When a.i10 Is Null Then 0 Else a.i10 End Else 0 End +  
        Case When a.c11 in ('53') Then Case When a.i11<0 Then 0 When a.i11 = '' Then 0 When a.i11 Is Null Then 0 Else a.i11 End Else 0 End +  
        Case When a.c12 in ('53') Then Case When a.i12<0 Then 0 When a.i12 = '' Then 0 When a.i12 Is Null Then 0 Else a.i12 End Else 0 End +  
        Case When a.c13 in ('53') Then Case When a.i13<0 Then 0 When a.i13 = '' Then 0 When a.i13 Is Null Then 0 Else a.i13 End Else 0 End +  
        Case When a.c14 in ('53') Then Case When a.i14<0 Then 0 When a.i14 = '' Then 0 When a.i14 Is Null Then 0 Else a.i14 End Else 0 End +  
        Case When a.c15 in ('53') Then Case When a.i15<0 Then 0 When a.i15 = '' Then 0 When a.i15 Is Null Then 0 Else a.i15 End Else 0 End +  
        Case When a.c16 in ('53') Then Case When a.i16<0 Then 0 When a.i16 = '' Then 0 When a.i16 Is Null Then 0 Else a.i16 End Else 0 End +  
        Case When a.c17 in ('53') Then Case When a.i17<0 Then 0 When a.i17 = '' Then 0 When a.i17 Is Null Then 0 Else a.i17 End Else 0 End +  
        Case When a.c18 in ('53') Then Case When a.i18<0 Then 0 When a.i18 = '' Then 0 When a.i18 Is Null Then 0 Else a.i18 End Else 0 End +  
        Case When a.c19 in ('53') Then Case When a.i19<0 Then 0 When a.i19 = '' Then 0 When a.i19 Is Null Then 0 Else a.i19 End Else 0 End +  
        Case When a.c20 in ('53') Then Case When a.i20<0 Then 0 When a.i20 = '' Then 0 When a.i20 Is Null Then 0 Else a.i20 End Else 0 End +  
        Case When a.c21 in ('53') Then Case When a.i21<0 Then 0 When a.i21 = '' Then 0 When a.i21 Is Null Then 0 Else a.i21 End Else 0 End +  
        Case When a.c22 in ('53') Then Case When a.i22<0 Then 0 When a.i22 = '' Then 0 When a.i22 Is Null Then 0 Else a.i22 End Else 0 End +  
        Case When a.c23 in ('53') Then Case When a.i23<0 Then 0 When a.i23 = '' Then 0 When a.i23 Is Null Then 0 Else a.i23 End Else 0 End +  
        Case When a.c24 in ('53') Then Case When a.i24<0 Then 0 When a.i24 = '' Then 0 When a.i24 Is Null Then 0 Else a.i24 End Else 0 End +  
        Case When a.c25 in ('53') Then Case When a.i25<0 Then 0 When a.i25 = '' Then 0 When a.i25 Is Null Then 0 Else a.i25 End Else 0 End +  
        Case When a.c26 in ('53') Then Case When a.i26<0 Then 0 When a.i26 = '' Then 0 When a.i26 Is Null Then 0 Else a.i26 End Else 0 End +  
        Case When a.c27 in ('53') Then Case When a.i27<0 Then 0 When a.i27 = '' Then 0 When a.i27 Is Null Then 0 Else a.i27 End Else 0 End +  
        Case When a.c28 in ('53') Then Case When a.i28<0 Then 0 When a.i28 = '' Then 0 When a.i28 Is Null Then 0 Else a.i28 End Else 0 End +  
        Case When a.c29 in ('53') Then Case When a.i29<0 Then 0 When a.i29 = '' Then 0 When a.i29 Is Null Then 0 Else a.i29 End Else 0 End +  
        Case When a.c30 in ('53') Then Case When a.i30<0 Then 0 When a.i30 = '' Then 0 When a.i30 Is Null Then 0 Else a.i30 End Else 0 End +  
        Case When a.c31 in ('53') Then Case When a.i31<0 Then 0 When a.i31 = '' Then 0 When a.i31 Is Null Then 0 Else a.i31 End Else 0 End +  
        Case When a.c32 in ('53') Then Case When a.i32<0 Then 0 When a.i32 = '' Then 0 When a.i32 Is Null Then 0 Else a.i32 End Else 0 End +  
        Case When a.c33 in ('53') Then Case When a.i33<0 Then 0 When a.i33 = '' Then 0 When a.i33 Is Null Then 0 Else a.i33 End Else 0 End +  
        Case When a.c34 in ('53') Then Case When a.i34<0 Then 0 When a.i34 = '' Then 0 When a.i34 Is Null Then 0 Else a.i34 End Else 0 End +  
        Case When a.c35 in ('53') Then Case When a.i35<0 Then 0 When a.i35 = '' Then 0 When a.i35 Is Null Then 0 Else a.i35 End Else 0 End +  
        Case When a.c36 in ('53') Then Case When a.i36<0 Then 0 When a.i36 = '' Then 0 When a.i36 Is Null Then 0 Else a.i36 End Else 0 End +  
        Case When a.c37 in ('53') Then Case When a.i37<0 Then 0 When a.i37 = '' Then 0 When a.i37 Is Null Then 0 Else a.i37 End Else 0 End +  
        Case When a.c38 in ('53') Then Case When a.i38<0 Then 0 When a.i38 = '' Then 0 When a.i38 Is Null Then 0 Else a.i38 End Else 0 End +  
        Case When a.c39 in ('53') Then Case When a.i39<0 Then 0 When a.i39 = '' Then 0 When a.i39 Is Null Then 0 Else a.i39 End Else 0 End +  
        Case When a.c40 in ('53') Then Case When a.i40<0 Then 0 When a.i40 = '' Then 0 When a.i40 Is Null Then 0 Else a.i40 End Else 0 End ) IsR_meta4,  
    b.isr ISR_registrado_SB, b.registros layout_Recibidos_SB,(count(*) - b.registros) recibos_no_reportados 
    From cosif_prueba2 a, fechas_timbrado_nomina b 
    Where a.anio='2022' 
        And a.quincena= '22' 
        And a.tipo in ('0','1') 
        And a.id_empresa='01' 
        And a.fec_pago = b.fec_pago 
        And a.quincena = b.quincena 
        And a.anio = b.anio 
        Group by 2,4,5 
        Order by a.fec_pago 
    ) A Left Outer Join ( 
    Select a.fec_pago fec_pago_timbrado, Count(*) registros, Sum(T1.ImpRete) Isr 
    From cosif_prueba2 a 
    Inner Join timbrado_nomina_2022 T1 ON a.rfc=T1.ID_EMPLEADO AND a.fec_pago=T1.FECHAPAGO 
    Where a.quincena = '22' 
        And a.anio = '2022' 
        And a.tipo in ('0','1') 
        And a.id_empresa='01' 
        And (T1.ESTATUS IS NULL OR T1.ESTATUS='Cancelado') 
        Group By 1 
        Order By a.fec_pago 
    ) B 
    On A.fec_pago_proceso=B.fec_pago_timbrado 
    Left Outer Join ( 
    Select a.fec_pago fec_pago_cruce, Count(*) registros_no_timbrados, 
    Sum( 
        Case When a.c1 in ('53') Then Case When a.i1<0 Then 0 When a.i1 = '' Then 0 When a.i1 Is Null Then 0 Else a.i1 End Else 0 End +  
        Case When a.c2 in ('53') Then Case When a.i2<0 Then 0 When a.i2 = '' Then 0 When a.i2 Is Null Then 0 Else a.i2 End Else 0 End +  
        Case When a.c3 in ('53') Then Case When a.i3<0 Then 0 When a.i3 = '' Then 0 When a.i3 Is Null Then 0 Else a.i3 End Else 0 End +  
        Case When a.c4 in ('53') Then Case When a.i4<0 Then 0 When a.i4 = '' Then 0 When a.i4 Is Null Then 0 Else a.i4 End Else 0 End +  
        Case When a.c5 in ('53') Then Case When a.i5<0 Then 0 When a.i5 = '' Then 0 When a.i5 Is Null Then 0 Else a.i5 End Else 0 End +  
        Case When a.c6 in ('53') Then Case When a.i6<0 Then 0 When a.i6 = '' Then 0 When a.i6 Is Null Then 0 Else a.i6 End Else 0 End +  
        Case When a.c7 in ('53') Then Case When a.i7<0 Then 0 When a.i7 = '' Then 0 When a.i7 Is Null Then 0 Else a.i7 End Else 0 End +  
        Case When a.c8 in ('53') Then Case When a.i8<0 Then 0 When a.i8 = '' Then 0 When a.i8 Is Null Then 0 Else a.i8 End Else 0 End +  
        Case When a.c9 in ('53') Then Case When a.i9<0 Then 0 When a.i9 = '' Then 0 When a.i9 Is Null Then 0 Else a.i9 End Else 0 End +  
        Case When a.c10 in ('53') Then Case When a.i10<0 Then 0 When a.i10 = '' Then 0 When a.i10 Is Null Then 0 Else a.i10 End Else 0 End +  
        Case When a.c11 in ('53') Then Case When a.i11<0 Then 0 When a.i11 = '' Then 0 When a.i11 Is Null Then 0 Else a.i11 End Else 0 End +  
        Case When a.c12 in ('53') Then Case When a.i12<0 Then 0 When a.i12 = '' Then 0 When a.i12 Is Null Then 0 Else a.i12 End Else 0 End +  
        Case When a.c13 in ('53') Then Case When a.i13<0 Then 0 When a.i13 = '' Then 0 When a.i13 Is Null Then 0 Else a.i13 End Else 0 End +  
        Case When a.c14 in ('53') Then Case When a.i14<0 Then 0 When a.i14 = '' Then 0 When a.i14 Is Null Then 0 Else a.i14 End Else 0 End +  
        Case When a.c15 in ('53') Then Case When a.i15<0 Then 0 When a.i15 = '' Then 0 When a.i15 Is Null Then 0 Else a.i15 End Else 0 End +  
        Case When a.c16 in ('53') Then Case When a.i16<0 Then 0 When a.i16 = '' Then 0 When a.i16 Is Null Then 0 Else a.i16 End Else 0 End +  
        Case When a.c17 in ('53') Then Case When a.i17<0 Then 0 When a.i17 = '' Then 0 When a.i17 Is Null Then 0 Else a.i17 End Else 0 End +  
        Case When a.c18 in ('53') Then Case When a.i18<0 Then 0 When a.i18 = '' Then 0 When a.i18 Is Null Then 0 Else a.i18 End Else 0 End +  
        Case When a.c19 in ('53') Then Case When a.i19<0 Then 0 When a.i19 = '' Then 0 When a.i19 Is Null Then 0 Else a.i19 End Else 0 End +  
        Case When a.c20 in ('53') Then Case When a.i20<0 Then 0 When a.i20 = '' Then 0 When a.i20 Is Null Then 0 Else a.i20 End Else 0 End +  
        Case When a.c21 in ('53') Then Case When a.i21<0 Then 0 When a.i21 = '' Then 0 When a.i21 Is Null Then 0 Else a.i21 End Else 0 End +  
        Case When a.c22 in ('53') Then Case When a.i22<0 Then 0 When a.i22 = '' Then 0 When a.i22 Is Null Then 0 Else a.i22 End Else 0 End +  
        Case When a.c23 in ('53') Then Case When a.i23<0 Then 0 When a.i23 = '' Then 0 When a.i23 Is Null Then 0 Else a.i23 End Else 0 End +  
        Case When a.c24 in ('53') Then Case When a.i24<0 Then 0 When a.i24 = '' Then 0 When a.i24 Is Null Then 0 Else a.i24 End Else 0 End +  
        Case When a.c25 in ('53') Then Case When a.i25<0 Then 0 When a.i25 = '' Then 0 When a.i25 Is Null Then 0 Else a.i25 End Else 0 End +  
        Case When a.c26 in ('53') Then Case When a.i26<0 Then 0 When a.i26 = '' Then 0 When a.i26 Is Null Then 0 Else a.i26 End Else 0 End +  
        Case When a.c27 in ('53') Then Case When a.i27<0 Then 0 When a.i27 = '' Then 0 When a.i27 Is Null Then 0 Else a.i27 End Else 0 End +  
        Case When a.c28 in ('53') Then Case When a.i28<0 Then 0 When a.i28 = '' Then 0 When a.i28 Is Null Then 0 Else a.i28 End Else 0 End +  
        Case When a.c29 in ('53') Then Case When a.i29<0 Then 0 When a.i29 = '' Then 0 When a.i29 Is Null Then 0 Else a.i29 End Else 0 End +  
        Case When a.c30 in ('53') Then Case When a.i30<0 Then 0 When a.i30 = '' Then 0 When a.i30 Is Null Then 0 Else a.i30 End Else 0 End +  
        Case When a.c31 in ('53') Then Case When a.i31<0 Then 0 When a.i31 = '' Then 0 When a.i31 Is Null Then 0 Else a.i31 End Else 0 End +  
        Case When a.c32 in ('53') Then Case When a.i32<0 Then 0 When a.i32 = '' Then 0 When a.i32 Is Null Then 0 Else a.i32 End Else 0 End +  
        Case When a.c33 in ('53') Then Case When a.i33<0 Then 0 When a.i33 = '' Then 0 When a.i33 Is Null Then 0 Else a.i33 End Else 0 End +  
        Case When a.c34 in ('53') Then Case When a.i34<0 Then 0 When a.i34 = '' Then 0 When a.i34 Is Null Then 0 Else a.i34 End Else 0 End +  
        Case When a.c35 in ('53') Then Case When a.i35<0 Then 0 When a.i35 = '' Then 0 When a.i35 Is Null Then 0 Else a.i35 End Else 0 End +  
        Case When a.c36 in ('53') Then Case When a.i36<0 Then 0 When a.i36 = '' Then 0 When a.i36 Is Null Then 0 Else a.i36 End Else 0 End +  
        Case When a.c37 in ('53') Then Case When a.i37<0 Then 0 When a.i37 = '' Then 0 When a.i37 Is Null Then 0 Else a.i37 End Else 0 End +  
        Case When a.c38 in ('53') Then Case When a.i38<0 Then 0 When a.i38 = '' Then 0 When a.i38 Is Null Then 0 Else a.i38 End Else 0 End +  
        Case When a.c39 in ('53') Then Case When a.i39<0 Then 0 When a.i39 = '' Then 0 When a.i39 Is Null Then 0 Else a.i39 End Else 0 End +  
        Case When a.c40 in ('53') Then Case When a.i40<0 Then 0 When a.i40 = '' Then 0 When a.i40 Is Null Then 0 Else a.i40 End Else 0 End ) Isr_no_timbrado 
    From cosif_prueba2 a 
    Left Outer Join timbrado_nomina_2022 T1 
    On a.rfc=T1.id_Empleado 
    And a.fec_pago=t1.fechapago 
    Where a.quincena = '22' 
        And a.anio = '2022' 
        And a.tipo in ('0','1') 
        And a.id_empresa='01' 
        And T1.UUID Is Null 
        Group By 1 
        Order By a.fec_pago 
    ) C 
    On B.fec_pago_timbrado=C.fec_pago_cruce;
