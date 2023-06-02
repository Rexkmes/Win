function Get-EventDetails {
    param(
        [Parameter(Mandatory=$true)]
        [int]$EventID
    )

    $events = Get-WinEvent -FilterHashtable @{Logname='Security'; ID=$EventID}

    foreach ($event in $events) {
        $eventData = $event.Properties[0].Value

        $userDetails = @{
            'AccountName' = $eventData.AccountName
            'AccountDomain' = $eventData.AccountDomain
            'LogonID' = $eventData.LogonID
            # Add other desired user-related properties from the EventData
        }
        Write-Output $userDetails

        # Display other event information
        Write-Output "EventID: $($event.Id)"
        Write-Output "TimeCreated: $($event.TimeCreated)"
        Write-Output "Message: $($event.Message)"
        Write-Output "-----------------------------------------"
    }
}
