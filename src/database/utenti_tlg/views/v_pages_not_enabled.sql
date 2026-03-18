create or replace force editionable view utenti_tlg.v_pages_not_enabled (
    id_applicazione,
    application_id,
    page_id
) as
    select
        a.id_applicazione,
        v.application_id,
        page_id
    from
             utenti_tlg.v_apex_application_pages v
        inner join utenti_tlg.tbl_anag_applicazioni a on a.apex_app_id = v.application_id 
--)
--GROUP BY id_applicazione
--ORDER BY 2
--;
    minus
--SELECT count(*), id_applicazione FROM (
    select distinct
        a1.id_applicazione,
        a1.apex_app_id,
        page_id
    from
             utenti_tlg.tbl_ruolo_app_pag v1
        inner join utenti_tlg.tbl_anag_applicazioni a1 on a1.id_applicazione = v1.id_applicazione 
--)
--GROUP BY id_applicazione
--ORDER BY 2
        ;


-- sqlcl_snapshot {"hash":"ca1557821588fd227289622686e82e58aee53427","type":"VIEW","name":"V_PAGES_NOT_ENABLED","schemaName":"UTENTI_TLG","sxml":""}