--------------------------------------------version 3.3 ATEb-----------------------------------------
drop procedure if exists eagg_tab_porcu_sat_ext_y_ord_2023;
create procedure eagg_tab_porcu_sat_ext_y_ord_2023(wfec_pago date, wnomin varchar(1), wempresa varchar(2), wtipo varchar(1), wimpacum varchar(1))
returning char(265);

   define wid_empleado varchar(10,0);
   define wpercep      money(18,2);
   define wporcen      decimal(11,2);
   define w_cont       integer;
   define w_NomDes, w_TipCont, w_Period, w_TipNom varchar(10,0);
   define w_TipCont1, w_Period1 varchar(2,0); define w_TipNom1 varchar(1,0);

   ---set debug file to 'tab.log';
   ---trace on;

   ---Elimina y crea tabla de salida
   drop table porc_emp;

   create table porc_emp
     (id_empleado varchar(10),
      fec_pago    date,
      porcent     decimal(11,2));
   revoke all on porc_emp from "public";
   create index porc_emp01 on porc_emp (id_empleado) using btree;

   let w_cont = 1;

   --let wtipo = '1';
   --let wtipo = '0';
   
   if wnomin = 'O' then let w_NomDes = 'Ordinaria'; ---revisar los datos
      let w_TipCont = '01-TiemInd'; let w_Period = '04-Quincen'; let w_TipNom = 'O-Ordinari';
      let w_TipCont1 = '01'; let w_Period1 = '04'; let w_TipNom1 = 'O'; end if;
         
   if wnomin = 'E' then let w_NomDes = 'Extraord'; ---revisar los datos
      let w_TipCont = '01-TiemInd'; let w_Period = '99-OtraPer'; let w_TipNom = 'E-Extraord';
      let w_TipCont1 = '01'; let w_Period1 = '99'; let w_TipNom1 = 'E'; end if;
            
   if wnomin = 'H' then let w_NomDes = 'Honorario';
      ---let w_TipCont = '04-Tempora'; let w_Period = '05-Mensual'; let w_TipNom = 'O-Ordinari';
      let w_TipCont = '09-SinRela'; let w_Period = '04-Qincen'; let w_TipNom = 'O-Ordinari';
      let w_TipCont1 = '09'; let w_Period1 = '05'; let w_TipNom1 = 'O'; end if;
      
   if wnomin = 'P' then let w_NomDes = 'PAOAM'; ---Internos
      let w_TipCont = '03-TiemDet'; let w_Period = '99-OtraPer'; let w_TipNom = 'E-Extraord';
      let w_TipCont1 = '03'; let w_Period1 = '99'; let w_TipNom1 = 'E'; end if;

   if wnomin = 'T' then let w_NomDes = 'Temporal';
      let w_TipCont = '03-TiemDet'; let w_Period = '04-Quincen'; let w_TipNom = 'O-Ordinari';
      let w_TipCont1 = '03'; let w_Period1 = '04'; let w_TipNom1 = 'O'; end if;
            
         
   return 'Informe --> ' || wnomin || '; ' || w_NomDes || '; ' || w_TipCont || '; ' ||w_Period || '; ' ||w_TipNom || '.'with resume;
   
   foreach select rfc,sum(tot_perc_cheque)*2
             into wid_empleado,wpercep
             --from cosif_timbrado_2022
             from cosif_timbrado_2023
            where fec_pago = wfec_pago
            and id_empresa = wempresa
            and tipo = wtipo
            And impacum_p5 = wimpacum  --1 Pre 2 Eve 3 EveCov 4 EvePen 5 Hono
            ---and rfc in ('355290','202046','309352','161695','246291','367131','357819','385281')
            And (c1<>'26' And c2<>'26' And c3<>'26' And c4<>'26' And c5<>'26' And c6<>'26' And c7<>'26' And c8<>'26' And c9<>'26' And c10<>'26'
            And c11<>'26' And c12<>'26' And c13<>'26' And c14<>'26' And c15<>'26' And c16<>'26' And c17<>'26' And c18<>'26' And c19<>'26' And c20<>'26'
            And c21<>'26' And c22<>'26' And c23<>'26' And c24<>'26' And c25<>'26' And c26<>'26' And c27<>'26' And c28<>'26' And c29<>'26' And c30<>'26'
            And c31<>'26' And c32<>'26' And c33<>'26' And c34<>'26' And c35<>'26' And c36<>'26' And c37<>'26' And c38<>'26' And c39<>'26' And c40<>'26')
                ---Tablas cosif_prueba2_hist2017   cosif_timbrado_2018_ene_b    cosif_timbrado_2019
                ---and rfc in (select distinct id_empleado from filtro_aoa)    and filiacion <> ''
            group by 1 order by 1
     
      if year(wfec_pago) = '2023' then
         select max(porc_exced)
           into wporcen
           from m4t_impuesto_m
          where year(fec_inicio) = '2023'
            and lim_inferior <= wpercep;
      else
         select max(porc_exced)
           into wporcen
           from m4t_impuesto_m
          where year(fec_inicio) = '2022'
            and lim_inferior <= wpercep;
      end if;
             
      if wporcen is null then
         let wporcen = 0.00;
      end if;
      
      insert into porc_emp (id_empleado,fec_pago,porcent) values (wid_empleado,wfec_pago,wporcen);
      
      return 'llevo porc---> ' || w_cont  with resume;
      let w_cont = w_cont + 1;
      
   end foreach;
   
end procedure;
