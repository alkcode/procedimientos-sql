-----------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------Paso Número 2 Resultado Totales Nomina Meta4---------------------------------------------------------------------

SELECT a.fec_pago, COUNT(*) Registros, 
    SUM(
        CASE WHEN a.c2 in ('53') THEN  a.i2 ELSE 0 END + 
        CASE WHEN  a.c3 in ('53') THEN  a.i3 ELSE 0 END + 
        CASE WHEN a.c4 in ('53') THEN  a.i4 ELSE 0 END +
        CASE WHEN a.c5 in ('53') THEN  a.i5 ELSE 0 END + CASE WHEN  a.c6 in ('53') THEN  a.i6 ELSE 0 END + CASE WHEN a.c7 in ('53') THEN  a.i7 ELSE 0 END +
        CASE WHEN a.c8 in ('53') THEN  a.i8 ELSE 0 END + CASE WHEN  a.c9 in ('53') THEN  a.i9 ELSE 0 END + CASE WHEN a.c10 in ('53') THEN a.i10 ELSE 0 END +
        CASE WHEN a.c11 in ('53') THEN a.i11 ELSE 0 END + CASE WHEN a.c12 in ('53') THEN a.i12 ELSE 0 END + CASE WHEN a.c13 in ('53') THEN a.i13 ELSE 0 END +
        CASE WHEN a.c14 in ('53') THEN a.i14 ELSE 0 END + CASE WHEN a.c15 in ('53') THEN a.i15 ELSE 0 END + CASE WHEN a.c16 in ('53') THEN a.i16 ELSE 0 END +
        CASE WHEN a.c17 in ('53') THEN a.i17 ELSE 0 END + CASE WHEN a.c18 in ('53') THEN a.i18 ELSE 0 END + CASE WHEN a.c19 in ('53') THEN a.i19 ELSE 0 END +
        CASE WHEN a.c20 in ('53') THEN a.i20 ELSE 0 END + CASE WHEN a.c21 in ('53') THEN a.i21 ELSE 0 END + CASE WHEN a.c22 in ('53') THEN a.i22 ELSE 0 END +
        CASE WHEN a.c23 in ('53') THEN a.i23 ELSE 0 END + CASE WHEN a.c24 in ('53') THEN a.i24 ELSE 0 END + CASE WHEN a.c25 in ('53') THEN a.i25 ELSE 0 END +
        CASE WHEN a.c26 in ('53') THEN a.i26 ELSE 0 END + CASE WHEN a.c27 in ('53') THEN a.i27 ELSE 0 END + CASE WHEN a.c28 in ('53') THEN a.i28 ELSE 0 END +
        CASE WHEN a.c29 in ('53') THEN a.i29 ELSE 0 END + CASE WHEN a.c30 in ('53') THEN a.i30 ELSE 0 END + CASE WHEN a.c31 in ('53') THEN a.i31 ELSE 0 END +
        CASE WHEN a.c32 in ('53') THEN a.i32 ELSE 0 END + CASE WHEN a.c33 in ('53') THEN a.i33 ELSE 0 END + CASE WHEN a.c34 in ('53') THEN a.i34 ELSE 0 END +
        CASE WHEN a.c35 in ('53') THEN a.i35 ELSE 0 END + CASE WHEN a.c36 in ('53') THEN a.i36 ELSE 0 END + CASE WHEN a.c37 in ('53') THEN a.i37 ELSE 0 END +
        CASE WHEN a.c38 in ('53') THEN a.i38 ELSE 0 END + CASE WHEN a.c39 in ('53') THEN a.i39 ELSE 0 END + CASE WHEN a.c40 in ('53') THEN a.i40 ELSE 0 END ) ISR_meta4
      FROM cosif_prueba2 a
      WHERE a.quincena = '20'
      AND a.anio = '2022'
      AND a.tipo IN (0,1)
      AND a.id_empresa = '01'
      --AND a.fec_pago BETWEEN   AND   
      AND a.fec_pago IN('2022/10/31','2022/10/08','2022/11/01','2022/11/02','2022/11/03') 
      GROUP BY 1 
      ORDER BY fec_pago;


 --------------------------------------------------------------------------------------------------------------------------------------------------------
 --------------------------------------------------------  Suma Totales de lo Timbrado   ----------------------------------------------------------------
