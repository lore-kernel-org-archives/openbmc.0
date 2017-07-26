Return-Path: <d.mueller@elsoft.ch>
Received: from mail.hostpark.net (mail.hostpark.net [212.243.197.30])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xHT7R5skbzDqmj
 for <openbmc@lists.ozlabs.org>; Wed, 26 Jul 2017 18:39:47 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.hostpark.net (Postfix) with ESMTP id 481EC16906
 for <openbmc@lists.ozlabs.org>; Wed, 26 Jul 2017 10:39:43 +0200 (CEST)
X-Virus-Scanned: by Hostpark/NetZone Mailprotection at hostpark.net
Received: from mail.hostpark.net ([127.0.0.1])
 by localhost (mail0.hostpark.net [127.0.0.1]) (amavisd-new, port 10124)
 with ESMTP id kbqPcD2xKq5z for <openbmc@lists.ozlabs.org>;
 Wed, 26 Jul 2017 10:39:42 +0200 (CEST)
Received: from [192.168.11.10] (80-219-76-43.dclient.hispeed.ch [80.219.76.43])
 by mail.hostpark.net (Postfix) with ESMTPA id 5FD67168EA
 for <openbmc@lists.ozlabs.org>; Wed, 26 Jul 2017 10:39:39 +0200 (CEST)
From: =?UTF-8?Q?David_M=c3=bcller_=28ELSOFT_AG=29?= <d.mueller@elsoft.ch>
To: OpenBMC <openbmc@lists.ozlabs.org>
Organization: ELSOFT AG
Subject: Crashing Phosphor Settings Manager
Message-ID: <f332da14-43c6-ccf9-b602-ca5358dd124e@elsoft.ch>
Date: Wed, 26 Jul 2017 10:39:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:49.0) Gecko/20100101 Firefox/49.0
 SeaMonkey/2.46
MIME-Version: 1.0
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
X-List-Received-Date: Wed, 26 Jul 2017 08:39:48 -0000

Hello

I have some trouble to bring up OpenBMC on your custom, AST2500 based
design. I suspect some kind of misconfiguration but was unable to
pin-point it so far.
Any idea what could be wrong with my setup or hints how to debug this issue?


root@test:~# cat /etc/os-release
ID="openbmc-phosphor"
NAME="Phosphor OpenBMC (Phosphor OpenBMC Project Reference Distro)"
VERSION="v1.99.8-94"
VERSION_ID="v1.99.8-94-g4699a110-dirty"
PRETTY_NAME="Phosphor OpenBMC (Phosphor OpenBMC Project Reference
Distro) v1.99.8-94"
BUILD_ID="v1.99.8"


The message log is full of this kind of messages:

