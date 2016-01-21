Return-Path: <hramasub@in.ibm.com>
Received: from e28smtp06.in.ibm.com (e28smtp06.in.ibm.com [125.16.236.6])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 7BFCF1A02E6
 for <openbmc@lists.ozlabs.org>; Mon, 25 Jan 2016 17:23:40 +1100 (AEDT)
Received: from localhost
 by e28smtp06.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <hramasub@in.ibm.com>;
 Mon, 25 Jan 2016 11:53:36 +0530
Received: from d28relay05.in.ibm.com (9.184.220.62)
 by e28smtp06.in.ibm.com (192.168.1.136) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Mon, 25 Jan 2016 11:53:34 +0530
X-IBM-Helo: d28relay05.in.ibm.com
X-IBM-MailFrom: hramasub@in.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d50lp31.co.us.ibm.com (d50lp31.boulder.ibm.com [9.17.249.32])
 by d28relay05.in.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u0P6NT8T21692680
 for <openbmc@lists.ozlabs.org>; Mon, 25 Jan 2016 11:53:31 +0530
Message-Id: <201601250623.u0P6NT8T21692680@d28relay05.in.ibm.com>
Received: from localhost
 by d50lp31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <hramasub@in.ibm.com>;
 Sun, 24 Jan 2016 23:23:29 -0700
Received: from smtp.notes.na.collabserv.com (192.155.248.66)
 by d50lp31.co.us.ibm.com (192.168.2.141) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Sun, 24 Jan 2016 23:23:27 -0700
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: hramasub@in.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <hramasub@in.ibm.com>;
 Mon, 25 Jan 2016 06:23:26 -0000
Received: from us1a3-smtp03.a3.dal06.isc4sb.com (10.106.154.94)
 by smtp.notes.na.collabserv.com (10.106.227.127) with
 smtp.notes.na.collabserv.com ESMTP; Mon, 25 Jan 2016 06:23:25 -0000
Received: from us1a3-mail111.a3.dal06.isc4sb.com ([10.146.45.113])
 by us1a3-smtp03.a3.dal06.isc4sb.com
 with ESMTP id 2016012506242451-27780 ;
 Mon, 25 Jan 2016 06:24:24 +0000 
In-Reply-To: <20160121162313.6bb4a181@camb691>
Subject: Re: [PATCH openbmc] Dbus API for systemd/networkd for network
 configuration.
To: Cyril Bur <cyrilbur@gmail.com>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
From: "Hariharasubramanian Ramasubramanian" <hramasub@in.ibm.com>
Date: Thu, 21 Jan 2016 12:36:22 +0530
References: <1453302622-24191-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1453302622-24191-2-git-send-email-openbmc-patches@stwcx.xyz>
 <20160121162313.6bb4a181@camb691>
X-KeepSent: 6D59A278:03DEF31B-00257F41:00266AB8;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1SHF211 December 19, 2013
X-LLNOutbound: False
X-Disclaimed: 64467
X-TNEFEvaluated: 1
Content-type: multipart/related; 
 Boundary="0__=8FBBF5D2DFB5EC288f9e8a93df938690918c8FBBF5D2DFB5EC28"
x-cbid: 16012506-0021-0000-0000-000009B99931
X-IBM-ISS-SpamDetectors: Score=0.397557; BY=0.294059; FL=0; FP=0; FZ=0; HX=0; 
 KW=0; PH=0; SC=0.397557; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00004830; HX=3.00000239; KW=3.00000007;
 PH=3.00000004; SC=3.00000137; SDB=6.00650210; UDB=6.00294002; UTC=2016-01-25
 06:23:25
x-cbparentid: 16012506-9588-0000-0000-000001A79E81
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
X-List-Received-Date: Mon, 25 Jan 2016 06:23:42 -0000

--0__=8FBBF5D2DFB5EC288f9e8a93df938690918c8FBBF5D2DFB5EC28
Content-type: multipart/alternative; 
	Boundary="1__=8FBBF5D2DFB5EC288f9e8a93df938690918c8FBBF5D2DFB5EC28"


--1__=8FBBF5D2DFB5EC288f9e8a93df938690918c8FBBF5D2DFB5EC28
Content-type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable


Hi Cyril,

