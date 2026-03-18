create or replace function utenti_tlg.is_role_admin_num (
    p_user in varchar2
) return integer is
    valida number(2);
begin
    if is_role_admin(p_user) then
        return 1;
    else
        return 0;
    end if;
end is_role_admin_num;
/


-- sqlcl_snapshot {"hash":"92d072605384c162119dbb2abbcff1197d8caff7","type":"FUNCTION","name":"IS_ROLE_ADMIN_NUM","schemaName":"UTENTI_TLG","sxml":""}