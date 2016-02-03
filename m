Return-Path: <austenc@us.ibm.com>
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 878351A0167
 for <openbmc@lists.ozlabs.org>; Wed,  3 Feb 2016 13:48:50 +1100 (AEDT)
Received: from localhost
 by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Tue, 2 Feb 2016 19:48:47 -0700
Received: from d03dlp03.boulder.ibm.com (9.17.202.179)
 by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 2 Feb 2016 19:48:34 -0700
X-IBM-Helo: d03dlp03.boulder.ibm.com
X-IBM-MailFrom: austenc@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id D935119D8040
 for <openbmc@lists.ozlabs.org>; Tue,  2 Feb 2016 19:36:32 -0700 (MST)
Received: from d03av04.boulder.ibm.com (d03av04.boulder.ibm.com [9.17.195.170])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u132mXOV26411144
 for <openbmc@lists.ozlabs.org>; Tue, 2 Feb 2016 19:48:33 -0700
Received: from d03av04.boulder.ibm.com (loopback [127.0.0.1])
 by d03av04.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u132mXH9018273
 for <openbmc@lists.ozlabs.org>; Tue, 2 Feb 2016 19:48:33 -0700
Received: from d50lp01.ny.us.ibm.com (d50lp01.pok.ibm.com [146.89.104.207])
 by d03av04.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u132mWqp018231
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Tue, 2 Feb 2016 19:48:33 -0700
Message-Id: <201602030248.u132mWqp018231@d03av04.boulder.ibm.com>
Received: from /spool/local
 by d50lp01.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Tue, 2 Feb 2016 21:48:32 -0500
Received: from smtp.notes.na.collabserv.com (192.155.248.90)
 by d50lp01.ny.us.ibm.com (158.87.18.20) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Tue, 2 Feb 2016 21:48:29 -0500
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Wed, 3 Feb 2016 02:48:27 -0000
Received: from us1a3-smtp05.a3.dal06.isc4sb.com (10.146.71.159)
 by smtp.notes.na.collabserv.com (10.106.227.141) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 3 Feb 2016 02:48:27 -0000
Received: from us1a3-mail75.a3.dal09.isc4sb.com ([10.142.3.82])
 by us1a3-smtp05.a3.dal06.isc4sb.com
 with ESMTP id 2016020302482672-493497 ;
 Wed, 3 Feb 2016 02:48:26 +0000 
In-Reply-To: <20160203120050.45997da1@camb691>
Subject: Re: [PATCH phosphor-networkd v2] Adding org.openbmc.NetworkManager
 dbus interface for network configuation.
From: "Chris Austen" <austenc@us.ibm.com>
To: Cyril Bur <cyrilbur@gmail.com>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>, "Hariharasubramanian
 Ramasubramanian" <hramasub@in.ibm.com>, openbmc@lists.ozlabs.org
Date: Wed, 3 Feb 2016 02:48:26 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <20160203120050.45997da1@camb691>,
 <1454365834-2245-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1454365834-2245-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: Lotus Domino Web Server Build V851SAAS_01182016_FP3 January 26, 2016
X-LLNOutbound: False
X-Disclaimed: 651
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 16020302-0009-0000-0000-000012022B49
X-IBM-ISS-SpamDetectors: Score=0.404685; BY=0.273677; FL=0; FP=0; FZ=0; HX=0; 
 KW=0; PH=0; SC=0.404685; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00004872; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000138; SDB=6.00654409; UDB=6.00296520; UTC=2016-02-03
 02:48:27
x-cbparentid: 16020302-7792-0000-0000-000001D0E5D0
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
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
X-List-Received-Date: Wed, 03 Feb 2016 02:48:51 -0000

=20


Chris Austen
POWER Systems Enablement Manager=20
(512) 286-5184 (T/L: 363-5184)

-----"openbmc" <openbmc-bounces+austenc=3Dus.ibm.com@lists.ozlabs.org> wrot=
e: -----
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, hramasub@in.ibm.com
From: Cyril Bur=20
Sent by: "openbmc"=20
Date: 02/02/2016 07:01PM
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH phosphor-networkd v2] Adding org.openbmc.NetworkManager=
 dbus interface for network configuation.

On Mon, =C2=A01 Feb 2016 16:30:34 -0600
OpenBMC Patches <openbmc-patches@stwcx.xyz> wrote:

> From: Hariharasubramanian R <hramasub@in.ibm.com>
>=20

After all the previous discussion about Python indenting, I thought we were
sticking to spaces. I've outlined some tabs I noticed.

I assume this python will one day be rewritten in C?