systemted-networkd did *not* support *dbus-api* to configure the network
interface. The way to configure network with networkd would be to edit a
corresponding *.link/*.network/*.service files.

This patch adds the dbus-api. If you introspected
the /org/freedesktop/network1/network/default object of the
org.freedesktop.network1 application, you would get the following. The
AddAddress, DelAddress and GetAddress are the new dbus methods enabled by
this patch.

--------
method return sender=3D:1.2 -> dest=3D:1.24 reply=5Fserial=3D2
   string "<!DOCTYPE node PUBLIC "-//freedesktop//DTD D-BUS Object
Introspection 1.0//EN"
"http://www.freedesktop.org/standards/dbus/1.0/introspect.dtd">
<node>
 <interface name=3D"org.freedesktop.DBus.Peer">
  <method name=3D"Ping"/>
  <method name=3D"GetMachineId">
   <arg type=3D"s" name=3D"machine=5Fuuid" direction=3D"out"/>
  </method>
 </interface>
 <interface name=3D"org.freedesktop.DBus.Introspectable">
  <method name=3D"Introspect">
   <arg name=3D"data" type=3D"s" direction=3D"out"/>
  </method>
 </interface>
 <interface name=3D"org.freedesktop.DBus.Properties">
  <method name=3D"Get">
   <arg name=3D"interface" direction=3D"in" type=3D"s"/>
   <arg name=3D"property" direction=3D"in" type=3D"s"/>
   <arg name=3D"value" direction=3D"out" type=3D"v"/>
  </method>
  <method name=3D"GetAll">
   <arg name=3D"interface" direction=3D"in" type=3D"s"/>
   <arg name=3D"properties" direction=3D"out" type=3D"a{sv}"/>
  </method>
  <method name=3D"Set">
   <arg name=3D"interface" direction=3D"in" type=3D"s"/>
   <arg name=3D"property" direction=3D"in" type=3D"s"/>
   <arg name=3D"value" direction=3D"in" type=3D"v"/>
  </method>
  <signal name=3D"PropertiesChanged">
   <arg type=3D"s" name=3D"interface"/>
   <arg type=3D"a{sv}" name=3D"changed=5Fproperties"/>
   <arg type=3D"as" name=3D"invalidated=5Fproperties"/>
  </signal>
 </interface>
 <interface name=3D"org.freedesktop.network1.Network">
  <property name=3D"Description" type=3D"s" access=3D"read">
   <annotation name=3D"org.freedesktop.DBus.Property.EmitsChangedSignal"
value=3D"const"/>
  </property>
  <property name=3D"SourcePath" type=3D"s" access=3D"read">
   <annotation name=3D"org.freedesktop.DBus.Property.EmitsChangedSignal"
value=3D"const"/>
  </property>
  <property name=3D"MatchMAC" type=3D"as" access=3D"read">
   <annotation name=3D"org.freedesktop.DBus.Property.EmitsChangedSignal"
value=3D"const"/>
  </property>
  <property name=3D"MatchPath" type=3D"as" access=3D"read">
   <annotation name=3D"org.freedesktop.DBus.Property.EmitsChangedSignal"
value=3D"const"/>
  </property>
  <property name=3D"MatchDriver" type=3D"as" access=3D"read">
   <annotation name=3D"org.freedesktop.DBus.Property.EmitsChangedSignal"
value=3D"const"/>
  </property>
  <property name=3D"MatchType" type=3D"as" access=3D"read">
   <annotation name=3D"org.freedesktop.DBus.Property.EmitsChangedSignal"
value=3D"const"/>
  </property>
  <property name=3D"MatchName" type=3D"as" access=3D"read">
   <annotation name=3D"org.freedesktop.DBus.Property.EmitsChangedSignal"
value=3D"const"/>
  </property>
  <method name=3D"AddAddress">
   <arg type=3D"s" direction=3D"in"/>
   <arg type=3D"s" direction=3D"in"/>
   <arg type=3D"s" direction=3D"in"/>
   <arg type=3D"y" direction=3D"in"/>
   <arg type=3D"y" direction=3D"in"/>
   <arg type=3D"y" direction=3D"in"/>
   <arg type=3D"s" direction=3D"in"/>
   <arg type=3D"x" direction=3D"out"/>
  </method>
  <method name=3D"DelAddress">
   <arg type=3D"s" direction=3D"in"/>
   <arg type=3D"s" direction=3D"in"/>
   <arg type=3D"s" direction=3D"in"/>
   <arg type=3D"y" direction=3D"in"/>
   <arg type=3D"y" direction=3D"in"/>
   <arg type=3D"y" direction=3D"in"/>
   <arg type=3D"s" direction=3D"in"/>
   <arg type=3D"x" direction=3D"out"/>
  </method>
  <method name=3D"GetAddress">
   <arg type=3D"s" direction=3D"in"/>
   <arg type=3D"a(iyyus)" direction=3D"out"/>
   <arg type=3D"s" direction=3D"out"/>
  </method>
 </interface>
</node>
"
--------

regards,
rhari !

Hariharasubramanian R.
Power Firmware Development
IBM India Systems & Technology Lab, Bangalore, India
Phone:  +91 80 4025 6950



From:	Cyril Bur <cyrilbur@gmail.com>
To:	OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc:	openbmc@lists.ozlabs.org
Date:	01/21/2016 10:53 AM
Subject:	Re: [PATCH openbmc] Dbus API for systemd/networkd for network
            configuration.
Sent by:	"openbmc" <openbmc-bounces
            +hramasub=3Din.ibm.com@lists.ozlabs.org>



On Wed, 20 Jan 2016 09:10:22 -0600
OpenBMC Patches <openbmc-patches@stwcx.xyz> wrote:

> From: Hariharasubramanian R <hramasub@in.ibm.com>
>

Hi Hariharasubramanian,

Just to be sure I've got this right, we're patching systemd now? Does
systemd
not already do this? I thought the one good thing with systemd is that it
provides all this kind of stuff out of the box?

> ---
>  .../0100-systemd=5Fnetworkd=5Fdbus=5Fsetaddress.patch    | 845 +++++++++=
++++++
++++++
>  .../meta/recipes-core/systemd/systemd=5F225.bb       |   1 +
>  2 files changed, 846 insertions(+)
>  create mode 100644
yocto-poky/meta/recipes-core/systemd/systemd/0100-systemd=5Fnetworkd=5Fdbus=
=5Fsetaddress.patch

>
> diff --git
a/yocto-poky/meta/recipes-core/systemd/systemd/0100-systemd=5Fnetworkd=5Fdb=
us=5Fsetaddress.patch

b/yocto-poky/meta/recipes-core/systemd/systemd/0100-systemd=5Fnetworkd=5Fdb=
us=5Fsetaddress.patch

> new file mode 100644
> index 0000000..6727c1e
> --- /dev/null
> +++
b/yocto-poky/meta/recipes-core/systemd/systemd/0100-systemd=5Fnetworkd=5Fdb=
us=5Fsetaddress.patch

> @@ -0,0 +1,845 @@
> +From 35efeac7a1b1f6b737348f649d58d1c7eb5ecb8d Mon Sep 17 00:00:00 2001
> +From: Hariharasubramanian R <hramasub@in.ibm.com>
> +Date: Tue, 19 Jan 2016 05:04:40 -0600
> +Subject: [PATCH] Test
> +
> +---
> + src/network/networkd-link-bus.c           |  93 +++++
> + src/network/networkd-network-bus.c        | 556 +++++++++++++++++++++++
+++++++
> + src/network/networkd-network.c            |  81 +++++
> + src/network/org.freedesktop.network1.conf |  17 +
> + 4 files changed, 747 insertions(+)
> +
> +diff --git a/src/network/networkd-link-bus.c
b/src/network/networkd-link-bus.c
> +index 1a1524d..103d513 100644
> +--- a/src/network/networkd-link-bus.c
> ++++ b/src/network/networkd-link-bus.c
> +@@ -25,15 +25,41 @@
> + #include "networkd.h"
> + #include "networkd-link.h"
> +
> ++#define SYSTEMD=5FNETWORKD=5FDBUS 1
> ++
> ++#ifdef SYSTEMD=5FNETWORKD=5FDBUS
> ++/*
> ++#include "hostname-util.h"
> ++#include "network-internal.h"
> ++#include "networkd-link.h"
> ++#include "bus-util.h"
> ++*/
> ++#include "sd-network.h"
> ++#include "sd-netlink.h"
> ++#include "socket-util.h"
> ++#include "ether-addr-util.h"
> ++/*
> ++#include "local-addresses.h"
> ++*/
> ++#endif
> ++
> + static BUS=5FDEFINE=5FPROPERTY=5FGET=5FENUM(property=5Fget=5Foperationa=
l=5Fstate,
link=5Foperstate, LinkOperationalState);
> + static BUS=5FDEFINE=5FPROPERTY=5FGET=5FENUM(property=5Fget=5Fadministra=
tive=5Fstate,
link=5Fstate, LinkState);
> +
> ++#ifdef SYSTEMD=5FNETWORKD=5FDBUS
> ++static int method=5Fget=5Faddress (sd=5Fbus=5Fmessage *m, void* userdat=
a,
sd=5Fbus=5Ferror *error);
> ++#endif
> ++
> + const sd=5Fbus=5Fvtable link=5Fvtable[] =3D {
> +         SD=5FBUS=5FVTABLE=5FSTART(0),
> +
> +         SD=5FBUS=5FPROPERTY("OperationalState", "s",
property=5Fget=5Foperational=5Fstate, offsetof(Link, operstate),
SD=5FBUS=5FVTABLE=5FPROPERTY=5FEMITS=5FCHANGE),
> +         SD=5FBUS=5FPROPERTY("AdministrativeState", "s",
property=5Fget=5Fadministrative=5Fstate, offsetof(Link, state),
SD=5FBUS=5FVTABLE=5FPROPERTY=5FEMITS=5FCHANGE),
> +
> ++#ifdef SYSTEMD=5FNETWORKD=5FDBUS
> ++		     /* device name */
> ++    		 SD=5FBUS=5FMETHOD("GetAddress", "s", "s",
method=5Fget=5Faddress, SD=5FBUS=5FVTABLE=5FUNPRIVILEGED),
> ++#endif
> +         SD=5FBUS=5FVTABLE=5FEND
> + };
> +
> +@@ -136,3 +162,70 @@ int link=5Fsend=5Fchanged(Link *link, const char
*property, ...) {
> +                         "org.freedesktop.network1.Link",
> +                         l);
> + }
> ++
> ++static int method=5Fget=5Faddress (sd=5Fbus=5Fmessage *m, void* userdat=
a,
sd=5Fbus=5Ferror *error)
> ++{
> ++    =5Fcleanup=5Fnetlink=5Funref=5F sd=5Fnetlink                  *rtnl=
   =3D NULL;
> ++    =5Fcleanup=5Fnetlink=5Fmessage=5Funref=5F sd=5Fnetlink=5Fmessage  *=
req    =3D NULL;
> ++    =5Fcleanup=5Fnetlink=5Fmessage=5Funref=5F sd=5Fnetlink=5Fmessage  *=
reply  =3D NULL;
> ++    =5Fcleanup=5Fbus=5Fmessage=5Funref=5F sd=5Fbus=5Fmessage          *=
resp   =3D NULL;
> ++    Manager                                             *mgr    =3D
userdata;
> ++
> ++    struct udev*        udev               =3D NULL;
> ++    struct udev=5Fdevice* udev=5Feth           =3D NULL;
> ++    const char*         device             =3D NULL;
> ++    char                devpath [32]       =3D "/sys/class/net/";
> ++
> ++    int                 r;
> ++    unsigned char       ifindex;
> ++    bool                have=5Fmac;
> ++    struct ether=5Faddr   e;
> ++    char                ea[ETHER=5FADDR=5FTO=5FSTRING=5FMAX];
> ++
> ++    assert(m);
> ++    assert(mgr);
> ++
> ++    r =3D sd=5Fbus=5Fmessage=5Fread (m, "s", &device);
> ++    if (r < 0)
> ++        return r;
> ++
> ++    if (isempty (device))
> ++        return sd=5Fbus=5Ferror=5Fsetf(error, SD=5FBUS=5FERROR=5FINVALI=
D=5FARGS,
"Invalid Device Name.");
> ++
> ++    udev =3D udev=5Fnew();
> ++    udev=5Feth =3D udev=5Fdevice=5Fnew=5Ffrom=5Fsyspath(udev, strcat (d=
evpath,
device));
> ++    if (!udev=5Feth)
> ++        return sd=5Fbus=5Ferror=5Fsetf(error, SD=5FBUS=5FERROR=5FFAILED=
, "Could not
find udev device");
> ++
> ++    ifindex =3D udev=5Fdevice=5Fget=5Fifindex(udev=5Feth);
> ++
> ++    r =3D sd=5Fnetlink=5Fopen(&rtnl);
> ++    if (r < 0)
> ++            return log=5Ferror=5Ferrno(r, "Failed to connect to
netlink:"); /* fixme */
> ++
> ++    r =3D sd=5Frtnl=5Fmessage=5Fnew=5Flink(rtnl, &req, RTM=5FGETLINK, i=
findex);
> ++    if (r < 0)
> ++            return r;
> ++
> ++    r =3D sd=5Fnetlink=5Fcall(rtnl, req, 0, &reply); /* fixme */
> ++    if (r < 0)
> ++            return r;
> ++
> ++    have=5Fmac =3D sd=5Fnetlink=5Fmessage=5Fread=5Fether=5Faddr(reply, =
IFLA=5FADDRESS,
&e) >=3D 0;
> ++    if (!have=5Fmac)
> ++        return sd=5Fbus=5Ferror=5Fsetf(error, SD=5FBUS=5FERROR=5FFAILED=
, "Error
reading IFLA address");
> ++
> ++    ether=5Faddr=5Fto=5Fstring(&e, ea);
> ++
> ++    r =3D sd=5Fbus=5Fmessage=5Fnew=5Fmethod=5Freturn(m, &resp);
> ++    if (r < 0)
> ++        return sd=5Fbus=5Ferror=5Fsetf(error, SD=5FBUS=5FERROR=5FNO=5FM=
EMORY, "Error
allocating reply messgage");
> ++
> ++    r =3D sd=5Fbus=5Fmessage=5Fappend(resp, "s", ea);
> ++    if (r < 0)
> ++        return sd=5Fbus=5Ferror=5Fsetf(error, SD=5FBUS=5FERROR=5FFAILED=
, "Error
appending to reply messgage");
> ++
> ++    r =3D sd=5Fbus=5Fsend(mgr->bus, resp, NULL);
> ++
> ++    return sd=5Fbus=5Freply=5Fmethod=5Freturn(m, "s", "Getting IFLA
address ...");
> ++}
> +diff --git a/src/network/networkd-network-bus.c
b/src/network/networkd-network-bus.c
> +index 5717a15..6f0d1e5 100644
> +--- a/src/network/networkd-network-bus.c
> ++++ b/src/network/networkd-network-bus.c
> +@@ -19,10 +19,34 @@
> +   along with systemd; If not, see <http://www.gnu.org/licenses/>.
> + ***/
> +
> ++#define SYSTEMD=5FNETWORKD=5FDBUS 1
> ++
> ++#ifdef SYSTEMD=5FNETWORKD=5FDBUS
> ++#include <netinet/ether.h>
> ++#include <linux/if.h>
> ++#endif
> ++
> + #include "strv.h"
> +
> + #include "networkd.h"
> +
> ++#ifdef SYSTEMD=5FNETWORKD=5FDBUS
> ++#include "hostname-util.h"
> ++#include "network-internal.h"
> ++#include "networkd-link.h"
> ++#include "bus-util.h"
> ++
> ++#include "sd-network.h"
> ++#include "sd-netlink.h"
> ++#include "local-addresses.h"
> ++#endif
> ++
> ++#ifdef SYSTEMD=5FNETWORKD=5FDBUS
> ++int network=5Faddress=5Fadded=5Fhandler (sd=5Fnetlink* rtnl,
sd=5Fnetlink=5Fmessage* m, void* userdata);
> ++int network=5Frtnl=5Fprocess=5Faddress(sd=5Fnetlink *rtnl, sd=5Fnetlink=
=5Fmessage
*message, void *userdata, Address* address); /* fixme */
> ++static int method=5Fget=5Faddress (sd=5Fbus=5Fmessage *m, void* userdat=
a,
sd=5Fbus=5Ferror *error); /* fixme */
> ++#endif
> ++
> + static int property=5Fget=5Fether=5Faddrs(
> +                 sd=5Fbus *bus,
> +                 const char *path,
> +@@ -56,6 +80,11 @@ static int property=5Fget=5Fether=5Faddrs(
> +         return sd=5Fbus=5Fmessage=5Fclose=5Fcontainer(reply);
> + }
> +
> ++#ifdef SYSTEMD=5FNETWORKD=5FDBUS
> ++static int method=5Fadd=5Faddress (sd=5Fbus=5Fmessage *m, void* userdat=
a,
sd=5Fbus=5Ferror *error);
> ++static int method=5Fdel=5Faddress (sd=5Fbus=5Fmessage *m, void* userdat=
a,
sd=5Fbus=5Ferror *error);
> ++#endif
> ++
> + const sd=5Fbus=5Fvtable network=5Fvtable[] =3D {
> +         SD=5FBUS=5FVTABLE=5FSTART(0),
> +
> +@@ -67,6 +96,13 @@ const sd=5Fbus=5Fvtable network=5Fvtable[] =3D {
> +         SD=5FBUS=5FPROPERTY("MatchType", "as", NULL, offsetof(Network,
match=5Ftype), SD=5FBUS=5FVTABLE=5FPROPERTY=5FCONST),
> +         SD=5FBUS=5FPROPERTY("MatchName", "as", NULL, offsetof(Network,
match=5Fname), SD=5FBUS=5FVTABLE=5FPROPERTY=5FCONST),
> +
> ++#ifdef SYSTEMD=5FNETWORKD=5FDBUS
> ++		     /* device, IP, netmask, family, flags, scope, gateway */
> ++    		 SD=5FBUS=5FMETHOD("AddAddress", "sssyyys", "x",
method=5Fadd=5Faddress, SD=5FBUS=5FVTABLE=5FUNPRIVILEGED),
> ++    		 SD=5FBUS=5FMETHOD("DelAddress", "sssyyys", "x",
method=5Fdel=5Faddress, SD=5FBUS=5FVTABLE=5FUNPRIVILEGED),
> ++		     /* (family, prefixlen, flags, scope, IP)+ gateway */
> ++    		 SD=5FBUS=5FMETHOD("GetAddress", "s", "a(iyyus)s",
method=5Fget=5Faddress, SD=5FBUS=5FVTABLE=5FUNPRIVILEGED),
> ++#endif
> +         SD=5FBUS=5FVTABLE=5FEND
> + };
> +
> +@@ -152,3 +188,523 @@ int network=5Fobject=5Ffind(sd=5Fbus *bus, const c=
har
*path, const char *interface, vo
> +
> +         return 1;
> + }
> ++
> ++#ifdef SYSTEMD=5FNETWORKD=5FDBUS
> ++
> ++static int method=5Fadd=5Faddress (sd=5Fbus=5Fmessage *m, void* userdat=
a,
sd=5Fbus=5Ferror *error)
> ++{
> ++    =5Fcleanup=5Fbus=5Fmessage=5Funref=5F sd=5Fbus=5Fmessage*         r=
esp    =3D NULL;
> ++    =5Fcleanup=5Fnetlink=5Funref=5F sd=5Fnetlink*                 rtnl =
   =3D NULL;
> ++    =5Fcleanup=5Fnetlink=5Fmessage=5Funref=5F sd=5Fnetlink=5Fmessage* r=
eq     =3D NULL;
> ++    =5Fcleanup=5Fnetlink=5Fmessage=5Funref=5F sd=5Fnetlink=5Fmessage* r=
eply   =3D NULL;
> ++    =5Fcleanup=5Faddress=5Ffree=5F Address *addr                       =
 =3D NULL;
> ++    =5Fcleanup=5Froute=5Ffree=5F Route *rt                             =
 =3D NULL;
> ++    Manager *mgr                                                =3D
userdata;
> ++    Link*               link               =3D NULL;
> ++    struct udev*        udev               =3D NULL;
> ++    struct udev=5Fdevice* udev=5Feth           =3D NULL;
> ++
> ++    const char*         device             =3D NULL;
> ++    const char*         ipaddr             =3D NULL;
> ++    const char*         netmask            =3D NULL;
> ++    const char*         gateway            =3D NULL;
> ++    char                devpath [32]       =3D "/sys/class/net/";
> ++
> ++    unsigned char       family;
> ++    unsigned char       prefixlen;
> ++    unsigned char       flags;
> ++    unsigned char       scope;
> ++    unsigned char       ifindex;
> ++
> ++    struct in=5Faddr      nm;
> ++    struct in=5Faddr      ip;
> ++    struct in=5Faddr      gw;
> ++    int r;
> ++
> ++    assert(m);
> ++    assert(mgr);
> ++
> ++    r =3D sd=5Fbus=5Fmessage=5Fread (m, "sssyyys", &device, &ipaddr, &n=
etmask,
&family, &flags, &scope, &gateway);
> ++    if (r < 0)
> ++        return r;
> ++
> ++    if (isempty (device))
> ++        return sd=5Fbus=5Ferror=5Fsetf(error, SD=5FBUS=5FERROR=5FINVALI=
D=5FARGS,
"Invalid Device Name.");
> ++
> ++    if (isempty (ipaddr))
> ++        return sd=5Fbus=5Ferror=5Fsetf(error, SD=5FBUS=5FERROR=5FINVALI=
D=5FARGS,
"Invalid IP Address.");
> ++
> ++    if (isempty (netmask))
> ++        return sd=5Fbus=5Ferror=5Fsetf(error, SD=5FBUS=5FERROR=5FINVALI=
D=5FARGS,
"Invalid IP Netmask.");
> ++
> ++    assert(family =3D=3D AF=5FINET || family =3D=3D AF=5FINET6);
> ++
> ++    udev =3D udev=5Fnew();
> ++    udev=5Feth =3D udev=5Fdevice=5Fnew=5Ffrom=5Fsyspath(udev, strcat (d=
evpath,
device));
> ++    if (!udev=5Feth)
> ++            return sd=5Fbus=5Ferror=5Fsetf(error, SD=5FBUS=5FERROR=5FFA=
ILED, "Could
not find udev device");
> ++
> ++    ifindex =3D udev=5Fdevice=5Fget=5Fifindex(udev=5Feth);
> ++
> ++    inet=5Faton (netmask, &nm);
> ++    inet=5Faton (ipaddr, &ip);
> ++    if (!isempty (gateway)) inet=5Faton (gateway, &gw);
> ++
> ++    prefixlen =3D in=5Faddr=5Fnetmask=5Fto=5Fprefixlen(&nm);
> ++    assert(prefixlen > 0);
> ++
> ++    r =3D address=5Fnew=5Fdynamic(&addr);
> ++    if (r < 0)
> ++        return sd=5Fbus=5Ferror=5Fsetf(error, SD=5FBUS=5FERROR=5FNO=5FM=
EMORY, "Error
allocating new address");
> ++
> ++    r =3D sd=5Fnetlink=5Fopen(&rtnl);
> ++    if (r < 0)
> ++            return sd=5Fbus=5Ferror=5Fsetf(error, SD=5FBUS=5FERROR=5FIO=
=5FERROR,
"Failed to connect to netlink");
> ++
> ++    link =3D new0(Link, 1);
> ++    if (!link)
> ++            return -ENOMEM;
> ++
> ++    link->network =3D new0(Network, 1);
> ++    if (!link->network)
> ++            return sd=5Fbus=5Ferror=5Fsetf(error, SD=5FBUS=5FERROR=5FNO=
=5FMEMORY,
"Could not alloc memory for Network");
> ++
> ++    link->n=5Fref                 =3D 1;
> ++    link->manager               =3D mgr;
> ++    link->manager->rtnl         =3D rtnl;
> ++    link->state                 =3D LINK=5FSTATE=5FPENDING;
> ++    link->rtnl=5Fextended=5Fattrs   =3D true;
> ++    link->ifindex               =3D ifindex;
> ++    link->ifname                =3D strdup(device); /*FIXME:*/
> ++    if (!link->ifname)
> ++            return -ENOMEM;
> ++
> ++    addr->family                =3D family;
> ++    addr->in=5Faddr.in.s=5Faddr     =3D ip.s=5Faddr;
> ++    addr->prefixlen             =3D prefixlen;
> ++    addr->broadcast.s=5Faddr      =3D ip.s=5Faddr | ~nm.s=5Faddr;
> ++
> ++    if (!isempty (gateway))
> ++    {
> ++        r =3D route=5Fnew=5Fdynamic(&rt, RTPROT=5FSTATIC);
> ++        if (r < 0)
> ++            return r;
> ++
> ++        rt->protocol        =3D RTPROT=5FSTATIC;
> ++        rt->network         =3D link->network;
> ++        rt->family          =3D family;
> ++        rt->scope           =3D RT=5FSCOPE=5FLINK;            /* FIXME:=
 */
> ++        rt->dst=5Fprefixlen   =3D 32;                       /* FIXME:
AF=5FINET assumed */
> ++        rt->dst=5Faddr.in     =3D gw;
> ++
> ++        LIST=5FPREPEND(routes, link->network->static=5Froutes, rt);
> ++    }
> ++
> ++    /* send an nlmsg (RTM=5FNEWADDR) and append address to link address
list */
> ++    r =3D address=5Fupdate (addr, link, network=5Faddress=5Fadded=5Fhan=
dler);
> ++    if (r < 0)
> ++        return r;
> ++
> ++    r =3D sd=5Fbus=5Fmessage=5Fnew=5Fmethod=5Freturn(m, &resp);
> ++    if (r < 0)
> ++        return sd=5Fbus=5Ferror=5Fsetf(error, SD=5FBUS=5FERROR=5FNO=5FM=
EMORY, "Error
allocating reply messgage");
> ++
> ++    r =3D sd=5Fbus=5Fmessage=5Fappend(resp, "x", 0);
> ++    if (r < 0)
> ++            return sd=5Fbus=5Ferror=5Fsetf(error, SD=5FBUS=5FERROR=5FFA=
ILED, "Error
appending to reply messgage");
> ++
> ++    r =3D sd=5Fbus=5Fsend(mgr->bus, resp, NULL);
> ++    if (r < 0)
> ++            return sd=5Fbus=5Ferror=5Fsetf(error, SD=5FBUS=5FERROR=5FFA=
ILED, "Error
sending reply messgage");
> ++
> ++    return sd=5Fbus=5Freply=5Fmethod=5Freturn(m, "s", "Adding IP addres=
s...");
> ++}
> ++
> ++static int method=5Fdel=5Faddress (sd=5Fbus=5Fmessage *m, void* userdat=
a,
sd=5Fbus=5Ferror *error)
> ++{
> ++    =5Fcleanup=5Fbus=5Fmessage=5Funref=5F sd=5Fbus=5Fmessage*         r=
esp    =3D NULL;
> ++    =5Fcleanup=5Fnetlink=5Funref=5F sd=5Fnetlink*                 rtnl =
   =3D NULL;
> ++    =5Fcleanup=5Fnetlink=5Fmessage=5Funref=5F sd=5Fnetlink=5Fmessage* r=
eq     =3D NULL;
> ++    =5Fcleanup=5Fnetlink=5Fmessage=5Funref=5F sd=5Fnetlink=5Fmessage* r=
eply   =3D NULL;
> ++    =5Fcleanup=5Faddress=5Ffree=5F Address *addr                       =
 =3D NULL;
> ++    =5Fcleanup=5Froute=5Ffree=5F Route *rt                             =
 =3D NULL;
> ++    Manager *mgr                                                =3D
userdata;
> ++    Link*               link               =3D NULL;
> ++    struct udev*        udev               =3D NULL;
> ++    struct udev=5Fdevice* udev=5Feth           =3D NULL;
> ++
> ++    const char*         device             =3D NULL;
> ++    const char*         ipaddr             =3D NULL;
> ++    const char*         netmask            =3D NULL;
> ++    const char*         gateway            =3D NULL;
> ++    char                devpath [32]       =3D "/sys/class/net/";
> ++
> ++    unsigned char       family;
> ++    unsigned char       prefixlen;
> ++    unsigned char       flags;
> ++    unsigned char       scope;
> ++    unsigned char       ifindex;
> ++
> ++    struct in=5Faddr      nm;
> ++    struct in=5Faddr      ip;
> ++    struct in=5Faddr      gw;
> ++    int r;
> ++
> ++    assert(m);
> ++    assert(mgr);
> ++
> ++    r =3D sd=5Fbus=5Fmessage=5Fread (m, "sssyyys", &device, &ipaddr, &n=
etmask,
&family, &flags, &scope, &gateway);
> ++    if (r < 0)
> ++        return r;
> ++
> ++    if (isempty (device))
> ++        return sd=5Fbus=5Ferror=5Fsetf(error, SD=5FBUS=5FERROR=5FINVALI=
D=5FARGS,
"Invalid Device Name.");
> ++
> ++    if (isempty (ipaddr))
> ++        return sd=5Fbus=5Ferror=5Fsetf(error, SD=5FBUS=5FERROR=5FINVALI=
D=5FARGS,
"Invalid IP Address.");
> ++
> ++    if (isempty (netmask))
> ++        return sd=5Fbus=5Ferror=5Fsetf(error, SD=5FBUS=5FERROR=5FINVALI=
D=5FARGS,
"Invalid IP Netmask.");
> ++
> ++    assert(family =3D=3D AF=5FINET || family =3D=3D AF=5FINET6);
> ++
> ++    udev =3D udev=5Fnew();
> ++    udev=5Feth =3D udev=5Fdevice=5Fnew=5Ffrom=5Fsyspath(udev, strcat (d=
evpath,
device));
> ++    if (!udev=5Feth)
> ++            return sd=5Fbus=5Ferror=5Fsetf(error, SD=5FBUS=5FERROR=5FFA=
ILED, "Could
not find udev device");
> ++
> ++    ifindex =3D udev=5Fdevice=5Fget=5Fifindex(udev=5Feth);
> ++
> ++    inet=5Faton (netmask, &nm);
> ++    inet=5Faton (ipaddr, &ip);
> ++    if (!isempty (gateway)) inet=5Faton (gateway, &gw);
> ++
> ++    prefixlen =3D in=5Faddr=5Fnetmask=5Fto=5Fprefixlen(&nm);
> ++    assert(prefixlen > 0);
> ++
> ++    r =3D address=5Fnew=5Fdynamic(&addr);
> ++    if (r < 0)
> ++        return sd=5Fbus=5Ferror=5Fsetf(error, SD=5FBUS=5FERROR=5FNO=5FM=
EMORY, "Error
allocating new address");
> ++
> ++    r =3D sd=5Fnetlink=5Fopen(&rtnl);
> ++    if (r < 0)
> ++            return sd=5Fbus=5Ferror=5Fsetf(error, SD=5FBUS=5FERROR=5FIO=
=5FERROR,
"Failed to connect to netlink");
> ++
> ++    link =3D new0(Link, 1);
> ++    if (!link)
> ++            return -ENOMEM;
> ++
> ++    link->network =3D new0(Network, 1);
> ++    if (!link->network)
> ++            return sd=5Fbus=5Ferror=5Fsetf(error, SD=5FBUS=5FERROR=5FNO=
=5FMEMORY,
"Could not alloc memory for Network");
> ++
> ++    link->n=5Fref                 =3D 1;
> ++    link->manager               =3D mgr;
> ++    link->manager->rtnl         =3D rtnl;
> ++    link->state                 =3D LINK=5FSTATE=5FPENDING;
> ++    link->rtnl=5Fextended=5Fattrs   =3D true;
> ++    link->ifindex               =3D ifindex;
> ++    link->ifname                =3D strdup(device);
> ++    if (!link->ifname)
> ++            return -ENOMEM;
> ++
> ++    addr->family                =3D family;
> ++    addr->in=5Faddr.in.s=5Faddr     =3D ip.s=5Faddr;
> ++    addr->prefixlen             =3D prefixlen;
> ++    addr->broadcast.s=5Faddr      =3D ip.s=5Faddr | ~nm.s=5Faddr;
> ++
> ++    if (!isempty (gateway))
> ++    {
> ++        r =3D route=5Fnew=5Fdynamic(&rt, RTPROT=5FSTATIC);
> ++        if (r < 0)
> ++            return r;
> ++
> ++        rt->network         =3D link->network;
> ++        rt->family          =3D family;
> ++        rt->scope           =3D RT=5FSCOPE=5FLINK;            /* FIXME:=
 */
> ++        rt->dst=5Fprefixlen   =3D 32;                       /* FIXME:
AF=5FINET assumed */
> ++        rt->dst=5Faddr.in     =3D gw;
> ++
> ++        /*LIST=5FPREPEND(routes, link->network->static=5Froutes, rt);*/
> ++        /* Drop the Gateway */
> ++        route=5Fdrop (rt, link, link=5Froute=5Fdrop=5Fhandler);
> ++    }
> ++
> ++    /* send an nlmsg to delete address from address list */
> ++    r =3D address=5Fdrop(addr, link, link=5Faddress=5Fdrop=5Fhandler);
> ++    if (r < 0)
> ++        return r;
> ++
> ++    r =3D sd=5Fbus=5Fmessage=5Fnew=5Fmethod=5Freturn(m, &resp);
> ++    if (r < 0)
> ++        return sd=5Fbus=5Ferror=5Fsetf(error, SD=5FBUS=5FERROR=5FNO=5FM=
EMORY, "Error
allocating reply messgage");
> ++
> ++    r =3D sd=5Fbus=5Fmessage=5Fappend(resp, "x", 0);
> ++    if (r < 0)
> ++            return sd=5Fbus=5Ferror=5Fsetf(error, SD=5FBUS=5FERROR=5FFA=
ILED, "Error
appending to reply messgage");
> ++
> ++    r =3D sd=5Fbus=5Fsend(mgr->bus, resp, NULL);
> ++    if (r < 0)
> ++            return sd=5Fbus=5Ferror=5Fsetf(error, SD=5FBUS=5FERROR=5FFA=
ILED, "Error
sending reply messgage");
> ++
> ++    return sd=5Fbus=5Freply=5Fmethod=5Freturn(m, "s", "Deleted IP addre=
ss...");
> ++}
> ++
> ++static int method=5Fget=5Faddress (sd=5Fbus=5Fmessage *m, void* userdat=
a,
sd=5Fbus=5Ferror *error)
> ++{
> ++    =5Fcleanup=5Fnetlink=5Funref=5F sd=5Fnetlink  *rtnl   =3D NULL;
> ++    =5Fcleanup=5Faddress=5Ffree=5F Address      *addr   =3D NULL;
> ++    =5Fcleanup=5Froute=5Ffree=5F Route          *rt     =3D NULL;
> ++    Manager                             *mgr    =3D userdata;
> ++#if 0 /* fixme: */
> ++    Link*               link               =3D NULL;
> ++#endif
> ++    struct udev*        udev               =3D NULL;
> ++    struct udev=5Fdevice* udev=5Feth           =3D NULL;
> ++
> ++    const char*         device             =3D NULL;
> ++#if 0 /* fixme: */
> ++    const char*         ipaddr             =3D NULL;
> ++    const char*         netmask            =3D NULL;
> ++    const char*         gateway            =3D NULL;
> ++#endif
> ++    char                devpath [32]       =3D "/sys/class/net/";
> ++
> ++#if 0 /* fixme: */
> ++    unsigned char       family;
> ++    unsigned char       prefixlen;
> ++    unsigned char       flags;
> ++    unsigned char       scope;
> ++#endif
> ++    unsigned char       ifindex;
> ++
> ++#if 0 /* fixme: */
> ++    struct in=5Faddr      nm;
> ++    struct in=5Faddr      ip;
> ++    struct in=5Faddr      gw;
> ++#endif
> ++    int                 r;
> ++
> ++    sd=5Fnetlink=5Fmessage* maddr;
> ++
> ++    =5Fcleanup=5Fnetlink=5Fmessage=5Funref=5F sd=5Fnetlink=5Fmessage  *=
req    =3D NULL;
> ++    =5Fcleanup=5Fnetlink=5Fmessage=5Funref=5F sd=5Fnetlink=5Fmessage  *=
reply    =3D
NULL;
> ++    =5Fcleanup=5Fbus=5Fmessage=5Funref=5F sd=5Fbus=5Fmessage  *resp   =
=3D NULL;
> ++    =5Fcleanup=5Faddress=5Ffree=5F Address              *address =3D NU=
LL;
> ++    =5Fcleanup=5Ffree=5F struct local=5Faddress         *local   =3D NU=
LL;
> ++    =5Fcleanup=5Ffree=5F char                         *ipr     =3D NULL;
> ++    =5Fcleanup=5Ffree=5F char                         *gwr     =3D NULL;
> ++    int                 n;
> ++    int                 i;
> ++
> ++    assert(m);
> ++    assert(mgr);
> ++
> ++    r =3D sd=5Fbus=5Fmessage=5Fread (m, "s", &device);
> ++    if (r < 0)
> ++        return r;
> ++
> ++    if (isempty (device))
> ++        return sd=5Fbus=5Ferror=5Fsetf(error, SD=5FBUS=5FERROR=5FINVALI=
D=5FARGS,
"Invalid Device Name.");
> ++
> ++    udev =3D udev=5Fnew();
> ++    udev=5Feth =3D udev=5Fdevice=5Fnew=5Ffrom=5Fsyspath(udev, strcat (d=
evpath,
device));
> ++    if (!udev=5Feth)
> ++        return sd=5Fbus=5Ferror=5Fsetf(error, SD=5FBUS=5FERROR=5FFAILED=
, "Could not
find udev device");
> ++
> ++    ifindex =3D udev=5Fdevice=5Fget=5Fifindex(udev=5Feth);
> ++
> ++    r =3D sd=5Fnetlink=5Fopen(&rtnl);
> ++    if (r < 0)
> ++            return log=5Ferror=5Ferrno(r, "Failed to connect to
netlink:"); /* fixme */
> ++
> ++    r =3D sd=5Frtnl=5Fmessage=5Fnew=5Faddr(rtnl, &req, RTM=5FGETADDR, 0=
, 0);
> ++    if (r < 0)
> ++            return r;
> ++
> ++    r =3D sd=5Fnetlink=5Fmessage=5Frequest=5Fdump(req, true);
> ++    if (r < 0)
> ++            return r;
> ++
> ++    r =3D sd=5Fnetlink=5Fcall(rtnl, req, 0, &reply); /* fixme */
> ++    if (r < 0)
> ++            return r;
> ++
> ++    r =3D sd=5Fbus=5Fmessage=5Fnew=5Fmethod=5Freturn(m, &resp);
> ++    if (r < 0)
> ++        return sd=5Fbus=5Ferror=5Fsetf(error, SD=5FBUS=5FERROR=5FNO=5FM=
EMORY, "Error
allocating reply messgage");
> ++
> ++    r =3D sd=5Fbus=5Fmessage=5Fopen=5Fcontainer(resp, 'a',
"iyyus"); /*family,prefixlen,scope,flags,addr*/
> ++    if (r < 0)
> ++        return sd=5Fbus=5Ferror=5Fsetf(error, SD=5FBUS=5FERROR=5FNO=5FM=
EMORY, "Error
opening a container for reply message");
> ++
> ++    for (maddr =3D reply; maddr; maddr =3D sd=5Fnetlink=5Fmessage=5Fnex=
t(maddr))
{
> ++            int k;
> ++
> ++            r =3D address=5Fnew=5Fdynamic(&address);
> ++            if (r < 0)
> ++                    return r;
> ++
> ++            k =3D network=5Frtnl=5Fprocess=5Faddress(rtnl, maddr, mgr,
address);
> ++            if (k) {
> ++                r =3D sd=5Fbus=5Fmessage=5Fappend(resp, "i", address->f=
amily);
> ++                if (r < 0)
> ++                        return sd=5Fbus=5Ferror=5Fsetf(error,
SD=5FBUS=5FERROR=5FFAILED, "Error appending to reply messgage");
> ++
> ++                r =3D sd=5Fbus=5Fmessage=5Fappend(resp, "y", address->
prefixlen);
> ++                if (r < 0)
> ++                        return sd=5Fbus=5Ferror=5Fsetf(error,
SD=5FBUS=5FERROR=5FFAILED, "Error appending to reply messgage");
> ++
> ++                r =3D sd=5Fbus=5Fmessage=5Fappend(resp, "y", address->s=
cope);
> ++                if (r < 0)
> ++                        return sd=5Fbus=5Ferror=5Fsetf(error,
SD=5FBUS=5FERROR=5FFAILED, "Error appending to reply messgage");
> ++
> ++                r =3D sd=5Fbus=5Fmessage=5Fappend(resp, "u", address->f=
lags);
> ++                if (r < 0)
> ++                        return sd=5Fbus=5Ferror=5Fsetf(error,
SD=5FBUS=5FERROR=5FFAILED, "Error appending to reply messgage");
> ++
> ++                r =3D in=5Faddr=5Fto=5Fstring(address->family, &address=
->
in=5Faddr, &ipr); /* fixme */
> ++                if (r < 0)
> ++                        return r;
> ++
> ++                r =3D sd=5Fbus=5Fmessage=5Fappend(resp, "s", ipr);
> ++                if (r < 0)
> ++                        return sd=5Fbus=5Ferror=5Fsetf(error,
SD=5FBUS=5FERROR=5FFAILED, "Error appending to reply messgage");
> ++            }
> ++    }
> ++
> ++    r =3D sd=5Fbus=5Fmessage=5Fclose=5Fcontainer(resp);
> ++    if (r < 0)
> ++            return sd=5Fbus=5Ferror=5Fsetf(error, SD=5FBUS=5FERROR=5FFA=
ILED, "Error
closing reply container");
> ++
> ++    n =3D local=5Fgateways(rtnl, ifindex, AF=5FUNSPEC, &local);
> ++    if (n < 0)
> ++            return n;
> ++
> ++    for (i =3D 0; i < n; i++) {
> ++
> ++            r =3D in=5Faddr=5Fto=5Fstring(local[i].family, &local[i].ad=
dress,
&gwr);
> ++            if (r < 0)
> ++                    return r;
> ++    }
> ++
> ++    r =3D sd=5Fbus=5Fmessage=5Fappend(resp, "s", gwr);
> ++    if (r < 0)
> ++            return sd=5Fbus=5Ferror=5Fsetf(error, SD=5FBUS=5FERROR=5FFA=
ILED, "Error
appending to reply messgage");
> ++
> ++    r =3D sd=5Fbus=5Fsend(mgr->bus, resp, NULL);
> ++    if (r < 0)
> ++            return sd=5Fbus=5Ferror=5Fsetf(error, SD=5FBUS=5FERROR=5FFA=
ILED, "Error
sending reply messgage");
> ++
> ++    return sd=5Fbus=5Freply=5Fmethod=5Freturn(m, "s", "Getting IP
configuration...");
> ++}
> ++
> ++
> ++int network=5Frtnl=5Fprocess=5Faddress(sd=5Fnetlink *rtnl, sd=5Fnetlink=
=5Fmessage
*message, void *userdata, Address* address) {
> ++        Manager*        m       =3D (Manager*) userdata; /* fixme */
> ++#if 0 /* fixme */
> ++        Link*           link    =3D NULL;
> ++#endif
> ++        uint16=5Ft        type;
> ++        unsigned char   flags;
> ++#if 0 /* fixme */
> ++        Address*        existing;
> ++#endif
> ++        char            buf[INET6=5FADDRSTRLEN];
> ++#if 0 /* fixme */
> ++        char            valid=5Fbuf[FORMAT=5FTIMESPAN=5FMAX];
> ++        const char*     valid=5Fstr =3D NULL;
> ++#endif
> ++        int             ifindex;
> ++        int             r;
> ++        /*=5Fcleanup=5Faddress=5Ffree=5F Address *address =3D NULL;*/
> ++        sd=5Fbus=5Ferror err    =3D SD=5FBUS=5FERROR=5FNULL; /* fixme */
> ++        sd=5Fbus=5Ferror* error =3D &err;             /* fixme */
> ++
> ++        assert(rtnl);
> ++        assert(message);
> ++        assert(m);
> ++        assert(address);
> ++
> ++        if (sd=5Fnetlink=5Fmessage=5Fis=5Ferror(message)) {
> ++                r =3D sd=5Fnetlink=5Fmessage=5Fget=5Ferrno(message);
> ++                if (r < 0)
> ++                        sd=5Fbus=5Ferror=5Fsetf(error, SD=5FBUS=5FERROR=
=5FFAILED,
"rtnl: failed to receive address: ");
> ++
> ++                return 0;
> ++        }
> ++
> ++        r =3D sd=5Fnetlink=5Fmessage=5Fget=5Ftype(message, &type);
> ++        if (r < 0) {
> ++                sd=5Fbus=5Ferror=5Fsetf(error, SD=5FBUS=5FERROR=5FFAILE=
D, "rtnl:
could not get message type: ");
> ++                return 0;
> ++        } else if (type !=3D RTM=5FNEWADDR && type !=3D RTM=5FDELADDR) {
> ++                sd=5Fbus=5Ferror=5Fsetf(error, SD=5FBUS=5FERROR=5FFAILE=
D, "rtnl:
received unexpected message type when processing address");
> ++                return 0;
> ++        }
> ++
> ++        r =3D sd=5Frtnl=5Fmessage=5Faddr=5Fget=5Fifindex(message, &ifin=
dex);
> ++        if (r < 0) {
> ++                sd=5Fbus=5Ferror=5Fsetf(error, SD=5FBUS=5FERROR=5FFAILE=
D, "rtnl:
could not get ifindex from address: %m");
> ++                return 0;
> ++        } else if (ifindex <=3D 0) {
> ++                sd=5Fbus=5Ferror=5Fsetf(error, SD=5FBUS=5FERROR=5FFAILE=
D, "rtnl:
received address message with invalid ifindex: %d", ifindex);
> ++                return 0;
> ++        }
> ++
> ++        r =3D sd=5Frtnl=5Fmessage=5Faddr=5Fget=5Ffamily(message, &addre=
ss->
family); /* int : i*/
> ++        if (r < 0 || !IN=5FSET(address->family, AF=5FINET, AF=5FINET6))=
 {
> ++                sd=5Fbus=5Ferror=5Fsetf(error, SD=5FBUS=5FERROR=5FFAILE=
D, "rtnl:
received address with invalid family, ignoring.");
> ++                return 0;
> ++        }
> ++
> ++        r =3D sd=5Frtnl=5Fmessage=5Faddr=5Fget=5Fprefixlen(message, &ad=
dress->
prefixlen); /* uchar : byte : y */
> ++        if (r < 0) {
> ++                sd=5Fbus=5Ferror=5Fsetf(error, SD=5FBUS=5FERROR=5FFAILE=
D, "rtnl:
received address with invalid prefixlen, ignoring: ");
> ++                return 0;
> ++        }
> ++
> ++        r =3D sd=5Frtnl=5Fmessage=5Faddr=5Fget=5Fscope(message, &addres=
s->
scope); /* uchar : byte : y*/
> ++        if (r < 0) {
> ++                sd=5Fbus=5Ferror=5Fsetf(error, SD=5FBUS=5FERROR=5FFAILE=
D, "rtnl:
received address with invalid scope, ignoring: ");
> ++                return 0;
> ++        }
> ++
> ++        r =3D sd=5Frtnl=5Fmessage=5Faddr=5Fget=5Fflags(message, &flags)=
; /*
uint32 : u*/
> ++        if (r < 0) {
> ++                sd=5Fbus=5Ferror=5Fsetf(error, SD=5FBUS=5FERROR=5FFAILE=
D, "rtnl:
received address with invalid flags, ignoring: ");
> ++                return 0;
> ++        }
> ++        address->flags =3D flags;
> ++
> ++        switch (address->family) {
> ++        case AF=5FINET:
> ++                r =3D sd=5Fnetlink=5Fmessage=5Fread=5Fin=5Faddr(message=
, IFA=5FLOCAL,
&address->in=5Faddr.in); /* ulong : uint64 : t */
> ++                if (r < 0) {
> ++                        sd=5Fbus=5Ferror=5Fsetf(error, SD=5FBUS=5FERROR=
=5FFAILED,
"rtnl: received address without valid address, ignoring: ");
> ++                        return 0;
> ++                }
> ++
> ++                break;
> ++
> ++        case AF=5FINET6:
> ++                r =3D sd=5Fnetlink=5Fmessage=5Fread=5Fin6=5Faddr(messag=
e,
IFA=5FADDRESS, &address->in=5Faddr.in6); /* ulong : uint64 : t */
> ++                if (r < 0) {
> ++                        sd=5Fbus=5Ferror=5Fsetf(error, SD=5FBUS=5FERROR=
=5FFAILED,
"rtnl: received address without valid address, ignoring: ");
> ++                        return 0;
> ++                }
> ++
> ++                break;
> ++
> ++        default:
> ++                assert=5Fnot=5Freached("invalid address family");
> ++        }
> ++
> ++        if (!inet=5Fntop(address->family, &address->in=5Faddr, buf,
INET6=5FADDRSTRLEN)) { /* string : s */
> ++                sd=5Fbus=5Ferror=5Fsetf(error, SD=5FBUS=5FERROR=5FFAILE=
D, "Could
not print address");
> ++                return 0;
> ++        }
> ++
> ++        return 1;
> ++}
> ++#endif
> +diff --git a/src/network/networkd-network.c
b/src/network/networkd-network.c
> +index 6587ea9..2616c5b 100644
> +--- a/src/network/networkd-network.c
> ++++ b/src/network/networkd-network.c
> +@@ -32,6 +32,14 @@
> + #include "network-internal.h"
> + #include "dns-domain.h"
> +
> ++#define SYSTEMD=5FNETWORKD=5FDBUS 1
> ++
> ++#ifdef SYSTEMD=5FNETWORKD=5FDBUS
> ++int network=5Faddress=5Fadded=5Fhandler (sd=5Fnetlink* rtnl,
sd=5Fnetlink=5Fmessage* m, void* userdata);
> ++int network=5Fset=5Fgateway (Link* link);
> ++static int route=5Fhandler(sd=5Fnetlink *rtnl, sd=5Fnetlink=5Fmessage *=
m, void
*userdata);
> ++#endif
> ++
> + static int network=5Fload=5Fone(Manager *manager, const char *filename)=
 {
> +         =5Fcleanup=5Fnetwork=5Ffree=5F Network *network =3D NULL;
> +         =5Fcleanup=5Ffclose=5F FILE *file =3D NULL;
> +@@ -850,3 +858,76 @@ int config=5Fparse=5Fhostname(const char *unit,
> +
> +         return 0;
> + }
> ++
> ++#ifdef SYSTEMD=5FNETWORKD=5FDBUS
> ++int network=5Faddress=5Fadded=5Fhandler (sd=5Fnetlink* rtnl,
sd=5Fnetlink=5Fmessage* m, void* userdata)
> ++{
> ++        =5Fcleanup=5Flink=5Funref=5F Link *link =3D userdata;
> ++        int r;
> ++
> ++        assert(link);
> ++
> ++        r =3D sd=5Fnetlink=5Fmessage=5Fget=5Ferrno(m);
> ++        if (r < 0 && r !=3D -EEXIST) {
> ++                log=5Fdebug("Error in set IP address!");
> ++                link=5Fenter=5Ffailed(link);
> ++        } else if (r >=3D 0)
> ++                link=5Frtnl=5Fprocess=5Faddress(rtnl, m, link->manager);
> ++
> ++		 network=5Fset=5Fgateway (link);
> ++
> ++		 return 1;
> ++}
> ++
> ++/* link=5Fenter=5Fset=5Froutes */
> ++int network=5Fset=5Fgateway (Link* link)
> ++{
> ++        Route *rt;
> ++        int r;
> ++
> ++        assert(link);
> ++        assert(link->network);
> ++        assert(link->state =3D=3D LINK=5FSTATE=5FSETTING=5FADDRESSES);
> ++
> ++        link->state =3D LINK=5FSTATE=5FSETTING=5FROUTES;
> ++
> ++        LIST=5FFOREACH(routes, rt, link->network->static=5Froutes) {
> ++                r =3D route=5Fconfigure(rt, link, &route=5Fhandler);
> ++                if (r < 0) {
> ++                        log=5Fdebug ("Could not set Gateway!");
> ++                        link=5Fenter=5Ffailed(link);
> ++                        return r;
> ++                }
> ++
> ++                link->link=5Fmessages ++;
> ++        }
> ++
> ++        if (link->link=5Fmessages =3D=3D 0) {
> ++                link->static=5Fconfigured =3D true;
> ++
> ++                /*link=5Fenter=5Fconfigured (link);*/
> ++                log=5Flink=5Finfo(link, "Configured");
> ++                link->state =3D LINK=5FSTATE=5FCONFIGURED;
> ++                link=5Fsave(link);
> ++        } else
> ++                log=5Fdebug("Setting Gateway");
> ++
> ++        return 0;
> ++}
> ++
> ++static int route=5Fhandler(sd=5Fnetlink *rtnl, sd=5Fnetlink=5Fmessage *=
m, void
*userdata) {
> ++        =5Fcleanup=5Flink=5Funref=5F Link *link =3D userdata;
> ++        int r;
> ++
> ++        assert(link);
> ++
> ++        r =3D sd=5Fnetlink=5Fmessage=5Fget=5Ferrno(m);
> ++        if (r < 0 && r !=3D -EEXIST) {
> ++                log=5Fdebug ("Could not set route! ");
> ++                link=5Fenter=5Ffailed(link);
> ++        }
> ++
> ++        return 1;
> ++}
> ++
> ++#endif
> +diff --git a/src/network/org.freedesktop.network1.conf
b/src/network/org.freedesktop.network1.conf
> +index 52dad33..f424b88 100644
> +--- a/src/network/org.freedesktop.network1.conf
> ++++ b/src/network/org.freedesktop.network1.conf
> +@@ -36,6 +36,23 @@
> +                        send=5Finterface=3D"org.freedesktop.DBus.Propert=
ies"
> +                        send=5Fmember=3D"GetAll"/>
> +
> ++                <allow send=5Fdestination=3D"org.freedesktop.network1"
> ++
send=5Finterface=3D"org.freedesktop.network1.Network"
> ++                       send=5Fmember=3D"AddAddress"/>
> ++
> ++                <allow send=5Fdestination=3D"org.freedesktop.network1"
> ++
send=5Finterface=3D"org.freedesktop.network1.Network"
> ++                       send=5Fmember=3D"DelAddress"/>
> ++
> ++                <allow send=5Fdestination=3D"org.freedesktop.network1"
> ++
send=5Finterface=3D"org.freedesktop.network1.Network"
> ++                       send=5Fmember=3D"GetAddress"/>
> ++
> ++                <allow send=5Fdestination=3D"org.freedesktop.network1"
> ++                       send=5Finterface=3D"org.freedesktop.network1.Lin=
k"
> ++                       send=5Fmember=3D"GetAddress"/>
> ++
> ++
> +                 <allow receive=5Fsender=3D"org.freedesktop.network1"/>
> +         </policy>
> +
> +--
> +1.8.2.2
> +
> diff --git a/yocto-poky/meta/recipes-core/systemd/systemd=5F225.bb
b/yocto-poky/meta/recipes-core/systemd/systemd=5F225.bb
> index f7d4c7d..e3d55ec 100644
> --- a/yocto-poky/meta/recipes-core/systemd/systemd=5F225.bb
> +++ b/yocto-poky/meta/recipes-core/systemd/systemd=5F225.bb
> @@ -41,6 +41,7 @@ SRC=5FURI =3D
"git://github.com/systemd/systemd.git;protocol=3Dgit \
>             file://0012-implment-systemd-sysv-install-for-OE.patch \
>             file://0014-Revert-rules-remove-firmware-loading-rules.patch
\
>
file://0015-Revert-udev-remove-userspace-firmware-loading-suppor.patch \
> +           file://0100-systemd=5Fnetworkd=5Fdbus=5Fsetaddress.patch \
>             file://touchscreen.rules \
>             file://00-create-volatile.conf \
>             file://init \

=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
openbmc mailing list
openbmc@lists.ozlabs.org
https://lists.ozlabs.org/listinfo/openbmc


--1__=8FBBF5D2DFB5EC288f9e8a93df938690918c8FBBF5D2DFB5EC28
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

<html><body><p>Hi Cyril,<br><br>systemted-networkd did *not* support *dbus-=
api* to configure the network interface. The way to configure network with =
networkd would be to edit a corresponding *.link/*.network/*.service files.=
<br><br>This patch adds the dbus-api. If you introspected the /org/freedesk=
top/network1/network/default object of the org.freedesktop.network1 applica=
tion, you would get the following. The AddAddress, DelAddress and GetAddres=
s are the new dbus methods enabled by this patch.<br><br>--------<br>method=
 return sender=3D:1.2 -&gt; dest=3D:1.24 reply=5Fserial=3D2<br>   string &q=
uot;&lt;!DOCTYPE node PUBLIC &quot;-//freedesktop//DTD D-BUS Object Introsp=
ection 1.0//EN&quot;<br>&quot;<a href=3D"http://www.freedesktop.org/standar=
ds/dbus/1.0/introspect.dtd">http://www.freedesktop.org/standards/dbus/1.0/i=
ntrospect.dtd</a>&quot;&gt;<br>&lt;node&gt;<br> &lt;interface name=3D&quot;=
org.freedesktop.DBus.Peer&quot;&gt;<br>  &lt;method name=3D&quot;Ping&quot;=
/&gt;<br>  &lt;method name=3D&quot;GetMachineId&quot;&gt;<br>   &lt;arg typ=
e=3D&quot;s&quot; name=3D&quot;machine=5Fuuid&quot; direction=3D&quot;out&q=
uot;/&gt;<br>  &lt;/method&gt;<br> &lt;/interface&gt;<br> &lt;interface nam=
e=3D&quot;org.freedesktop.DBus.Introspectable&quot;&gt;<br>  &lt;method nam=
e=3D&quot;Introspect&quot;&gt;<br>   &lt;arg name=3D&quot;data&quot; type=
=3D&quot;s&quot; direction=3D&quot;out&quot;/&gt;<br>  &lt;/method&gt;<br> =
&lt;/interface&gt;<br> &lt;interface name=3D&quot;org.freedesktop.DBus.Prop=
erties&quot;&gt;<br>  &lt;method name=3D&quot;Get&quot;&gt;<br>   &lt;arg n=
ame=3D&quot;interface&quot; direction=3D&quot;in&quot; type=3D&quot;s&quot;=
/&gt;<br>   &lt;arg name=3D&quot;property&quot; direction=3D&quot;in&quot; =
type=3D&quot;s&quot;/&gt;<br>   &lt;arg name=3D&quot;value&quot; direction=
=3D&quot;out&quot; type=3D&quot;v&quot;/&gt;<br>  &lt;/method&gt;<br>  &lt;=
method name=3D&quot;GetAll&quot;&gt;<br>   &lt;arg name=3D&quot;interface&q=
uot; direction=3D&quot;in&quot; type=3D&quot;s&quot;/&gt;<br>   &lt;arg nam=
e=3D&quot;properties&quot; direction=3D&quot;out&quot; type=3D&quot;a{sv}&q=
uot;/&gt;<br>  &lt;/method&gt;<br>  &lt;method name=3D&quot;Set&quot;&gt;<b=
r>   &lt;arg name=3D&quot;interface&quot; direction=3D&quot;in&quot; type=
=3D&quot;s&quot;/&gt;<br>   &lt;arg name=3D&quot;property&quot; direction=
=3D&quot;in&quot; type=3D&quot;s&quot;/&gt;<br>   &lt;arg name=3D&quot;valu=
e&quot; direction=3D&quot;in&quot; type=3D&quot;v&quot;/&gt;<br>  &lt;/meth=
od&gt;<br>  &lt;signal name=3D&quot;PropertiesChanged&quot;&gt;<br>   &lt;a=
rg type=3D&quot;s&quot; name=3D&quot;interface&quot;/&gt;<br>   &lt;arg typ=
e=3D&quot;a{sv}&quot; name=3D&quot;changed=5Fproperties&quot;/&gt;<br>   &l=
t;arg type=3D&quot;as&quot; name=3D&quot;invalidated=5Fproperties&quot;/&gt=
;<br>  &lt;/signal&gt;<br> &lt;/interface&gt;<br> &lt;interface name=3D&quo=
t;org.freedesktop.network1.Network&quot;&gt;<br>  &lt;property name=3D&quot=
;Description&quot; type=3D&quot;s&quot; access=3D&quot;read&quot;&gt;<br>  =
 &lt;annotation name=3D&quot;org.freedesktop.DBus.Property.EmitsChangedSign=
al&quot; value=3D&quot;const&quot;/&gt;<br>  &lt;/property&gt;<br>  &lt;pro=
perty name=3D&quot;SourcePath&quot; type=3D&quot;s&quot; access=3D&quot;rea=
d&quot;&gt;<br>   &lt;annotation name=3D&quot;org.freedesktop.DBus.Property=
.EmitsChangedSignal&quot; value=3D&quot;const&quot;/&gt;<br>  &lt;/property=
&gt;<br>  &lt;property name=3D&quot;MatchMAC&quot; type=3D&quot;as&quot; ac=
cess=3D&quot;read&quot;&gt;<br>   &lt;annotation name=3D&quot;org.freedeskt=
op.DBus.Property.EmitsChangedSignal&quot; value=3D&quot;const&quot;/&gt;<br=
>  &lt;/property&gt;<br>  &lt;property name=3D&quot;MatchPath&quot; type=3D=
&quot;as&quot; access=3D&quot;read&quot;&gt;<br>   &lt;annotation name=3D&q=
uot;org.freedesktop.DBus.Property.EmitsChangedSignal&quot; value=3D&quot;co=
nst&quot;/&gt;<br>  &lt;/property&gt;<br>  &lt;property name=3D&quot;MatchD=
river&quot; type=3D&quot;as&quot; access=3D&quot;read&quot;&gt;<br>   &lt;a=
nnotation name=3D&quot;org.freedesktop.DBus.Property.EmitsChangedSignal&quo=
t; value=3D&quot;const&quot;/&gt;<br>  &lt;/property&gt;<br>  &lt;property =
name=3D&quot;MatchType&quot; type=3D&quot;as&quot; access=3D&quot;read&quot=
;&gt;<br>   &lt;annotation name=3D&quot;org.freedesktop.DBus.Property.Emits=
ChangedSignal&quot; value=3D&quot;const&quot;/&gt;<br>  &lt;/property&gt;<b=
r>  &lt;property name=3D&quot;MatchName&quot; type=3D&quot;as&quot; access=
=3D&quot;read&quot;&gt;<br>   &lt;annotation name=3D&quot;org.freedesktop.D=
Bus.Property.EmitsChangedSignal&quot; value=3D&quot;const&quot;/&gt;<br>  &=
lt;/property&gt;<br><b>  &lt;method name=3D&quot;AddAddress&quot;&gt;</b><b=
r>   &lt;arg type=3D&quot;s&quot; direction=3D&quot;in&quot;/&gt;<br>   &lt=
;arg type=3D&quot;s&quot; direction=3D&quot;in&quot;/&gt;<br>   &lt;arg typ=
e=3D&quot;s&quot; direction=3D&quot;in&quot;/&gt;<br>   &lt;arg type=3D&quo=
t;y&quot; direction=3D&quot;in&quot;/&gt;<br>   &lt;arg type=3D&quot;y&quot=
; direction=3D&quot;in&quot;/&gt;<br>   &lt;arg type=3D&quot;y&quot; direct=
ion=3D&quot;in&quot;/&gt;<br>   &lt;arg type=3D&quot;s&quot; direction=3D&q=
uot;in&quot;/&gt;<br>   &lt;arg type=3D&quot;x&quot; direction=3D&quot;out&=
quot;/&gt;<br>  &lt;/method&gt;<br><b>  &lt;method name=3D&quot;DelAddress&=
quot;&gt;</b><br>   &lt;arg type=3D&quot;s&quot; direction=3D&quot;in&quot;=
/&gt;<br>   &lt;arg type=3D&quot;s&quot; direction=3D&quot;in&quot;/&gt;<br=
>   &lt;arg type=3D&quot;s&quot; direction=3D&quot;in&quot;/&gt;<br>   &lt;=
arg type=3D&quot;y&quot; direction=3D&quot;in&quot;/&gt;<br>   &lt;arg type=
=3D&quot;y&quot; direction=3D&quot;in&quot;/&gt;<br>   &lt;arg type=3D&quot=
;y&quot; direction=3D&quot;in&quot;/&gt;<br>   &lt;arg type=3D&quot;s&quot;=
 direction=3D&quot;in&quot;/&gt;<br>   &lt;arg type=3D&quot;x&quot; directi=
on=3D&quot;out&quot;/&gt;<br>  &lt;/method&gt;<br>  <b>&lt;method name=3D&q=
uot;GetAddress&quot;&gt;</b><br>   &lt;arg type=3D&quot;s&quot; direction=
=3D&quot;in&quot;/&gt;<br>   &lt;arg type=3D&quot;a(iyyus)&quot; direction=
=3D&quot;out&quot;/&gt;<br>   &lt;arg type=3D&quot;s&quot; direction=3D&quo=
t;out&quot;/&gt;<br>  &lt;/method&gt;<br> &lt;/interface&gt;<br>&lt;/node&g=
t;<br>&quot;<br>--------<br><br>regards,<br>rhari !<br><br>Hariharasubraman=
ian R.<br>Power Firmware Development<br>IBM India Systems &amp; Technology =
Lab, Bangalore, India<br>Phone:  +91 80 4025 6950   <br><br><img width=3D"1=
6" height=3D"16" src=3D"cid:2=5F=5F=3D8FBBF5D2DFB5EC288f9e8a93df938690918c8=
FB@" border=3D"0" alt=3D"Inactive hide details for Cyril Bur ---01/21/2016 =
10:53:40 AM---From: Cyril Bur &lt;cyrilbur@gmail.com&gt; To: OpenBMC Patche=
s &lt;openb"><font color=3D"#424282">Cyril Bur ---01/21/2016 10:53:40 AM---=
From: Cyril Bur &lt;cyrilbur@gmail.com&gt; To: OpenBMC Patches &lt;openbmc-=
patches@stwcx.xyz&gt;</font><br><br><font size=3D"2" color=3D"#5F5F5F">From=
:        </font><font size=3D"2">Cyril Bur &lt;cyrilbur@gmail.com&gt;</font=
><br><font size=3D"2" color=3D"#5F5F5F">To:        </font><font size=3D"2">=
OpenBMC Patches &lt;openbmc-patches@stwcx.xyz&gt;</font><br><font size=3D"2=
" color=3D"#5F5F5F">Cc:        </font><font size=3D"2">openbmc@lists.ozlabs=
.org</font><br><font size=3D"2" color=3D"#5F5F5F">Date:        </font><font=
 size=3D"2">01/21/2016 10:53 AM</font><br><font size=3D"2" color=3D"#5F5F5F=
">Subject:        </font><font size=3D"2">Re: [PATCH openbmc] Dbus API for =
systemd/networkd for network configuration.</font><br><font size=3D"2" colo=
r=3D"#5F5F5F">Sent by:        </font><font size=3D"2">&quot;openbmc&quot; &=
lt;openbmc-bounces+hramasub=3Din.ibm.com@lists.ozlabs.org&gt;</font><br><hr=
 width=3D"100%" size=3D"2" align=3D"left" noshade style=3D"color:#8091A5; "=
><br><br><br><tt>On Wed, 20 Jan 2016 09:10:22 -0600<br>OpenBMC Patches &lt;=
openbmc-patches@stwcx.xyz&gt; wrote:<br><br>&gt; From: Hariharasubramanian =
R &lt;hramasub@in.ibm.com&gt;<br>&gt; <br><br>Hi Hariharasubramanian,<br><b=
r>Just to be sure I've got this right, we're patching systemd now? Does sys=
temd<br>not already do this? I thought the one good thing with systemd is t=
hat it<br>provides all this kind of stuff out of the box?<br><br>&gt; ---<b=
r>&gt; &nbsp;.../0100-systemd=5Fnetworkd=5Fdbus=5Fsetaddress.patch &nbsp; &=
nbsp;| 845 +++++++++++++++++++++<br>&gt; &nbsp;.../meta/recipes-core/system=
d/systemd=5F225.bb &nbsp; &nbsp; &nbsp; | &nbsp; 1 +<br>&gt; &nbsp;2 files =
changed, 846 insertions(+)<br>&gt; &nbsp;create mode 100644 yocto-poky/meta=
/recipes-core/systemd/systemd/0100-systemd=5Fnetworkd=5Fdbus=5Fsetaddress.p=
atch<br>&gt; <br>&gt; diff --git a/yocto-poky/meta/recipes-core/systemd/sys=
temd/0100-systemd=5Fnetworkd=5Fdbus=5Fsetaddress.patch b/yocto-poky/meta/re=
cipes-core/systemd/systemd/0100-systemd=5Fnetworkd=5Fdbus=5Fsetaddress.patc=
h<br>&gt; new file mode 100644<br>&gt; index 0000000..6727c1e<br>&gt; --- /=
dev/null<br>&gt; +++ b/yocto-poky/meta/recipes-core/systemd/systemd/0100-sy=
stemd=5Fnetworkd=5Fdbus=5Fsetaddress.patch<br>&gt; @@ -0,0 +1,845 @@<br>&gt=
; +From 35efeac7a1b1f6b737348f649d58d1c7eb5ecb8d Mon Sep 17 00:00:00 2001<b=
r>&gt; +From: Hariharasubramanian R &lt;hramasub@in.ibm.com&gt;<br>&gt; +Da=
te: Tue, 19 Jan 2016 05:04:40 -0600<br>&gt; +Subject: [PATCH] Test<br>&gt; =
+<br>&gt; +---<br>&gt; + src/network/networkd-link-bus.c &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; | &nbsp;93 +++++<br>&gt; + src/network/networkd-network-bu=
s.c &nbsp; &nbsp; &nbsp; &nbsp;| 556 ++++++++++++++++++++++++++++++<br>&gt;=
 + src/network/networkd-network.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
| &nbsp;81 +++++<br>&gt; + src/network/org.freedesktop.network1.conf | &nbs=
p;17 +<br>&gt; + 4 files changed, 747 insertions(+)<br>&gt; +<br>&gt; +diff=
 --git a/src/network/networkd-link-bus.c b/src/network/networkd-link-bus.c<=
br>&gt; +index 1a1524d..103d513 100644<br>&gt; +--- a/src/network/networkd-=
link-bus.c<br>&gt; ++++ b/src/network/networkd-link-bus.c<br>&gt; +@@ -25,1=
5 +25,41 @@<br>&gt; + #include &quot;networkd.h&quot;<br>&gt; + #include &q=
uot;networkd-link.h&quot;<br>&gt; + <br>&gt; ++#define SYSTEMD=5FNETWORKD=
=5FDBUS 1<br>&gt; ++<br>&gt; ++#ifdef SYSTEMD=5FNETWORKD=5FDBUS<br>&gt; ++/=
*<br>&gt; ++#include &quot;hostname-util.h&quot;<br>&gt; ++#include &quot;n=
etwork-internal.h&quot;<br>&gt; ++#include &quot;networkd-link.h&quot;<br>&=
gt; ++#include &quot;bus-util.h&quot;<br>&gt; ++*/<br>&gt; ++#include &quot=
;sd-network.h&quot;<br>&gt; ++#include &quot;sd-netlink.h&quot;<br>&gt; ++#=
include &quot;socket-util.h&quot;<br>&gt; ++#include &quot;ether-addr-util.=
h&quot;<br>&gt; ++/*<br>&gt; ++#include &quot;local-addresses.h&quot;<br>&g=
t; ++*/<br>&gt; ++#endif<br>&gt; ++<br>&gt; + static BUS=5FDEFINE=5FPROPERT=
Y=5FGET=5FENUM(property=5Fget=5Foperational=5Fstate, link=5Foperstate, Link=
OperationalState);<br>&gt; + static BUS=5FDEFINE=5FPROPERTY=5FGET=5FENUM(pr=
operty=5Fget=5Fadministrative=5Fstate, link=5Fstate, LinkState);<br>&gt; + =
<br>&gt; ++#ifdef SYSTEMD=5FNETWORKD=5FDBUS<br>&gt; ++static int method=5Fg=
et=5Faddress (sd=5Fbus=5Fmessage *m, void* userdata, sd=5Fbus=5Ferror *erro=
r);<br>&gt; ++#endif<br>&gt; ++<br>&gt; + const sd=5Fbus=5Fvtable link=5Fvt=
able[] =3D {<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; SD=5FBUS=5FVTABLE=5FSTAR=
T(0),<br>&gt; + <br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; SD=5FBUS=5FPROPERTY(=
&quot;OperationalState&quot;, &quot;s&quot;, property=5Fget=5Foperational=
=5Fstate, offsetof(Link, operstate), SD=5FBUS=5FVTABLE=5FPROPERTY=5FEMITS=
=5FCHANGE),<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; SD=5FBUS=5FPROPERTY(&quot=
;AdministrativeState&quot;, &quot;s&quot;, property=5Fget=5Fadministrative=
=5Fstate, offsetof(Link, state), SD=5FBUS=5FVTABLE=5FPROPERTY=5FEMITS=5FCHA=
NGE),<br>&gt; + <br>&gt; ++#ifdef SYSTEMD=5FNETWORKD=5FDBUS<br>&gt; ++     =
            &nbsp; &nbsp; /* device name */<br>&gt; ++ &nbsp; &nbsp;       =
          SD=5FBUS=5FMETHOD(&quot;GetAddress&quot;, &quot;s&quot;, &quot;s&=
quot;, method=5Fget=5Faddress, SD=5FBUS=5FVTABLE=5FUNPRIVILEGED),<br>&gt; +=
+#endif<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; SD=5FBUS=5FVTABLE=5FEND<br>&g=
t; + };<br>&gt; + <br>&gt; +@@ -136,3 +162,70 @@ int link=5Fsend=5Fchanged(=
Link *link, const char *property, ...) {<br>&gt; + &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;org.freed=
esktop.network1.Link&quot;,<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; l);<br>&gt; + }<br>&gt; ++<b=
r>&gt; ++static int method=5Fget=5Faddress (sd=5Fbus=5Fmessage *m, void* us=
erdata, sd=5Fbus=5Ferror *error)<br>&gt; ++{<br>&gt; ++ &nbsp; &nbsp;=5Fcle=
anup=5Fnetlink=5Funref=5F sd=5Fnetlink &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;*rtnl &nbsp; =3D NULL;<br>&gt; ++ &nbsp; &nbsp;=
=5Fcleanup=5Fnetlink=5Fmessage=5Funref=5F sd=5Fnetlink=5Fmessage &nbsp;*req=
 &nbsp; &nbsp;=3D NULL;<br>&gt; ++ &nbsp; &nbsp;=5Fcleanup=5Fnetlink=5Fmess=
age=5Funref=5F sd=5Fnetlink=5Fmessage &nbsp;*reply &nbsp;=3D NULL;<br>&gt; =
++ &nbsp; &nbsp;=5Fcleanup=5Fbus=5Fmessage=5Funref=5F sd=5Fbus=5Fmessage &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;*resp &nbsp; =3D NULL;<br>&gt; ++ &nbsp; &n=
bsp;Manager &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; *mgr &nbsp; &nbsp;=3D userdata;<br>&gt; ++<br>&gt; ++ &nbsp=
; &nbsp;struct udev* &nbsp; &nbsp; &nbsp; &nbsp;udev &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; =3D NULL;<br>&gt; ++ &nbsp; &nbsp;struct udev=5F=
device* udev=5Feth &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D NULL;<br>&gt; ++ =
&nbsp; &nbsp;const char* &nbsp; &nbsp; &nbsp; &nbsp; device &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; =3D NULL;<br>&gt; ++ &nbsp; &nbsp;char &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;devpath [32] &nbsp; &nbsp; &n=
bsp; =3D &quot;/sys/class/net/&quot;; <br>&gt; ++<br>&gt; ++ &nbsp; &nbsp;i=
nt &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; r;<br>&gt; ++ &n=
bsp; &nbsp;unsigned char &nbsp; &nbsp; &nbsp; ifindex;<br>&gt; ++ &nbsp; &n=
bsp;bool &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;have=5Fmac;=
<br>&gt; ++ &nbsp; &nbsp;struct ether=5Faddr &nbsp; e;<br>&gt; ++ &nbsp; &n=
bsp;char &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ea[ETHER=5F=
ADDR=5FTO=5FSTRING=5FMAX];<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp;assert(m);<br=
>&gt; ++ &nbsp; &nbsp;assert(mgr);<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp;r =3D=
 sd=5Fbus=5Fmessage=5Fread (m, &quot;s&quot;, &amp;device);<br>&gt; ++ &nbs=
p; &nbsp;if (r &lt; 0)<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp;return r;<br>&=
gt; ++<br>&gt; ++ &nbsp; &nbsp;if (isempty (device))<br>&gt; ++ &nbsp; &nbs=
p; &nbsp; &nbsp;return sd=5Fbus=5Ferror=5Fsetf(error, SD=5FBUS=5FERROR=5FIN=
VALID=5FARGS, &quot;Invalid Device Name.&quot;);<br>&gt; ++<br>&gt; ++ &nbs=
p; &nbsp;udev =3D udev=5Fnew();<br>&gt; ++ &nbsp; &nbsp;udev=5Feth =3D udev=
=5Fdevice=5Fnew=5Ffrom=5Fsyspath(udev, strcat (devpath, device));<br>&gt; +=
+ &nbsp; &nbsp;if (!udev=5Feth)<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp;retur=
n sd=5Fbus=5Ferror=5Fsetf(error, SD=5FBUS=5FERROR=5FFAILED, &quot;Could not=
 find udev device&quot;);<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp;ifindex =3D ud=
ev=5Fdevice=5Fget=5Fifindex(udev=5Feth);<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp=
;r =3D sd=5Fnetlink=5Fopen(&amp;rtnl);<br>&gt; ++ &nbsp; &nbsp;if (r &lt; 0=
)<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return log=5Ferror=5F=
errno(r, &quot;Failed to connect to netlink:&quot;); /* fixme */<br>&gt; ++=
<br>&gt; ++ &nbsp; &nbsp;r =3D sd=5Frtnl=5Fmessage=5Fnew=5Flink(rtnl, &amp;=
req, RTM=5FGETLINK, ifindex);<br>&gt; ++ &nbsp; &nbsp;if (r &lt; 0)<br>&gt;=
 ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return r;<br>&gt; ++<br>&gt; +=
+ &nbsp; &nbsp;r =3D sd=5Fnetlink=5Fcall(rtnl, req, 0, &amp;reply); /* fixm=
e */<br>&gt; ++ &nbsp; &nbsp;if (r &lt; 0)<br>&gt; ++ &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;return r;<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp;have=5Fmac=
 =3D sd=5Fnetlink=5Fmessage=5Fread=5Fether=5Faddr(reply, IFLA=5FADDRESS, &a=
mp;e) &gt;=3D 0;<br>&gt; ++ &nbsp; &nbsp;if (!have=5Fmac)<br>&gt; ++ &nbsp;=
 &nbsp; &nbsp; &nbsp;return sd=5Fbus=5Ferror=5Fsetf(error, SD=5FBUS=5FERROR=
=5FFAILED, &quot;Error reading IFLA address&quot;);<br>&gt; ++<br>&gt; ++ &=
nbsp; &nbsp;ether=5Faddr=5Fto=5Fstring(&amp;e, ea);<br>&gt; ++<br>&gt; ++ &=
nbsp; &nbsp;r =3D sd=5Fbus=5Fmessage=5Fnew=5Fmethod=5Freturn(m, &amp;resp);=
<br>&gt; ++ &nbsp; &nbsp;if (r &lt; 0)<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbs=
p;return sd=5Fbus=5Ferror=5Fsetf(error, SD=5FBUS=5FERROR=5FNO=5FMEMORY, &qu=
ot;Error allocating reply messgage&quot;);<br>&gt; ++<br>&gt; ++ &nbsp; &nb=
sp;r =3D sd=5Fbus=5Fmessage=5Fappend(resp, &quot;s&quot;, ea);<br>&gt; ++ &=
nbsp; &nbsp;if (r &lt; 0)<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp;return sd=
=5Fbus=5Ferror=5Fsetf(error, SD=5FBUS=5FERROR=5FFAILED, &quot;Error appendi=
ng to reply messgage&quot;);<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp;r =3D sd=5F=
bus=5Fsend(mgr-&gt;bus, resp, NULL);<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp;ret=
urn sd=5Fbus=5Freply=5Fmethod=5Freturn(m, &quot;s&quot;, &quot;Getting IFLA=
 address ...&quot;);<br>&gt; ++}<br>&gt; +diff --git a/src/network/networkd=
-network-bus.c b/src/network/networkd-network-bus.c<br>&gt; +index 5717a15.=
.6f0d1e5 100644<br>&gt; +--- a/src/network/networkd-network-bus.c<br>&gt; +=
+++ b/src/network/networkd-network-bus.c<br>&gt; +@@ -19,10 +19,34 @@<br>&g=
t; + &nbsp; along with systemd; If not, see &lt;</tt><tt><a href=3D"http://=
www.gnu.org/licenses/">http://www.gnu.org/licenses/</a></tt><tt>&gt;.<br>&g=
t; + ***/<br>&gt; + <br>&gt; ++#define SYSTEMD=5FNETWORKD=5FDBUS 1<br>&gt; =
++<br>&gt; ++#ifdef SYSTEMD=5FNETWORKD=5FDBUS<br>&gt; ++#include &lt;netine=
t/ether.h&gt;<br>&gt; ++#include &lt;linux/if.h&gt;<br>&gt; ++#endif<br>&gt=
; ++<br>&gt; + #include &quot;strv.h&quot;<br>&gt; + <br>&gt; + #include &q=
uot;networkd.h&quot;<br>&gt; + <br>&gt; ++#ifdef SYSTEMD=5FNETWORKD=5FDBUS<=
br>&gt; ++#include &quot;hostname-util.h&quot;<br>&gt; ++#include &quot;net=
work-internal.h&quot;<br>&gt; ++#include &quot;networkd-link.h&quot;<br>&gt=
; ++#include &quot;bus-util.h&quot;<br>&gt; ++<br>&gt; ++#include &quot;sd-=
network.h&quot;<br>&gt; ++#include &quot;sd-netlink.h&quot;<br>&gt; ++#incl=
ude &quot;local-addresses.h&quot;<br>&gt; ++#endif<br>&gt; ++<br>&gt; ++#if=
def SYSTEMD=5FNETWORKD=5FDBUS<br>&gt; ++int network=5Faddress=5Fadded=5Fhan=
dler (sd=5Fnetlink* rtnl, sd=5Fnetlink=5Fmessage* m, void* userdata);<br>&g=
t; ++int network=5Frtnl=5Fprocess=5Faddress(sd=5Fnetlink *rtnl, sd=5Fnetlin=
k=5Fmessage *message, void *userdata, Address* address); /* fixme */<br>&gt=
; ++static int method=5Fget=5Faddress (sd=5Fbus=5Fmessage *m, void* userdat=
a, sd=5Fbus=5Ferror *error); /* fixme */<br>&gt; ++#endif<br>&gt; ++<br>&gt=
; + static int property=5Fget=5Fether=5Faddrs(<br>&gt; + &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; sd=5Fbus *bus,<br>&gt; + &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; const char *path,<br>&gt; +@@ -=
56,6 +80,11 @@ static int property=5Fget=5Fether=5Faddrs(<br>&gt; + &nbsp; =
&nbsp; &nbsp; &nbsp; return sd=5Fbus=5Fmessage=5Fclose=5Fcontainer(reply);<=
br>&gt; + }<br>&gt; + <br>&gt; ++#ifdef SYSTEMD=5FNETWORKD=5FDBUS<br>&gt; +=
+static int method=5Fadd=5Faddress (sd=5Fbus=5Fmessage *m, void* userdata, =
sd=5Fbus=5Ferror *error);<br>&gt; ++static int method=5Fdel=5Faddress (sd=
=5Fbus=5Fmessage *m, void* userdata, sd=5Fbus=5Ferror *error);<br>&gt; ++#e=
ndif<br>&gt; ++<br>&gt; + const sd=5Fbus=5Fvtable network=5Fvtable[] =3D {<=
br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; SD=5FBUS=5FVTABLE=5FSTART(0),<br>&gt;=
 + <br>&gt; +@@ -67,6 +96,13 @@ const sd=5Fbus=5Fvtable network=5Fvtable[] =
=3D {<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; SD=5FBUS=5FPROPERTY(&quot;Match=
Type&quot;, &quot;as&quot;, NULL, offsetof(Network, match=5Ftype), SD=5FBUS=
=5FVTABLE=5FPROPERTY=5FCONST),<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; SD=5FB=
US=5FPROPERTY(&quot;MatchName&quot;, &quot;as&quot;, NULL, offsetof(Network=
, match=5Fname), SD=5FBUS=5FVTABLE=5FPROPERTY=5FCONST),<br>&gt; + <br>&gt; =
++#ifdef SYSTEMD=5FNETWORKD=5FDBUS<br>&gt; ++                 &nbsp; &nbsp;=
 /* device, IP, netmask, family, flags, scope, gateway */<br>&gt; ++ &nbsp;=
 &nbsp;                 SD=5FBUS=5FMETHOD(&quot;AddAddress&quot;, &quot;sss=
yyys&quot;, &quot;x&quot;, method=5Fadd=5Faddress, SD=5FBUS=5FVTABLE=5FUNPR=
IVILEGED),<br>&gt; ++ &nbsp; &nbsp;                 SD=5FBUS=5FMETHOD(&quot=
;DelAddress&quot;, &quot;sssyyys&quot;, &quot;x&quot;, method=5Fdel=5Faddre=
ss, SD=5FBUS=5FVTABLE=5FUNPRIVILEGED),<br>&gt; ++                 &nbsp; &n=
bsp; /* (family, prefixlen, flags, scope, IP)+ gateway */<br>&gt; ++ &nbsp;=
 &nbsp;                 SD=5FBUS=5FMETHOD(&quot;GetAddress&quot;, &quot;s&q=
uot;, &quot;a(iyyus)s&quot;, method=5Fget=5Faddress, SD=5FBUS=5FVTABLE=5FUN=
PRIVILEGED),<br>&gt; ++#endif<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; SD=5FBU=
S=5FVTABLE=5FEND<br>&gt; + };<br>&gt; + <br>&gt; +@@ -152,3 +188,523 @@ int=
 network=5Fobject=5Ffind(sd=5Fbus *bus, const char *path, const char *inter=
face, vo<br>&gt; + <br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; return 1;<br>&gt;=
 + }<br>&gt; ++<br>&gt; ++#ifdef SYSTEMD=5FNETWORKD=5FDBUS<br>&gt; ++<br>&g=
t; ++static int method=5Fadd=5Faddress (sd=5Fbus=5Fmessage *m, void* userda=
ta, sd=5Fbus=5Ferror *error)<br>&gt; ++{<br>&gt; ++ &nbsp; &nbsp;=5Fcleanup=
=5Fbus=5Fmessage=5Funref=5F sd=5Fbus=5Fmessage* &nbsp; &nbsp; &nbsp; &nbsp;=
 resp &nbsp; &nbsp;=3D NULL;<br>&gt; ++ &nbsp; &nbsp;=5Fcleanup=5Fnetlink=
=5Funref=5F sd=5Fnetlink* &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; rtnl &nbsp; &nbsp;=3D NULL;<br>&gt; ++ &nbsp; &nbsp;=5Fcleanup=5Fnet=
link=5Fmessage=5Funref=5F sd=5Fnetlink=5Fmessage* req &nbsp; &nbsp; =3D NUL=
L;<br>&gt; ++ &nbsp; &nbsp;=5Fcleanup=5Fnetlink=5Fmessage=5Funref=5F sd=5Fn=
etlink=5Fmessage* reply &nbsp; =3D NULL;<br>&gt; ++ &nbsp; &nbsp;=5Fcleanup=
=5Faddress=5Ffree=5F Address *addr &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D NULL;<br>&gt; ++ &nbsp; &nbs=
p;=5Fcleanup=5Froute=5Ffree=5F Route *rt &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D N=
ULL;<br>&gt; ++ &nbsp; &nbsp;Manager *mgr &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D userdata;<br=
>&gt; ++ &nbsp; &nbsp;Link* &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; link &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D NULL;<br>&gt; +=
+ &nbsp; &nbsp;struct udev* &nbsp; &nbsp; &nbsp; &nbsp;udev &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D NULL;<br>&gt; ++ &nbsp; &nbsp;struct =
udev=5Fdevice* udev=5Feth &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D NULL;<br>&=
gt; ++<br>&gt; ++ &nbsp; &nbsp;const char* &nbsp; &nbsp; &nbsp; &nbsp; devi=
ce &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D NULL;<br>&gt; ++ &nbsp; &n=
bsp;const char* &nbsp; &nbsp; &nbsp; &nbsp; ipaddr &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; =3D NULL;<br>&gt; ++ &nbsp; &nbsp;const char* &nbsp; &nbs=
p; &nbsp; &nbsp; netmask &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D NULL;=
<br>&gt; ++ &nbsp; &nbsp;const char* &nbsp; &nbsp; &nbsp; &nbsp; gateway &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D NULL;<br>&gt; ++ &nbsp; &nbsp;ch=
ar &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;devpath [32] &nbs=
p; &nbsp; &nbsp; =3D &quot;/sys/class/net/&quot;; <br>&gt; ++<br>&gt; ++ &n=
bsp; &nbsp;unsigned char &nbsp; &nbsp; &nbsp; family;<br>&gt; ++ &nbsp; &nb=
sp;unsigned char &nbsp; &nbsp; &nbsp; prefixlen;<br>&gt; ++ &nbsp; &nbsp;un=
signed char &nbsp; &nbsp; &nbsp; flags;<br>&gt; ++ &nbsp; &nbsp;unsigned ch=
ar &nbsp; &nbsp; &nbsp; scope;<br>&gt; ++ &nbsp; &nbsp;unsigned char &nbsp;=
 &nbsp; &nbsp; ifindex;<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp;struct in=5Faddr=
 &nbsp; &nbsp; &nbsp;nm;<br>&gt; ++ &nbsp; &nbsp;struct in=5Faddr &nbsp; &n=
bsp; &nbsp;ip;<br>&gt; ++ &nbsp; &nbsp;struct in=5Faddr &nbsp; &nbsp; &nbsp=
;gw;<br>&gt; ++ &nbsp; &nbsp;int r;<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp;asse=
rt(m);<br>&gt; ++ &nbsp; &nbsp;assert(mgr);<br>&gt; ++<br>&gt; ++ &nbsp; &n=
bsp;r =3D sd=5Fbus=5Fmessage=5Fread (m, &quot;sssyyys&quot;, &amp;device, &=
amp;ipaddr, &amp;netmask, &amp;family, &amp;flags, &amp;scope, &amp;gateway=
);<br>&gt; ++ &nbsp; &nbsp;if (r &lt; 0)<br>&gt; ++ &nbsp; &nbsp; &nbsp; &n=
bsp;return r;<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp;if (isempty (device))<br>&=
gt; ++ &nbsp; &nbsp; &nbsp; &nbsp;return sd=5Fbus=5Ferror=5Fsetf(error, SD=
=5FBUS=5FERROR=5FINVALID=5FARGS, &quot;Invalid Device Name.&quot;);<br>&gt;=
 ++<br>&gt; ++ &nbsp; &nbsp;if (isempty (ipaddr))<br>&gt; ++ &nbsp; &nbsp; =
&nbsp; &nbsp;return sd=5Fbus=5Ferror=5Fsetf(error, SD=5FBUS=5FERROR=5FINVAL=
ID=5FARGS, &quot;Invalid IP Address.&quot;);<br>&gt; ++<br>&gt; ++ &nbsp; &=
nbsp;if (isempty (netmask))<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp;return sd=
=5Fbus=5Ferror=5Fsetf(error, SD=5FBUS=5FERROR=5FINVALID=5FARGS, &quot;Inval=
id IP Netmask.&quot;);<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp;assert(family =3D=
=3D AF=5FINET || family =3D=3D AF=5FINET6);<br>&gt; ++<br>&gt; ++ &nbsp; &n=
bsp;udev =3D udev=5Fnew();<br>&gt; ++ &nbsp; &nbsp;udev=5Feth =3D udev=5Fde=
vice=5Fnew=5Ffrom=5Fsyspath(udev, strcat (devpath, device));<br>&gt; ++ &nb=
sp; &nbsp;if (!udev=5Feth)<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;return sd=5Fbus=5Ferror=5Fsetf(error, SD=5FBUS=5FERROR=5FFAILED, &quot;=
Could not find udev device&quot;);<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp;ifind=
ex =3D udev=5Fdevice=5Fget=5Fifindex(udev=5Feth);<br>&gt; ++<br>&gt; ++ &nb=
sp; &nbsp;inet=5Faton (netmask, &amp;nm);<br>&gt; ++ &nbsp; &nbsp;inet=5Fat=
on (ipaddr, &amp;ip);<br>&gt; ++ &nbsp; &nbsp;if (!isempty (gateway)) inet=
=5Faton (gateway, &amp;gw);<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp;prefixlen =
=3D in=5Faddr=5Fnetmask=5Fto=5Fprefixlen(&amp;nm);<br>&gt; ++ &nbsp; &nbsp;=
assert(prefixlen &gt; 0);<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp;r =3D address=
=5Fnew=5Fdynamic(&amp;addr);<br>&gt; ++ &nbsp; &nbsp;if (r &lt; 0)<br>&gt; =
++ &nbsp; &nbsp; &nbsp; &nbsp;return sd=5Fbus=5Ferror=5Fsetf(error, SD=5FBU=
S=5FERROR=5FNO=5FMEMORY, &quot;Error allocating new address&quot;);<br>&gt;=
 ++<br>&gt; ++ &nbsp; &nbsp;r =3D sd=5Fnetlink=5Fopen(&amp;rtnl);<br>&gt; +=
+ &nbsp; &nbsp;if (r &lt; 0)<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;return sd=5Fbus=5Ferror=5Fsetf(error, SD=5FBUS=5FERROR=5FIO=5FERROR, =
&quot;Failed to connect to netlink&quot;);<br>&gt; ++<br>&gt; ++ &nbsp; &nb=
sp;link =3D new0(Link, 1);<br>&gt; ++ &nbsp; &nbsp;if (!link)<br>&gt; ++ &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return -ENOMEM;<br>&gt; ++<br>&gt; +=
+ &nbsp; &nbsp;link-&gt;network =3D new0(Network, 1);<br>&gt; ++ &nbsp; &nb=
sp;if (!link-&gt;network)<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp;return sd=5Fbus=5Ferror=5Fsetf(error, SD=5FBUS=5FERROR=5FNO=5FMEMORY, &q=
uot;Could not alloc memory for Network&quot;);<br>&gt; ++<br>&gt; ++ &nbsp;=
 &nbsp;link-&gt;n=5Fref &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; =3D 1;<br>&gt; ++ &nbsp; &nbsp;link-&gt;manager &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; =3D mgr;<br>&gt; ++ &nbsp; &nbsp;link-&gt;manage=
r-&gt;rtnl &nbsp; &nbsp; &nbsp; &nbsp; =3D rtnl;<br>&gt; ++ &nbsp; &nbsp;li=
nk-&gt;state &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D LI=
NK=5FSTATE=5FPENDING;<br>&gt; ++ &nbsp; &nbsp;link-&gt;rtnl=5Fextended=5Fat=
trs &nbsp; =3D true;<br>&gt; ++ &nbsp; &nbsp;link-&gt;ifindex &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D ifindex;<br>&gt; ++ &nbsp; &nbsp;li=
nk-&gt;ifname &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D st=
rdup(device); /*FIXME:*/<br>&gt; ++ &nbsp; &nbsp;if (!link-&gt;ifname)<br>&=
gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return -ENOMEM;<br>&gt; ++<=
br>&gt; ++ &nbsp; &nbsp;addr-&gt;family &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;=3D family;<br>&gt; ++ &nbsp; &nbsp;addr-&gt;in=5Faddr.=
in.s=5Faddr &nbsp; &nbsp; =3D ip.s=5Faddr;<br>&gt; ++ &nbsp; &nbsp;addr-&gt=
;prefixlen &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D prefixlen;<br>&gt;=
 ++ &nbsp; &nbsp;addr-&gt;broadcast.s=5Faddr &nbsp; &nbsp; &nbsp;=3D ip.s=
=5Faddr | ~nm.s=5Faddr;<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp;if (!isempty (ga=
teway))<br>&gt; ++ &nbsp; &nbsp;{<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp;r =
=3D route=5Fnew=5Fdynamic(&amp;rt, RTPROT=5FSTATIC);<br>&gt; ++ &nbsp; &nbs=
p; &nbsp; &nbsp;if (r &lt; 0)<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;return r;<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp;rt-&gt;pr=
otocol &nbsp; &nbsp; &nbsp; &nbsp;=3D RTPROT=5FSTATIC;<br>&gt; ++ &nbsp; &n=
bsp; &nbsp; &nbsp;rt-&gt;network &nbsp; &nbsp; &nbsp; &nbsp; =3D link-&gt;n=
etwork;<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp;rt-&gt;family &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;=3D family;<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp;rt-&gt=
;scope &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D RT=5FSCOPE=5FLINK; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp;/* FIXME: */<br>&gt; ++ &nbsp; &nbsp; &nbsp;=
 &nbsp;rt-&gt;dst=5Fprefixlen &nbsp; =3D 32; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* FIXME: AF=5FINET assumed =
*/<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp;rt-&gt;dst=5Faddr.in &nbsp; &nbsp;=
 =3D gw;<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp;LIST=5FPREPEND(ro=
utes, link-&gt;network-&gt;static=5Froutes, rt);<br>&gt; ++ &nbsp; &nbsp;}<=
br>&gt; ++<br>&gt; ++ &nbsp; &nbsp;/* send an nlmsg (RTM=5FNEWADDR) and app=
end address to link address list */<br>&gt; ++ &nbsp; &nbsp;r =3D address=
=5Fupdate (addr, link, network=5Faddress=5Fadded=5Fhandler);<br>&gt; ++ &nb=
sp; &nbsp;if (r &lt; 0)<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp;return r;<br>=
&gt; ++<br>&gt; ++ &nbsp; &nbsp;r =3D sd=5Fbus=5Fmessage=5Fnew=5Fmethod=5Fr=
eturn(m, &amp;resp);<br>&gt; ++ &nbsp; &nbsp;if (r &lt; 0)<br>&gt; ++ &nbsp=
; &nbsp; &nbsp; &nbsp;return sd=5Fbus=5Ferror=5Fsetf(error, SD=5FBUS=5FERRO=
R=5FNO=5FMEMORY, &quot;Error allocating reply messgage&quot;);<br>&gt; ++<b=
r>&gt; ++ &nbsp; &nbsp;r =3D sd=5Fbus=5Fmessage=5Fappend(resp, &quot;x&quot=
;, 0);<br>&gt; ++ &nbsp; &nbsp;if (r &lt; 0)<br>&gt; ++ &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;return sd=5Fbus=5Ferror=5Fsetf(error, SD=5FBUS=5FERRO=
R=5FFAILED, &quot;Error appending to reply messgage&quot;);<br>&gt; ++<br>&=
gt; ++ &nbsp; &nbsp;r =3D sd=5Fbus=5Fsend(mgr-&gt;bus, resp, NULL);<br>&gt;=
 ++ &nbsp; &nbsp;if (r &lt; 0)<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp;return sd=5Fbus=5Ferror=5Fsetf(error, SD=5FBUS=5FERROR=5FFAILED, &q=
uot;Error sending reply messgage&quot;);<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp=
;return sd=5Fbus=5Freply=5Fmethod=5Freturn(m, &quot;s&quot;, &quot;Adding I=
P address...&quot;);<br>&gt; ++}<br>&gt; ++<br>&gt; ++static int method=5Fd=
el=5Faddress (sd=5Fbus=5Fmessage *m, void* userdata, sd=5Fbus=5Ferror *erro=
r)<br>&gt; ++{<br>&gt; ++ &nbsp; &nbsp;=5Fcleanup=5Fbus=5Fmessage=5Funref=
=5F sd=5Fbus=5Fmessage* &nbsp; &nbsp; &nbsp; &nbsp; resp &nbsp; &nbsp;=3D N=
ULL;<br>&gt; ++ &nbsp; &nbsp;=5Fcleanup=5Fnetlink=5Funref=5F sd=5Fnetlink* =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; rtnl &nbsp; &nbsp;=
=3D NULL;<br>&gt; ++ &nbsp; &nbsp;=5Fcleanup=5Fnetlink=5Fmessage=5Funref=5F=
 sd=5Fnetlink=5Fmessage* req &nbsp; &nbsp; =3D NULL;<br>&gt; ++ &nbsp; &nbs=
p;=5Fcleanup=5Fnetlink=5Fmessage=5Funref=5F sd=5Fnetlink=5Fmessage* reply &=
nbsp; =3D NULL;<br>&gt; ++ &nbsp; &nbsp;=5Fcleanup=5Faddress=5Ffree=5F Addr=
ess *addr &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp;=3D NULL;<br>&gt; ++ &nbsp; &nbsp;=5Fcleanup=5Froute=5Ffr=
ee=5F Route *rt &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D NULL;<br>&gt; ++ &nbsp; &n=
bsp;Manager *mgr &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D userdata;<br>&gt; ++ &nbsp; &nbsp;Lin=
k* &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; link &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; =3D NULL;<br>&gt; ++ &nbsp; &nbsp;struct ude=
v* &nbsp; &nbsp; &nbsp; &nbsp;udev &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; =3D NULL;<br>&gt; ++ &nbsp; &nbsp;struct udev=5Fdevice* udev=5Feth=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D NULL;<br>&gt; ++<br>&gt; ++ &nbsp; =
&nbsp;const char* &nbsp; &nbsp; &nbsp; &nbsp; device &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; =3D NULL;<br>&gt; ++ &nbsp; &nbsp;const char* &nbsp; &n=
bsp; &nbsp; &nbsp; ipaddr &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D NUL=
L;<br>&gt; ++ &nbsp; &nbsp;const char* &nbsp; &nbsp; &nbsp; &nbsp; netmask =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D NULL;<br>&gt; ++ &nbsp; &nbsp;=
const char* &nbsp; &nbsp; &nbsp; &nbsp; gateway &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp;=3D NULL;<br>&gt; ++ &nbsp; &nbsp;char &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;devpath [32] &nbsp; &nbsp; &nbsp; =3D &quo=
t;/sys/class/net/&quot;; <br>&gt; ++<br>&gt; ++ &nbsp; &nbsp;unsigned char =
&nbsp; &nbsp; &nbsp; family;<br>&gt; ++ &nbsp; &nbsp;unsigned char &nbsp; &=
nbsp; &nbsp; prefixlen;<br>&gt; ++ &nbsp; &nbsp;unsigned char &nbsp; &nbsp;=
 &nbsp; flags;<br>&gt; ++ &nbsp; &nbsp;unsigned char &nbsp; &nbsp; &nbsp; s=
cope;<br>&gt; ++ &nbsp; &nbsp;unsigned char &nbsp; &nbsp; &nbsp; ifindex;<b=
r>&gt; ++<br>&gt; ++ &nbsp; &nbsp;struct in=5Faddr &nbsp; &nbsp; &nbsp;nm;<=
br>&gt; ++ &nbsp; &nbsp;struct in=5Faddr &nbsp; &nbsp; &nbsp;ip;<br>&gt; ++=
 &nbsp; &nbsp;struct in=5Faddr &nbsp; &nbsp; &nbsp;gw;<br>&gt; ++ &nbsp; &n=
bsp;int r;<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp;assert(m);<br>&gt; ++ &nbsp; =
&nbsp;assert(mgr);<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp;r =3D sd=5Fbus=5Fmess=
age=5Fread (m, &quot;sssyyys&quot;, &amp;device, &amp;ipaddr, &amp;netmask,=
 &amp;family, &amp;flags, &amp;scope, &amp;gateway);<br>&gt; ++ &nbsp; &nbs=
p;if (r &lt; 0)<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp;return r;<br>&gt; ++<=
br>&gt; ++ &nbsp; &nbsp;if (isempty (device))<br>&gt; ++ &nbsp; &nbsp; &nbs=
p; &nbsp;return sd=5Fbus=5Ferror=5Fsetf(error, SD=5FBUS=5FERROR=5FINVALID=
=5FARGS, &quot;Invalid Device Name.&quot;);<br>&gt; ++<br>&gt; ++ &nbsp; &n=
bsp;if (isempty (ipaddr))<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp;return sd=
=5Fbus=5Ferror=5Fsetf(error, SD=5FBUS=5FERROR=5FINVALID=5FARGS, &quot;Inval=
id IP Address.&quot;);<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp;if (isempty (netm=
ask))<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp;return sd=5Fbus=5Ferror=5Fsetf(=
error, SD=5FBUS=5FERROR=5FINVALID=5FARGS, &quot;Invalid IP Netmask.&quot;);=
<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp;assert(family =3D=3D AF=5FINET || famil=
y =3D=3D AF=5FINET6);<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp;udev =3D udev=5Fne=
w();<br>&gt; ++ &nbsp; &nbsp;udev=5Feth =3D udev=5Fdevice=5Fnew=5Ffrom=5Fsy=
spath(udev, strcat (devpath, device));<br>&gt; ++ &nbsp; &nbsp;if (!udev=5F=
eth)<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return sd=5Fbus=5F=
error=5Fsetf(error, SD=5FBUS=5FERROR=5FFAILED, &quot;Could not find udev de=
vice&quot;);<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp;ifindex =3D udev=5Fdevice=
=5Fget=5Fifindex(udev=5Feth);<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp;inet=5Fato=
n (netmask, &amp;nm);<br>&gt; ++ &nbsp; &nbsp;inet=5Faton (ipaddr, &amp;ip)=
;<br>&gt; ++ &nbsp; &nbsp;if (!isempty (gateway)) inet=5Faton (gateway, &am=
p;gw);<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp;prefixlen =3D in=5Faddr=5Fnetmask=
=5Fto=5Fprefixlen(&amp;nm);<br>&gt; ++ &nbsp; &nbsp;assert(prefixlen &gt; 0=
);<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp;r =3D address=5Fnew=5Fdynamic(&amp;ad=
dr);<br>&gt; ++ &nbsp; &nbsp;if (r &lt; 0)<br>&gt; ++ &nbsp; &nbsp; &nbsp; =
&nbsp;return sd=5Fbus=5Ferror=5Fsetf(error, SD=5FBUS=5FERROR=5FNO=5FMEMORY,=
 &quot;Error allocating new address&quot;);<br>&gt; ++<br>&gt; ++ &nbsp; &n=
bsp;r =3D sd=5Fnetlink=5Fopen(&amp;rtnl);<br>&gt; ++ &nbsp; &nbsp;if (r &lt=
; 0)<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return sd=5Fbus=5F=
error=5Fsetf(error, SD=5FBUS=5FERROR=5FIO=5FERROR, &quot;Failed to connect =
to netlink&quot;);<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp;link =3D new0(Link, 1=
);<br>&gt; ++ &nbsp; &nbsp;if (!link)<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp;return -ENOMEM;<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp;link-&gt;=
network =3D new0(Network, 1);<br>&gt; ++ &nbsp; &nbsp;if (!link-&gt;network=
)<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return sd=5Fbus=5Ferr=
or=5Fsetf(error, SD=5FBUS=5FERROR=5FNO=5FMEMORY, &quot;Could not alloc memo=
ry for Network&quot;);<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp;link-&gt;n=5Fref =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 1;<br>&gt; ++ &=
nbsp; &nbsp;link-&gt;manager &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; =3D mgr;<br>&gt; ++ &nbsp; &nbsp;link-&gt;manager-&gt;rtnl &nbsp; &nbsp;=
 &nbsp; &nbsp; =3D rtnl;<br>&gt; ++ &nbsp; &nbsp;link-&gt;state &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D LINK=5FSTATE=5FPENDING;<br=
>&gt; ++ &nbsp; &nbsp;link-&gt;rtnl=5Fextended=5Fattrs &nbsp; =3D true;<br>=
&gt; ++ &nbsp; &nbsp;link-&gt;ifindex &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; =3D ifindex;<br>&gt; ++ &nbsp; &nbsp;link-&gt;ifname &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D strdup(device);<br>&gt; ++=
 &nbsp; &nbsp;if (!link-&gt;ifname)<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;return -ENOMEM;<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp;addr-&gt;fa=
mily &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D family;<br>=
&gt; ++ &nbsp; &nbsp;addr-&gt;in=5Faddr.in.s=5Faddr &nbsp; &nbsp; =3D ip.s=
=5Faddr;<br>&gt; ++ &nbsp; &nbsp;addr-&gt;prefixlen &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; =3D prefixlen;<br>&gt; ++ &nbsp; &nbsp;addr-&gt;broadcas=
t.s=5Faddr &nbsp; &nbsp; &nbsp;=3D ip.s=5Faddr | ~nm.s=5Faddr;<br>&gt; ++<b=
r>&gt; ++ &nbsp; &nbsp;if (!isempty (gateway))<br>&gt; ++ &nbsp; &nbsp;{<br=
>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp;r =3D route=5Fnew=5Fdynamic(&amp;rt, RT=
PROT=5FSTATIC);<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp;if (r &lt; 0)<br>&gt;=
 ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return r;<br>&gt; ++<br>&gt; +=
+ &nbsp; &nbsp; &nbsp; &nbsp;rt-&gt;network &nbsp; &nbsp; &nbsp; &nbsp; =3D=
 link-&gt;network;<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp;rt-&gt;family &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp;=3D family;<br>&gt; ++ &nbsp; &nbsp; &nbsp; &=
nbsp;rt-&gt;scope &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D RT=5FSCOPE=5FLINK;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* FIXME: */<br>&gt; ++ &nbsp; &n=
bsp; &nbsp; &nbsp;rt-&gt;dst=5Fprefixlen &nbsp; =3D 32; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* FIXME: AF=5FIN=
ET assumed */<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp;rt-&gt;dst=5Faddr.in &n=
bsp; &nbsp; =3D gw;<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp;/*LIST=
=5FPREPEND(routes, link-&gt;network-&gt;static=5Froutes, rt);*/<br>&gt; ++ =
&nbsp; &nbsp; &nbsp; &nbsp;/* Drop the Gateway */<br>&gt; ++ &nbsp; &nbsp; =
&nbsp; &nbsp;route=5Fdrop (rt, link, link=5Froute=5Fdrop=5Fhandler);<br>&gt=
; ++ &nbsp; &nbsp;}<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp;/* send an nlmsg to =
delete address from address list */<br>&gt; ++ &nbsp; &nbsp;r =3D address=
=5Fdrop(addr, link, link=5Faddress=5Fdrop=5Fhandler);<br>&gt; ++ &nbsp; &nb=
sp;if (r &lt; 0)<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp;return r;<br>&gt; ++=
<br>&gt; ++ &nbsp; &nbsp;r =3D sd=5Fbus=5Fmessage=5Fnew=5Fmethod=5Freturn(m=
, &amp;resp);<br>&gt; ++ &nbsp; &nbsp;if (r &lt; 0)<br>&gt; ++ &nbsp; &nbsp=
; &nbsp; &nbsp;return sd=5Fbus=5Ferror=5Fsetf(error, SD=5FBUS=5FERROR=5FNO=
=5FMEMORY, &quot;Error allocating reply messgage&quot;);<br>&gt; ++<br>&gt;=
 ++ &nbsp; &nbsp;r =3D sd=5Fbus=5Fmessage=5Fappend(resp, &quot;x&quot;, 0);=
<br>&gt; ++ &nbsp; &nbsp;if (r &lt; 0)<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;return sd=5Fbus=5Ferror=5Fsetf(error, SD=5FBUS=5FERROR=5FFA=
ILED, &quot;Error appending to reply messgage&quot;);<br>&gt; ++<br>&gt; ++=
 &nbsp; &nbsp;r =3D sd=5Fbus=5Fsend(mgr-&gt;bus, resp, NULL);<br>&gt; ++ &n=
bsp; &nbsp;if (r &lt; 0)<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;return sd=5Fbus=5Ferror=5Fsetf(error, SD=5FBUS=5FERROR=5FFAILED, &quot;Er=
ror sending reply messgage&quot;);<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp;retur=
n sd=5Fbus=5Freply=5Fmethod=5Freturn(m, &quot;s&quot;, &quot;Deleted IP add=
ress...&quot;);<br>&gt; ++}<br>&gt; ++<br>&gt; ++static int method=5Fget=5F=
address (sd=5Fbus=5Fmessage *m, void* userdata, sd=5Fbus=5Ferror *error)<br=
>&gt; ++{<br>&gt; ++ &nbsp; &nbsp;=5Fcleanup=5Fnetlink=5Funref=5F sd=5Fnetl=
ink &nbsp;*rtnl &nbsp; =3D NULL;<br>&gt; ++ &nbsp; &nbsp;=5Fcleanup=5Faddre=
ss=5Ffree=5F Address &nbsp; &nbsp; &nbsp;*addr &nbsp; =3D NULL;<br>&gt; ++ =
&nbsp; &nbsp;=5Fcleanup=5Froute=5Ffree=5F Route &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;*rt &nbsp; &nbsp; =3D NULL;<br>&gt; ++ &nbsp; &nbsp;Manager &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; *mgr &nbsp; &nbsp;=3D userdata;<br>&gt; ++#if 0 /* fixme: */=
<br>&gt; ++ &nbsp; &nbsp;Link* &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; link &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D NULL;<br>&gt=
; ++#endif<br>&gt; ++ &nbsp; &nbsp;struct udev* &nbsp; &nbsp; &nbsp; &nbsp;=
udev &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D NULL;<br>&gt; ++ =
&nbsp; &nbsp;struct udev=5Fdevice* udev=5Feth &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; =3D NULL;<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp;const char* &nbsp; &nbsp=
; &nbsp; &nbsp; device &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D NULL;<=
br>&gt; ++#if 0 /* fixme: */<br>&gt; ++ &nbsp; &nbsp;const char* &nbsp; &nb=
sp; &nbsp; &nbsp; ipaddr &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D NULL=
;<br>&gt; ++ &nbsp; &nbsp;const char* &nbsp; &nbsp; &nbsp; &nbsp; netmask &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D NULL;<br>&gt; ++ &nbsp; &nbsp;c=
onst char* &nbsp; &nbsp; &nbsp; &nbsp; gateway &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;=3D NULL;<br>&gt; ++#endif<br>&gt; ++ &nbsp; &nbsp;char &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;devpath [32] &nbsp; &nbsp;=
 &nbsp; =3D &quot;/sys/class/net/&quot;; <br>&gt; ++<br>&gt; ++#if 0 /* fix=
me: */<br>&gt; ++ &nbsp; &nbsp;unsigned char &nbsp; &nbsp; &nbsp; family;<b=
r>&gt; ++ &nbsp; &nbsp;unsigned char &nbsp; &nbsp; &nbsp; prefixlen;<br>&gt=
; ++ &nbsp; &nbsp;unsigned char &nbsp; &nbsp; &nbsp; flags;<br>&gt; ++ &nbs=
p; &nbsp;unsigned char &nbsp; &nbsp; &nbsp; scope;<br>&gt; ++#endif<br>&gt;=
 ++ &nbsp; &nbsp;unsigned char &nbsp; &nbsp; &nbsp; ifindex;<br>&gt; ++<br>=
&gt; ++#if 0 /* fixme: */<br>&gt; ++ &nbsp; &nbsp;struct in=5Faddr &nbsp; &=
nbsp; &nbsp;nm;<br>&gt; ++ &nbsp; &nbsp;struct in=5Faddr &nbsp; &nbsp; &nbs=
p;ip;<br>&gt; ++ &nbsp; &nbsp;struct in=5Faddr &nbsp; &nbsp; &nbsp;gw;<br>&=
gt; ++#endif<br>&gt; ++ &nbsp; &nbsp;int &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; r;<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp;sd=5Fnetlink=5F=
message* maddr;<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp;=5Fcleanup=5Fnetlink=5Fm=
essage=5Funref=5F sd=5Fnetlink=5Fmessage &nbsp;*req &nbsp; &nbsp;=3D NULL;<=
br>&gt; ++ &nbsp; &nbsp;=5Fcleanup=5Fnetlink=5Fmessage=5Funref=5F sd=5Fnetl=
ink=5Fmessage &nbsp;*reply &nbsp; &nbsp;=3D NULL;<br>&gt; ++ &nbsp; &nbsp;=
=5Fcleanup=5Fbus=5Fmessage=5Funref=5F sd=5Fbus=5Fmessage &nbsp;*resp &nbsp;=
 =3D NULL;<br>&gt; ++ &nbsp; &nbsp;=5Fcleanup=5Faddress=5Ffree=5F Address &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;*address =3D NULL;<br>&gt; +=
+ &nbsp; &nbsp;=5Fcleanup=5Ffree=5F struct local=5Faddress &nbsp; &nbsp; &n=
bsp; &nbsp; *local &nbsp; =3D NULL;<br>&gt; ++ &nbsp; &nbsp;=5Fcleanup=5Ffr=
ee=5F char &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; *ipr &nbsp; &nbsp; =3D NULL;<br>&gt; ++ &nbsp; &nbsp;=
=5Fcleanup=5Ffree=5F char &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; *gwr &nbsp; &nbsp; =3D NULL;<br>&gt; ++ =
&nbsp; &nbsp;int &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; n;=
<br>&gt; ++ &nbsp; &nbsp;int &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; i;<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp;assert(m);<br>&gt; ++ &nbsp=
; &nbsp;assert(mgr);<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp;r =3D sd=5Fbus=5Fme=
ssage=5Fread (m, &quot;s&quot;, &amp;device);<br>&gt; ++ &nbsp; &nbsp;if (r=
 &lt; 0)<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp;return r;<br>&gt; ++<br>&gt;=
 ++ &nbsp; &nbsp;if (isempty (device))<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbs=
p;return sd=5Fbus=5Ferror=5Fsetf(error, SD=5FBUS=5FERROR=5FINVALID=5FARGS, =
&quot;Invalid Device Name.&quot;);<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp;udev =
=3D udev=5Fnew();<br>&gt; ++ &nbsp; &nbsp;udev=5Feth =3D udev=5Fdevice=5Fne=
w=5Ffrom=5Fsyspath(udev, strcat (devpath, device));<br>&gt; ++ &nbsp; &nbsp=
;if (!udev=5Feth)<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp;return sd=5Fbus=5Fe=
rror=5Fsetf(error, SD=5FBUS=5FERROR=5FFAILED, &quot;Could not find udev dev=
ice&quot;);<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp;ifindex =3D udev=5Fdevice=5F=
get=5Fifindex(udev=5Feth);<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp;r =3D sd=5Fne=
tlink=5Fopen(&amp;rtnl);<br>&gt; ++ &nbsp; &nbsp;if (r &lt; 0)<br>&gt; ++ &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return log=5Ferror=5Ferrno(r, &quot=
;Failed to connect to netlink:&quot;); /* fixme */<br>&gt; ++<br>&gt; ++ &n=
bsp; &nbsp;r =3D sd=5Frtnl=5Fmessage=5Fnew=5Faddr(rtnl, &amp;req, RTM=5FGET=
ADDR, 0, 0);
<br>&gt; ++ &nbsp; &nbsp;if (r &lt; 0)<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;return r;<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp;r =3D sd=5Fnet=
link=5Fmessage=5Frequest=5Fdump(req, true);<br>&gt; ++ &nbsp; &nbsp;if (r &=
lt; 0)<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return r;<br>&gt=
; ++<br>&gt; ++ &nbsp; &nbsp;r =3D sd=5Fnetlink=5Fcall(rtnl, req, 0, &amp;r=
eply); /* fixme */<br>&gt; ++ &nbsp; &nbsp;if (r &lt; 0)<br>&gt; ++ &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return r;<br>&gt; ++<br>&gt; ++ &nbsp; &n=
bsp;r =3D sd=5Fbus=5Fmessage=5Fnew=5Fmethod=5Freturn(m, &amp;resp);<br>&gt;=
 ++ &nbsp; &nbsp;if (r &lt; 0)<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp;return=
 sd=5Fbus=5Ferror=5Fsetf(error, SD=5FBUS=5FERROR=5FNO=5FMEMORY, &quot;Error=
 allocating reply messgage&quot;);<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp;r =3D=
 sd=5Fbus=5Fmessage=5Fopen=5Fcontainer(resp, 'a', &quot;iyyus&quot;); /*fam=
ily,prefixlen,scope,flags,addr*/<br>&gt; ++ &nbsp; &nbsp;if (r &lt; 0)<br>&=
gt; ++ &nbsp; &nbsp; &nbsp; &nbsp;return sd=5Fbus=5Ferror=5Fsetf(error, SD=
=5FBUS=5FERROR=5FNO=5FMEMORY, &quot;Error opening a container for reply mes=
sage&quot;);<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp;for (maddr =3D reply; maddr=
; maddr =3D sd=5Fnetlink=5Fmessage=5Fnext(maddr)) {<br>&gt; ++ &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp;int k;<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp;r =3D address=5Fnew=5Fdynamic(&amp;address);<br>&gt=
; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (r &lt; 0)<br>&gt; ++ &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return r;<=
br>&gt; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;k =3D networ=
k=5Frtnl=5Fprocess=5Faddress(rtnl, maddr, mgr, address);<br>&gt; ++ &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (k) {<br>&gt; ++ &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;r =3D sd=5Fbus=5Fmessage=5Fappend(resp, &=
quot;i&quot;, address-&gt;family);<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;if (r &lt; 0)<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return sd=5Fbus=
=5Ferror=5Fsetf(error, SD=5FBUS=5FERROR=5FFAILED, &quot;Error appending to =
reply messgage&quot;);<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp;r =3D sd=5Fbus=5Fmessage=5Fappend(resp, &quot;y&qu=
ot;, address-&gt;prefixlen);<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;if (r &lt; 0)<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return sd=5Fbus=5Ferro=
r=5Fsetf(error, SD=5FBUS=5FERROR=5FFAILED, &quot;Error appending to reply m=
essgage&quot;);<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp;r =3D sd=5Fbus=5Fmessage=5Fappend(resp, &quot;y&quot;, ad=
dress-&gt;scope);<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;if (r &lt; 0)<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return sd=5Fbus=5Ferror=5Fsetf(er=
ror, SD=5FBUS=5FERROR=5FFAILED, &quot;Error appending to reply messgage&quo=
t;);<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;r =3D sd=5Fbus=5Fmessage=5Fappend(resp, &quot;u&quot;, address-&gt;f=
lags);<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if=
 (r &lt; 0)<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp;return sd=5Fbus=5Ferror=5Fsetf(error, SD=5FB=
US=5FERROR=5FFAILED, &quot;Error appending to reply messgage&quot;);<br>&gt=
; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;r =
=3D in=5Faddr=5Fto=5Fstring(address-&gt;family, &amp;address-&gt;in=5Faddr,=
 &amp;ipr); /* fixme */<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp;if (r &lt; 0)<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return r;</tt><br><tt>&gt; =
++<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;r =3D =
sd=5Fbus=5Fmessage=5Fappend(resp, &quot;s&quot;, ipr);<br>&gt; ++ &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (r &lt; 0)<br>&gt; ++ &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;return sd=5Fbus=5Ferror=5Fsetf(error, SD=5FBUS=5FERROR=5FFAILED, &quot;=
Error appending to reply messgage&quot;);<br>&gt; ++ &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;}<br>&gt; ++ &nbsp; &nbsp;}<br>&gt; ++<br>&gt; ++ &nbsp;=
 &nbsp;r =3D sd=5Fbus=5Fmessage=5Fclose=5Fcontainer(resp);<br>&gt; ++ &nbsp=
; &nbsp;if (r &lt; 0)<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;r=
eturn sd=5Fbus=5Ferror=5Fsetf(error, SD=5FBUS=5FERROR=5FFAILED, &quot;Error=
 closing reply container&quot;);<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp;n =3D l=
ocal=5Fgateways(rtnl, ifindex, AF=5FUNSPEC, &amp;local);<br>&gt; ++ &nbsp; =
&nbsp;if (n &lt; 0)<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ret=
urn n;<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp;for (i =3D 0; i &lt; n; i++) {<br=
>&gt; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;r =3D in=5Fadd=
r=5Fto=5Fstring(local[i].family, &amp;local[i].address, &amp;gwr);<br>&gt; =
++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (r &lt; 0)<br>&gt; ++ &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return r;<br=
>&gt; ++ &nbsp; &nbsp;}<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp;r =3D sd=5Fbus=
=5Fmessage=5Fappend(resp, &quot;s&quot;, gwr);<br>&gt; ++ &nbsp; &nbsp;if (=
r &lt; 0)<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return sd=5Fb=
us=5Ferror=5Fsetf(error, SD=5FBUS=5FERROR=5FFAILED, &quot;Error appending t=
o reply messgage&quot;);<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp;r =3D sd=5Fbus=
=5Fsend(mgr-&gt;bus, resp, NULL);<br>&gt; ++ &nbsp; &nbsp;if (r &lt; 0)<br>=
&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return sd=5Fbus=5Ferror=5F=
setf(error, SD=5FBUS=5FERROR=5FFAILED, &quot;Error sending reply messgage&q=
uot;);<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp;return sd=5Fbus=5Freply=5Fmethod=
=5Freturn(m, &quot;s&quot;, &quot;Getting IP configuration...&quot;);<br>&g=
t; ++}<br>&gt; ++<br>&gt; ++<br>&gt; ++int network=5Frtnl=5Fprocess=5Faddre=
ss(sd=5Fnetlink *rtnl, sd=5Fnetlink=5Fmessage *message, void *userdata, Add=
ress* address) {<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp;Manager* &nbsp; &nbs=
p; &nbsp; &nbsp;m &nbsp; &nbsp; &nbsp; =3D (Manager*) userdata; /* fixme */=
<br>&gt; ++#if 0 /* fixme */<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp;Link* &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; link &nbsp; &nbsp;=3D NULL;<br>&gt; ++#end=
if<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp;uint16=5Ft &nbsp; &nbsp; &nbsp; &n=
bsp;type;<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp;unsigned char &nbsp; flags;=
<br>&gt; ++#if 0 /* fixme */<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp;Address*=
 &nbsp; &nbsp; &nbsp; &nbsp;existing;<br>&gt; ++#endif<br>&gt; ++ &nbsp; &n=
bsp; &nbsp; &nbsp;char &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;buf[INET6=
=5FADDRSTRLEN]; <br>&gt; ++#if 0 /* fixme */<br>&gt; ++ &nbsp; &nbsp; &nbsp=
; &nbsp;char &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;valid=5Fbuf[FORMAT=5F=
TIMESPAN=5FMAX];<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp;const char* &nbsp; &=
nbsp; valid=5Fstr =3D NULL;<br>&gt; ++#endif<br>&gt; ++ &nbsp; &nbsp; &nbsp=
; &nbsp;int &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ifindex;<br>&gt; ++ &=
nbsp; &nbsp; &nbsp; &nbsp;int &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; r; =
<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp;/*=5Fcleanup=5Faddress=5Ffree=5F Add=
ress *address =3D NULL;*/<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp;sd=5Fbus=5F=
error err &nbsp; &nbsp;=3D SD=5FBUS=5FERROR=5FNULL; /* fixme */<br>&gt; ++ =
&nbsp; &nbsp; &nbsp; &nbsp;sd=5Fbus=5Ferror* error =3D &amp;err; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; /* fixme */<br>&gt; ++<br>&gt; ++ &nbsp; &n=
bsp; &nbsp; &nbsp;assert(rtnl);<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp;asser=
t(message);<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp;assert(m);<br>&gt; ++ &nb=
sp; &nbsp; &nbsp; &nbsp;assert(address);<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp=
; &nbsp; &nbsp;if (sd=5Fnetlink=5Fmessage=5Fis=5Ferror(message)) {<br>&gt; =
++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;r =3D sd=5Fnetlin=
k=5Fmessage=5Fget=5Ferrno(message);<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;if (r &lt; 0)<br>&gt; ++ &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;sd=5Fbus=5Ferro=
r=5Fsetf(error, SD=5FBUS=5FERROR=5FFAILED, &quot;rtnl: failed to receive ad=
dress: &quot;);<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp;return 0;<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp;}<br>&gt;=
 ++<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp;r =3D sd=5Fnetlink=5Fmessage=5Fge=
t=5Ftype(message, &amp;type);<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp;if (r &=
lt; 0) {<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
sd=5Fbus=5Ferror=5Fsetf(error, SD=5FBUS=5FERROR=5FFAILED, &quot;rtnl: could=
 not get message type: &quot;);<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;return 0;<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp;} el=
se if (type !=3D RTM=5FNEWADDR &amp;&amp; type !=3D RTM=5FDELADDR) {<br>&gt=
; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;sd=5Fbus=5Ferro=
r=5Fsetf(error, SD=5FBUS=5FERROR=5FFAILED, &quot;rtnl: received unexpected =
message type when processing address&quot;);<br>&gt; ++ &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return 0;<br>&gt; ++ &nbsp; &nbsp; &nbs=
p; &nbsp;}<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp;r =3D sd=5Frtnl=
=5Fmessage=5Faddr=5Fget=5Fifindex(message, &amp;ifindex);<br>&gt; ++ &nbsp;=
 &nbsp; &nbsp; &nbsp;if (r &lt; 0) {<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp;sd=5Fbus=5Ferror=5Fsetf(error, SD=5FBUS=5FERROR=
=5FFAILED, &quot;rtnl: could not get ifindex from address: %m&quot;);<br>&g=
t; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return 0;<br>&=
gt; ++ &nbsp; &nbsp; &nbsp; &nbsp;} else if (ifindex &lt;=3D 0) {<br>&gt; +=
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;sd=5Fbus=5Ferror=
=5Fsetf(error, SD=5FBUS=5FERROR=5FFAILED, &quot;rtnl: received address mess=
age with invalid ifindex: %d&quot;, ifindex);<br>&gt; ++ &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return 0;<br>&gt; ++ &nbsp; &nbsp; &nb=
sp; &nbsp;} <br>&gt; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp;r =3D sd=5Frt=
nl=5Fmessage=5Faddr=5Fget=5Ffamily(message, &amp;address-&gt;family); /* in=
t : i*/<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp;if (r &lt; 0 || !IN=5FSET(add=
ress-&gt;family, AF=5FINET, AF=5FINET6)) {<br>&gt; ++ &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;sd=5Fbus=5Ferror=5Fsetf(error, SD=5FBUS=
=5FERROR=5FFAILED, &quot;rtnl: received address with invalid family, ignori=
ng.&quot;);<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp;return 0;<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp;}<br>&gt; ++<br>&gt; ++ =
&nbsp; &nbsp; &nbsp; &nbsp;r =3D sd=5Frtnl=5Fmessage=5Faddr=5Fget=5Fprefixl=
en(message, &amp;address-&gt;prefixlen); /* uchar : byte : y */<br>&gt; ++ =
&nbsp; &nbsp; &nbsp; &nbsp;if (r &lt; 0) {<br>&gt; ++ &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;sd=5Fbus=5Ferror=5Fsetf(error, SD=5FBUS=
=5FERROR=5FFAILED, &quot;rtnl: received address with invalid prefixlen, ign=
oring: &quot;);<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;return 0;<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp;}<br>&gt; ++<br>&gt;=
 ++ &nbsp; &nbsp; &nbsp; &nbsp;r =3D sd=5Frtnl=5Fmessage=5Faddr=5Fget=5Fsco=
pe(message, &amp;address-&gt;scope); /* uchar : byte : y*/<br>&gt; ++ &nbsp=
; &nbsp; &nbsp; &nbsp;if (r &lt; 0) {<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp;sd=5Fbus=5Ferror=5Fsetf(error, SD=5FBUS=5FERRO=
R=5FFAILED, &quot;rtnl: received address with invalid scope, ignoring: &quo=
t;);<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;retu=
rn 0;<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp;}<br>&gt; ++<br>&gt; ++ &nbsp; =
&nbsp; &nbsp; &nbsp;r =3D sd=5Frtnl=5Fmessage=5Faddr=5Fget=5Fflags(message,=
 &amp;flags); /* uint32 : u*/<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp;if (r &=
lt; 0) {<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
sd=5Fbus=5Ferror=5Fsetf(error, SD=5FBUS=5FERROR=5FFAILED, &quot;rtnl: recei=
ved address with invalid flags, ignoring: &quot;);<br>&gt; ++ &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return 0;<br>&gt; ++ &nbsp; &nbsp=
; &nbsp; &nbsp;}<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp;address-&gt;flags =
=3D flags;<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp;switch (address=
-&gt;family) {<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp;case AF=5FINET:<br>&gt=
; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;r =3D sd=5Fnetl=
ink=5Fmessage=5Fread=5Fin=5Faddr(message, IFA=5FLOCAL, &amp;address-&gt;in=
=5Faddr.in); /* ulong : uint64 : t */<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp;if (r &lt; 0) {<br>&gt; ++ &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;sd=5Fbus=5F=
error=5Fsetf(error, SD=5FBUS=5FERROR=5FFAILED, &quot;rtnl: received address=
 without valid address, ignoring: &quot;);<br>&gt; ++ &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return 0;<br>=
&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>&gt; ++=
<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;<b=
r>&gt; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp;case AF=5FINET6:<br>&gt; ++=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;r =3D sd=5Fnetlink=
=5Fmessage=5Fread=5Fin6=5Faddr(message, IFA=5FADDRESS, &amp;address-&gt;in=
=5Faddr.in6); /* ulong : uint64 : t */<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp;if (r &lt; 0) {<br>&gt; ++ &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;sd=5Fbus=
=5Ferror=5Fsetf(error, SD=5FBUS=5FERROR=5FFAILED, &quot;rtnl: received addr=
ess without valid address, ignoring: &quot;);<br>&gt; ++ &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return 0;<=
br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>&gt;=
 ++<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break=
;<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp;default:<br>&gt; ++ &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;assert=5Fnot=5Freached(&=
quot;invalid address family&quot;);<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp;}=
<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp;if (!inet=5Fntop(address-=
&gt;family, &amp;address-&gt;in=5Faddr, buf, INET6=5FADDRSTRLEN)) { /* stri=
ng : s */<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;sd=5Fbus=5Ferror=5Fsetf(error, SD=5FBUS=5FERROR=5FFAILED, &quot;Could not =
print address&quot;);<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;return 0;<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp;}<br>&gt; ++<b=
r>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp;return 1;<br>&gt; ++}<br>&gt; ++#endif=
<br>&gt; +diff --git a/src/network/networkd-network.c b/src/network/network=
d-network.c<br>&gt; +index 6587ea9..2616c5b 100644<br>&gt; +--- a/src/netwo=
rk/networkd-network.c<br>&gt; ++++ b/src/network/networkd-network.c<br>&gt;=
 +@@ -32,6 +32,14 @@<br>&gt; + #include &quot;network-internal.h&quot;<br>&=
gt; + #include &quot;dns-domain.h&quot;<br>&gt; + <br>&gt; ++#define SYSTEM=
D=5FNETWORKD=5FDBUS 1<br>&gt; ++<br>&gt; ++#ifdef SYSTEMD=5FNETWORKD=5FDBUS=
<br>&gt; ++int network=5Faddress=5Fadded=5Fhandler (sd=5Fnetlink* rtnl, sd=
=5Fnetlink=5Fmessage* m, void* userdata);<br>&gt; ++int network=5Fset=5Fgat=
eway (Link* link);<br>&gt; ++static int route=5Fhandler(sd=5Fnetlink *rtnl,=
 sd=5Fnetlink=5Fmessage *m, void *userdata);<br>&gt; ++#endif<br>&gt; ++<br=
>&gt; + static int network=5Fload=5Fone(Manager *manager, const char *filen=
ame) {<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; =5Fcleanup=5Fnetwork=5Ffree=5F=
 Network *network =3D NULL;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; =5Fcleanu=
p=5Ffclose=5F FILE *file =3D NULL;<br>&gt; +@@ -850,3 +858,76 @@ int config=
=5Fparse=5Fhostname(const char *unit,<br>&gt; + <br>&gt; + &nbsp; &nbsp; &n=
bsp; &nbsp; return 0;<br>&gt; + }<br>&gt; ++<br>&gt; ++#ifdef SYSTEMD=5FNET=
WORKD=5FDBUS<br>&gt; ++int network=5Faddress=5Fadded=5Fhandler (sd=5Fnetlin=
k* rtnl, sd=5Fnetlink=5Fmessage* m, void* userdata)<br>&gt; ++{<br>&gt; ++ =
&nbsp; &nbsp; &nbsp; &nbsp;=5Fcleanup=5Flink=5Funref=5F Link *link =3D user=
data;<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp;int r;<br>&gt; ++<br>&gt; ++ &n=
bsp; &nbsp; &nbsp; &nbsp;assert(link);<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp; =
&nbsp; &nbsp;r =3D sd=5Fnetlink=5Fmessage=5Fget=5Ferrno(m);<br>&gt; ++ &nbs=
p; &nbsp; &nbsp; &nbsp;if (r &lt; 0 &amp;&amp; r !=3D -EEXIST) {<br>&gt; ++=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;log=5Fdebug(&quot;E=
rror in set IP address!&quot;);<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;link=5Fenter=5Ffailed(link);<br>&gt; ++ &nbsp; &nbsp=
; &nbsp; &nbsp;} else if (r &gt;=3D 0)<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp;link=5Frtnl=5Fprocess=5Faddress(rtnl, m, link=
-&gt;manager);<br>&gt; ++<br>&gt; ++                 network=5Fset=5Fgatewa=
y (link);<br>&gt; ++<br>&gt; ++                 return 1;<br>&gt; ++}<br>&g=
t; ++<br>&gt; ++/* link=5Fenter=5Fset=5Froutes */<br>&gt; ++int network=5Fs=
et=5Fgateway (Link* link)<br>&gt; ++{<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp=
;Route *rt;<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp;int r;<br>&gt; ++<br>&gt;=
 ++ &nbsp; &nbsp; &nbsp; &nbsp;assert(link);<br>&gt; ++ &nbsp; &nbsp; &nbsp=
; &nbsp;assert(link-&gt;network);<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp;ass=
ert(link-&gt;state =3D=3D LINK=5FSTATE=5FSETTING=5FADDRESSES);<br>&gt; ++<b=
r>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp;link-&gt;state =3D LINK=5FSTATE=5FSETT=
ING=5FROUTES;<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp;LIST=5FFOREA=
CH(routes, rt, link-&gt;network-&gt;static=5Froutes) {<br>&gt; ++ &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;r =3D route=5Fconfigure(rt, l=
ink, &amp;route=5Fhandler);<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;if (r &lt; 0) {<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;log=5Fdebug (&quot;Co=
uld not set Gateway!&quot;);<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;link=5Fenter=5Ffailed(link)=
;<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;return r;<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;}<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;link-&gt;link=5Fmessages ++;<br>&gt; ++ &nbsp; &n=
bsp; &nbsp; &nbsp;}<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp;if (li=
nk-&gt;link=5Fmessages =3D=3D 0) {<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;link-&gt;static=5Fconfigured =3D true;<br>&gt; ++=
<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/*link=
=5Fenter=5Fconfigured (link);*/<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;log=5Flink=5Finfo(link, &quot;Configured&quot;);<br>=
&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;link-&gt;sta=
te =3D LINK=5FSTATE=5FCONFIGURED;<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp;link=5Fsave(link);<br>&gt; ++ &nbsp; &nbsp; &nbsp;=
 &nbsp;} else<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;log=5Fdebug(&quot;Setting Gateway&quot;);<br>&gt; ++<br>&gt; ++ &nbsp;=
 &nbsp; &nbsp; &nbsp;return 0;<br>&gt; ++}<br>&gt; ++<br>&gt; ++static int =
route=5Fhandler(sd=5Fnetlink *rtnl, sd=5Fnetlink=5Fmessage *m, void *userda=
ta) {<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp;=5Fcleanup=5Flink=5Funref=5F Li=
nk *link =3D userdata;<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp;int r;<br>&gt;=
 ++<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp;assert(link);<br>&gt; ++<br>&gt; =
++ &nbsp; &nbsp; &nbsp; &nbsp;r =3D sd=5Fnetlink=5Fmessage=5Fget=5Ferrno(m)=
;<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp;if (r &lt; 0 &amp;&amp; r !=3D -EEX=
IST) {<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;lo=
g=5Fdebug (&quot;Could not set route! &quot;);<br>&gt; ++ &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;link=5Fenter=5Ffailed(link);<br>&gt; =
++ &nbsp; &nbsp; &nbsp; &nbsp;}<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp; =
&nbsp;return 1;<br>&gt; ++}<br>&gt; ++<br>&gt; ++#endif<br>&gt; +diff --git=
 a/src/network/org.freedesktop.network1.conf b/src/network/org.freedesktop.=
network1.conf<br>&gt; +index 52dad33..f424b88 100644<br>&gt; +--- a/src/net=
work/org.freedesktop.network1.conf<br>&gt; ++++ b/src/network/org.freedeskt=
op.network1.conf<br>&gt; +@@ -36,6 +36,23 @@<br>&gt; + &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;send=5Finter=
face=3D&quot;org.freedesktop.DBus.Properties&quot;<br>&gt; + &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;send=
=5Fmember=3D&quot;GetAll&quot;/&gt;<br>&gt; + <br>&gt; ++ &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&lt;allow send=5Fdestination=3D&quot;=
org.freedesktop.network1&quot;<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; send=5Finterface=3D&quot;org.fr=
eedesktop.network1.Network&quot;<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; send=5Fmember=3D&quot;AddAddr=
ess&quot;/&gt;<br>&gt; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;&lt;allow send=5Fdestination=3D&quot;org.freedesktop.netwo=
rk1&quot;<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; send=5Finterface=3D&quot;org.freedesktop.network1.Ne=
twork&quot;<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; send=5Fmember=3D&quot;DelAddress&quot;/&gt;<br>&gt=
; ++<br>&gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&lt;=
allow send=5Fdestination=3D&quot;org.freedesktop.network1&quot;<br>&gt; ++ =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; send=5Finterface=3D&quot;org.freedesktop.network1.Network&quot;<br>&gt; +=
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; send=5Fmember=3D&quot;GetAddress&quot;/&gt;<br>&gt; ++<br>&gt; ++ &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&lt;allow send=5Fdestinat=
ion=3D&quot;org.freedesktop.network1&quot;<br>&gt; ++ &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; send=5Finterface=3D=
&quot;org.freedesktop.network1.Link&quot;<br>&gt; ++ &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; send=5Fmember=3D&quo=
t;GetAddress&quot;/&gt;<br>&gt; ++<br>&gt; ++<br>&gt; + &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;allow receive=5Fsender=3D&quot;org=
.freedesktop.network1&quot;/&gt;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &lt;=
/policy&gt;<br>&gt; + <br>&gt; +-- <br>&gt; +1.8.2.2<br>&gt; +<br>&gt; diff=
 --git a/yocto-poky/meta/recipes-core/systemd/systemd=5F225.bb b/yocto-poky=
/meta/recipes-core/systemd/systemd=5F225.bb<br>&gt; index f7d4c7d..e3d55ec =
100644<br>&gt; --- a/yocto-poky/meta/recipes-core/systemd/systemd=5F225.bb<=
br>&gt; +++ b/yocto-poky/meta/recipes-core/systemd/systemd=5F225.bb<br>&gt;=
 @@ -41,6 +41,7 @@ SRC=5FURI =3D &quot;git://github.com/systemd/systemd.git=
;protocol=3Dgit \<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </tt><t=
t><a href=3D"file://0012-implment-systemd-sysv-install-for-OE.patch">file:/=
/0012-implment-systemd-sysv-install-for-OE.patch</a></tt><tt>&nbsp;\<br>&gt=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </tt><tt><a href=3D"file://0014=
-Revert-rules-remove-firmware-loading-rules.patch">file://0014-Revert-rules=
-remove-firmware-loading-rules.patch</a></tt><tt>&nbsp;\<br>&gt; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; </tt><tt><a href=3D"file://0015-Revert-udev=
-remove-userspace-firmware-loading-suppor.patch">file://0015-Revert-udev-re=
move-userspace-firmware-loading-suppor.patch</a></tt><tt>&nbsp;\<br>&gt; + =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </tt><tt><a href=3D"file://0100-systemd=
=5Fnetworkd=5Fdbus=5Fsetaddress.patch">file://0100-systemd=5Fnetworkd=5Fdbu=
s=5Fsetaddress.patch</a></tt><tt>&nbsp;\<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; </tt><tt><a href=3D"file://touchscreen.rules">file://touchs=
creen.rules</a></tt><tt>&nbsp;\<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; </tt><tt><a href=3D"file://00-create-volatile.conf">file://00-create=
-volatile.conf</a></tt><tt>&nbsp;\<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; </tt><tt>file://init</tt><tt>&nbsp;\<br><br>=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F<br>openbmc mailing list<br>op=
enbmc@lists.ozlabs.org<br></tt><tt><a href=3D"https://lists.ozlabs.org/list=
info/openbmc">https://lists.ozlabs.org/listinfo/openbmc</a></tt><tt><br></t=
t><br><BR>
</body></html>

--1__=8FBBF5D2DFB5EC288f9e8a93df938690918c8FBBF5D2DFB5EC28--


--0__=8FBBF5D2DFB5EC288f9e8a93df938690918c8FBBF5D2DFB5EC28
Content-type: image/gif; 
	name="graycol.gif"
Content-Disposition: inline; filename="graycol.gif"
Content-ID: <2__=8FBBF5D2DFB5EC288f9e8a93df938690918c8FB@>
Content-Transfer-Encoding: base64

R0lGODlhEAAQAKECAMzMzAAAAP///wAAACH5BAEAAAIALAAAAAAQABAAAAIXlI+py+0PopwxUbpu
ZRfKZ2zgSJbmSRYAIf4fT3B0aW1pemVkIGJ5IFVsZWFkIFNtYXJ0U2F2ZXIhAAA7


--0__=8FBBF5D2DFB5EC288f9e8a93df938690918c8FBBF5D2DFB5EC28--
