sudo git clone --recurse-submodules https://github.com/ZeroPointSecurity/Covenant.git /opt/Covenant

cd /opt/Covenant/Covenant/

mv ./Data/AssemblyReferences/ ../AssemblyReferences/


mv ./Data/ReferenceSourceLibraries/ ../ReferenceSourceLibraries/

mv ./Data/EmbeddedResources/ ../EmbeddedResources/


mv ./Models/Covenant/ ./Models/EasyPeasy/
mv ./Components/CovenantUsers/ ./Components/EasyPeasyUsers/
mv ./Components/Grunts/ ./Components/Ottos/
mv ./Models/Grunts/ ./Models/Ottos/
mv ./Data/Grunt/GruntBridge/ ./Data/Grunt/OttoBridge/
mv ./Data/Grunt/GruntHTTP/ ./Data/Grunt/OttoHTTP/
mv ./Data/Grunt/GruntSMB/ ./Data/Grunt/OttoSMB/
mv ./Components/GruntTaskings/ ./Components/OttoTaskings/
mv ./Components/GruntTasks/ ./Components/OttoTasks/
mv ./Data/Grunt/ ./Data/Otto/



find ./ -type f -print0 | xargs -0 sed -i "s/Grunt/Otto/g"
find ./ -type f -print0 | xargs -0 sed -i "s/GRUNT/OTTO/g"
find ./ -type f -print0 | xargs -0 sed -i "s/grunt/otto/g"

#find ./ -type f -print0 | xargs -0 sed -i "s/covenant/easypeasy/g"
find ./ -type f -print0 | xargs -0 sed -i "s/Covenant/EasyPeasy/g"
find ./ -type f -print0 | xargs -0 sed -i "s/COVENANT/EASYPEASY/g"

find ./ -type f -print0 | xargs -0 sed -i "s/ExecuteStager/ExecLevel/g"
#find ./ -type f -print0 | xargs -0 sed -i "s/REPLACE_PROFILE/REP_PROF/g"
#find ./ -type f -print0 | xargs -0 sed -i "s/REPLACE_PIPE/REP_PIP/g"
#find ./ -type f -print0 | xargs -0 sed -i "s/GUID/ANGID/g"
find ./ -type f -print0 | xargs -0 sed -i "s/SetupAES/InstallAES/g"
find ./ -type f -print0 | xargs -0 sed -i "s/SessionKey/SessKEy/g"
find ./ -type f -print0 | xargs -0 sed -i "s/EncryptedChallenge/EncChallEnge/g"

find ./ -type f -print0 | xargs -0 sed -i "s/DecryptedChallenges/DecryptChallEnges/g"
find ./ -type f -print0 | xargs -0 sed -i "s/Stage0Body/FirstBody/g"
find ./ -type f -print0 | xargs -0 sed -i "s/Stage0Response/FirstResponse/g"
find ./ -type f -print0 | xargs -0 sed -i "s/Stage0Bytes/FirstBytes/g"
find ./ -type f -print0 | xargs -0 sed -i "s/Stage1Body/SeccondBody/g"
find ./ -type f -print0 | xargs -0 sed -i "s/Stage1Response/SeccondResponse/g"
find ./ -type f -print0 | xargs -0 sed -i "s/Stage1Bytes/SeccondBytes/g"
find ./ -type f -print0 | xargs -0 sed -i "s/Stage2Body/ThirdBody/g"
find ./ -type f -print0 | xargs -0 sed -i "s/Stage2Response/ThirdResponse/g"
find ./ -type f -print0 | xargs -0 sed -i "s/Stage2Bytes/ThirdBytes/g"
find ./ -type f -print0 | xargs -0 sed -i "s/message64str/messAgE64str/g"
find ./ -type f -print0 | xargs -0 sed -i "s/messageBytes/messAgEbytes/g"

find ./ -type f -print0 | xargs -0 sed -i "s/totalReadBytes/ToTalReaDBytes/g"
#find ./ -type f -print0 | xargs -0 sed -i "s/inputStream/instream/g"
#find ./ -type f -print0 | xargs -0 sed -i "s/outputStream/outstream/g"
find ./ -type f -print0 | xargs -0 sed -i "s/deflateStream/deFlatEstream/g"
find ./ -type f -print0 | xargs -0 sed -i "s/memoryStream/memOrYstream/g"
find ./ -type f -print0 | xargs -0 sed -i "s/compressedBytes/packedbytes/g"

find ./ -type f -name "*.cs" -print0 | xargs -0 sed -i "s/REPLACE_/REP_/g"
find ./ -type f -name "*.cs" -print0 | xargs -0 sed -i "s/_PROFILE_/_PROF_/g"
find ./ -type f -name "*.cs" -print0 | xargs -0 sed -i "s/_VALIDATE_/_VAL_/g"
find ./ -type f -name "*.cs" -print0 | xargs -0 sed -i "s/GUID/ANOTHERID/g"
find ./ -type f -name "*.razor" -print0 | xargs -0 sed -i "s/GUID/ANOTHERID/g"
find ./ -type f -name "*.json" -print0 | xargs -0 sed -i "s/GUID/ANOTHERID/g"
find ./ -type f -name "*.yaml" -print0 | xargs -0 sed -i "s/GUID/ANOTHERID/g"
find ./ -type f -name "*.cs" -print0 | xargs -0 sed -i "s/guid/anotherid/g"
find ./ -type f -name "*.razor" -print0 | xargs -0 sed -i "s/guid/anotherid/g"
find ./ -type f -name "*.json" -print0 | xargs -0 sed -i "s/guid/anotherid/g"
find ./ -type f -name "*.yaml" -print0 | xargs -0 sed -i "s/guid/anotherid/g"
find ./ -type f -print0 | xargs -0 sed -i "s/ProfileHttp/ProfHTTP/g"
find ./ -type f -print0 | xargs -0 sed -i "s/baseMessenger/bAsemEsSenger/g"

