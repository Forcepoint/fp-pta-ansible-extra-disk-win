# extra-disk-win

Mounts and formats an extra disk for use on Windows. See https://github.com/PowerShell/StorageDsc/wiki#getting-started
for information about the Powershell DSC module being used here. At the time of this writing, there were no ansible
modules available for managing windows disks directly, so a Powershell DSC module was used instead.

## Requirements

The disk exists.

## Role Variables

### Optional

* extra_disk_win_drive_letter: The drive letter to use. Note that by default this is D. This is by design. 
  For whatever reason, when windows boots up after the drive has been created, it will attach the drive as the first
  available letter after C, even if you specify a different letter here. Using a non-sequential drive letter will result in
  an error on subsequent runs of the playbook.
* extra_disk_win_drive_name: The label or name to give the drive.
* extra_disk_win_disk_id: The drive number to use. This also is a bit arbitrary. The C drive is 0. Any additional disks
  you add get the next incremental number.
* extra_disk_win_fs_format: The format to use for the drive. See Allowed Values for FSFormat. https://github.com/PowerShell/StorageDsc/wiki/Disk

## Dependencies

None

## Example Playbook

    - hosts: servers
      roles:
         - role: extra-disk-win

## License

BSD

## Author Information

Jeremy Cornett <jeremy.cornett@forcepoint.com>
