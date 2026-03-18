create or replace function utenti_tlg.is_role_ditte_esterne (
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
        and rp.id_ruolo_portale in ( 7, 8, 9, 10, 11,
                                     12, 13, 14 );

    return valida > 0;
end is_role_ditte_esterne;
/


-- sqlcl_snapshot {"hash":"02fe8275ec75e602ad3427f28fe9da865be158e5","type":"FUNCTION","name":"IS_ROLE_DITTE_ESTERNE","schemaName":"UTENTI_TLG","sxml":""}