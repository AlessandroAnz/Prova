create or replace package body utenti_tlg.pkg_user_utilities as

    function f_calcola_id_impresa (
        p_user in varchar2
    ) return integer
        result_cache
    is
        v_id_impresa integer;
    begin

    --SELECT ID_IMPRESA into v_id_impresa FROM TBL_ANAG_UTENTI WHERE USER_NAME = p_user;
        select
            b.id_impresa
        into v_id_impresa
        from
                 tbl_anag_utenti a
            inner join tbl_utenti_profili_applicazioni b on a.id_utente = b.id_utente
            inner join tbl_anag_applicazioni           aa on aa.apex_app_id = nvl(
                    v('APP_ID'),
                    110
                )
                                                   and aa.id_applicazione = b.id_applicazione
        where
            upper(ldap_account) = upper(p_user);

        return v_id_impresa;
    end;

    function f_calcola_nome_impresa (
        p_user in varchar2
    ) return varchar2 is
        v_nome_impresa varchar2(50);
    begin

    --SELECT I.NOME_IMPRESA into v_nome_impresa FROM TBL_ANAG_IMPRESE I, TBL_ANAG_UTENTI U WHERE I.ID_IMPRESA = U.ID_IMPRESA AND USER_NAME = p_user;
        select
            nome_impresa
        into v_nome_impresa
        from
            tbl_anag_imprese
        where
            id_impresa in (
                select
                    b.id_impresa
                from
                         tbl_anag_utenti a
                    inner join tbl_utenti_profili_applicazioni b on a.id_utente = b.id_utente
                    inner join tbl_anag_applicazioni           aa on aa.apex_app_id = nvl(
                            v('APP_ID'),
                            102
                        )
                                                           and aa.id_applicazione = b.id_applicazione
                where
                    upper(ldap_account) = upper(p_user)
            );

        return v_nome_impresa;
    end;

    function f_calcola_tipo_impresa (
        p_user in varchar2
    ) return varchar2 is
        v_tipo_impresa varchar2(50);
    begin

   -- SELECT I.TIPO_IMPRESA into v_tipo_impresa FROM TBL_ANAG_IMPRESE I, TBL_ANAG_UTENTI U WHERE I.ID_IMPRESA = U.ID_IMPRESA AND USER_NAME = p_user;
        select
            tipo_impresa
        into v_tipo_impresa
        from
            tbl_anag_imprese
        where
            id_impresa in (
                select
                    b.id_impresa
                from
                         tbl_anag_utenti a
                    inner join tbl_utenti_profili_applicazioni b on a.id_utente = b.id_utente
                    inner join tbl_anag_applicazioni           aa on aa.apex_app_id = v('APP_ID')
                                                           and aa.id_applicazione = b.id_applicazione
                where
                    upper(ldap_account) = upper(p_user)
            );

        return v_tipo_impresa;
    end;

    function f_calcola_profilo (
        p_user in varchar2
    ) return varchar2 is
        v_nome_profilo varchar2(50);
    begin

    /*SELECT p.NOME_PROFILO
    into v_nome_profilo
    FROM TBL_ANAG_UTENTI U, TBL_UTENTI_PROFILI_APPLICAZIONI uP, tbl_anag_profili p
    WHERE U.ID_PROFILO = UP.ID_PROFILO
    and  up.id_profilo = p.id_profilo
    AND U.USER_NAME = p_user;*/
        select
            nome_profilo
        into v_nome_profilo
        from
            tbl_anag_profili
        where
            id_profilo in (
                select
                    b.id_profilo
                from
                         tbl_anag_utenti a
                    inner join tbl_utenti_profili_applicazioni b on a.id_utente = b.id_utente
                    inner join tbl_anag_applicazioni           aa on aa.apex_app_id = nvl(
                            v('APP_ID'),
                            102
                        )
                                                           and aa.id_applicazione = b.id_applicazione
                where
                    ldap_account = p_user
            );

        return v_nome_profilo;
    end;

    function f_calcola_id_profilo (
        p_user in varchar2
    ) return integer is
        v_id_profilo integer;
    begin

    /*SELECT P.ID_PROFILO
    into v_id_profilo
    FROM TBL_ANAG_UTENTI U, TBL_UTENTI_PROFILI_APPLICAZIONI P
    WHERE U.ID_PROFILO = P.ID_PROFILO
    AND U.USER_NAME = p_user;*/

        select
            b.id_profilo
        into v_id_profilo
        from
                 tbl_anag_utenti a
            inner join tbl_utenti_profili_applicazioni b on a.id_utente = b.id_utente
            inner join tbl_anag_applicazioni           aa on aa.apex_app_id = v('APP_ID')
                                                   and aa.id_applicazione = b.id_applicazione
        where
            ldap_account = p_user;

        return v_id_profilo;
    end;

    function f_calcola_area (
        p_user in varchar2
    ) return varchar2 is
        v_area varchar2(50);
    begin
        select
            id_aree
        into v_area
        from
            tbl_anag_utenti
        where
            ldap_account = p_user;

        return v_area;
    end;

end pkg_user_utilities;
/


-- sqlcl_snapshot {"hash":"71773991b575daa355cc197859e6734440387d88","type":"PACKAGE_BODY","name":"PKG_USER_UTILITIES","schemaName":"UTENTI_TLG","sxml":""}