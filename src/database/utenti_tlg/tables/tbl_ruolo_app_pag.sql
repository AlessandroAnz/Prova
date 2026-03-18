create table utenti_tlg.tbl_ruolo_app_pag (
    id_ruolo_portale number(38, 0) not null enable,
    id_applicazione  number not null enable,
    page_id          number,
    abilitata        number
);


-- sqlcl_snapshot {"hash":"5e9e78b42a0dd897fcdb88c54daca6a71a2b0fc5","type":"TABLE","name":"TBL_RUOLO_APP_PAG","schemaName":"UTENTI_TLG","sxml":"\n  <TABLE xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>UTENTI_TLG</SCHEMA>\n   <NAME>TBL_RUOLO_APP_PAG</NAME>\n   <RELATIONAL_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>ID_RUOLO_PORTALE</NAME>\n            <DATATYPE>NUMBER</DATATYPE>\n            <PRECISION>38</PRECISION>\n            <SCALE>0</SCALE>\n            <NOT_NULL></NOT_NULL>\n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>ID_APPLICAZIONE</NAME>\n            <DATATYPE>NUMBER</DATATYPE>\n            <NOT_NULL></NOT_NULL>\n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>PAGE_ID</NAME>\n            <DATATYPE>NUMBER</DATATYPE>\n         </COL_LIST_ITEM>\n         <COL_LIST_ITEM>\n            <NAME>ABILITATA</NAME>\n            <DATATYPE>NUMBER</DATATYPE>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      <DEFAULT_COLLATION>USING_NLS_COMP</DEFAULT_COLLATION>\n      <PHYSICAL_PROPERTIES>\n         <HEAP_TABLE></HEAP_TABLE>\n      </PHYSICAL_PROPERTIES>\n   </RELATIONAL_TABLE>\n</TABLE>"}