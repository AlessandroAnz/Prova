create or replace function utenti_tlg.is_role_admin (
    p_user in varchar2
) return boolean is
    valida number(2);
begin
    select
        count(*)
    into valida
    from
             tbl_anag_utenti au
        inner join tbl_ruolo_portale rp on au.id_ruolo_portale = rp.id_ruolo_portale
    where
            au.ldap_account = p_user
        and rp.ruolo_portale = 'ADMIN';

    return valida > 0;
end is_role_admin;
/


-- sqlcl_snapshot {"hash":"5737fff8c3ef6fbf943d4e7e147672bd5342fc02","type":"FUNCTION","name":"IS_ROLE_ADMIN","schemaName":"UTENTI_TLG","sxml":""}