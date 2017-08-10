Return-Path: <d.mueller@elsoft.ch>
Received: from mail.hostpark.net (mail.hostpark.net [212.243.197.30])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xSq2906SVzDqkX
 for <openbmc@lists.ozlabs.org>; Thu, 10 Aug 2017 23:37:36 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.hostpark.net (Postfix) with ESMTP id B2B2716735
 for <openbmc@lists.ozlabs.org>; Thu, 10 Aug 2017 15:37:31 +0200 (CEST)
X-Virus-Scanned: by Hostpark/NetZone Mailprotection at hostpark.net
Received: from mail.hostpark.net ([127.0.0.1])
 by localhost (mail0.hostpark.net [127.0.0.1]) (amavisd-new, port 10124)
 with ESMTP id YMiQ2f8j0aUh for <openbmc@lists.ozlabs.org>;
 Thu, 10 Aug 2017 15:37:31 +0200 (CEST)
Received: from [192.168.11.10] (80-219-76-43.dclient.hispeed.ch [80.219.76.43])
 by mail.hostpark.net (Postfix) with ESMTPA id B3B9916AAD
 for <openbmc@lists.ozlabs.org>; Thu, 10 Aug 2017 15:37:30 +0200 (CEST)
Subject: Re: Crashing Phosphor Settings Manager
To: openbmc@lists.ozlabs.org
References: <f332da14-43c6-ccf9-b602-ca5358dd124e@elsoft.ch>
From: =?UTF-8?Q?David_M=c3=bcller_=28ELSOFT_AG=29?= <d.mueller@elsoft.ch>
Organization: ELSOFT AG
Message-ID: <ee3d713b-b320-4d4d-a758-0684de0799d9@elsoft.ch>
Date: Thu, 10 Aug 2017 15:37:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:51.0) Gecko/20100101 Firefox/51.0
 SeaMonkey/2.48
MIME-Version: 1.0
In-Reply-To: <f332da14-43c6-ccf9-b602-ca5358dd124e@elsoft.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 10 Aug 2017 13:37:38 -0000

Hello

While trying to further debug my problem, I had the idea to check how
things are done on the AST2500 eval board. So I built and install a new
flash image using the "evb-ast2500" configuration.

Unfortunately the symtoms are the same as with my custom configuration.

- The evb-ast2500 OpenBMC configuration is known to be good, isn't it?

- Which process/service is responsible for the "/org/openbmc/control"
  object?


root@evb-ast2500:~# cat /etc/os-release
ID="openbmc-phosphor"
NAME="Phosphor OpenBMC (Phosphor OpenBMC Project Reference Distro)"
VERSION="v1.99.8-208"
VERSION_ID="v1.99.8-208-g4ee67571-dirty"
PRETTY_NAME="Phosphor OpenBMC (Phosphor OpenBMC Project Reference
Distro) v1.99.8-208"
BUILD_ID="v1.99.8"



Aug 10 11:28:27 evb-ast2500 daemon.info systemd[1]: Starting Phosphor
Settings Manager...
Aug 10 11:28:29 evb-ast2500 daemon.info settings_manager.py[1033]:
Traceback (most recent call last):
Aug 10 11:28:29 evb-ast2500 daemon.info settings_manager.py[1033]:
File "/usr/sbin/settings_manager.py", line 262, in <module>
Aug 10 11:28:29 evb-ast2500 daemon.info settings_manager.py[1033]:
allobjects = create_object(s.SETTINGS)
Aug 10 11:28:29 evb-ast2500 daemon.info settings_manager.py[1033]:
File "/usr/sbin/settings_manager.py", line 72, in create_object
Aug 10 11:28:29 evb-ast2500 daemon.info settings_manager.py[1033]:
retries=10, interval=0.1)
Aug 10 11:28:29 evb-ast2500 daemon.info settings_manager.py[1033]:
File "/usr/lib/python2.7/site-packages/obmc/mapper/bindings.py", line
66, in get_subtree_paths
Aug 10 11:28:29 evb-ast2500 daemon.info settings_manager.py[1033]:
retries, interval)
Aug 10 11:28:29 evb-ast2500 daemon.info settings_manager.py[1033]:
File "/usr/lib/python2.7/site-packages/obmc/mapper/bindings.py", line
42, in retry
Aug 10 11:28:29 evb-ast2500 daemon.info settings_manager.py[1033]:
return func()
Aug 10 11:28:29 evb-ast2500 daemon.info settings_manager.py[1033]:
File "/usr/lib/python2.7/site-packages/obmc/mapper/bindings.py", line
65, in <lambda>
Aug 10 11:28:29 evb-ast2500 daemon.info settings_manager.py[1033]:
path, de/lib/python2.7/site-packages/dbus/connection.py", line 651, in
call_blocking
Aug 10 11:40:45 evb-ast2500 daemon.info settings_manager.py[1589]:
message, timeout)
Aug 10 11:40:45 evb-ast2500 daemon.info settings_manager.py[1589]:
dbus.exceptions.DBusException: org.freedesktop.DBus.Error.FileNotFound:
path or object not found: /org/openbmc/control
Aug 10 11:40:45 evb-ast2500 daemon.notice systemd[1]:
org.openbmc.settings.Host
.service: Main process exited, code=exited, status=1/FAILURE
Aug 10 11:40:45 evb-ast2500 daemon.err systemd[1]: Failed to start
Phosphor Settings Manager.
Aug 10 11:40:45 evb-ast2500 daemon.notice systemd[1]:
org.openbmc.settings.Host.service: Unit entered failed state.
Aug 10 11:40:45 evb-ast2500 daemon.warn systemd[1]:
org.openbmc.settings.Host.service: Failed with result 'exit-code'.
Aug 10 11:40:46 evb-ast2500 daemon.info systemd[1]:
org.openbmc.settings.Host.service: Service hold-off time over,
scheduling restart.
Aug 10 11:40:46 evb-ast2500 daemon.info systemd[1]: Stopped Phosphor
Settings Manager.


Dave
