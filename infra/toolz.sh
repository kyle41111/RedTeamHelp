sudo apt install seclists curl enum4linux feroxbuster gobuster impacket-scripts nbtscan nikto nmap onesixtyone oscanner redis-tools smbclient smbmap snmp sslscan sipvicious tnscmd10g whatweb wkhtmltopdf 2to3 python3-lib2to3 python3-toolz
sudo python3 -m pipx ensurepath
sudo apt-get install python3-poetry
cd /opt
sudo chmod 777 RedTeamHelp
cd /opt/RedTeamHelp
sudo mkdir cves
sudo chmod 777 cves
cd cves
sudo git clone https://github.com/fox-it/cve-2019-1040-scanner.git
sudo git clone https://github.com/topotam/PetitPotam.git
sudo git clone https://github.com/SecuraBV/CVE-2020-1472.git
sudo wget https://raw.githubusercontent.com/cube0x0/CVE-2021-1675/main/CVE-2021-1675.py
sudo wget https://raw.githubusercontent.com/cube0x0/CVE-2021-1675/main/SharpPrintNightmare/CVE-2021-1675.py
cd ..
sudo chmod 777 ActiveDirectory
cd ActiveDirectory
sudo git clone https://github.com/aas-n/spraykatz.git
sudo git clone https://github.com/GhostPack/Certify.git
sudo git clone https://github.com/ShutdownRepo/ShadowCoerce.git
sudo git clone https://github.com/byt3bl33d3r/ItWasAllADream.git
cd ..
sudo chmod 777 evasion
cd evasion
sudo git clone https://github.com/mdsecactivebreach/SharpShooter.git
sudo git clone https://github.com/WazeHell/LightMe.git
sudo git clone https://github.com/optiv/ScareCrow.git
cd ..
sudo mkdir crawlers
sudo chmod 777 crawlers
cd crawlers
sudo pipx install git+https://github.com/blacklanternsecurity/MANSPIDER

cd .. 
cd ActiveDirectory
sudo git clone https://github.com/dirkjanm/adidnsdump.git
sudo git clone https://github.com/dirkjanm/PrivExchange.git
python3 -m pip install lsassy
sudo git clone https://github.com/zer1t0/ticket_converter.git
sudo pip install git+https://github.com/dirkjanm/adidnsdump#egg=adidnsdump

cd ..
git clone https://github.com/ropnop/windapsearch.git
sudo apt-get install libsasl2-dev python-dev libldap2-dev libssl-dev
sudo apt-get install python3-ldap