> ---
> =C2=A0netman.py | 147 +++++++++++++++++++++++++++++++++++++++++++++++++++=
+++++++++++
> =C2=A01 file changed, 147 insertions(+)
> =C2=A0create mode 100755 netman.py
>=20
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
> +DBUS=5FNAME =3D 'org.openbmc.NetworkManager'
> +OBJ=5FNAME =3D '/org/openbmc/NetworkManager/Interface'
> +
> +network=5Fproviders =3D {
> +	'networkd' : {=20
> +		'bus=5Fname' : 'org.freedesktop.network1',
> +		'ip=5Fobject=5Fname' : '/org/freedesktop/network1/network/default',
> +		'hw=5Fobject=5Fname' : '/org/freedesktop/network1/link/=5F31',
> +		'interface=5Fname' : 'org.freedesktop.network1.Network',
> +		'method' : 'org.freedesktop.network1.Network.SetAddr'
> +	},
> +	'NetworkManager' : {
> +		'bus=5Fname' : 'org.freedesktop.NetworkManager',
> +		'ip=5Fobject=5Fname' : '/org/freedesktop/NetworkManager',
> +		'hw=5Fobject=5Fname' : '/org/freedesktop/NetworkManager',
> +		'interface=5Fname' : 'org.freedesktop.NetworkManager',
> +		'method' : 'org.freedesktop.NetworkManager' # FIXME:=20
> +	},=09
> +}

Have I misunderstood PEP8, isn't it always spaces for indenting?

> +
> +def getPrefixLen(mask):
> +	prefixLen =3D sum([bin(int(x)).count('1') for x in mask.split('.')])
> +	return prefixLen

Tabs here... ^

> +
> +class IfAddr ():
> + =C2=A0 =C2=A0def =5F=5Finit=5F=5F (self, family, scope, flags, prefixle=
n, addr, gw):
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0self.family =C2=A0 =C2=A0 =3D family
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0self.scope =C2=A0 =C2=A0 =C2=A0=3D scope
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0self.flags =C2=A0 =C2=A0 =C2=A0=3D flags
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0self.prefixlen =C2=A0=3D prefixlen
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0self.addr =C2=A0 =C2=A0 =C2=A0 =3D addr
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0self.gw =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D gw

PEP8 discourages extraneous whitespace like this...

