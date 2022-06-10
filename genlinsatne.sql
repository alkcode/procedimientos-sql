Drop Function If Exists GenLinSATne;

Create Function GenLinSATne(xemp varchar(6),xp1 varchar(1),xi1 decimal(14,2),xc1 varchar(2),
xi2 decimal(14,2),xc2 varchar(2),wnum_linea integer,xid_empresa varchar(2))
returning int;
-----Programa en modifica para ISSSTE ASEGURADOR ordinaria suma percepciones y deducciones y toma
-----datos de conceptos constantes.
   define xcadenaNOI char(163);
   define xn_concepto varchar(150);
   define xgrav integer;
   define xkey char(03);
   define xtip_perc char(03);
   define ximp_gra decimal(14,2);
   define ximp_exe decimal(14,2);
   define xband, xcons integer;
 
   let xband = 1;
 
   If xband = 1 Then  
      If xi1 < 0 Then
         If xp1='P' Then
            let xp1 = 'D';
         Else
            let xp1 = 'P';
         End If;
         
         let xi1 = (xi1 * (-1));

         Select n_concepto,gravado,sat_tipoperded
         Into xn_concepto,xgrav,xtip_perc
         From cptos_grav_neg
           Where id_concepto=xc1;
              
      Else
            Select n_concepto,gravado,sat_tipoperded
            Into xn_concepto,xgrav,xtip_perc
            From cptos_grav
            Where id_concepto=xc1;
       
      End If;
       
      If xgrav!=0 Then
          let ximp_gra=xi1;
          let ximp_exe=xi2;
      Else
          let ximp_gra=xi2;
          let ximp_exe=xi1;
      End If;
          
      If xp1='P' Then
          let xkey='NPD';
      Else
          let xkey='NDD';
      End If;

      If xn_concepto is null Then
         let xcadenaNOI = 'Error no existe el concepto -' || xc1 || '-';
      Else
         let xcadenaNOI= xkey || '@'|| '@' || xtip_perc || '@' || lpad(xc1,3,'0') || '@' || trim(xn_concepto) || '@' || ximp_gra || '@' || ximp_exe;
         ---insert into verifican values (xemp, xi1, '0', '0');
         ---insert into verifican values (xemp, xi2, '0', '0');
      End If;

      let wnum_linea=wnum_linea+1;
      Insert Into info_satn (num_linea,id_empresa,id_empleado,linea) Values (wnum_linea,xid_empresa,xemp,xcadenaNOI);

   End If;

   return wnum_linea;

End Function; 