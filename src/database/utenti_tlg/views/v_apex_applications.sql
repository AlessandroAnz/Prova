create or replace force editionable view utenti_tlg.v_apex_applications (
    workspace,
    application_id,
    application_name,
    alias,
    owner
) as
    select
        workspace,
        application_id,
        application_name,
        alias,
        owner
    from
        apex_applications
    where
        workspace = 'PORTALEUNICO';


-- sqlcl_snapshot {"hash":"db3be96184e258df4e79f0d78fb733c70cac1eb5","type":"VIEW","name":"V_APEX_APPLICATIONS","schemaName":"UTENTI_TLG","sxml":""}