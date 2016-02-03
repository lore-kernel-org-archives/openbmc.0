Return-Path: <cyrilbur@gmail.com>
Received: from mail-pa0-x244.google.com (mail-pa0-x244.google.com
 [IPv6:2607:f8b0:400e:c03::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 149411A007F
 for <openbmc@lists.ozlabs.org>; Wed,  3 Feb 2016 12:00:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=LZnBku34; 
 dkim-atps=neutral
Received: by mail-pa0-x244.google.com with SMTP id pv5so215720pac.0
 for <openbmc@lists.ozlabs.org>; Tue, 02 Feb 2016 17:00:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding;
 bh=XSJR8w8HZ3zyahGL74W9SHyb3/myq0A3NPJ/X8+mGJQ=;
 b=LZnBku34tYWMecjhrMhKKwhM8DDqg3cLx6NSwQhK4q9y3jSsD4XBq4f5sFcFlZKL1E
 YPrArd9l6VQMDfTVzIL6iUBmhIec/cziWekR7WDZLmARUPJTZKChj1luH1WE8B8uDIh0
 OQmwXvwAEhPM0qxWWfzTWSrdtKPX3smlO5UQj4OWYxjyuQyscICZsz54YX88K6J42Qgf
 D11bI+f786PQ9VjaJ0HfWmGQo1P/ilm8lof58iYvldQyeHQEl/nDCOjTRkFLu0vc7Quh
 9BJsir/QEAIPOcZbNHfQFnVzMNwRe0tql5xYG1st5iCzOTBckL12jcfOtCLAhJCSaGfH
 YSrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-type:content-transfer-encoding;
 bh=XSJR8w8HZ3zyahGL74W9SHyb3/myq0A3NPJ/X8+mGJQ=;
 b=VmskYy8pbrafUH5wro4O7EZxgyYHE8JBEbPAU391F1xN0WnI9r0CWLyB0EUFgFGsEo
 M9OJ6rNz5hsFOSBkn4Sm8zs6/2OCdEY7jfTD24kgCRISjUTm0tBZzeXWi0EnEzMPpUUa
 TbrlM3tdSVXGJ/9bN0VH9BDWxIQne3nFdyUayw4QRvNIGgcAuZxMzxkrdsQomPjrmiWV
 om8cmK5tsJKc1wlbxl9+V2cokTiA0/NTQWlztxSqXAJLtRLwCEmJul1IEAZaY8R4HQsJ
 EzQ89i1/T4ENbp1t4Me78q5P4b5ZVnCvP7d/ZP/VFfemKkuLhBgwuz7XfTMEoA+LQEX1
 LTGA==
X-Gm-Message-State: AG10YORseXeaCxz+hTxVnbpvIyPQNceMoTtA1dfH7dTL2f8JCc1XcKdqJ1JbtWQtLESbSQ==
X-Received: by 10.66.139.134 with SMTP id qy6mr9993718pab.45.1454461254182;
 Tue, 02 Feb 2016 17:00:54 -0800 (PST)
Received: from camb691 ([138.44.251.171])
 by smtp.gmail.com with ESMTPSA id 79sm5323474pfr.22.2016.02.02.17.00.52
 (version=TLSv1/SSLv3 cipher=OTHER);
 Tue, 02 Feb 2016 17:00:53 -0800 (PST)
Date: Wed, 3 Feb 2016 12:00:50 +1100
From: Cyril Bur <cyrilbur@gmail.com>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, hramasub@in.ibm.com
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH phosphor-networkd v2] Adding org.openbmc.NetworkManager
 dbus interface for network configuation.
Message-ID: <20160203120050.45997da1@camb691>
In-Reply-To: <1454365834-2245-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1454365834-2245-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1454365834-2245-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.29; x86_64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Feb 2016 01:00:57 -0000

On Mon,  1 Feb 2016 16:30:34 -0600
OpenBMC Patches <openbmc-patches@stwcx.xyz> wrote:

> From: Hariharasubramanian R <hramasub@in.ibm.com>
> 

After all the previous discussion about Python indenting, I thought we were
sticking to spaces. I've outlined some tabs I noticed.

I assume this python will one day be rewritten in C?

> ---
>  netman.py | 147 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 147 insertions(+)
>  create mode 100755 netman.py
> 
> diff --git a/netman.py b/netman.py
> new file mode 100755
> index 0000000..c63921f
> --- /dev/null
> +++ b/netman.py
> @@ -0,0 +1,147 @@
> +#!/usr/bin/env python
> +
> +from subprocess import call
> +import sys
> +import subprocess
> +import dbus
> +import string
> +import os
> +import fcntl
> +import glib
> +import gobject
> +import dbus.service
> +import dbus.mainloop.glib
> +
> +DBUS_NAME = 'org.openbmc.NetworkManager'
> +OBJ_NAME = '/org/openbmc/NetworkManager/Interface'
> +
> +network_providers = {
> +	'networkd' : { 
> +		'bus_name' : 'org.freedesktop.network1',
> +		'ip_object_name' : '/org/freedesktop/network1/network/default',
> +		'hw_object_name' : '/org/freedesktop/network1/link/_31',
> +		'interface_name' : 'org.freedesktop.network1.Network',
> +		'method' : 'org.freedesktop.network1.Network.SetAddr'
> +	},
> +	'NetworkManager' : {
> +		'bus_name' : 'org.freedesktop.NetworkManager',
> +		'ip_object_name' : '/org/freedesktop/NetworkManager',
> +		'hw_object_name' : '/org/freedesktop/NetworkManager',
> +		'interface_name' : 'org.freedesktop.NetworkManager',
> +		'method' : 'org.freedesktop.NetworkManager' # FIXME: 
> +	},	
> +}

Have I misunderstood PEP8, isn't it always spaces for indenting?

> +
> +def getPrefixLen(mask):
> +	prefixLen = sum([bin(int(x)).count('1') for x in mask.split('.')])
> +	return prefixLen

Tabs here... ^

> +
> +class IfAddr ():
> +    def __init__ (self, family, scope, flags, prefixlen, addr, gw):
> +        self.family     = family
> +        self.scope      = scope
> +        self.flags      = flags
> +        self.prefixlen  = prefixlen
> +        self.addr       = addr
> +        self.gw         = gw

PEP8 discourages extraneous whitespace like this...

> +
> +class NetMan (dbus.service.Object):
> +    def __init__(self, bus, name):
> +        self.bus = bus
> +        self.name = name
> +        dbus.service.Object.__init__(self,bus,name)
> +
> +    def setNetworkProvider(self, provider):
> +        self.provider = provider
> +
> +    def _setAddr (self, op, device, ipaddr, netmask, family, flags, scope, gateway):
> +        netprov     = network_providers [self.provider]
> +        bus_name    = netprov ['bus_name']
> +        obj_path    = netprov ['ip_object_name']
> +        intf_name   = netprov ['interface_name']

PEP8 discourages extraneous whitespace...

> +
> +        obj = self.bus.get_object(bus_name, obj_path)
> +        intf = dbus.Interface(obj, intf_name)
> +        if (op == "add"):
> +            return intf.AddAddress (device, ipaddr, netmask, family, flags, scope, gateway)
> +
> +        if (op == "del"):
> +            return intf.DelAddress (device, ipaddr, netmask, family, flags, scope, gateway)
> +
> +    def _getAddr (self, target, device):
> +        netprov     = network_providers [self.provider]
> +        bus_name    = netprov ['bus_name']
> +
> +        if (target == "ip"):
> +            intf_name   = 'org.freedesktop.network1.Network'
> +            obj_path    = netprov ['ip_object_name']
> +            obj = self.bus.get_object(bus_name, obj_path)
> +            intf = dbus.Interface(obj, intf_name)
> +            return intf.GetAddress (device)
> +
> +        if (target == "mac"):
> +            intf_name   = 'org.freedesktop.network1.Link'
> +            obj_path    = netprov ['hw_object_name']
> +            obj = self.bus.get_object(bus_name, obj_path)
> +            intf = dbus.Interface(obj, intf_name)
> +            mac = intf.GetAddress (device)
> +            print mac
> +            return mac
> +
> +
> +
> +    @dbus.service.method(DBUS_NAME, "", "")
> +    def test(self):
> +        print("TEST")

Should this code stay in the final version?

> +
> +    @dbus.service.method(DBUS_NAME, "ssss", "x")
> +    def AddAddress4 (self, device, ipaddr, netmask, gateway):
> +        prefixLen = getPrefixLen (netmask)
> +        confFile = "/etc/systemd/network/10-bmc-" + device + "-" + ipaddr + '_' + str(prefixLen) + ".network"
> +        if os.path.exists(confFile):
> +            return 0
> +
> +        print("Making .network file...")
> +        networkconf = open (confFile, "w+") 
> +        networkconf.write ('[Match]'+ '\n')
> +        networkconf.write ('Name=' + (device) + '\n')
> +        networkconf.write ('[Network]' + '\n')
> +        networkconf.write ('Address=' + ipaddr + '/' + str(prefixLen) +  '\n')
> +        networkconf.write ('Gateway=' + gateway + '\n')
> +
> +        print("Restarting networkd service...")
> +        call(["systemctl", "restart", "systemd-networkd.service"])
> +        return 0
> +        #return self._setAddr ("add", device, ipaddr, netmask, 2, 0, 253, gateway)

Why is that return statement commented?

> +
> +    @dbus.service.method(DBUS_NAME, "ssss", "x")
> +    def DelAddress4 (self, device, ipaddr, netmask, gateway):
> +        prefixLen = getPrefixLen (netmask)
> +        confFile = "/etc/systemd/network/10-bmc-" + device + "-" + ipaddr + '_' + str(prefixLen) + ".network"
> +        if not (os.path.exists(confFile)):
> +            return 1
> +
> +        self._setAddr ("del", device, ipaddr, netmask, 2, 0, 253, gateway)
> +        os.remove (confFile)
> +        return  0;
> +
> +    @dbus.service.method(DBUS_NAME, "s", "a(iyyus)s")
> +    def GetAddress4 (self, device):
> +        return self._getAddr ("ip", device)
> +
> +    @dbus.service.method(DBUS_NAME, "s", "s")
> +    def GetHwAddress (self, device):
> +        return self._getAddr ("mac", device)
> +
> +def main():
> +    dbus.mainloop.glib.DBusGMainLoop(set_as_default=True)
> +    bus = dbus.SystemBus()
> +    name = dbus.service.BusName(DBUS_NAME, bus)
> +    obj = NetMan (bus, OBJ_NAME)
> +    obj.setNetworkProvider ("networkd")
> +    mainloop = gobject.MainLoop()
> +    print("Started")
> +    mainloop.run()
> +
> +if __name__ == '__main__':
> +    sys.exit(main())
