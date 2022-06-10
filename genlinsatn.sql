DROP FUNCTION "m4prod".genlinsatn;

create function GenLinSATn(xemp varchar(6),xp1 varchar(1),xi1 decimal(14,2),xc1 varchar(2),
wnum_linea integer,xid_empresa varchar(2)) returning int;
-----Programa en modifica para ISSSTE ASEGURADOR ordinaria suma percepciones y deducciones y toma
-----datos de conceptos constantes.
define xcadenaNOI char(163);
define xn_concepto varchar(150);
define xgrav integer;
define xkey char (03);
define xtip_perc char(03);
define ximp_gra decimal(14,2);
define ximp_exe decimal(14,2);
define xband, xcons integer;
--define ernesto decimal(14,2);

--let ernesto = 0;
--let ernesto = xi1;

    let xband = 1;
 
    if xband = 1 then
         
       if xi1 < 0 then
       
          if xp1='P' then
             --let xp1 = 'D';
             let xp1 = 'P';
          else
             --let xp1 = 'P';
             let xp1 = 'D';
          end if;
          
          let xi1 = (xi1 * (-1));

          select n_concepto,gravado,sat_tipoperded
            into xn_concepto,xgrav,xtip_perc
            from cptos_grav_neg
            where id_concepto=xc1;
              
       else
          
          select n_concepto,gravado,sat_tipoperded
             into xn_concepto,xgrav,xtip_perc
             from cptos_grav
             where id_concepto=xc1;
       
       end if;
       
       if xgrav!=0 then
          let ximp_gra=xi1;
          let ximp_exe=0.0;
       else
          let ximp_gra=0.0;
          let ximp_exe=xi1;
       end if;
          
       --if xp1='D' and ernesto <= 0  then
       if xp1='P' then
          let xkey='NPD';
       else
          let xkey='NDD';
       end if;

       if xn_concepto is null then
          let xcadenaNOI = 'Error no existe el concepto -' || xc1 || '-';
       else
         
         if xp1 = 'P' then
            let xcadenaNOI= xkey || '@' || '@' || xtip_perc || '@' || lpad(xc1,3,'0') || '@' ||trim(xn_concepto) || '@' || ximp_gra || '@' || ximp_exe;
            ---insert into verifican values (xemp, xi1, '0', '0');
         else
            let xcadenaNOI= xkey || '@' || xtip_perc || '@' || lpad(xc1,3,'0') || '@' ||trim(xn_concepto) || '@' || ximp_exe;
            ---insert into verifican values (xemp , '0', xi1, '0');
         end if;
       
       end if;
       let wnum_linea=wnum_linea+1;
       insert into info_satn (num_linea,id_empresa,id_empleado,linea) values (wnum_linea,xid_empresa,xemp,xcadenaNOI);

   end if;

   return wnum_linea;

end function;                                                                                                                                 
