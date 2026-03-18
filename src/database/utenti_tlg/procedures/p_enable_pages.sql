create or replace procedure utenti_tlg.p_enable_pages as
begin
-- Ineserisce nella tabella TBL_RUOLO_APP_PAG eventuali pagine nuove non ancora abilitate.
-- Di default, la pagina viene abilitata per i tutti i ruoli che hanno accesso alla APPLICAZIONE
--    in cui � stata creata
    insert into utenti_tlg.tbl_ruolo_app_pag
        select
            r.id_ruolo_portale,
            v.id_applicazione,
            v.page_id,
            1
        from
            v_pages_not_enabled                       v, utenti_tlg.tbl_ruolo_portale t
            inner join utenti_tlg.tbl_ruolo_portale_applicazione r on r.id_ruolo_portale = t.id_ruolo_portale
        where
--v.ID_APPLICAZIONE = 8 AND
                v.id_applicazione = r.id_applicazione
            and r.id_ruolo_portale != 20;

end;
/


-- sqlcl_snapshot {"hash":"d1dbd407ecc021bf844d5bd367c75b18f42f9fe2","type":"PROCEDURE","name":"P_ENABLE_PAGES","schemaName":"UTENTI_TLG","sxml":""}