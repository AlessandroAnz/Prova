create or replace editionable trigger utenti_tlg.trig_ruolo_portale before
    insert on utenti_tlg.tbl_ruolo_portale
    for each row
declare
    id_rol integer;
begin
    select
        seq_ruoli.nextval
    into id_rol
    from
        dual;

    :new.id_ruolo_portale := id_rol;
end;
/

alter trigger utenti_tlg.trig_ruolo_portale enable;


-- sqlcl_snapshot {"hash":"cfd27f55dbe41097a102892833ebfc5eb2f492ee","type":"TRIGGER","name":"TRIG_RUOLO_PORTALE","schemaName":"UTENTI_TLG","sxml":""}