Jul 26 07:11:36 test daemon.info systemd[1]: Starting Phosphor Settings
Manager...
Jul 26 07:11:38 test daemon.info settings_manager.py[1222]: Traceback
(most recent call last):
Jul 26 07:11:38 test daemon.info settings_manager.py[1222]:   File
"/usr/sbin/settings_manager.py", line 262, in <module>
Jul 26 07:11:38 test daemon.info settings_manager.py[1222]:
allobjects = create_object(s.SETTINGS)
Jul 26 07:11:38 test daemon.info settings_manager.py[1222]:   File
"/usr/sbin/settings_manager.py", line 72, in create_object
Jul 26 07:11:38 test daemon.info settings_manager.py[1222]:
retries=10, interval=0.1)
Jul 26 07:11:38 test daemon.info settings_manager.py[1222]:   File
"/usr/lib/python2.7/site-packages/obmc/mapper/bindings.py", line 66, in
get_subtree_paths
Jul 26 07:11:38 test daemon.info settings_manager.py[1222]:     retries,
interval)
Jul 26 07:11:38 test daemon.info settings_manager.py[1222]:   File
"/usr/lib/python2.7/site-packages/obmc/mapper/bindings.py", line 42, in
retry
Jul 26 07:11:38 test daemon.info settings_manager.py[1222]:     return
func()
Jul 26 07:11:38 test daemon.info settings_manager.py[1222]:   File
"/usr/lib/python2.7/site-packages/obmc/mapper/bindings.py", line 65, in
<lambda>
Jul 26 07:11:38 test daemon.info settings_manager.py[1222]:     path,
depth, interfaces, signature='sias'),
Jul 26 07:11:38 test daemon.info settings_manager.py[1222]:   File
"/usr/lib/python2.7/site-packages/dbus/proxies.py", line 145, in __call__
Jul 26 07:11:38 test daemon.info settings_manager.py[1222]:     **keywords)
Jul 26 07:11:38 test daemon.info settings_manager.py[1222]:   File
"/usr/lib/python2.7/site-packages/dbus/connection.py", line 651, in
call_blocking
Jul 26 07:11:38 test daemon.info settings_manager.py[1222]:     message,
timeout)
Jul 26 07:11:38 test daemon.info settings_manager.py[1222]:
dbus.exceptions.DBusException: org.freedesktop.DBus.Error.FileNotFound:
path or object not found: /org/openbmc/control
Jul 26 07:11:39 test daemon.notice systemd[1]:
org.openbmc.settings.Host.service: Main process exited, code=exited,
status=1/FAILURE
Jul 26 07:11:39 test daemon.err systemd[1]: Failed to start Phosphor
Settings Manager.
Jul 26 07:11:39 test daemon.notice systemd[1]:
org.openbmc.settings.Host.service: Unit entered failed state.
Jul 26 07:11:39 test daemon.warn systemd[1]:
org.openbmc.settings.Host.service: Failed with result 'exit-code'.
Jul 26 07:11:39 test daemon.info systemd[1]:
org.openbmc.settings.Host.service: Service hold-off time over,
scheduling restart.
Jul 26 07:11:39 test daemon.info systemd[1]: Stopped Phosphor Settings
Manager.


The "obmcutil" tool crashes with the following dump:

root@test:~# obmcutil state
Traceback (most recent call last):
  File "/usr/sbin/obmcutil", line 168, in <module>
    obj = bus.get_object(bus_name, obj_path)
  File "/usr/lib/python2.7/site-packages/dbus/bus.py", line 241, in
get_object
    follow_name_owner_changes=follow_name_owner_changes)
  File "/usr/lib/python2.7/site-packages/dbus/proxies.py", line 248, in
__init__
    self._named_service = conn.activate_name_owner(bus_name)
  File "/usr/lib/python2.7/site-packages/dbus/bus.py", line 180, in
activate_name_owner
    self.start_service_by_name(bus_name)
  File "/usr/lib/python2.7/site-packages/dbus/bus.py", line 278, in
start_service_by_name
    'su', (bus_name, flags)))
  File "/usr/lib/python2.7/site-packages/dbus/connection.py", line 651,
in call_blocking
    message, timeout)
dbus.exceptions.DBusException:
org.freedesktop.DBus.Error.ServiceUnknown: The name
xyz.openbmc_project.State.BMC was not provided by any .service files


I have stripped down the board wiring config file to the bare minimum
(at least I think so), but also this does not help.

root@test:~# cat /usr/lib/python2.7/site-packages/obmc_system_config.py
## System states
##   state can change to next state in 2 ways:
##   - a process emits a GotoSystemState signal with state name to goto
##   - objects specified in EXIT_STATE_DEPEND have started
SYSTEM_STATES = [
    'BASE_APPS',
    'BMC_STARTING',
    'BMC_READY',
    'HOST_POWERING_ON',
    'HOST_POWERED_ON',
    'HOST_BOOTING',
    'HOST_BOOTED',
    'HOST_POWERED_OFF',
]

EXIT_STATE_DEPEND = {
    'BASE_APPS' : {
        '/xyz/openbmc_project/sensors': 0,
    },
    'BMC_STARTING' : {
        '/xyz/openbmc_project/control/chassis0': 0,
    },
}

FRU_INSTANCES = {}

ID_LOOKUP = {
    'FRU' : {},
    'FRU_STR' : {},
    'SENSOR' : {},
    'GPIO_PRESENT' : {}
}

GPIO_CONFIG = {}

HWMON_CONFIG = {}
GPIO_CONFIGS = {}

MISC_SENSORS = {}


Dave
