Return-Path: <dja@axtens.net>
Received: from mail-pf0-x241.google.com (mail-pf0-x241.google.com
 [IPv6:2607:f8b0:400e:c00::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 296741A0191
 for <openbmc@lists.ozlabs.org>; Wed,  3 Feb 2016 16:08:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b=MzEz6gz0; 
 dkim-atps=neutral
Received: by mail-pf0-x241.google.com with SMTP id 65so469723pfd.1
 for <openbmc@lists.ozlabs.org>; Tue, 02 Feb 2016 21:08:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:subject:in-reply-to:references:user-agent:date:message-id
 :mime-version:content-type;
 bh=yAN6YCy7cWmqddKg9xlrYDr2/x8jCRIjmSSmZSIT6Ow=;
 b=MzEz6gz0W3RyY9RO6cCR3FD18iJlVO8ePZAepDc1Ejf5cGM2S3CJswUYUvIcdiROyI
 jKyLD0xrEQlnkGbpJabhuYJZSlXxvajpZY9N2P5Vt6HuYOej1Ps1Qp5HtxII28/ITZ4G
 NOe1BAZNH33JtpVQGe81FypKH8p0HVVMxcMp0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:subject:in-reply-to:references
 :user-agent:date:message-id:mime-version:content-type;
 bh=yAN6YCy7cWmqddKg9xlrYDr2/x8jCRIjmSSmZSIT6Ow=;
 b=L8GhG6S790GP+WI6c7p+cZLBQSCugqAZpABm+5SwuGlDsUAzFous8GDId1QxZm9WeB
 Lix4JOw+4qZ9fknE7KwOyFBat1HYK+rCqjS88ERKFZj1ru7xklHiqFO6PWdD0l4nN0Fo
 EdOkyeEvRlakBT2v3CSlA5W7rvz7VPgZbtTGj54yFKAyIWRrghFOQCcMDjgiHsfuI/Qm
 uzgVFiyLlj1zjdKcJTO0cNEpLWlLMxcXvBV4yHLiTd6MzBGd6j+82GjJC6ZS2EIq5iAK
 TjydjtWPLTShkThHrN1x0FyeN6XI7yCAKfQ1zVcI4gnpmy9POE4w4XZn4URdeh6PIQgv
 ywVA==
X-Gm-Message-State: AG10YORumdAj4zEVeu98sM6aXGdYQ8iJIWa4YomCzO/4NX2dMusVRbD6CNaFeGQSW9tFVw==
X-Received: by 10.98.89.78 with SMTP id n75mr52456839pfb.120.1454476084058;
 Tue, 02 Feb 2016 21:08:04 -0800 (PST)
Received: from localhost ([138.44.250.25])
 by smtp.gmail.com with ESMTPSA id s90sm720289pfa.49.2016.02.02.21.08.02
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 02 Feb 2016 21:08:03 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH phosphor-networkd] org.openbmc.NetworkManager : Bug fixes,
 SetHwAddress & EnableDHCP
In-Reply-To: <1454436632-30694-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1454436632-30694-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1454436632-30694-2-git-send-email-openbmc-patches@stwcx.xyz>
User-Agent: Notmuch/0.21 (http://notmuchmail.org) Emacs/24.5.1
 (x86_64-pc-linux-gnu)
Date: Wed, 03 Feb 2016 16:07:50 +1100
Message-ID: <87d1seidp5.fsf@gamma.ozlabs.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
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
X-List-Received-Date: Wed, 03 Feb 2016 05:08:07 -0000

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi,

It looks like you've changed spaces to tabs.

Is there anything else you have changed? It's difficult to tell because
the change in whitespace made to every line.

Would it be possible to break up the whitespace change and the bugfix
into different patches please? It would make review much much easier.

Thanks!

Regards,
Daniel Axtens

OpenBMC Patches <openbmc-patches@stwcx.xyz> writes:
> From: Hariharasubramanian R <hramasub@in.ibm.com>
>
> ---
>  netman.py | 324 ++++++++++++++++++++++++++++++++++----------------------=
------
>  1 file changed, 178 insertions(+), 146 deletions(-)
>
> diff --git a/netman.py b/netman.py
> index 8f0fb80..5b18712 100755
> --- a/netman.py
> +++ b/netman.py
> @@ -1,146 +1,178 @@
> -#!/usr/bin/env python
> -
> -from subprocess import call
> -import sys
> -import subprocess
> -import dbus
> -import string
> -import os
> -import fcntl
> -import glib
> -import gobject
> -import dbus.service
> -import dbus.mainloop.glib
> -
> -DBUS_NAME =3D 'org.openbmc.NetworkManager'
> -OBJ_NAME =3D '/org/openbmc/NetworkManager/Interface'
> -
> -network_providers =3D {
> -	'networkd' : {=20
> -		'bus_name' : 'org.freedesktop.network1',
> -		'ip_object_name' : '/org/freedesktop/network1/network/default',
> -		'hw_object_name' : '/org/freedesktop/network1/link/_31',
> -		'interface_name' : 'org.freedesktop.network1.Network',
> -		'method' : 'org.freedesktop.network1.Network.SetAddr'
> -	},
> -	'NetworkManager' : {
> -		'bus_name' : 'org.freedesktop.NetworkManager',
> -		'ip_object_name' : '/org/freedesktop/NetworkManager',
> -		'hw_object_name' : '/org/freedesktop/NetworkManager',
> -		'interface_name' : 'org.freedesktop.NetworkManager',
> -		'method' : 'org.freedesktop.NetworkManager' # FIXME:=20
> -	},=09
> -}
> -
> -def getPrefixLen(mask):
> -	prefixLen =3D sum([bin(int(x)).count('1') for x in mask.split('.')])
> -	return prefixLen
> -
> -class IfAddr ():
> -    def __init__ (self, family, scope, flags, prefixlen, addr, gw):
> -        self.family     =3D family
> -        self.scope      =3D scope
> -        self.flags      =3D flags
> -        self.prefixlen  =3D prefixlen
> -        self.addr       =3D addr
> -        self.gw         =3D gw
> -
> -class NetMan (dbus.service.Object):
> -    def __init__(self, bus, name):
> -        self.bus =3D bus
> -        self.name =3D name
> -        dbus.service.Object.__init__(self,bus,name)
> -
> -    def setNetworkProvider(self, provider):
> -        self.provider =3D provider
> -
> -    def _setAddr (self, op, device, ipaddr, netmask, family, flags, scop=
e, gateway):
> -        netprov     =3D network_providers [self.provider]
> -        bus_name    =3D netprov ['bus_name']
> -        obj_path    =3D netprov ['ip_object_name']
> -        intf_name   =3D netprov ['interface_name']
> -
> -        obj =3D self.bus.get_object(bus_name, obj_path)
> -        intf =3D dbus.Interface(obj, intf_name)
> -        if (op =3D=3D "add"):
> -            return intf.AddAddress (device, ipaddr, netmask, family, fla=
gs, scope, gateway)
> -
> -        if (op =3D=3D "del"):
> -            return intf.DelAddress (device, ipaddr, netmask, family, fla=
gs, scope, gateway)
> -
> -    def _getAddr (self, target, device):
> -        netprov     =3D network_providers [self.provider]
> -        bus_name    =3D netprov ['bus_name']
> -
> -        if (target =3D=3D "ip"):
> -            intf_name   =3D 'org.freedesktop.network1.Network'
> -            obj_path    =3D netprov ['ip_object_name']
> -            obj =3D self.bus.get_object(bus_name, obj_path)
> -            intf =3D dbus.Interface(obj, intf_name)
> -            return intf.GetAddress (device)
> -
> -        if (target =3D=3D "mac"):
> -            intf_name   =3D 'org.freedesktop.network1.Link'
> -            obj_path    =3D netprov ['hw_object_name']
> -            obj =3D self.bus.get_object(bus_name, obj_path)
> -            intf =3D dbus.Interface(obj, intf_name)
> -            mac =3D intf.GetAddress (device)
> -            print mac
> -            return mac
> -
> -
> -
> -    @dbus.service.method(DBUS_NAME, "", "")
> -    def test(self):
> -        print("TEST")
> -
> -    @dbus.service.method(DBUS_NAME, "ssss", "x")
> -    def AddAddress4 (self, device, ipaddr, netmask, gateway):
> -        prefixLen =3D getPrefixLen (netmask)
> -        confFile =3D "/etc/systemd/network/10-bmc-" + device + ".network"
> -
> -        print("Making .network file...")
> -        networkconf =3D open (confFile, "w+")=20
> -        networkconf.write ('[Match]'+ '\n')
> -        networkconf.write ('Name=3D' + (device) + '\n')
> -        networkconf.write ('[Network]' + '\n')
> -        networkconf.write ('Address=3D' + ipaddr + '/' + str(prefixLen) =
+  '\n')
> -        networkconf.write ('Gateway=3D' + gateway + '\n')
> -        networkconf.close()
> -
> -        print("Restarting networkd service...")
> -        call(["ip", "addr", "flush", device])
> -        return 0
> -        #return self._setAddr ("add", device, ipaddr, netmask, 2, 0, 253=
, gateway
> -
> -    @dbus.service.method(DBUS_NAME, "ssss", "x")
> -    def DelAddress4 (self, device, ipaddr, netmask, gateway):
> -        prefixLen =3D getPrefixLen (netmask)
> -        confFile =3D "/etc/systemd/network/10-bmc-" + device + ".network"
> -        if not (os.path.exists(confFile)):
> -            return 1
> -
> -        self._setAddr ("del", device, ipaddr, netmask, 2, 0, 253, gatewa=
y)
> -        os.remove (confFile)
> -        return  0;
> -
> -    @dbus.service.method(DBUS_NAME, "s", "a(iyyus)s")
> -    def GetAddress4 (self, device):
> -        return self._getAddr ("ip", device)
> -
> -    @dbus.service.method(DBUS_NAME, "s", "s")
> -    def GetHwAddress (self, device):
> -        return self._getAddr ("mac", device)
> -
> -def main():
> -    dbus.mainloop.glib.DBusGMainLoop(set_as_default=3DTrue)
> -    bus =3D dbus.SystemBus()
> -    name =3D dbus.service.BusName(DBUS_NAME, bus)
> -    obj =3D NetMan (bus, OBJ_NAME)
> -    obj.setNetworkProvider ("networkd")
> -    mainloop =3D gobject.MainLoop()
> -    print("Started")
> -    mainloop.run()
> -
> -if __name__ =3D=3D '__main__':
> -    sys.exit(main())
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
> +DBUS_NAME =3D 'org.openbmc.NetworkManager'
> +OBJ_NAME =3D '/org/openbmc/NetworkManager/Interface'
> +
> +network_providers =3D {
> +	'networkd' : {=20
> +		'bus_name' : 'org.freedesktop.network1',
> +		'ip_object_name' : '/org/freedesktop/network1/network/default',
> +		'hw_object_name' : '/org/freedesktop/network1/link/_31',
> +		'ip_if_name' : 'org.freedesktop.network1.Network',
> +		'hw_if_name' : 'org.freedesktop.network1.Link',
> +		'method' : 'org.freedesktop.network1.Network.SetAddr'
> +	},
> +	'NetworkManager' : {
> +		'bus_name' : 'org.freedesktop.NetworkManager',
> +		'ip_object_name' : '/org/freedesktop/NetworkManager',
> +		'hw_object_name' : '/org/freedesktop/NetworkManager',
> +		'ip_if_name' : 'org.freedesktop.NetworkManager',
> +		'hw_if_name' : 'org.freedesktop.NetworkManager',
> +		'method' : 'org.freedesktop.NetworkManager' # FIXME:=20
> +	},=09
> +}
> +
> +def getPrefixLen(mask):
> +	prefixLen =3D sum([bin(int(x)).count('1') for x in mask.split('.')])
> +	return prefixLen
> +
> +class IfAddr ():
> +    def __init__ (self, family, scope, flags, prefixlen, addr, gw):
> +        self.family     =3D family
> +        self.scope      =3D scope
> +        self.flags      =3D flags
> +        self.prefixlen  =3D prefixlen
> +        self.addr       =3D addr
> +        self.gw         =3D gw
> +
> +class NetMan (dbus.service.Object):
> +    def __init__(self, bus, name):
> +        self.bus =3D bus
> +        self.name =3D name
> +        dbus.service.Object.__init__(self,bus,name)
> +
> +    def setNetworkProvider(self, provider):
> +        self.provider =3D provider
> +
> +    def _setAddr (self, op, device, ipaddr, netmask, family, flags, scop=
e, gateway):
> +        netprov     =3D network_providers [self.provider]
> +        bus_name    =3D netprov ['bus_name']
> +        obj_path    =3D netprov ['ip_object_name']
> +        intf_name   =3D netprov ['ip_if_name']
> +
> +        obj =3D self.bus.get_object(bus_name, obj_path)
> +        intf =3D dbus.Interface(obj, intf_name)
> +        if (op =3D=3D "add"):
> +            return intf.AddAddress (device, ipaddr, netmask, family, fla=
gs, scope, gateway)
> +
> +        if (op =3D=3D "del"):
> +            return intf.DelAddress (device, ipaddr, netmask, family, fla=
gs, scope, gateway)
> +
> +    def _getAddr (self, target, device):
> +        netprov     =3D network_providers [self.provider]
> +        bus_name    =3D netprov ['bus_name']
> +
> +        if (target =3D=3D "ip"):
> +            intf_name   =3D netprov ['ip_if_name'] #'org.freedesktop.net=
work1.Network'
> +            obj_path    =3D netprov ['ip_object_name']
> +            obj =3D self.bus.get_object(bus_name, obj_path)
> +            intf =3D dbus.Interface(obj, intf_name)
> +            return intf.GetAddress (device)
> +
> +        if (target =3D=3D "mac"):
> +            intf_name   =3D netprov ['hw_if_name'] #'org.freedesktop.net=
work1.Link'
> +            obj_path    =3D netprov ['hw_object_name']
> +            obj =3D self.bus.get_object(bus_name, obj_path)
> +            intf =3D dbus.Interface(obj, intf_name)
> +            mac =3D intf.GetAddress (device)
> +            print mac
> +            return mac
> +
> +    @dbus.service.method(DBUS_NAME, "", "")
> +    def test(self):
> +        print("TEST")
> +
> +    @dbus.service.method(DBUS_NAME, "s", "x")
> +    def EnableDHCP (self, device):
> +        confFile =3D "/etc/systemd/network/10-bmc-" + device + "-" + "dh=
cp.network"
> +        if os.path.exists(confFile):
> +            return 0
> +
> +        print("Making .network file...")
> +        networkconf =3D open (confFile, "w+")=20
> +        networkconf.write ('[Match]'+ '\n')
> +        networkconf.write ('Name=3D' + (device) + '\n')
> +        networkconf.write ('[Network]' + '\n')
> +        networkconf.write ('DHCP=3Dyes')
> +        networkconf.close ()
> +
> +        print("Restarting networkd service...")
> +        call(["systemctl", "restart", "systemd-networkd.service"])
> +        return 0
> +        #return self._setAddr ("add", device, ipaddr, netmask, 2, 0, 253=
, gateway)
> +
> +    @dbus.service.method(DBUS_NAME, "ssss", "x")
> +    def AddAddress4 (self, device, ipaddr, netmask, gateway):
> +        prefixLen =3D getPrefixLen (netmask)
> +        confFile =3D "/etc/systemd/network/10-bmc-" + device + "-" + ipa=
ddr + '_' + str(prefixLen) + ".network"
> +        if os.path.exists(confFile):
> +            return 0
> +
> +        print("Making .network file...")
> +        networkconf =3D open (confFile, "w+")=20
> +        networkconf.write ('[Match]'+ '\n')
> +        networkconf.write ('Name=3D' + (device) + '\n')
> +        networkconf.write ('[Network]' + '\n')
> +        networkconf.write ('Address=3D' + ipaddr + '/' + str(prefixLen) =
+  '\n')
> +        networkconf.write ('Gateway=3D' + gateway + '\n')
> +        networkconf.close()
> +
> +        print("Restarting networkd service...")
> +        call(["ip", "addr", "flush", device])
> +        return 0
> +        #return self._setAddr ("add", device, ipaddr, netmask, 2, 0, 253=
, gateway
> +
> +    @dbus.service.method(DBUS_NAME, "ssss", "x")
> +    def DelAddress4 (self, device, ipaddr, netmask, gateway):
> +        prefixLen =3D getPrefixLen (netmask)
> +        confFile =3D "/etc/systemd/network/10-bmc-" + device + "-" + ipa=
ddr + '_' + str(prefixLen) + ".network"
> +        if not (os.path.exists(confFile)):
> +            return 1
> +
> +        self._setAddr ("del", device, ipaddr, netmask, 2, 0, 253, gatewa=
y)
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
> +    @dbus.service.method(DBUS_NAME, "ss", "s")
> +    def SetHwAddress (self, device, mac):
> +        netprov     =3D network_providers [self.provider]
> +        bus_name    =3D netprov ['bus_name']
> +        obj_path    =3D netprov ['hw_object_name']
> +        intf_name   =3D netprov ['hw_if_name']
> +
> +        obj =3D self.bus.get_object(bus_name, obj_path)
> +        intf =3D dbus.Interface(obj, intf_name)
> +        return intf.SetAddress (device, mac)
> +
> +def main():
> +    dbus.mainloop.glib.DBusGMainLoop(set_as_default=3DTrue)
> +    bus =3D dbus.SystemBus()
> +    name =3D dbus.service.BusName(DBUS_NAME, bus)
> +    obj =3D NetMan (bus, OBJ_NAME)
> +    obj.setNetworkProvider ("networkd")
> +    mainloop =3D gobject.MainLoop()
> +    print("Started")
> +    mainloop.run()
> +
> +if __name__ =3D=3D '__main__':
> +    sys.exit(main())
> --=20
> 2.6.4
>
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: GPGTools - https://gpgtools.org

iQIcBAEBCgAGBQJWsYsmAAoJEPC3R3P2I92F7B8P/RDNAMo5XU3ikWPJZpSCtCaY
4SmEILe7DmneCcMiXgDvirdZojq7t4wmiwXfR38/UlGEL0tuCPnOVx/s9Z6IZ1hk
povHeRDQNa23C539UPpFVnzwm+nYYqLMaRl6XNhK60jCRMtGBQBC/Lf0Eszuekg4
05inwoOASiYkDOwJAEHanncQ+mWyyoeoHjdFdIs6hGrtB1pr0b+iObtWb3MicSgq
Hj6zTJ51/WcM7/xQQSDnOvqI47/DaeTcrZfFcovBSjOzLikJrVwfr7m+MVfk2+iA
S/DbNCBhmQ0lAxHbU09TeIqf2VVKSTUJohm8MCaGFkFISYM4hnFZzDs67KK8oOwJ
kY7F16ch2TYJZEWuMUlZA0UtEG49sndWzTnBJ2E15ze5Y0xWgosYdMSUEnq7zXB5
XwFt6vt5VpTsvsZpFLHp7zBRG7cDvNWSS5Ujvjz/9HyPvUfx0P1SLpF1GTmrVoNU
SaM91Ez4WuqJWwGf7/ftuJwkNrqTTFD6tfUcjK0G5cOfdGNUFuqgk6qNSlV8kVSF
MTku7TNdPaJKdbeKa0gojM4KA0FfDFnhi5eLKIiHvtWqitxNFCv9L5XuR0c637yO
D6awWazeUPoblP7PKsPXAak2Zdbxv2wy9ighPsjA+8NzohBdPKKyjcs/YK+ynqSN
kG0bWwinSTOnuav9gLet
=gg1o
-----END PGP SIGNATURE-----
--=-=-=--
