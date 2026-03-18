create or replace editionable trigger utenti_tlg.trig_upper_utenti before
    insert or update on utenti_tlg.tbl_anag_utenti
    referencing
            new as new
            old as old
    for each row
declare
    id_utente integer;
begin
  --ldap account in maiuscolo
    :new.ldap_account := upper(:new.ldap_account);
    if inserting then
        insert into log values ( sysdate,
                                 :new.id_ruolo_portale );
        --cerco id
        select
            aes_tlr.seq_utenti.nextval
        into id_utente
        from
            dual;
        --assegno id
        :new.id_utente := id_utente;
        --ciclo che inserisce record nella tbl_utenti_profili_applicazioni
        if :new.copiato_da is not null then
            for k in (
                select
                    *
                from
                    tbl_utenti_profili_applicazioni
                where
                    id_utente = :new.copiato_da
            ) loop
                insert into tbl_utenti_profili_applicazioni values ( id_utente,
                                                                     k.id_profilo,
                                                                     k.id_impresa,
                                                                     k.id_applicazione );

            end loop;
        else
            for i in (
                select
                    id_applicazione
                from
                    tbl_ruolo_portale_applicazione trpa
                where
                    id_ruolo_portale = :new.id_ruolo_portale
            ) loop
                insert into tbl_utenti_profili_applicazioni values ( :new.id_utente,
                                                                     0,
                                                                     :new.id_impresa,
                                                                     i.id_applicazione );

            end loop;
        end if;

    end if;

end;
/

alter trigger utenti_tlg.trig_upper_utenti enable;


-- sqlcl_snapshot {"hash":"51d3746aa5db7cee93115c1f175e8cfbb944803c","type":"TRIGGER","name":"TRIG_UPPER_UTENTI","schemaName":"UTENTI_TLG","sxml":""}