-- changes save files, as otherwise your vanilla save will get fucked by the skilltree changes
SavefileManager.PROGRESS_SLOT = SystemInfo:platform() == Idstring("WIN32") and 612 or 613
SavefileManager.BACKUP_SLOT = SystemInfo:platform() == Idstring("WIN32") and 612 or 613
