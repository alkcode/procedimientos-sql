Select *   --, ISR_meta4 - ISR_registrado_SB
From (
    Select a.rfc id_empleado, a.fec_pago,
        SUM(
        Case When a.c1 in ('53') Then Case When a.i1<0 Then 0 When a.i1 = '' Then 0 When a.i1 IS NULL Then 0 Else a.i1 End Else 0 End +
        Case When a.c2 in ('53') Then Case When a.i2<0 Then 0 When a.i2 = '' Then 0 When a.i2 IS NULL Then 0 Else a.i2 End Else 0 End +
        Case When a.c3 in ('53') Then Case When a.i3<0 Then 0 When a.i3 = '' Then 0 When a.i3 IS NULL Then 0 Else a.i3 End Else 0 End +
        Case When a.c4 in ('53') Then Case When a.i4<0 Then 0 When a.i4 = '' Then 0 When a.i4 IS NULL Then 0 Else a.i4 End Else 0 End +
        Case When a.c5 in ('53') Then Case When a.i5<0 Then 0 When a.i5 = '' Then 0 When a.i5 IS NULL Then 0 Else a.i5 End Else 0 End +
        Case When a.c6 in ('53') Then Case When a.i6<0 Then 0 When a.i6 = '' Then 0 When a.i6 IS NULL Then 0 Else a.i6 End Else 0 End +
        Case When a.c7 in ('53') Then Case When a.i7<0 Then 0 When a.i7 = '' Then 0 When a.i7 IS NULL Then 0 Else a.i7 End Else 0 End +
        Case When a.c8 in ('53') Then Case When a.i8<0 Then 0 When a.i8 = '' Then 0 When a.i8 IS NULL Then 0 Else a.i8 End Else 0 End +
        Case When a.c9 in ('53') Then Case When a.i9<0 Then 0 When a.i9 = '' Then 0 When a.i9 IS NULL Then 0 Else a.i9 End Else 0 End +
        Case When a.c10 in ('53') Then Case When a.i10<0 Then 0 When a.i10 = '' Then 0 When a.i10 IS NULL Then 0 Else a.i10 End Else 0 End +
        Case When a.c11 in ('53') Then Case When a.i11<0 Then 0 When a.i11 = '' Then 0 When a.i11 IS NULL Then 0 Else a.i11 End Else 0 End +
        Case When a.c12 in ('53') Then Case When a.i12<0 Then 0 When a.i12 = '' Then 0 When a.i12 IS NULL Then 0 Else a.i12 End Else 0 End +
        Case When a.c13 in ('53') Then Case When a.i13<0 Then 0 When a.i13 = '' Then 0 When a.i13 IS NULL Then 0 Else a.i13 End Else 0 End +
        Case When a.c14 in ('53') Then Case When a.i14<0 Then 0 When a.i14 = '' Then 0 When a.i14 IS NULL Then 0 Else a.i14 End Else 0 End +
        Case When a.c15 in ('53') Then Case When a.i15<0 Then 0 When a.i15 = '' Then 0 When a.i15 IS NULL Then 0 Else a.i15 End Else 0 End +
        Case When a.c16 in ('53') Then Case When a.i16<0 Then 0 When a.i16 = '' Then 0 When a.i16 IS NULL Then 0 Else a.i16 End Else 0 End +
        Case When a.c17 in ('53') Then Case When a.i17<0 Then 0 When a.i17 = '' Then 0 When a.i17 IS NULL Then 0 Else a.i17 End Else 0 End +
        Case When a.c18 in ('53') Then Case When a.i18<0 Then 0 When a.i18 = '' Then 0 When a.i18 IS NULL Then 0 Else a.i18 End Else 0 End +
        Case When a.c19 in ('53') Then Case When a.i19<0 Then 0 When a.i19 = '' Then 0 When a.i19 IS NULL Then 0 Else a.i19 End Else 0 End +
        Case When a.c20 in ('53') Then Case When a.i20<0 Then 0 When a.i20 = '' Then 0 When a.i20 IS NULL Then 0 Else a.i20 End Else 0 End +
        Case When a.c21 in ('53') Then Case When a.i21<0 Then 0 When a.i21 = '' Then 0 When a.i21 IS NULL Then 0 Else a.i21 End Else 0 End +
        Case When a.c22 in ('53') Then Case When a.i22<0 Then 0 When a.i22 = '' Then 0 When a.i22 IS NULL Then 0 Else a.i22 End Else 0 End +
        Case When a.c23 in ('53') Then Case When a.i23<0 Then 0 When a.i23 = '' Then 0 When a.i23 IS NULL Then 0 Else a.i23 End Else 0 End +
        Case When a.c24 in ('53') Then Case When a.i24<0 Then 0 When a.i24 = '' Then 0 When a.i24 IS NULL Then 0 Else a.i24 End Else 0 End +
        Case When a.c25 in ('53') Then Case When a.i25<0 Then 0 When a.i25 = '' Then 0 When a.i25 IS NULL Then 0 Else a.i25 End Else 0 End +
        Case When a.c26 in ('53') Then Case When a.i26<0 Then 0 When a.i26 = '' Then 0 When a.i26 IS NULL Then 0 Else a.i26 End Else 0 End +
        Case When a.c27 in ('53') Then Case When a.i27<0 Then 0 When a.i27 = '' Then 0 When a.i27 IS NULL Then 0 Else a.i27 End Else 0 End +
        Case When a.c28 in ('53') Then Case When a.i28<0 Then 0 When a.i28 = '' Then 0 When a.i28 IS NULL Then 0 Else a.i28 End Else 0 End +
        Case When a.c29 in ('53') Then Case When a.i29<0 Then 0 When a.i29 = '' Then 0 When a.i29 IS NULL Then 0 Else a.i29 End Else 0 End +
        Case When a.c30 in ('53') Then Case When a.i30<0 Then 0 When a.i30 = '' Then 0 When a.i30 IS NULL Then 0 Else a.i30 End Else 0 End +
        Case When a.c31 in ('53') Then Case When a.i31<0 Then 0 When a.i31 = '' Then 0 When a.i31 IS NULL Then 0 Else a.i31 End Else 0 End +
        Case When a.c32 in ('53') Then Case When a.i32<0 Then 0 When a.i32 = '' Then 0 When a.i32 IS NULL Then 0 Else a.i32 End Else 0 End +
        Case When a.c33 in ('53') Then Case When a.i33<0 Then 0 When a.i33 = '' Then 0 When a.i33 IS NULL Then 0 Else a.i33 End Else 0 End +
        Case When a.c34 in ('53') Then Case When a.i34<0 Then 0 When a.i34 = '' Then 0 When a.i34 IS NULL Then 0 Else a.i34 End Else 0 End +
        Case When a.c35 in ('53') Then Case When a.i35<0 Then 0 When a.i35 = '' Then 0 When a.i35 IS NULL Then 0 Else a.i35 End Else 0 End +
        Case When a.c36 in ('53') Then Case When a.i36<0 Then 0 When a.i36 = '' Then 0 When a.i36 IS NULL Then 0 Else a.i36 End Else 0 End +
        Case When a.c37 in ('53') Then Case When a.i37<0 Then 0 When a.i37 = '' Then 0 When a.i37 IS NULL Then 0 Else a.i37 End Else 0 End +
        Case When a.c38 in ('53') Then Case When a.i38<0 Then 0 When a.i38 = '' Then 0 When a.i38 IS NULL Then 0 Else a.i38 End Else 0 End +
        Case When a.c39 in ('53') Then Case When a.i39<0 Then 0 When a.i39 = '' Then 0 When a.i39 IS NULL Then 0 Else a.i39 End Else 0 End +
        Case When a.c40 in ('53') Then Case When a.i40<0 Then 0 When a.i40 = '' Then 0 When a.i40 IS NULL Then 0 Else a.i40 End Else 0 End ) ISR_meta4
    From cosif_prueba2 a
    Where a.anio='2022'
      And a.quincena='20'
      And a.tipo In ('0','1')
      And a.id_empresa='01'
    Group By a.rfc, a.fec_pago
    Order By fec_pago

) X Left Outer Join (

    Select id_empleado, fechapago fec_pago, 
    Case 
      When imprete = '' Then 0 
      When imprete < 0 Then 0
      When imprete Is Null Then 0
    Else 
      imprete End impuesto
    From timbrado_nomina_2022
    Where qna=20 And anio=2022
    Group by id_empleado, fechapago,impuesto

    UNION
    
    Select num_empleado, fechapago,
    Case 
      When isr = '' Then 0
      When isr < 0 Then 0
      When isr Is Null Then 0
    Else
      isr End isr
    From recibos_sin_timbrar
    Where ejercicio = 2022
    And qna =20
    Group by num_empleado,fechapago, isr

) Y
ON 
  X.id_empleado = Y.id_empleado
  And X.fec_pago = Y.fec_pago
  And X.ISR_meta4 = Y.impuesto;