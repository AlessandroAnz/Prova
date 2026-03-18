create or replace procedure utenti_tlg.p_download_estrazione (
    p_directory in varchar2,
    p_filename  in varchar2
) is
    l_blob   blob;
    l_bfile  bfile;
    l_length number;
begin
    exporttlr.p_log_messaggio('p_download_estrazione', 5050, 'directory : nome file', p_directory
                                                                                      || ':'
                                                                                      || p_filename);

    l_bfile := bfilename(p_directory, p_filename);
    begin
        dbms_lob.open(l_bfile, dbms_lob.lob_readonly);
    exception
        when others then
            exporttlr.p_log_messaggio('p_download_estrazione', 5052, 'file non trovato o non accessibile', sqlerrm);
            return;
    end;

    exporttlr.p_log_messaggio('p_download_estrazione', 5051, 'file aperto', sqlerrm);
    l_length := dbms_lob.getlength(l_bfile);
    exporttlr.p_log_messaggio('p_download_estrazione', 5051, 'lunghezza del file', l_length);
    dbms_lob.createtemporary(l_blob, true);
    dbms_lob.open(l_blob, dbms_lob.lob_readwrite);
    begin
        dbms_lob.loadfromfile(l_blob, l_bfile, l_length);
    exception
        when others then
            exporttlr.p_log_messaggio('p_download_estrazione', 5054, 'errore nel caricamento del file', sqlerrm);
            dbms_lob.freetemporary(l_blob);
            dbms_lob.close(l_bfile);
            return;
    end;

    dbms_lob.close(l_bfile);
    exporttlr.p_log_messaggio('p_download_estrazione', 5051, 'file caricato nel blob', sqlerrm);
    sys.owa_util.mime_header('application/x-zip', false);
    sys.htp.p('Content-length: ' || l_length);
    sys.htp.p('Content-Disposition: filename="'
              || p_filename || '"');
    sys.owa_util.http_header_close;
    begin
        sys.wpg_docload.download_file(l_blob);
    exception
        when others then
            exporttlr.p_log_messaggio('p_download_estrazione', 5055, 'errore nel download del file', sqlerrm);
            dbms_lob.freetemporary(l_blob);
            return;
    end;

    exporttlr.p_log_messaggio('p_download_estrazione', 5051, 'file scaricato con successo', sqlerrm);
    dbms_lob.freetemporary(l_blob);
exception
    when others then
        exporttlr.p_log_messaggio('p_download_estrazione', 5053, 'errore nella procedura', sqlerrm);
        raise;
end;
/


-- sqlcl_snapshot {"hash":"0f79b75f75008976ed62d405074a49fcf2662443","type":"PROCEDURE","name":"P_DOWNLOAD_ESTRAZIONE","schemaName":"UTENTI_TLG","sxml":""}