Return-Path: <cyrilbur@gmail.com>
Received: from mail-pa0-x241.google.com (mail-pa0-x241.google.com
 [IPv6:2607:f8b0:400e:c03::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 246701A0018
 for <openbmc@lists.ozlabs.org>; Thu, 21 Jan 2016 16:15:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=wo3Gqzfg; 
 dkim-atps=neutral
Received: by mail-pa0-x241.google.com with SMTP id pv5so1230976pac.0
 for <openbmc@lists.ozlabs.org>; Wed, 20 Jan 2016 21:15:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding;
 bh=e3x/3cn8+xgXrIv0NPJbTisVlLzfl/wbT6Pfds37TfM=;
 b=wo3GqzfgHgbMvLF6E72uMMupFOkxFOqGKVGb5waJJ1cWNB46lpZUqd8deJ43+XGUGr
 yDStZ7903FtVrHI8YC0zjOKL6Wv9iW83/6Ky949PQh/++tkPQ4hiJwB0VCdJStuNYRvg
 eq7eQ4K0vVMgvNNTb0oCjRBoPK8w5p9NpmjTFMRxX5jBt6ZXZdRcgY3wZA+3EKbF+M/h
 N9ydZB2Ho2p2odjWLwcRWYW0Ifl9Pg1ua6+bkylul+MSlCYlLJ7lGz2t0Sq8Z0NunKBo
 hjTXi7/p+MdH+rJUTtKnGhxXApgHAkB4ObVue5usMRaZ0sNxxzqFbxrOeaWaptk7H2PO
 uxRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-type:content-transfer-encoding;
 bh=e3x/3cn8+xgXrIv0NPJbTisVlLzfl/wbT6Pfds37TfM=;
 b=WCr0pQZEK7rnS9WO0PuALsV6RBZapMjBQNRCpShruYa7ZhsJj10Ke2DDA3gJqhRK4P
 bWj/gJ0bb7Q8r6naYFn6Gv1uWu37itS2e49+QqRc7J7STRJBst2Onp51OJc6TSLI8tg3
 L4AmyL6lojrR8LCQmtiqXgnNTOstrkEuulgvpQo6YwjkXIDiHnNTUEuKEuagPUmgynQn
 ikqikuGomzk3WcqmpHY6JLbQTKUoft8gbvhi/HURXIOqMsN1Xf+QEHsiIy9FhF+yIDbB
 hdoiuUJoIp7mJfGryI1/28CJOT7k9bViBAfLkGE4j+uyYAdosCIU+VG7vH1JonI27ksa
 X6CQ==
X-Gm-Message-State: ALoCoQk6VyD/P8roik+Hi1RHZyaBlnWPmqPMUjTuun48FsKaYVAxlzelkxzq/Ca7kdkhyPpPmNBPayBMR5mXrXLfJ3Bywcn48Q==
X-Received: by 10.66.236.69 with SMTP id us5mr58043646pac.93.1453353327368;
 Wed, 20 Jan 2016 21:15:27 -0800 (PST)
Received: from camb691 ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id r89sm52344000pfa.57.2016.01.20.21.15.25
 (version=TLSv1/SSLv3 cipher=OTHER);
 Wed, 20 Jan 2016 21:15:27 -0800 (PST)
Date: Thu, 21 Jan 2016 16:15:20 +1100
From: Cyril Bur <cyrilbur@gmail.com>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH phosphor-networkd] Adding org.openbmc.NetworkManager
 dbus interface for network configuation.
Message-ID: <20160121161520.1557ad04@camb691>
In-Reply-To: <1453296634-21470-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1453296634-21470-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1453296634-21470-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: Claws Mail 3.13.1 (GTK+ 2.24.29; x86_64-unknown-linux-gnu)
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
X-List-Received-Date: Thu, 21 Jan 2016 05:15:30 -0000

On Wed, 20 Jan 2016 07:30:34 -0600
OpenBMC Patches <openbmc-patches@stwcx.xyz> wrote:

> From: Hariharasubramanian R <hramasub@in.ibm.com>
> 

Hi, Hariharasubramanian

So this looks like it is designed to run with your previous patch on the list.
Which answers one question I had.

It looks like this simply just bounces the dbus call along to systemd
or network manager. Why could your previous patch not do this directly?

As I'm not all that proficient in python, I'll leave the actual code review to
someone who knows a thing or two about python.

> ---
>  netman.py | 111 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 111 insertions(+)
>  create mode 100755 netman.py
> 
> diff --git a/netman.py b/netman.py
> new file mode 100755
> index 0000000..bc46fd1
> --- /dev/null
> +++ b/netman.py
> @@ -0,0 +1,111 @@
> +#!/usr/bin/env python
> +
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
> +		'object_name' : '/org/freedesktop/network1/network/default',
> +		'interface_name' : 'org.freedesktop.network1.Network',
> +		'method' : 'org.freedesktop.network1.Network.SetAddr'
> +	},
> +	'NetworkManager' : {
> +		'bus_name' : 'org.freedesktop.NetworkManager',
> +		'object_name' : '/org/freedesktop/NetworkManager',
> +		'interface_name' : 'org.freedesktop.NetworkManager',
> +		'method' : 'org.freedesktop.NetworkManager' # FIXME: 
> +	},	
> +}
> +
> +class IfAddr ():
> +    def __init__ (self, family, scope, flags, prefixlen, addr, gw):
> +        self.family     = family
> +        self.scope      = scope
> +        self.flags      = flags
> +        self.prefixlen  = prefixlen
> +        self.addr       = addr
> +        self.gw         = gw
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
> +        obj_path    = netprov ['object_name']
> +        intf_name   = netprov ['interface_name']
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
> +        obj_path    = netprov ['object_name']
> +
> +        if (target == "ip"):
> +            intf_name   = 'org.freedesktop.network1.Network'
> +
> +        if (target == "mac"):
> +            intf_name   = 'org.freedesktop.network1.Link'
> +
> +        obj = self.bus.get_object(bus_name, obj_path)
> +        intf = dbus.Interface(obj, intf_name)
> +        return intf.GetAddress (device)
> +
> +
> +    @dbus.service.method(DBUS_NAME, "", "")
> +    def test(self):
> +        print("TEST")
> +
> +    @dbus.service.method(DBUS_NAME, "ssss", "x")
> +    def AddAddress4 (self, device, ipaddr, netmask, gateway):
> +        return self._setAddr ("add", device, ipaddr, netmask, 2, 0, 253, gateway)
> +
> +    @dbus.service.method(DBUS_NAME, "ssss", "x")
> +    def DelAddress4 (self, device, ipaddr, netmask, gateway):
> +        return self._setAddr ("del", device, ipaddr, netmask, 2, 0, 253, gateway)
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
