drop procedure if exists  eagg_tab_porcu_ord_2022_ATEB;
create procedure eagg_tab_porcu_ord_2022_ATEB(wfec_pago date, wtipo varchar(1), wempresa varchar(2))
returning char(265);

   define wemp varchar(10);
   define wpercep      money(18,2);
   define wporcen      decimal(11,2);
   define w_cont       integer;
   define w_NomDes, w_TipCont, w_Period, w_TipNom varchar(10,0);
   define w_TipCont1, w_Period1 varchar(2,0); define w_TipNom1 varchar(1,0);

   SET DEBUG FILE TO '2022_ATEB_ORD_tab.log';
   TRACE ON;

   drop table porc_emp;

   create table porc_emp
     (id_empleado varchar(10),
      fec_pago    date,
      porcent     decimal(11,2));
   revoke all on porc_emp from "public";
   create index porc_emp01 on porc_emp (id_empleado) using btree;

   let w_cont = 1;
   
   
      let w_TipCont = '01-TiemInd'; let w_Period = '04-Quincen'; let w_TipNom = 'O-Ordinari';
      let w_TipCont1 = '01'; let w_Period1 = '04'; let w_TipNom1 = 'O'; 
            
         
   return 'Informe --> ' ||  w_TipCont || '; ' ||w_Period || '; ' ||w_TipNom || '.'with resume;
   
   foreach select rfc,sum(tot_perc_cheque)*2
             into wemp,wpercep
             from eagg_cosif_timbrado_2019
            where fec_pago = wfec_pago
            and id_empresa = wempresa
            and tipo = wtipo
            AND RFC IN ('246291','355290','202046','407986','396713','357819','161695','406529','367131','309352','403504')
            group by 1 order by 1
             
      if year(wfec_pago) = '2017' then
         select max(porc_exced)
           into wporcen
           from m4t_impuesto_m
          where year(fec_inicio) = '2014'
            and lim_inferior <= wpercep;
      else
         select max(porc_exced)
           into wporcen
           from m4t_impuesto_m
          where year(fec_inicio) = '2018'
            and lim_inferior <= wpercep;
      end if;
      
      if wporcen is null then
         let wporcen = 0.00;
      end if;
      
      insert into porc_emp (id_empleado,fec_pago,porcent) values (wemp,wfec_pago,wporcen);
      
      return 'llevo porc---> ' || w_cont  with resume;
      let w_cont = w_cont + 1;
      
   end foreach;
   
end procedure;
