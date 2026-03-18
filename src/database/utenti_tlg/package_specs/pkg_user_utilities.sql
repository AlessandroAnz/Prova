create or replace package utenti_tlg.pkg_user_utilities as
    function f_calcola_id_impresa (
        p_user in varchar2
    ) return integer
        result_cache;

    function f_calcola_nome_impresa (
        p_user in varchar2
    ) return varchar2;

    function f_calcola_tipo_impresa (
        p_user in varchar2
    ) return varchar2;

    function f_calcola_profilo (
        p_user in varchar2
    ) return varchar2;

    function f_calcola_id_profilo (
        p_user in varchar2
    ) return integer;

    function f_calcola_area (
        p_user in varchar2
    ) return varchar2;

end pkg_user_utilities;
/


-- sqlcl_snapshot {"hash":"0ce4c31b775942113f76522f813d7744cdbbf8e2","type":"PACKAGE_SPEC","name":"PKG_USER_UTILITIES","schemaName":"UTENTI_TLG","sxml":""}