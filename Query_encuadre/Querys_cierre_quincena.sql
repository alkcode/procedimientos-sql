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
        CASE WHEN a.c40 in ('53') THEN CASE WHEN a.i40<0 THEN 0 WHEN a.i40 = '' THEN 0 WHEN a.i40 IS NULL THEN 0 ELSE a.i40 END ELSE 0 END ) ISR_meta4
      From cosif_prueba2 a
      Where a.quincena = '20'
      And a.anio = '2022'
      And a.tipo In (0,1)
      And a.id_empresa = '01'
      --AND a.fec_pago BETWEEN   AND   
      And a.fec_pago IN('2022/10/31','2022/10/08','2022/11/01','2022/11/02','2022/11/03') 
      Group By a.fec_pago  
      Order By a.fec_pago ;


 --------------------------------------------------------------------------------------------------------------------------------------------------------
 --------------------------------------------------------  Suma Totales de lo Timbrado   ----------------------------------------------------------------
Select a.fec_pago, Count(*) Registros, Sum(T1.ImpRete) Isr, Sum(T1.Netopago) Neto
  From cosif_prueba2 a
  Inner Join timbrado_nomina_2022 T1 On a.rfc=T1.id_empleado And a.fec_pago=T1.FechaPago 
  Where a.tipo IN (0,1)
    And a.id_empresa = '01'
    And a.fec_pago In('2022-10-08','2022-10-31','2022-10-31','2022-11-01','2022-11-02','2022-11-03')
    --And a.fec_pago Between '' And ''
    And (T1.estatus Is Null Or T1.estatus='Cancelado') 
    Group By a.fec_pago 
    Order By a.fec_pago;




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
    And a.fec_pago In('2022-10-08','2022-10-31','2022-11-01','2022-11-02','2022-11-03')
    --And a.fec_pago BETWEEN '' AND '' 
    And T1.UUID Is Null 
    Group By a.fec_pago
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
  And a.fec_pago In('2022-10-08','2022-10-31','2022-11-01','2022-11-02','2022-11-03')
  --And a.fec_pago Between '' And ''
  And T1.UUID Is Null
  Group By a.rfc,a.fec_pago;


