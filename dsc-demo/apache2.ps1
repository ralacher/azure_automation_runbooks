Configuration 'apache2' {
    #Import the nx DSC Resource
    Import-DscResource -ModuleName 'nx'
    Node localhost {
        #Ensure apache2 package is installed
        nxpackage 'apache2' {
            Ensure          = 'Present'
            Name            = 'apache2'
            PackageManager  = 'Apt'
        }
        #Ensure apache2 service is running
        nxService 'apache2' {
            Enabled         = $true
            Name            = 'apache2'
            Controller      = 'init'
            State           = 'running'
        }
    }
}