Select a.fec_pago, Count(*) Registros, Sum(T1.ImpRete) Isr, Sum(T1.Netopago) Neto
  From cosif_prueba2 a
  Inner Join timbrado_nomina_2022 T1 On a.rfc=T1.id_empleado And a.fec_pago=T1.FechaPago 
  --WHERE T0.fechaPago BETWEEN '2022-10-15' AND '2022-10-18' 
  Where a.fec_pago In('2022-10-08','2022-10-31','2022-10-31','2022-11-01','2022-11-02','2022-11-03')
    AND a.tipo IN (0,1)
    AND a.id_empresa = '01'
    And (T1.estatus Is Null Or T1.estatus='Cancelado') 
    Group By 1 Order By a.fec_pago;


 ----------------------------------------------------------------------------------------------------------------------------------------------------------------
 ---------------------------------Consulta para Contar Registros que no se timbraron----Ejecutar esta consulta---------------------------------------------------
Select a.fec_pago, Count(*) Registros, 
  SUM(
        CASE WHEN a.c2 in ('53') THEN  a.i2 ELSE 0 END + 
        CASE WHEN  a.c3 in ('53') THEN  a.i3 ELSE 0 END + 
        CASE WHEN a.c4 in ('53') THEN  a.i4 ELSE 0 END +
        CASE WHEN a.c5 in ('53') THEN  a.i5 ELSE 0 END + CASE WHEN  a.c6 in ('53') THEN  a.i6 ELSE 0 END + CASE WHEN a.c7 in ('53') THEN  a.i7 ELSE 0 END +
        CASE WHEN a.c8 in ('53') THEN  a.i8 ELSE 0 END + CASE WHEN  a.c9 in ('53') THEN  a.i9 ELSE 0 END + CASE WHEN a.c10 in ('53') THEN a.i10 ELSE 0 END +
        CASE WHEN a.c11 in ('53') THEN a.i11 ELSE 0 END + CASE WHEN a.c12 in ('53') THEN a.i12 ELSE 0 END + CASE WHEN a.c13 in ('53') THEN a.i13 ELSE 0 END +
        CASE WHEN a.c14 in ('53') THEN a.i14 ELSE 0 END + CASE WHEN a.c15 in ('53') THEN a.i15 ELSE 0 END + CASE WHEN a.c16 in ('53') THEN a.i16 ELSE 0 END +
        CASE WHEN a.c17 in ('53') THEN a.i17 ELSE 0 END + CASE WHEN a.c18 in ('53') THEN a.i18 ELSE 0 END + CASE WHEN a.c19 in ('53') THEN a.i19 ELSE 0 END +
        CASE WHEN a.c20 in ('53') THEN a.i20 ELSE 0 END + CASE WHEN a.c21 in ('53') THEN a.i21 ELSE 0 END + CASE WHEN a.c22 in ('53') THEN a.i22 ELSE 0 END +
        CASE WHEN a.c23 in ('53') THEN a.i23 ELSE 0 END + CASE WHEN a.c24 in ('53') THEN a.i24 ELSE 0 END + CASE WHEN a.c25 in ('53') THEN a.i25 ELSE 0 END +
        CASE WHEN a.c26 in ('53') THEN a.i26 ELSE 0 END + CASE WHEN a.c27 in ('53') THEN a.i27 ELSE 0 END + CASE WHEN a.c28 in ('53') THEN a.i28 ELSE 0 END +
        CASE WHEN a.c29 in ('53') THEN a.i29 ELSE 0 END + CASE WHEN a.c30 in ('53') THEN a.i30 ELSE 0 END + CASE WHEN a.c31 in ('53') THEN a.i31 ELSE 0 END +
        CASE WHEN a.c32 in ('53') THEN a.i32 ELSE 0 END + CASE WHEN a.c33 in ('53') THEN a.i33 ELSE 0 END + CASE WHEN a.c34 in ('53') THEN a.i34 ELSE 0 END +
        CASE WHEN a.c35 in ('53') THEN a.i35 ELSE 0 END + CASE WHEN a.c36 in ('53') THEN a.i36 ELSE 0 END + CASE WHEN a.c37 in ('53') THEN a.i37 ELSE 0 END +
        CASE WHEN a.c38 in ('53') THEN a.i38 ELSE 0 END + CASE WHEN a.c39 in ('53') THEN a.i39 ELSE 0 END + CASE WHEN a.c40 in ('53') THEN a.i40 ELSE 0 END ) ISR_meta4
  From cosif_prueba2 a
  Left Outer Join timbrado_nomina_2022 T1 On a.rfc=T1.id_Empleado And a.fec_pago=t1.fechapago
    Where a.fec_pago In('2022-10-08','2022-10-31','2022-11-01','2022-11-02','2022-11-03')
    And a.tipo IN (0,1)
    And a.id_empresa = '01'
    --WHERE a.fec_pago BETWEEN '2022-10-15' AND '2022-10-18' 
    And T1.UUID Is Null 
    Group By a.fec_pago
    Order By a.fec_pago;



