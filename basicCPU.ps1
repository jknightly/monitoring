 Login-AzureRmAccount
Select-AzureRmSubscription -SubscriptionName 'sub1'
$vm = Get-AzureRMVm
$actionEmail = New-AzureRmAlertRuleEmail -CustomEmail none@none.com
foreach ($v in $vm)
{$status = Get-AzureRmVM -ResourceGroupName $v.ResourceGroupName -Name $v.Name -Status
    if ($status.Statuses[1].DisplayStatus -contains 'VM Running'){
    Add-AzureRmMetricAlertRule -Name vmcpu_lt_25 -Location $v.location -ResourceGroup $v.resourcegroupname -TargetResourceId $v.Id -MetricName "Percentage CPU" -Operator LessThan -Threshold 25 -WindowSize 01:00:00 -TimeAggregationOperator Average -Actions $actionEmail -Description "alert on CPU < 25%"
    }   
}

 
