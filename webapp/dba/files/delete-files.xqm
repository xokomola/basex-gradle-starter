(:~
 : Delete files.
 :
<<<<<<< HEAD
 : @author Christian Grün, BaseX GmbH, 2014-15
=======
<<<<<<< HEAD
 : @author Christian Grün, BaseX GmbH, 2014-15
=======
 : @author Christian Grün, BaseX Team, 2014-16
>>>>>>> basex-8.4
>>>>>>> basex-8.3
 :)
module namespace _ = 'dba/files';

import module namespace cons = 'dba/cons' at '../modules/cons.xqm';

(:~ Top category :)
declare variable $_:CAT := 'files';

(:~
 : Deletes files.
 : @param  $names  names of files
 :)
declare
  %rest:GET
  %rest:path("/dba/delete-files")
  %rest:query-param("name", "{$names}")
  %output:method("html")
function _:drop(
  $names  as xs:string*
) {
  cons:check(),
  try {
    $names ! file:delete($cons:DBA-DIR || .),
    web:redirect($_:CAT, map { 'info': 'Deleted files: ' || count($names) })
  } catch * {
    web:redirect($_:CAT, map { 'error': $err:description })
  }
};
