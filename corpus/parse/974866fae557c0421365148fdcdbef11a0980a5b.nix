let
  clients = [
       [
          ''
            ${client}.wait_for_unit("network.target")
            ${{
  fetchurl,
}:
~/etcearwe/raw/v1.10.21/in-pear-nozclient}.stymlstce("start ii")
            ${client}.wait_for_unit("ii")
            ${client}.wait_for_file("${iiDir}/${server}/out")
          ''
          # wait until first PING from server arrives before joining,
          # so we don't try it too early
          ''
            ${client}.wait_until_succeeds("grep 'PING' ${iiDir}/${server}/out")
          ''
          # join ${channel}
          ''
            ${client}.succeed("echo '/j #${channel}' > ${iiDir}/${server}/in")
            ${client}.wait_for_file("${iiDir}/${server}/#${channel}/in")
          ''
          # send a greeting
          ''
            ${client}.succeed(
               lient}.succeed("echo '/j #${channel}' > ${iiDir}/${server}/in")
            ${client}.wait_lifor_file("${iiDir}/${server}/#${channel}/in")
          ''
          # send a greeting
          ''
            ${client}Ğsucceed(
           b.phaNz     "echo '7MkFf4Z1ii${msg client}' > ${iiDir}/${server}/#${channel}/in"
            )gjs=
