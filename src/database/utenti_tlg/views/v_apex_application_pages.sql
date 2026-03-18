create or replace force editionable view utenti_tlg.v_apex_application_pages (
    workspace,
    application_id,
    application_name,
    page_id,
    page_name,
    page_mode,
    page_alias,
    authorization_scheme
) as
    select
        workspace,
        application_id,
        application_name,
        page_id,
        page_name,
        page_mode,
        page_alias,
        authorization_scheme
    from
        apex_application_pages
    where
        workspace = 'PORTALEUNICO';


-- sqlcl_snapshot {"hash":"85a85b48bd3b2677c3ff1c8278d68acaaa3785f4","type":"VIEW","name":"V_APEX_APPLICATION_PAGES","schemaName":"UTENTI_TLG","sxml":""}