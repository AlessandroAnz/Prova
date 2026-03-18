create or replace function utenti_tlg.check_applicazione (
    p_user in varchar2,
    p_app  in number
) return boolean is
    valida number(2);
begin
    select
        count(*)
    into valida
    from
             tbl_ruolo_portale_applicazione trpa
        inner join tbl_anag_applicazioni aa on trpa.id_applicazione = aa.id_applicazione
        inner join tbl_anag_utenti       au on au.id_ruolo_portale = trpa.id_ruolo_portale
    where
            au.ldap_account = p_user
        and aa.apex_app_id = p_app;

    return valida > 0
    or is_role_admin(p_user);
end check_applicazione;
/


-- sqlcl_snapshot {"hash":"6819e3b07fcf359ba731228f3685c6cb8c9bd5b2","type":"FUNCTION","name":"CHECK_APPLICAZIONE","schemaName":"UTENTI_TLG","sxml":""}