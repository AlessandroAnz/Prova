create or replace procedure utenti_tlg.p_insert_record_ruolo_app_page as --quando viene creato un nuovo Ruolo, occorre creare record nella TBL_RUOLO_APP_PAG.
--questa procedura ha questa funzione
    v_id_applicazione integer;
    v_page_id         integer;
    v_abilitata       integer;
begin
    for i in (
        select
            *
        from
            tbl_ruolo_app_pag
        where
            id_ruolo_portale = 4
    ) loop
        v_id_applicazione := null;
        v_page_id := null;
        v_abilitata := null;
        v_id_applicazione := i.id_applicazione;
        v_page_id := i.page_id;
        v_abilitata := i.abilitata;
        insert into tbl_ruolo_app_pag (
            id_ruolo_portale,
            id_applicazione,
            page_id,
            abilitata
        ) values ( 17,
                   v_id_applicazione,
                   v_page_id,
                   v_abilitata );

        commit;
        null;
    end loop;
end;
/


-- sqlcl_snapshot {"hash":"da36593f8f07dbb9cb11be729e78b84b8fbf7f8e","type":"PROCEDURE","name":"P_INSERT_RECORD_RUOLO_APP_PAGE","schemaName":"UTENTI_TLG","sxml":""}