----------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------
-------------------------2.1 Consulta para mostrar los registros que no se timbraron a nivel Detalle------------------------------------------
Select a.rfc,
 SUM(
        CASE WHEN a.c2 in ('53') THEN  a.i2 ELSE 0 END + 
        CASE WHEN  a.c3 in ('53') THEN  a.i3 ELSE 0 END + 
        CASE WHEN a.c4 in ('53') THEN  a.i4 ELSE 0 END +
        CASE WHEN a.c5 in ('53') THEN  a.i5 ELSE 0 END + CASE WHEN  a.c6 in ('53') THEN  a.i6 ELSE 0 END + CASE WHEN a.c7 in ('53') THEN  a.i7 ELSE 0 END +
        CASE WHEN a.c8 in ('53') THEN  a.i8 ELSE 0 END + CASE WHEN  a.c9 in ('53') THEN  a.i9 ELSE 0 END + CASE WHEN a.c10 in ('53') THEN a.i10 ELSE 0 END +
        CASE WHEN a.c11 in ('53') THEN a.i11 ELSE 0 END + CASE WHEN a.c12 in ('53') THEN a.i12 ELSE 0 END + CASE WHEN a.c13 in ('53') THEN a.i13 ELSE 0 END +
        CASE WHEN a.c14 in ('53') THEN a.i14 ELSE 0 END + CASE WHEN a.c15 in ('53') THEN a.i15 ELSE 0 END + CASE WHEN a.c16 in ('53') THEN a.i16 ELSE 0 END +
        CASE WHEN a.c17 in ('53') THEN a.i17 ELSE 0 END + CASE WHEN a.c18 in ('53') THEN a.i18 ELSE 0 END + CASE WHEN a.c19 in ('53') THEN a.i19 ELSE 0 END +
        CASE WHEN a.c20 in ('53') THEN a.i20 ELSE 0 END + CASE WHEN a.c21 in ('53') THEN a.i21 ELSE 0 END + CASE WHEN a.c22 in ('53') THEN a.i22 ELSE 0 END +
        CASE WHEN a.c23 in ('53') THEN a.i23 ELSE 0 END + CASE WHEN a.c24 in ('53') THEN a.i24 ELSE 0 END + CASE WHEN a.c25 in ('53') THEN a.i25 ELSE 0 END +
        CASE WHEN a.c26 in ('53') THEN a.i26 ELSE 0 END + CASE WHEN a.c27 in ('53') THEN a.i27 ELSE 0 END + CASE WHEN a.c28 in ('53') THEN a.i28 ELSE 0 END +
        CASE WHEN a.c29 in ('53') THEN a.i29 ELSE 0 END + CASE WHEN a.c30 in ('53') THEN a.i30 ELSE 0 END + CASE WHEN a.c31 in ('53') THEN a.i31 ELSE 0 END +
        CASE WHEN a.c32 in ('53') THEN a.i32 ELSE 0 END + CASE WHEN a.c33 in ('53') THEN a.i33 ELSE 0 END + CASE WHEN a.c34 in ('53') THEN a.i34 ELSE 0 END +
        CASE WHEN a.c35 in ('53') THEN a.i35 ELSE 0 END + CASE WHEN a.c36 in ('53') THEN a.i36 ELSE 0 END + CASE WHEN a.c37 in ('53') THEN a.i37 ELSE 0 END +
        CASE WHEN a.c38 in ('53') THEN a.i38 ELSE 0 END + CASE WHEN a.c39 in ('53') THEN a.i39 ELSE 0 END + CASE WHEN a.c40 in ('53') THEN a.i40 ELSE 0 END ) ISR_meta4,
        Sum(Tot_net_cheque) Neto, a.fec_pago
From cosif_prueba2 a
Left Outer Join timbrado_nomina_2022 T1 On a.rfc=T1.id_Empleado And a.fec_pago=T1.FechaPago
  --Where a.fec_pago Between '2022-08-15' And '2022-08-23'
  Where a.fec_pago In('2022-10-08','2022-10-31','2022-11-01','2022-11-02','2022-11-03')
  And a.tipo IN (0,1)
  And a.id_empresa = '01'
  And T1.UUID Is Null
  Group By a.rfc,a.fec_pago;