find ./ -type f -print0 | xargs -0 sed -i "s/PartiallyDecrypted/Partdecrypted/g"
find ./ -type f -print0 | xargs -0 sed -i "s/FullyDecrypted/Fulldecrypted/g"
find ./ -type f -print0 | xargs -0 sed -i "s/compressedBytes/packedbytes/g"

find ./ -type f -print0 | xargs -0 sed -i "s/CookieWebClient/OttosWebClient/g"
#find ./ -type f -print0 | xargs -0 sed -i "s/CookieContainer/KekseContains/g"
#find ./ -type f -print0 | xargs -0 sed -i "s/GetWebRequest/DoAnWebReq/g"
find ./ -type f -print0 | xargs -0 sed -i "s/Jitter/JItter/g"
find ./ -type f -print0 | xargs -0 sed -i "s/ConnectAttempts/ConneCTAttEmpts/g"
find ./ -type f -print0 | xargs -0 sed -i "s/RegisterBody/RegBody/g"
find ./ -type f -name "*.cs" -print0 | xargs -0 sed -i "s/messenger/meSsenGer/g"
find ./ -type f -print0 | xargs -0 sed -i "s/Hello World/Its me, Mario/g"
find ./ -type f -print0 | xargs -0 sed -i "s/ValidateCert/ValCerT/g"
find ./ -type f -print0 | xargs -0 sed -i "s/UseCertPinning/UsCertPin/g"
find ./ -type f -print0 | xargs -0 sed -i "s/EncryptedMessage/EncMsg/g"
find ./ -type f -print0 | xargs -0 sed -i "s/cookieWebClient/ottosWebClient/g"
find ./ -type f -name "*.cs" -print0 | xargs -0 sed -i "s/aes/cryptvar/g"
find ./ -type f -name "*.cs" -print0 | xargs -0 sed -i "s/aes2/cryptvar2/g"
find ./ -type f -name "*.cs" -print0 | xargs -0 sed -i "s/array5/arr5/g"
find ./ -type f -name "*.cs" -print0 | xargs -0 sed -i "s/array6/arr6/g"
find ./ -type f -name "*.cs" -print0 | xargs -0 sed -i "s/array4/arr4/g"
find ./ -type f -name "*.cs" -print0 | xargs -0 sed -i "s/array7/arr7/g"
find ./ -type f -name "*.cs" -print0 | xargs -0 sed -i "s/array1/arr1/g"
find ./ -type f -name "*.cs" -print0 | xargs -0 sed -i "s/array2/arr2/g"
find ./ -type f -name "*.cs" -print0 | xargs -0 sed -i "s/array3/arr3/g"
find ./ -type f -name "*.cs" -print0 | xargs -0 sed -i "s/list1/li1/g"
find ./ -type f -name "*.cs" -print0 | xargs -0 sed -i "s/list2/li2/g"
find ./ -type f -name "*.cs" -print0 | xargs -0 sed -i "s/list3/li3/g"
find ./ -type f -name "*.cs" -print0 | xargs -0 sed -i "s/list4/li4/g"
find ./ -type f -name "*.cs" -print0 | xargs -0 sed -i "s/list5/li5/g"
find ./ -type f -name "*.cs" -print0 | xargs -0 sed -i "s/group0/grp0/g"
find ./ -type f -name "*.cs" -print0 | xargs -0 sed -i "s/group1/grp1/g"
find ./ -type f -name "*.cs" -print0 | xargs -0 sed -i "s/group2/grp2/g"
find ./ -type f -name "*.cs" -print0 | xargs -0 sed -i "s/group3/grp3/g"
find ./ -type f -name "*.cs" -print0 | xargs -0 sed -i "s/group4/grp4/g"
find ./ -type f -name "*.cs" -print0 | xargs -0 sed -i "s/group5/grp5/g"
find ./ -type f -name "*.cs" -print0 | xargs -0 sed -i "s/group6/grp6/g"
find ./ -type f -name "*.cs" -print0 | xargs -0 sed -i "s/group7/grp7/g"
find ./ -type f -name "*.cs" -print0 | xargs -0 sed -i "s/group8/grp8/g"



find ./ -type f -name "*Grunt*" | while read FILE ; do
	newfile="$(echo ${FILE} |sed -e "s/Grunt/Otto/g")";
	mv "${FILE}" "${newfile}";
done
find ./ -type f -name "*GRUNT*" | while read FILE ; do
	newfile="$(echo ${FILE} |sed -e "s/GRUNT/OTTO/g")";
	mv "${FILE}" "${newfile}";
done

find ./ -type f -name "*grunt*" | while read FILE ; do
	newfile="$(echo ${FILE} |sed -e "s/grunt/otto/g")";
	mv "${FILE}" "${newfile}";
done

find ./ -type f -name "*Covenant*" | while read FILE ; do
	newfile="$(echo ${FILE} |sed -e "s/Covenant/EasyPeasy/g")";
	mv "${FILE}" "${newfile}";
done

find ./ -type f -name "*COVENANT*" | while read FILE ; do
	newfile="$(echo ${FILE} |sed -e "s/COVENANT/EASYPEASY/g")";
	mv "${FILE}" "${newfile}";
done

#find ./ -type f -name "*covenant*" | while read FILE ; do
#	newfile="$(echo ${FILE} |sed -e "s/covenant/ottocommand/g")";
#	mv "${FILE}" "${newfile}";
#done

mv ../AssemblyReferences/ ./Data/ 

mv ../ReferenceSourceLibraries/ ./Data/ 

mv ../EmbeddedResources/ ./Data/ 

dotnet build
