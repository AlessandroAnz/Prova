create or replace function utenti_tlg.check_applicazione_pagina (
    p_user in varchar2,
    p_app  in number,
    p_pag  in number
) return boolean is
    valida number(2);
begin
    insert into log (
        data,
        msg
    ) values ( sysdate,
               'user: '
               || p_user
               || ', app: '
               || p_app
               || ', pag: '
               || p_pag );

    commit;
    select
        nvl(abilitata, 0)
    into valida
    from
             tbl_ruolo_app_pag ra
        inner join tbl_anag_applicazioni aa on ra.id_applicazione = aa.id_applicazione
        inner join tbl_anag_utenti       au on au.id_ruolo_portale = ra.id_ruolo_portale
    where
            au.ldap_account = p_user
        and aa.apex_app_id = p_app
        and ra.page_id = p_pag;

    return valida > 0
    or is_role_admin(p_user);
exception
    when no_data_found then
        return false
        or is_role_admin(p_user);
end check_applicazione_pagina;
/


-- sqlcl_snapshot {"hash":"5a91da882f7cc8eb7d21768cbbb99eaf68390f79","type":"FUNCTION","name":"CHECK_APPLICAZIONE_PAGINA","schemaName":"UTENTI_TLG","sxml":""}