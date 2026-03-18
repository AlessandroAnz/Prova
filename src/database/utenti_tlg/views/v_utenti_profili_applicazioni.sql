create or replace force editionable view utenti_tlg.v_utenti_profili_applicazioni (
    id_utente,
    id_profilo,
    id_impresa,
    id_applicazione,
    applicazione,
    nome_utente,
    ldap_account,
    nome_impresa
) as
    select
        tupa.id_utente,
        tupa.id_profilo,
        tupa.id_impresa,
        tupa.id_applicazione,
        taa.applicazione,
        tau.nome_utente,
        tau.ldap_account,
        tai.nome_impresa
    from
             tbl_utenti_profili_applicazioni tupa
        inner join tbl_anag_utenti       tau on tau.id_utente = tupa.id_utente
        inner join tbl_anag_applicazioni taa on tupa.id_applicazione = taa.id_applicazione
        inner join tbl_anag_imprese      tai on tai.id_impresa = tupa.id_impresa
    order by
        6,
        5;


-- sqlcl_snapshot {"hash":"82ebd60d5c93246be74774ece0da7601c0bf4981","type":"VIEW","name":"V_UTENTI_PROFILI_APPLICAZIONI","schemaName":"UTENTI_TLG","sxml":""}