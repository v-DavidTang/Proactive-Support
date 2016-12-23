<properties
                pageTitle="Azure Web 应用配置本地缓存后出现日志中断现象"
                description="Azure Web 应用配置了本地缓存后由于 w3wp 进程的中断，日志记录会出现中断现象"
                services="web-apps"
                documentationCenter=""
                authors=""
                manager=""
                editor=""
                tags="Web Apps,local cache,Log"/>

<tags
                ms.service="web-apps-aog"
                ms.date="12/23/2016"
                wacn.date="12/23/2016"/>

# Azure Web 应用配置本地缓存后出现日志中断现象

### 问题现象

Azure Web 应用配置了本地缓存后，发现日志会在 2 分钟左右出现中断现象。

### 问题分析

Azure Web 应用除了使用默认的共享目录存放 Web 应用内容，用户可以为 Web 应用开启本地缓存。 开启本地缓存后， Web 应用内容会从共享目录复制到本地虚拟机实例的磁盘上。  
在开启了本地缓存后，w3wp 进程会在 2 分钟左右重启，如果是 java 网站，则 java 也会被中止( 因为 Web 应用 的 java 进程是由 w3wp 进程启动的 )。  
所以只有等到下次新的访问请求，网站的进程才会被启动，日志才会被重新记录。  

>[AZURE.NOTE]
>Azure Web 应用日志会自动写入本地缓存中，并定期同步到远程的共享目录。

具体如何配置本地缓存请参考 : [如何为 Azure Web 应用配置本地缓存](/documentation/articles/aog-web-app-configure-local-cache/)。

>[AZURE.IMPORTENT]
>若用户的日志很重要，不建议写入到本地缓存中，可以将其保存到 Azure  Storage 中。



