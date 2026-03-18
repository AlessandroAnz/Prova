create or replace editionable trigger utenti_tlg.trig_area_localita before
    insert on utenti_tlg.tbl_area_localita
    for each row
declare
    id_loc integer;
begin
    select
        seq_ruoli.nextval
    into id_loc
    from
        dual;

    :new.id := id_loc;
end;
/

alter trigger utenti_tlg.trig_area_localita enable;


-- sqlcl_snapshot {"hash":"421738014a8d2e66da47b72e288acb96100c0ff1","type":"TRIGGER","name":"TRIG_AREA_LOCALITA","schemaName":"UTENTI_TLG","sxml":""}