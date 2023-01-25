drop function if exists GenLinSAT_AGUI_2022_EAGG;
create function GenLinSAT_AGUI_2022_EAGG(xemp varchar(6),xfec_pago date,
a_xc1 varchar(2),a_xi1 decimal(14,2),a_xi1a decimal(14,2),
a_xc2 varchar(2),a_xi2 decimal(14,2),
a_xc3 varchar(2),a_xi3 decimal(14,2),
a_xc4 varchar(2),a_xi4 decimal(14,2),
a_xc5 varchar(2),a_xi5 decimal(14,2),
wnum_linea integer,xid_empresa varchar(2),xconp integer, xcond integer) returning int,int,int; 
-----Programa en modifica para ISSSTE ASEGURADOR
-----P al final es version PIRAMIDACION modificado el 27/03/2018
-----
define xcadenaNOI char(163);
define xn_concepto varchar(150);
define xgrav integer;
define xkey,xtip_perc char(03);
define ximp_gra decimal(14,2);
define ximp_exe decimal(14,2);
define ximp_ded decimal(14,2);
define xband, xcons integer;

   --SET DEBUG FILE TO 'gen.trace';
   --TRACE ON;
 
    let xband = 1;
 
    let ximp_ded=0.0;
       
    
      if a_xc1 = '26' and a_xi1 > 0 then
          
          --let wac_isr=wac_isr;
          let a_xc1 = "26";
          let xkey='NOI';
          let xtip_perc = "002";
          let xconp=xconp + 1;
          let xcons=xconp;
          let xn_concepto = "Paga de Aguinaldo";          
          let ximp_gra=a_xi1;
          let ximp_exe=a_xi1a;
       
       ---             Llave Consecutivo        TipoPercepcion         Clave                  Concepto                         ImporteGravado         ImporteExento
       let xcadenaNOI=xkey||rpad(xcons,4,' ')||rpad(xtip_perc,4,' ')||rpad('0'||a_xc1,15,' ')||rpad(trim(xn_concepto),100,' ')||rpad(ximp_gra,18,' ')||rpad(ximp_exe,18,' ')||'@';         
       let wnum_linea=wnum_linea+1;
       insert into info_sat9 (num_linea,id_empresa,id_empleado,linea) values (wnum_linea,xid_empresa,xemp,xcadenaNOI);              

      end if;    


      if a_xc2 = 'CC' and a_xi2 > 0 then
          
          --let wac_isr=wac_isr;
          let a_xc2 = "CC";
          let xkey='NOI';
          let xtip_perc = "009";
          let xconp=xconp + 1;
          let xcons=xconp;
          let xn_concepto = "Contribuciones a cargo del trabajador pagadas por el patron";          
          let ximp_gra=a_xi2;
          let ximp_exe=0.00;
       
       ---             Llave Consecutivo        TipoPercepcion         Clave                  Concepto                         ImporteGravado         ImporteExento
       --let xcadenaNOI=xkey||rpad(xcons,4,' ')||rpad(xtip_perc,4,' ')||rpad('0'||a_xc2,15,' ')||rpad(trim(xn_concepto),100,' ')||rpad(ximp_gra,18,' ')||rpad(ximp_exe,18,' ')||'@';         
       let xcadenaNOI=xkey||rpad(xcons,4,' ')||rpad(xtip_perc,4,' ')||rpad('0'||a_xc2,15,' ')||rpad(trim(xn_concepto),100,' ')||rpad(ximp_gra,18,' ')||rpad(ximp_exe,18,' ')||'@';
       let wnum_linea=wnum_linea+1;
       insert into info_sat9 (num_linea,id_empresa,id_empleado,linea) values (wnum_linea,xid_empresa,xemp,xcadenaNOI);              

      end if; 

      let xcons = 0;

      if a_xc3 = '53' and a_xi3 > 0 then
          
          --let wac_isr=wac_isr;
          let a_xc3 = "53";
          let xkey='NOD';
          let xtip_perc = "002";
          let xcond=xcond + 1;
          let xcons=xcond;
          let xn_concepto = "Impuesto sobre la Renta";          
          let ximp_gra=0.00;
          let ximp_exe=a_xi3;
       
       ---             Llave Consecutivo        TipoPercepcion         Clave                  Concepto                         ImporteGravado         ImporteExento
       let xcadenaNOI=xkey||rpad(xcons,4,' ')||rpad(xtip_perc,4,' ')||rpad('0'||a_xc3,15,' ')||rpad(trim(xn_concepto),100,' ')||rpad(ximp_gra,18,' ')||rpad(ximp_exe,18,' ')||'@';         
       let wnum_linea=wnum_linea+1;
       insert into info_sat9 (num_linea,id_empresa,id_empleado,linea) values (wnum_linea,xid_empresa,xemp,xcadenaNOI);              

      end if; 


      if a_xc4 = '69' and a_xi4 > 0 then
          
          --let wac_isr=wac_isr;
          let a_xc4 = "69";
          let xkey='NOD';
          let xtip_perc = "007";
          let xcond=xcond + 1;
          let xcons=xcond;
          let xn_concepto = "Pension Alimenticia";          
          let ximp_gra=0.00;
          let ximp_exe=a_xi4;
       
       ---             Llave Consecutivo        TipoPercepcion         Clave                  Concepto                         ImporteGravado         ImporteExento
       let xcadenaNOI=xkey||rpad(xcons,4,' ')||rpad(xtip_perc,4,' ')||rpad('0'||a_xc4,15,' ')||rpad(trim(xn_concepto),100,' ')||rpad(ximp_gra,18,' ')||rpad(ximp_exe,18,' ')||'@';         
       let wnum_linea=wnum_linea+1;
       insert into info_sat9 (num_linea,id_empresa,id_empleado,linea) values (wnum_linea,xid_empresa,xemp,xcadenaNOI);              

      end if; 


      if a_xc5 = 'RM' and a_xi5 > 0 then
          
          --let wac_isr=wac_isr;
          let a_xc5 = "RM";
          let xkey='NOD';
          let xtip_perc = "004";
          let xcond=xcond + 1;
          let xcons=xcond;
          let xn_concepto = "Retencion para pago a Terceros por Mandato Judicial";          
          let ximp_gra=0.00;
          let ximp_exe=a_xi5;
       
       ---             Llave Consecutivo        TipoPercepcion         Clave                  Concepto                         ImporteGravado         ImporteExento
       let xcadenaNOI=xkey||rpad(xcons,4,' ')||rpad(xtip_perc,4,' ')||rpad('0'||a_xc5,15,' ')||rpad(trim(xn_concepto),100,' ')||rpad(ximp_gra,18,' ')||rpad(ximp_exe,18,' ')||'@';         
       let wnum_linea=wnum_linea+1;
       insert into info_sat9 (num_linea,id_empresa,id_empleado,linea) values (wnum_linea,xid_empresa,xemp,xcadenaNOI);              

      end if; 

    
    
   return wnum_linea,xcond,xconp;

end function;

