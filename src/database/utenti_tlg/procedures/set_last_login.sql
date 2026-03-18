create or replace procedure utenti_tlg.set_last_login --(p_user varchar2)
 as
    my_errm varchar2(4000);
begin
  --insert into LOG values (current_timestamp, v('APP_USER'));

    if v('APP_USER') is null then
        insert into log values ( current_timestamp,
                                 'APP_USER non � valorizzato' );

    else
        update tbl_anag_utenti
        set
            last_login = current_timestamp,
            last_ip = owa_util.get_cgi_env('REMOTE_ADDR')
        where
            ldap_account = v('APP_USER'); --p_user;
    end if;
exception
    when others then
        my_errm := sqlerrm;
        insert into log values ( current_timestamp,
                                 v('APP_USER')
                                 || ' - '
                                 || my_errm );

end;
/


-- sqlcl_snapshot {"hash":"09cf4079a0255e8fa526b02640a8117d6b1a83a2","type":"PROCEDURE","name":"SET_LAST_LOGIN","schemaName":"UTENTI_TLG","sxml":""}