settings  
{  
	priority=1  
	exclude.where = !process.is_explorer  
	showdelay = 200  
	modify.remove.duplicate=1  
	tip.enabled=true  
}  
  
// 导入所有模块  
import 'imports/theme.nss'  
import 'imports/images.nss'  
import 'imports/modify.nss'  
import 'imports/terminal.nss'  
import 'imports/file-manage.nss'  
import 'imports/develop.nss'  
import 'imports/goto.nss'  
import 'imports/taskbar.nss'  
  
// 空菜单定义  
menu(mode="multiple" title="Pin/Unpin" image=icon.pin)  
{  
}  
  
menu(mode="multiple" title=title.more_options image=icon.more_options)  
{  
}  
  
// 发送到桌面快捷方式  
item(where=sel.count>0 type='file|dir' title="发送到桌面快捷方式" image=\uE165       
     cmd=path.lnk.create(user.desktop + "\\" + path.removeextension(sel.file.name) + " .lnk", sel.path))  
  
// 任务栏系统工具菜单（修复后的结构）  
menu(type="taskbar" title="系统工具" image=\uE0F3)  
{  
    menu(title="电源控制" image=\uE7E8)  
    {  
        // 标准关机命令，通常没问题  
        item(title="关机" admin cmd='shutdown /s /t 0')  
        item(title="重启" admin cmd='shutdown /r /t 0')  
          
        // 修正：使用 PowerShell 强制睡眠，防止变成休眠  
        item(title="睡眠" cmd='powershell.exe -WindowStyle Hidden -Command "Add-Type -Assembly System.Windows.Forms; [System.Windows.Forms.Application]::SetSuspendState([System.Windows.Forms.PowerState]::Suspend, $false, $false)"')  
          
        item(title="休眠" admin cmd='shutdown /h')  
        item(title="注销" cmd='shutdown /l')  
    }  
  
    menu(title="电源方案切换" image=\uE70E)  
    {  
        item(title="打开电源设置" cmd='powercfg.cpl')  
        separator  
  
        item(title="模式：平衡" admin cmd='powercfg /setactive 381b4222-f694-41f0-9685-ff5bb260df2e')  
  
        // 尝试切换到节能 (通用 ID)  
        item(title="模式：PowerX v2" admin cmd='powercfg /setactive 66666666-6666-6666-6666-666666666666')  
          
        item(title="模式：Bitsum Highest Performance" admin cmd='powercfg /setactive f07afcde-5d8c-42b4-8bb6-ed1aca89d688')  
    }  
      
    separator  
      
    item(title="事件查看器" cmd='eventvwr.exe')  
    item(title="系统" cmd='ms-settings:about')  
    item(title="设备管理器" cmd='devmgmt.msc')  
    item(title="网络连接" cmd='ncpa.cpl')  
    item(title="磁盘管理" cmd='diskmgmt.msc')  
    item(title="计算机管理" cmd='compmgmt.msc')  
      
    separator  
    item(title="文件资源管理器" cmd='explorer.exe')  
}