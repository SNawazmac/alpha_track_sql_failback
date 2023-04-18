param(
[Parameter(Mandatory=$true)][string]$primary_mssql_server_resource_group_name,                     #Enter the name of resource group where the primary sql server is existing
[Parameter(Mandatory=$true)][string]$primary_mssql_server_name,                     #Enter the secondary server name
[Parameter(Mandatory=$true)][string]$failover_group_name,                      #Enter the failovergroupname
[Parameter(Mandatory=$true)][string]$primary_mssql_server_subscription_Id                   #Enter the primary_subscription_Id                            
)

#The below command sets authentication information for cmdlets that run in the current session
Set-AzContext -Subscription $primary_mssql_server_subscription_Id

#The below command invokes failover from primary to secondary sql server in the failover group
Switch-AzSqlDatabaseFailoverGroup -ResourceGroupName $primary_mssql_server_resource_group_name -ServerName $primary_mssql_server_name -FailoverGroupName $failover_group_name
