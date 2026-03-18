create or replace procedure utenti_tlg.p_insert_record_exporttlr as
    v_id_utente integer;
begin
    for i in (
        select
            *
        from
            tbl_anag_utenti
        where
            id_ruolo_portale = 1
    ) --RUOLO PORTALE TLR_ASSIST
     loop
        v_id_utente := null;
        v_id_utente := i.id_utente;
        insert into tbl_utenti_profili_applicazioni (
            id_utente,
            id_impresa,
            id_profilo,
            id_applicazione
        ) values ( v_id_utente,
                   1,
                   1,
                   5 );

    end loop;

    commit;
end;
/


-- sqlcl_snapshot {"hash":"467820ef007806936c7e41b44988515d9a158e42","type":"PROCEDURE","name":"P_INSERT_RECORD_EXPORTTLR","schemaName":"UTENTI_TLG","sxml":""}