> +
> +class NetMan (dbus.service.Object):
> + =C2=A0 =C2=A0def =5F=5Finit=5F=5F(self, bus, name):
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0self.bus =3D bus
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0self.name =3D name
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0dbus.service.Object.=5F=5Finit=5F=5F(self,bu=
s,name)
> +
> + =C2=A0 =C2=A0def setNetworkProvider(self, provider):
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0self.provider =3D provider
> +
> + =C2=A0 =C2=A0def =5FsetAddr (self, op, device, ipaddr, netmask, family,=
 flags, scope, gateway):
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0netprov =C2=A0 =C2=A0 =3D network=5Fprovider=
s [self.provider]
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0bus=5Fname =C2=A0 =C2=A0=3D netprov ['bus=5F=
name']
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0obj=5Fpath =C2=A0 =C2=A0=3D netprov ['ip=5Fo=
bject=5Fname']
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0intf=5Fname =C2=A0 =3D netprov ['interface=
=5Fname']

PEP8 discourages extraneous whitespace...

> +
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0obj =3D self.bus.get=5Fobject(bus=5Fname, ob=
j=5Fpath)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0intf =3D dbus.Interface(obj, intf=5Fname)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0if (op =3D=3D "add"):
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return intf.AddAddress (device=
, ipaddr, netmask, family, flags, scope, gateway)
> +
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0if (op =3D=3D "del"):
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return intf.DelAddress (device=
, ipaddr, netmask, family, flags, scope, gateway)
> +
> + =C2=A0 =C2=A0def =5FgetAddr (self, target, device):
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0netprov =C2=A0 =C2=A0 =3D network=5Fprovider=
s [self.provider]
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0bus=5Fname =C2=A0 =C2=A0=3D netprov ['bus=5F=
name']
> +
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0if (target =3D=3D "ip"):
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0intf=5Fname =C2=A0 =3D 'org.fr=
eedesktop.network1.Network'
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0obj=5Fpath =C2=A0 =C2=A0=3D ne=
tprov ['ip=5Fobject=5Fname']
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0obj =3D self.bus.get=5Fobject(=
bus=5Fname, obj=5Fpath)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0intf =3D dbus.Interface(obj, i=
ntf=5Fname)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return intf.GetAddress (device)
> +
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0if (target =3D=3D "mac"):
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0intf=5Fname =C2=A0 =3D 'org.fr=
eedesktop.network1.Link'
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0obj=5Fpath =C2=A0 =C2=A0=3D ne=
tprov ['hw=5Fobject=5Fname']
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0obj =3D self.bus.get=5Fobject(=
bus=5Fname, obj=5Fpath)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0intf =3D dbus.Interface(obj, i=
ntf=5Fname)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mac =3D intf.GetAddress (devic=
e)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0print mac
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return mac
> +
> +
> +
> + =C2=A0 =C2=A0@dbus.service.method(DBUS=5FNAME, "", "")
> + =C2=A0 =C2=A0def test(self):
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0print("TEST")

Should this code stay in the final version?

> +
> + =C2=A0 =C2=A0@dbus.service.method(DBUS=5FNAME, "ssss", "x")
> + =C2=A0 =C2=A0def AddAddress4 (self, device, ipaddr, netmask, gateway):
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0prefixLen =3D getPrefixLen (netmask)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0confFile =3D "/etc/systemd/network/10-bmc-" =
+ device + "-" + ipaddr + '=5F' + str(prefixLen) + ".network"


      =20
           if you put the ip in the name of the file then you can  create m=
ultiple .networks.  How is the networkd program suppose to know  which one =
to run?...
 10-bmc-eth0-192.168.1.2.network
 10-bmc-eth0-192.168.1.3.network
 10-bmc-eth0-10.10.0.2.network
  I would recommend hardcoding the name and just overwrite it with the new =
values like you did for the EnableDHCP write.=20
  You should build the confFile in both the AddAddress4 and EnableDHCP  fro=
m one function.  That way you never get out of sync or forget to  change a =
naming convention in two different places in the code.
           =20
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0if os.path.exists(confFile):
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0

Delete this check once you change the naming convention of the .network


> +
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0print("Making .network file...")
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0networkconf =3D open (confFile, "w+")=20
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0networkconf.write ('[Match]'+ '\n')
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0networkconf.write ('Name=3D' + (device) + '\=
n')
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0networkconf.write ('[Network]' + '\n')
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0networkconf.write ('Address=3D' + ipaddr + '=
/' + str(prefixLen) + =C2=A0'\n')
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0networkconf.write ('Gateway=3D' + gateway + =
'\n')
> +
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0print("Restarting networkd service...")
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0call(["systemctl", "restart", "systemd-netwo=
rkd.service"])

This line should be call(["ip", "addr", "flush", device])

> + =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0#return self.=5FsetAddr ("add", device, ipad=
dr, netmask, 2, 0, 253, gateway)

Why is that return statement commented?

> +
> + =C2=A0 =C2=A0@dbus.service.method(DBUS=5FNAME, "ssss", "x")
> + =C2=A0 =C2=A0def DelAddress4 (self, device, ipaddr, netmask, gateway):
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0prefixLen =3D getPrefixLen (netmask)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0confFile =3D "/etc/systemd/network/10-bmc-" =
+ device + "-" + ipaddr + '=5F' + str(prefixLen) + ".network"
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0if not (os.path.exists(confFile)):
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 1
> +
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0self.=5FsetAddr ("del", device, ipaddr, netm=
ask, 2, 0, 253, gateway)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0os.remove (confFile)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0return =C2=A00;
> +

CA: does it make sense to require the ip, netmask and gateway to delete an =
 interface?  Shouldn't it just be "eth0" ?  It's not as if eth0 can be  bou=
nded to multiple ipv4 addresses.   It appears that you needed the  extra st=
rings because you needed to build the name of the file.  I think  my other =
suggestions would solve this issue.

> + =C2=A0 =C2=A0@dbus.service.method(DBUS=5FNAME, "s", "a(iyyus)s")
> + =C2=A0 =C2=A0def GetAddress4 (self, device):
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0return self.=5FgetAddr ("ip", device)
> +
> + =C2=A0 =C2=A0@dbus.service.method(DBUS=5FNAME, "s", "s")
> + =C2=A0 =C2=A0def GetHwAddress (self, device):
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0return self.=5FgetAddr ("mac", device)
> +
> +def main():
> + =C2=A0 =C2=A0dbus.mainloop.glib.DBusGMainLoop(set=5Fas=5Fdefault=3DTrue)
> + =C2=A0 =C2=A0bus =3D dbus.SystemBus()
> + =C2=A0 =C2=A0name =3D dbus.service.BusName(DBUS=5FNAME, bus)
> + =C2=A0 =C2=A0obj =3D NetMan (bus, OBJ=5FNAME)
> + =C2=A0 =C2=A0obj.setNetworkProvider ("networkd")
> + =C2=A0 =C2=A0mainloop =3D gobject.MainLoop()
> + =C2=A0 =C2=A0print("Started")
> + =C2=A0 =C2=A0mainloop.run()
> +
> +if =5F=5Fname=5F=5F =3D=3D '=5F=5Fmain=5F=5F':
> + =C2=A0 =C2=A0sys.exit(main())

=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
openbmc mailing list
openbmc@lists.ozlabs.org
https://lists.ozlabs.org/listinfo/openbmc
