create or replace editionable trigger utenti_tlg.trig_aree before
    insert on utenti_tlg.tbl_aree
    for each row
declare
    id_area integer;
begin
    select
        seq_ruoli.nextval
    into id_area
    from
        dual;

    :new.id := id_area;
end;
/

alter trigger utenti_tlg.trig_aree enable;


-- sqlcl_snapshot {"hash":"d22e49d5d5149bb0e5c9e26633607f1c686ee226","type":"TRIGGER","name":"TRIG_AREE","schemaName":"UTENTI_TLG","sxml":""}