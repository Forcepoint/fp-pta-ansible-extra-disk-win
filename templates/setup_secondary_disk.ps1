Configuration setup_secondary_disk
{
    Import-DSCResource -ModuleName StorageDsc

    Node localhost
    {
        WaitForDisk Disk{{ extra_disk_win_disk_id }}
        {
             DiskId = {{ extra_disk_win_disk_id }}
             RetryIntervalSec = 60
             RetryCount = 60
        }

        Disk {{ extra_disk_win_drive_letter }}Volume
        {
             DiskId = {{ extra_disk_win_disk_id }}
             DriveLetter = '{{ extra_disk_win_drive_letter }}'
             FSLabel = '{{ extra_disk_win_drive_name }}'
             FSFormat = '{{ extra_disk_win_fs_format }}'
             DependsOn = '[WaitForDisk]Disk{{ extra_disk_win_disk_id }}'
        }
    }
}
setup_secondary_disk