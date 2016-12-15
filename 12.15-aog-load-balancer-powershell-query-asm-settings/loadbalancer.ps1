$cs= get-azurevm
$n=0
while ( $n -lt $cs.Count )
{
    $ep = $cs[$n].VM | Get-AzureEndpoint
    $m=0
    $lb=0
    while ($m -lt $ep.count)
    {
    if ($ep[$m].LBSetName)
        {
            $lb = 1
        }
    $m = $m + 1
    }
    $m=0
    if ($lb -eq 1)
    {
    echo -------------------------------
    $vmname = "VMName: "
    $DNSName = "DNSName: "
    $vmname + $cs[$n].Name
    $DNSName + $cs[$n].DNSName
    echo "    "
    while ($m -lt $ep.count)
    {
        if ($ep[$m].LBSetName)
        {
            $ep[$m]
        }
        $m = $m + 1
    }	
    }
    $n = $n + 1
}