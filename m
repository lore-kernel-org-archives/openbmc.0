Return-Path: <hramasub@in.ibm.com>
Received: from e28smtp03.in.ibm.com (e28smtp03.in.ibm.com [122.248.162.3])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 03FC11A0764
 for <openbmc@lists.ozlabs.org>; Fri, 13 Nov 2015 02:06:30 +1100 (AEDT)
Received: from /spool/local
 by e28smtp03.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <hramasub@in.ibm.com>;
 Thu, 12 Nov 2015 20:36:27 +0530
Received: from d28dlp02.in.ibm.com (9.184.220.127)
 by e28smtp03.in.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Thu, 12 Nov 2015 20:36:24 +0530
X-Helo: d28dlp02.in.ibm.com
X-MailFrom: hramasub@in.ibm.com
X-RcptTo: openbmc@lists.ozlabs.org
Received: from d28relay03.in.ibm.com (d28relay03.in.ibm.com [9.184.220.60])
 by d28dlp02.in.ibm.com (Postfix) with ESMTP id 8EA6E394005A
 for <openbmc@lists.ozlabs.org>; Thu, 12 Nov 2015 20:36:24 +0530 (IST)
Received: from d28av04.in.ibm.com (d28av04.in.ibm.com [9.184.220.66])
 by d28relay03.in.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 tACF6MDw131434
 for <openbmc@lists.ozlabs.org>; Thu, 12 Nov 2015 20:36:23 +0530
Received: from d28av04.in.ibm.com (localhost [127.0.0.1])
 by d28av04.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 tACF5KXg029166
 for <openbmc@lists.ozlabs.org>; Thu, 12 Nov 2015 20:35:20 +0530
Received: from d50lp02.ny.us.ibm.com ([146.89.104.208])
 by d28av04.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 tACF5HM8024965
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Thu, 12 Nov 2015 20:35:19 +0530
Message-Id: <201511121505.tACF5HM8024965@d28av04.in.ibm.com>
Received: from /spool/local
 by d50lp02.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <hramasub@in.ibm.com>;
 Thu, 12 Nov 2015 10:04:24 -0500
Received: from smtp.notes.na.collabserv.com (192.155.248.66)
 by d50lp02.ny.us.ibm.com (158.87.18.21) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Thu, 12 Nov 2015 10:04:22 -0500
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <hramasub@in.ibm.com>;
 Thu, 12 Nov 2015 15:04:21 -0000
Received: from us1a3-smtp04.a3.dal06.isc4sb.com (10.106.154.237)
 by smtp.notes.na.collabserv.com (10.106.227.127) with
 smtp.notes.na.collabserv.com ESMTP; Thu, 12 Nov 2015 15:04:20 -0000
Received: from us1a3-mail111.a3.dal06.isc4sb.com ([10.146.45.113])
 by us1a3-smtp04.a3.dal06.isc4sb.com
 with ESMTP id 2015111215041993-285122 ;
 Thu, 12 Nov 2015 15:04:19 +0000 
Subject: systemd networkd info.
To: openbmc@lists.ozlabs.org
From: "Hariharasubramanian Ramasubramanian" <hramasub@in.ibm.com>
Date: Thu, 12 Nov 2015 20:34:17 +0530
X-KeepSent: E9F65043:787DBC90-00257EFB:00529D8C;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1SHF211 December 19, 2013
X-LLNOutbound: False
X-Disclaimed: 17799
X-TNEFEvaluated: 1
Content-type: multipart/mixed; 
 Boundary="0__=8FBBF468DFC11B1C8f9e8a93df938690918c8FBBF468DFC11B1C"
x-cbid: 15111215-0009-0000-0000-000008CEF2D2
X-IBM-ISS-SpamDetectors: Score=0.423878; BY=0.000001; FL=0; FP=0; FZ=0; HX=0; 
 KW=0; PH=0; SC=0.423878; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00004589; HX=3.00000236; KW=3.00000007;
 PH=3.00000004; SC=3.00000121; SDB=6.00616379; UDB=6.00273070; UTC=2015-11-12
 15:04:21
x-cbparentid: 15111215-9588-0000-0000-000000D15B3E
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
X-List-Received-Date: Thu, 12 Nov 2015 15:06:31 -0000

--0__=8FBBF468DFC11B1C8f9e8a93df938690918c8FBBF468DFC11B1C
Content-type: multipart/alternative; 
	Boundary="1__=8FBBF468DFC11B1C8f9e8a93df938690918c8FBBF468DFC11B1C"


--1__=8FBBF468DFC11B1C8f9e8a93df938690918c8FBBF468DFC11B1C
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII


This is my log on the systemd networkd.info. I will walk through for a
discussion on the scrum.
(See attached file: sd-nd.txt)

regards
rhari!


Hariharasubramanian R.
Power Firmware Development
IBM India Systems & Technology Lab, Bangalore, India
Phone:  +91 80 4025 6950

--1__=8FBBF468DFC11B1C8f9e8a93df938690918c8FBBF468DFC11B1C
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline

<html><body><p>This is my log on the systemd networkd.info. I will walk thr=
ough for a discussion on the scrum.<br><i>(See attached file: sd-nd.txt)</i=
><br><br>regards<br>rhari!<br><br><br>Hariharasubramanian R.<br>Power Firmw=
are Development<br>IBM India Systems &amp; Technology Lab, Bangalore, India=
<br>Phone:  +91 80 4025 6950   <BR>
</body></html>

--1__=8FBBF468DFC11B1C8f9e8a93df938690918c8FBBF468DFC11B1C--


--0__=8FBBF468DFC11B1C8f9e8a93df938690918c8FBBF468DFC11B1C
Content-type: text/plain; 
	name="sd-nd.txt"
Content-Disposition: attachment; filename="sd-nd.txt"
Content-ID: <1__=8FBBF468DFC11B1C8f9e8a93df938690918c8FB@>
Content-Transfer-Encoding: quoted-printable

/* =0A *+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
+++++++++=0A		 --------- Configuration, DBUS info & Flow  --------=0A *++++=
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=0A=
ps | grep systemd=0A    1 root     13460 S    {systemd} /sbin/init=0A   68 =
root      6704 S    /lib/systemd/systemd-journald=0A   87 root     10224 S =
   /lib/systemd/systemd-udevd=0A   96 systemd- 12936 S    /lib/systemd/syst=
emd-timesyncd=0A  224 messageb  2960 S    /usr/bin/dbus-daemon --system --a=
ddress=3Dsystemd: --n=0A  255 systemd- 11424 S    /lib/systemd/systemd-netw=
orkd=0A  261 root      2884 S    /lib/systemd/systemd-logind=0A  459 root  =
    2968 S    grep systemd=0A----=0Asystemctl --version=0Asystemd 225=0A-PA=
M -AUDIT -SELINUX +IMA -APPARMOR +SMACK +SYSVINIT +UTMP -LIBCRYPTSETUP -GCR=
YPT -GNUTLS +ACL -XZ -LZ4 -SECCOMP +BLKID -ELFUTILS +KMOD -IDN=0A----=0Adbu=
s-send --system --print-reply --dest=3Dorg.freedesktop.DBus /org/freedeskto=
p/DBus org.freedesktop.DBus.ListNames=0Amethod return sender=3Dorg.freedesk=
top.DBus -> dest=3D:1.16 reply=5Fserial=3D2=0A   array [=0A      string "or=
g.freedesktop.DBus"=0A      string "org.freedesktop.login1"=0A      string =
":1.7"=0A      string "org.openbmc.examples.SDBusService1"=0A      string "=
:1.8"=0A      string ":1.9"=0A      string "org.openbmc.examples.PythonServ=
ice0"=0A      string "org.openbmc.examples.PythonService1"=0A      string "=
org.freedesktop.systemd1"=0A      string "org.openbmc.HostIpmi"=0A      str=
ing ":1.10"=0A      string ":1.11"=0A      string ":1.0"=0A      string "or=
g.openbmc.objectmapper"=0A      string ":1.1"=0A      string "org.openbmc.m=
anagers.Sensors"=0A      string ":1.2"=0A      string "org.freedesktop.netw=
ork1"=0A      string ":1.16"=0A      string ":1.3"=0A      string "org.open=
bmc.managers.System"=0A      string ":1.4"=0A      string ":1.5"=0A      st=
ring "org.openbmc.records.events"=0A      string "org.openbmc.examples.SDBu=
sService0"=0A      string ":1.6"=0A   ]=0A-----=0Adbus-send --system --prin=
t-reply --dest=3Dorg.freedesktop.network1 /org/freedesktop/network1 org.fre=
edesktop.DBus.Introspectable.Introspect=0A=0Amethod return sender=3D:1.5 ->=
 dest=3D:1.18 reply=5Fserial=3D2=0A   string "<!DOCTYPE node PUBLIC "-//fre=
edesktop//DTD D-BUS Object Introspection 1.0//EN"=0A"http://www.freedesktop=
.org/standards/dbus/1.0/introspect.dtd">=0A<node>=0A <interface name=3D"org=
.freedesktop.DBus.Peer">=0A  <method name=3D"Ping"/>=0A  <method name=3D"Ge=
tMachineId">=0A   <arg type=3D"s" name=3D"machine=5Fuuid" direction=3D"out"=
/>=0A  </method>=0A </interface>=0A <interface name=3D"org.freedesktop.DBus=
.Introspectable">=0A  <method name=3D"Introspect">=0A   <arg name=3D"data" =
type=3D"s" direction=3D"out"/>=0A  </method>=0A </interface>=0A <interface =
name=3D"org.freedesktop.DBus.Properties">=0A  <method name=3D"Get">=0A   <a=
rg name=3D"interface" direction=3D"in" type=3D"s"/>=0A   <arg name=3D"prope=
rty" direction=3D"in" type=3D"s"/>=0A   <arg name=3D"value" direction=3D"ou=
t" type=3D"v"/>=0A  </method>=0A  <method name=3D"GetAll">=0A   <arg name=
=3D"interface" direction=3D"in" type=3D"s"/>=0A   <arg name=3D"properties" =
direction=3D"out" type=3D"a{sv}"/>=0A  </method>=0A  <method name=3D"Set">=
=0A   <arg name=3D"interface" direction=3D"in" type=3D"s"/>=0A   <arg name=
=3D"property" direction=3D"in" type=3D"s"/>=0A   <arg name=3D"value" direct=
ion=3D"in" type=3D"v"/>=0A  </method>=0A  <signal name=3D"PropertiesChanged=
">=0A   <arg type=3D"s" name=3D"interface"/>=0A   <arg type=3D"a{sv}" name=
=3D"changed=5Fproperties"/>=0A   <arg type=3D"as" name=3D"invalidated=5Fpro=
perties"/>=0A  </signal>=0A </interface>=0A <interface name=3D"org.freedesk=
top.network1.Manager">=0A  <property name=3D"OperationalState" type=3D"s" a=
ccess=3D"read">=0A  </property>=0A </interface>=0A <node name=3D"link/=5F33=
"/>=0A <node name=3D"link/=5F31"/>=0A <node name=3D"link/=5F32"/>=0A <node =
name=3D"network/default"/>=0A <node name=3D"network/=5F380=5F2dcontainer=5F=
2dhost0"/>=0A <node name=3D"network"/>=0A <node name=3D"network/=5F380=5F2d=
container=5F2dve"/>=0A <node name=3D"link"/>=0A</node>=0A"=0A-----=0Adbus-s=
end --system --print-reply --dest=3Dorg.freedesktop.network1 /org/freedeskt=
op/network1 org.freedesktop.DBus.Properties.GetAll string:org.freedesktop.n=
etwork1.Manager=0Amethod return sender=3D:1.5 -> dest=3D:1.19 reply=5Fseria=
l=3D2=0A   array [=0A      dict entry(=0A         string "OperationalState"=
=0A         variant             string "routable"=0A      )=0A   ]=0A-----=
=0Adbus-send --system --print-reply --dest=3Dorg.freedesktop.network1 /org/=
freedesktop/network1 org.freedesktop.DBus.Properties.Get string:org.freedes=
ktop.network1.Manager string:OperationalState=0Amethod return sender=3D:1.5=
 -> dest=3D:1.20 reply=5Fserial=3D2=0A   variant       string "routable"=0A=
=0A*/=0A/* =0A *-----------------------------------------------------------=
-----------------=0A * Network Configuration.=0A *-------------------------=
---------------------------------------------------=0A*/=0ATriggers:=0A	- u=
dev --> .link file=0A	- RTM=5Fxxx events=0A=0AFlow:=0A|-- manager=5Fload=5F=
config(Manager *m)=0A     |-- netdev=5Fload(m); --> .netdev file=0A     |--=
 network=5Fload(m) --> .network file=0A=0A=0A/* =0A *++++++++++++++++++++++=
++++++++++++++++++++++++++++++++++++++++++++++++++++++=0A                  =
          --------- METHODS --------=0A *++++++++++++++++++++++++++++++++++=
++++++++++++++++++++++++++++++++++++++++++=0A*/=0A=0A/* =0A *--------------=
--------------------------------------------------------------=0A * Network=
 Manager.=0A *-------------------------------------------------------------=
---------------=0A*/=0Anetworkd.h:int manager=5Fnew(Manager **ret);=0Anetwo=
rkd.h:void manager=5Ffree(Manager *m);=0Anetworkd.h:int manager=5Fconnect=
=5Fbus(Manager *m);=0Anetworkd.h:int manager=5Frun(Manager *m);=0Anetworkd.=
h:int manager=5Fload=5Fconfig(Manager *m);=0Anetworkd.h:bool manager=5Fshou=
ld=5Freload(Manager *m);=0Anetworkd.h:int manager=5Frtnl=5Fenumerate=5Flink=
s(Manager *m);=0Anetworkd.h:int manager=5Frtnl=5Fenumerate=5Faddresses(Mana=
ger *m);=0Anetworkd.h:int manager=5Frtnl=5Fenumerate=5Froutes(Manager *m);=
=0Anetworkd.h:int manager=5Frtnl=5Fprocess=5Faddress(sd=5Fnetlink *nl, sd=
=5Fnetlink=5Fmessage *message, void *userdata);=0Anetworkd.h:int manager=5F=
rtnl=5Fprocess=5Froute(sd=5Fnetlink *nl, sd=5Fnetlink=5Fmessage *message, v=
oid *userdata);=0Anetworkd.h:void manager=5Fdirty(Manager *m);=0Anetworkd.h=
:int manager=5Faddress=5Fpool=5Facquire(Manager *m, int family, unsigned pr=
efixlen, union in=5Faddr=5Funion *found);=0Anetworkd.h:Link* manager=5Ffind=
=5Fuplink(Manager *m, Link *exclude);=0A=0A/* =0A *------------------------=
----------------------------------------------------=0A * Network Config Pa=
rse.=0A *------------------------------------------------------------------=
----------=0A*/=0Anetworkd-network.h:void network=5Ffree(Network *network);=
=0Anetworkd-network.h:int network=5Fload(Manager *manager);=0Anetworkd-netw=
ork.h:int network=5Fget=5Fby=5Fname(Manager *manager, const char *name, Net=
work **ret);=0Anetworkd-network.h:int network=5Fget(Manager *manager, struc=
t udev=5Fdevice *device, const char *ifname, const struct ether=5Faddr *mac=
, Network **ret);=0Anetworkd-network.h:int network=5Fapply(Manager *manager=
, Network *network, Link *link);=0Anetworkd-network.h:int config=5Fparse=5F=
netdev(const char *unit, const char *filename, unsigned line, const char *s=
ection, unsigned section=5Fline, const char *lvalue, int ltype, const char =
*rvalue, void *data, void *userdata);=0Anetworkd-network.h:int config=5Fpar=
se=5Fdomains(const char *unit, const char *filename, unsigned line, const c=
har *section, unsigned section=5Fline, const char *lvalue, int ltype, const=
 char *rvalue, void *data, void *userdata);=0Anetworkd-network.h:int config=
=5Fparse=5Ftunnel(const char *unit, const char *filename, unsigned line, co=
nst char *section, unsigned section=5Fline, const char *lvalue, int ltype, =
const char *rvalue, void *data, void *userdata);=0Anetworkd-network.h:int c=
onfig=5Fparse=5Fdhcp(const char *unit, const char *filename, unsigned line,=
 const char *section, unsigned section=5Fline, const char *lvalue, int ltyp=
e, const char *rvalue, void *data, void *userdata);=0Anetworkd-network.h:in=
t config=5Fparse=5Fdhcp=5Fclient=5Fidentifier(const char *unit, const char =
*filename, unsigned line, const char *section, unsigned section=5Fline, con=
st char *lvalue, int ltype, const char *rvalue, void *data, void *userdata)=
;=0Anetworkd-network.h:int config=5Fparse=5Fipv6token(const char *unit, con=
st char *filename, unsigned line, const char *section, unsigned section=5Fl=
ine, const char *lvalue, int ltype, const char *rvalue, void *data, void *u=
serdata);=0Anetworkd-network.h:int config=5Fparse=5Fipv6=5Fprivacy=5Fextens=
ions(const char *unit, const char *filename, unsigned line, const char *sec=
tion, unsigned section=5Fline, const char *lvalue, int ltype, const char *r=
value, void *data, void *userdata);=0Anetworkd-network.h:int config=5Fparse=
=5Fhostname(const char *unit, const char *filename, unsigned line, const ch=
ar *section, unsigned section=5Fline, const char *lvalue, int ltype, const =
char *rvalue, void *data, void *userdata);=0Anetworkd-network.h:int config=
=5Fparse=5Ftimezone(const char *unit, const char *filename, unsigned line, =
const char *section, unsigned section=5Fline, const char *lvalue, int ltype=
, const char *rvalue, void *data, void *userdata);=0Anetworkd-network.h:int=
 config=5Fparse=5Fdhcp=5Fserver=5Fdns(const char *unit, const char *filenam=
e, unsigned line, const char *section, unsigned section=5Fline, const char =
*lvalue, int ltype, const char *rvalue, void *data, void *userdata);=0Anetw=
orkd-network.h:int config=5Fparse=5Fdhcp=5Fserver=5Fntp(const char *unit, c=
onst char *filename, unsigned line, const char *section, unsigned section=
=5Fline, const char *lvalue, int ltype, const char *rvalue, void *data, voi=
d *userdata);=0Anetworkd-network.h:int config=5Fparse=5Fipv4ll(const char *=
unit, const char *filename, unsigned line, const char *section, unsigned se=
ction=5Fline, const char *lvalue, int ltype, const char *rvalue, void *data=
, void *userdata);=0Anetworkd-network.h:const struct ConfigPerfItem* networ=
k=5Fnetwork=5Fgperf=5Flookup(const char *key, unsigned length);=0Anetworkd-=
network.h:int network=5Fnode=5Fenumerator(sd=5Fbus *bus, const char *path, =
void *userdata, char ***nodes, sd=5Fbus=5Ferror *error);=0Anetworkd-network=
.h:int network=5Fobject=5Ffind(sd=5Fbus *bus, const char *path, const char =
*interface, void *userdata, void **found, sd=5Fbus=5Ferror *error);=0A=0A/*=
 =0A *---------------------------------------------------------------------=
-------=0A * Network Address=0A *------------------------------------------=
----------------------------------=0A*/=0Anetworkd-address.h:int address=5F=
new=5Fstatic(Network *network, unsigned section, Address **ret);=0Anetworkd=
-address.h:int address=5Fnew(Address **ret);=0Anetworkd-address.h:void addr=
ess=5Ffree(Address *address);=0Anetworkd-address.h:int address=5Fadd=5Ffore=
ign(Link *link, int family, const union in=5Faddr=5Funion *in=5Faddr, unsig=
ned char prefixlen, Address **ret);=0Anetworkd-address.h:int address=5Fadd(=
Link *link, int family, const union in=5Faddr=5Funion *in=5Faddr, unsigned =
char prefixlen, Address **ret);=0Anetworkd-address.h:int address=5Fget(Link=
 *link, int family, const union in=5Faddr=5Funion *in=5Faddr, unsigned char=
 prefixlen, Address **ret);=0Anetworkd-address.h:int address=5Fupdate(Addre=
ss *address, unsigned char flags, unsigned char scope, struct ifa=5Fcachein=
fo *cinfo);=0Anetworkd-address.h:int address=5Fdrop(Address *address);=0Ane=
tworkd-address.h:int address=5Fconfigure(Address *address, Link *link, sd=
=5Fnetlink=5Fmessage=5Fhandler=5Ft callback, bool update);=0Anetworkd-addre=
ss.h:int address=5Fremove(Address *address, Link *link, sd=5Fnetlink=5Fmess=
age=5Fhandler=5Ft callback);=0Anetworkd-address.h:bool address=5Fequal(Addr=
ess *a1, Address *a2);=0Anetworkd-address.h:bool address=5Fis=5Fready(const=
 Address *a);=0Anetworkd-address.h:int config=5Fparse=5Faddress(const char =
*unit, const char *filename, unsigned line, const char *section, unsigned s=
ection=5Fline, const char *lvalue, int ltype, const char *rvalue, void *dat=
a, void *userdata);=0Anetworkd-address.h:int config=5Fparse=5Fbroadcast(con=
st char *unit, const char *filename, unsigned line, const char *section, un=
signed section=5Fline, const char *lvalue, int ltype, const char *rvalue, v=
oid *data, void *userdata);=0Anetworkd-address.h:int config=5Fparse=5Flabel=
(const char *unit, const char *filename, unsigned line, const char *section=
, unsigned section=5Fline, const char *lvalue, int ltype, const char *rvalu=
e, void *data, void *userdata);=0A=0A/* =0A *------------------------------=
----------------------------------------------=0A * Network Route Ops.=0A *=
---------------------------------------------------------------------------=
-=0A*/=0Anetworkd-route.h:int route=5Fnew=5Fstatic(Network *network, unsign=
ed section, Route **ret);=0Anetworkd-route.h:int route=5Fnew(Route **ret);=
=0Anetworkd-route.h:void route=5Ffree(Route *route);=0Anetworkd-route.h:int=
 route=5Fconfigure(Route *route, Link *link, sd=5Fnetlink=5Fmessage=5Fhandl=
er=5Ft callback);=0Anetworkd-route.h:int route=5Fremove(Route *route, Link =
*link, sd=5Fnetlink=5Fmessage=5Fhandler=5Ft callback);=0Anetworkd-route.h:i=
nt route=5Fget(Link *link, int family, union in=5Faddr=5Funion *dst, unsign=
ed char dst=5Fprefixlen, unsigned char tos, uint32=5Ft priority, unsigned c=
har table, Route **ret);=0Anetworkd-route.h:int route=5Fadd(Link *link, int=
 family, union in=5Faddr=5Funion *dst, unsigned char dst=5Fprefixlen, unsig=
ned char tos, uint32=5Ft priority, unsigned char table, Route **ret);=0Anet=
workd-route.h:int route=5Fadd=5Fforeign(Link *link, int family, union in=5F=
addr=5Funion *dst, unsigned char dst=5Fprefixlen, unsigned char tos, uint32=
=5Ft priority, unsigned char table, Route **ret);=0Anetworkd-route.h:int ro=
ute=5Fupdate(Route *route, union in=5Faddr=5Funion *src, unsigned char src=
=5Fprefixlen, union in=5Faddr=5Funion *gw, union in=5Faddr=5Funion *prefsrc=
, unsigned char scope, unsigned char protocol);=0Anetworkd-route.h:void rou=
te=5Fdrop(Route *route);=0Anetworkd-route.h:int route=5Fexpire=5Fhandler(sd=
=5Fevent=5Fsource *s, uint64=5Ft usec, void *userdata);=0Anetworkd-route.h:=
int config=5Fparse=5Fgateway(const char *unit, const char *filename, unsign=
ed line, const char *section, unsigned section=5Fline, const char *lvalue, =
int ltype, const char *rvalue, void *data, void *userdata);=0Anetworkd-rout=
e.h:int config=5Fparse=5Fpreferred=5Fsrc(const char *unit, const char *file=
name, unsigned line, const char *section, unsigned section=5Fline, const ch=
ar *lvalue, int ltype, const char *rvalue, void *data, void *userdata);=0An=
etworkd-route.h:int config=5Fparse=5Fdestination(const char *unit, const ch=
ar *filename, unsigned line, const char *section, unsigned section=5Fline, =
const char *lvalue, int ltype, const char *rvalue, void *data, void *userda=
ta);=0Anetworkd-route.h:int config=5Fparse=5Froute=5Fpriority(const char *u=
nit, const char *filename, unsigned line, const char *section, unsigned sec=
tion=5Fline, const char *lvalue, int ltype, const char *rvalue, void *data,=
 void *userdata);=0Anetworkd-route.h:int config=5Fparse=5Froute=5Fscope(con=
st char *unit, const char *filename, unsigned line, const char *section, un=
signed section=5Fline, const char *lvalue, int ltype, const char *rvalue, v=
oid *data, void *userdata);=0A=0A/* =0A *----------------------------------=
------------------------------------------=0A * Network Link=0A *----------=
------------------------------------------------------------------=0A*/=0An=
etworkd-link.h:int link=5Fget(Manager *m, int ifindex, Link **ret);=0Anetwo=
rkd-link.h:int link=5Fadd(Manager *manager, sd=5Fnetlink=5Fmessage *message=
, Link **ret);=0Anetworkd-link.h:void link=5Fdrop(Link *link);=0Anetworkd-l=
ink.h:int link=5Faddress=5Fremove=5Fhandler(sd=5Fnetlink *rtnl, sd=5Fnetlin=
k=5Fmessage *m, void *userdata);=0Anetworkd-link.h:int link=5Froute=5Fremov=
e=5Fhandler(sd=5Fnetlink *rtnl, sd=5Fnetlink=5Fmessage *m, void *userdata);=
=0Anetworkd-link.h:void link=5Fenter=5Ffailed(Link *link);=0Anetworkd-link.=
h:int link=5Finitialized(Link *link, struct udev=5Fdevice *device);=0Anetwo=
rkd-link.h:void link=5Fcheck=5Fready(Link *link);=0Anetworkd-link.h:void li=
nk=5Fupdate=5Foperstate(Link *link);=0Anetworkd-link.h:int link=5Fupdate(Li=
nk *link, sd=5Fnetlink=5Fmessage *message);=0Anetworkd-link.h:void link=5Fd=
irty(Link *link);=0Anetworkd-link.h:void link=5Fclean(Link *link);=0Anetwor=
kd-link.h:int link=5Fsave(Link *link);=0Anetworkd-link.h:int link=5Fcarrier=
=5Freset(Link *link);=0Anetworkd-link.h:bool link=5Fhas=5Fcarrier(Link *lin=
k);=0Anetworkd-link.h:int link=5Fset=5Fmtu(Link *link, uint32=5Ft mtu);=0An=
etworkd-link.h:int link=5Fset=5Fhostname(Link *link, const char *hostname);=
=0Anetworkd-link.h:int link=5Fset=5Ftimezone(Link *link, const char *timezo=
ne);=0Anetworkd-link.h:int ipv4ll=5Fconfigure(Link *link);=0Anetworkd-link.=
h:int dhcp4=5Fconfigure(Link *link);=0Anetworkd-link.h:int dhcp6=5Fconfigur=
e(Link *link, bool information=5Frequest);=0Anetworkd-link.h:int ndisc=5Fco=
nfigure(Link *link);=0Anetworkd-link.h:bool link=5Flldp=5Fenabled(Link *lin=
k);=0Anetworkd-link.h:bool link=5Fipv4ll=5Fenabled(Link *link);=0Anetworkd-=
link.h:bool link=5Fipv6ll=5Fenabled(Link *link);=0Anetworkd-link.h:bool lin=
k=5Fdhcp4=5Fserver=5Fenabled(Link *link);=0Anetworkd-link.h:bool link=5Fdhc=
p4=5Fenabled(Link *link);=0Anetworkd-link.h:bool link=5Fdhcp6=5Fenabled(Lin=
k *link);=0Anetworkd-link.h:int link=5Fnode=5Fenumerator(sd=5Fbus *bus, con=
st char *path, void *userdata, char ***nodes, sd=5Fbus=5Ferror *error);=0An=
etworkd-link.h:int link=5Fobject=5Ffind(sd=5Fbus *bus, const char *path, co=
nst char *interface, void *userdata, void **found, sd=5Fbus=5Ferror *error)=
;=0Anetworkd-link.h:Link *link=5Funref(Link *link);=0Anetworkd-link.h:Link =
*link=5Fref(Link *link);=0A=0A/* =0A *-------------------------------------=
---------------------------------------=0A * Network Device Types.=0A *----=
------------------------------------------------------------------------=0A=
*/=0Anetworkd-netdev.h:        void (*init)(NetDev *n);=0Anetworkd-netdev.h=
:        void (*done)(NetDev *n);=0Anetworkd-netdev.h:        int (*fill=5F=
message=5Fcreate)(NetDev *netdev, Link *link, sd=5Fnetlink=5Fmessage *messa=
ge);=0Anetworkd-netdev.h:        int (*create)(NetDev *netdev);=0Anetworkd-=
netdev.h:        int (*post=5Fcreate)(NetDev *netdev, Link *link, sd=5Fnetl=
ink=5Fmessage *message);=0Anetworkd-netdev.h:        int (*config=5Fverify)=
(NetDev *netdev, const char *filename);=0Anetworkd-netdev.h:int netdev=5Flo=
ad(Manager *manager);=0Anetworkd-netdev.h:void netdev=5Fdrop(NetDev *netdev=
);=0Anetworkd-netdev.h:NetDev *netdev=5Funref(NetDev *netdev);=0Anetworkd-n=
etdev.h:NetDev *netdev=5Fref(NetDev *netdev);=0Anetworkd-netdev.h:int netde=
v=5Fget(Manager *manager, const char *name, NetDev **ret);=0Anetworkd-netde=
v.h:int netdev=5Fset=5Fifindex(NetDev *netdev, sd=5Fnetlink=5Fmessage *newl=
ink);=0Anetworkd-netdev.h:int netdev=5Fenslave(NetDev *netdev, Link *link, =
sd=5Fnetlink=5Fmessage=5Fhandler=5Ft callback);=0Anetworkd-netdev.h:int net=
dev=5Fget=5Fmac(const char *ifname, struct ether=5Faddr **ret);=0Anetworkd-=
netdev.h:int netdev=5Fjoin(NetDev *netdev, Link *link, sd=5Fnetlink=5Fmessa=
ge=5Fhandler=5Ft cb);=0Anetworkd-netdev.h:int config=5Fparse=5Fnetdev=5Fkin=
d(const char *unit, const char *filename, unsigned line, const char *sectio=
n, unsigned section=5Fline, const char *lvalue, int ltype, const char *rval=
ue, void *data, void *userdata);=0Anetworkd-netdev.h:const struct ConfigPer=
fItem* network=5Fnetdev=5Fgperf=5Flookup(const char *key, unsigned length);=
=0Anetworkd-netdev-bond.h:int config=5Fparse=5Fbond=5Fmode(const char *unit=
, const char *filename, unsigned line, const char *section, unsigned sectio=
n=5Fline, const char *lvalue, int ltype, const char *rvalue, void *data, vo=
id *userdata);=0Anetworkd-netdev-bond.h:int config=5Fparse=5Fbond=5Fxmit=5F=
hash=5Fpolicy(const char *unit, const char *filename, unsigned line, const =
char *section, unsigned section=5Fline, const char *lvalue, int ltype, cons=
t char *rvalue, void *data, void *userdata);=0Anetworkd-netdev-bond.h:int c=
onfig=5Fparse=5Fbond=5Flacp=5Frate(const char *unit, const char *filename, =
unsigned line, const char *section, unsigned section=5Fline, const char *lv=
alue, int ltype, const char *rvalue, void *data, void *userdata);=0Anetwork=
d-netdev-bond.h:int config=5Fparse=5Fbond=5Fad=5Fselect(const char *unit, c=
onst char *filename, unsigned line, const char *section, unsigned section=
=5Fline, const char *lvalue, int ltype, const char *rvalue, void *data, voi=
d *userdata);=0Anetworkd-netdev-bond.h:int config=5Fparse=5Fbond=5Ffail=5Fo=
ver=5Fmac(const char *unit, const char *filename, unsigned line, const char=
 *section, unsigned section=5Fline, const char *lvalue, int ltype, const ch=
ar *rvalue, void *data, void *userdata);=0Anetworkd-netdev-bond.h:int confi=
g=5Fparse=5Fbond=5Farp=5Fvalidate(const char *unit, const char *filename, u=
nsigned line, const char *section, unsigned section=5Fline, const char *lva=
lue, int ltype, const char *rvalue, void *data, void *userdata);=0Anetworkd=
-netdev-bond.h:int config=5Fparse=5Fbond=5Farp=5Fall=5Ftargets(const char *=
unit, const char *filename, unsigned line, const char *section, unsigned se=
ction=5Fline, const char *lvalue, int ltype, const char *rvalue, void *data=
, void *userdata);=0Anetworkd-netdev-bond.h:int config=5Fparse=5Fbond=5Fpri=
mary=5Freselect(const char *unit, const char *filename, unsigned line, cons=
t char *section, unsigned section=5Fline, const char *lvalue, int ltype, co=
nst char *rvalue, void *data, void *userdata);=0Anetworkd-netdev-bond.h:int=
 config=5Fparse=5Farp=5Fip=5Ftarget=5Faddress(const char *unit, const char =
*filename, unsigned line, const char *section, unsigned section=5Fline, con=
st char *lvalue, int ltype, const char *rvalue, void *data, void *userdata)=
;=0Anetworkd-netdev-tunnel.h:int config=5Fparse=5Ftunnel=5Faddress(const ch=
ar *unit, const char *filename, unsigned line, const char *section, unsigne=
d section=5Fline, const char *lvalue, int ltype, const char *rvalue, void *=
data, void *userdata);=0Anetworkd-netdev-tunnel.h:int config=5Fparse=5Fipv6=
=5Fflowlabel(const char *unit, const char *filename, unsigned line, const c=
har *section, unsigned section=5Fline, const char *lvalue, int ltype, const=
 char *rvalue, void *data, void *userdata); =0Anetworkd-netdev-tunnel.h:int=
 config=5Fparse=5Fencap=5Flimit(const char *unit, const char *filename, uns=
igned line, const char *section, unsigned section=5Fline, const char *lvalu=
e, int ltype, const char *rvalue, void *data, void *userdata);=0Anetworkd-n=
etdev-ipvlan.h:int config=5Fparse=5Fipvlan=5Fmode(const char *unit, const c=
har *filename, unsigned line, const char *section, unsigned section=5Fline,=
 const char *lvalue, int ltype, const char *rvalue, void *data, void *userd=
ata);=0Anetworkd-netdev-macvlan.h:int config=5Fparse=5Fmacvlan=5Fmode(const=
 char *unit, const char *filename, unsigned line, const char *section, unsi=
gned section=5Fline, const char *lvalue, int ltype, const char *rvalue, voi=
d *data, void *userdata);=0Anetworkd-netdev-vxlan.h:int config=5Fparse=5Fvx=
lan=5Fgroup=5Faddress(const char *unit, const char *filename, unsigned line=
, const char *section, unsigned section=5Fline, const char *lvalue, int lty=
pe, const char *rvalue, void *data, void *userdata);=0A=0A/* =0A *---------=
-------------------------------------------------------------------=0A * Ne=
twork ARP.=0A *------------------------------------------------------------=
----------------=0A*/=0Anetworkd-fdb.h:int fdb=5Fentry=5Fnew=5Fstatic(Netwo=
rk *const network, const unsigned section, FdbEntry **ret);=0Anetworkd-fdb.=
h:void fdb=5Fentry=5Ffree(FdbEntry *fdb=5Fentry);=0Anetworkd-fdb.h:int fdb=
=5Fentry=5Fconfigure(Link *const link, FdbEntry *const fdb=5Fentry);=0Anetw=
orkd-fdb.h:int config=5Fparse=5Ffdb=5Fhwaddr(const char *unit, const char *=
filename, unsigned line, const char *section, unsigned section=5Fline, cons=
t char *lvalue, int ltype, const char *rvalue, void *data, void *userdata);=
=0Anetworkd-fdb.h:int config=5Fparse=5Ffdb=5Fvlan=5Fid(const char *unit, co=
nst char *filename, unsigned line, const char *section, unsigned section=5F=
line, const char *lvalue, int ltype, const char *rvalue, void *data, void *=
userdata);=0A=0A=0A=0A/* =0A *---------------------------------------------=
-------------------------------=0A * Network Monitor.=0A *-----------------=
-----------------------------------------------------------=0A*/=0Anetworkd=
-wait-online.h:void manager=5Ffree(Manager *m);=0Anetworkd-wait-online.h:in=
t manager=5Fnew(Manager **ret, char **interfaces, char **ignore, usec=5Ft t=
imeout);=0Anetworkd-wait-online.h:bool manager=5Fall=5Fconfigured(Manager *=
m);=0Anetworkd-wait-online.h:bool manager=5Fignore=5Flink(Manager *m, Link =
*link);=0Anetworkd-wait-online-link.h:int link=5Fnew(Manager *m, Link **ret=
, int ifindex, const char *ifname);=0Anetworkd-wait-online-link.h:Link *lin=
k=5Ffree(Link *l);=0Anetworkd-wait-online-link.h:int link=5Fupdate=5Frtnl(L=
ink *l, sd=5Fnetlink=5Fmessage *m);=0Anetworkd-wait-online-link.h:int link=
=5Fupdate=5Fmonitor(Link *l);=0Anetworkd-wait-online-link.h:bool link=5Frel=
evant(Link *l);=0A=0A/* =0A *----------------------------------------------=
------------------------------=0A * Network Pool=0A *----------------------=
------------------------------------------------------=0A*/=0Anetworkd-addr=
ess-pool.h:int address=5Fpool=5Fnew(Manager *m, AddressPool **ret, int fami=
ly, const union in=5Faddr=5Funion *u, unsigned prefixlen);=0Anetworkd-addre=
ss-pool.h:int address=5Fpool=5Fnew=5Ffrom=5Fstring(Manager *m, AddressPool =
**ret, int family, const char *p, unsigned prefixlen);=0Anetworkd-address-p=
ool.h:void address=5Fpool=5Ffree(AddressPool *p);=0Anetworkd-address-pool.h=
:int address=5Fpool=5Facquire(AddressPool *p, unsigned prefixlen, union in=
=5Faddr=5Funion *found);=0A=0A=0A/* =0A *----------------------------------=
------------------------------------------=0A * Network Helpers.=0A *------=
----------------------------------------------------------------------=0A*/=
=0Anetworkd-util.h:int config=5Fparse=5Fresolve(const char *unit, const cha=
r *filename, unsigned line, const char *section, unsigned section=5Fline, c=
onst char *lvalue, int ltype, const char *rvalue, void *data, void *userdat=
a);=0Anetworkd-util.h:int config=5Fparse=5Faddress=5Ffamily=5Fboolean(const=
 char *unit, const char *filename, unsigned line, const char *section, unsi=
gned section=5Fline, const char *lvalue, int ltype, const char *rvalue, voi=
d *data, void *userdata);=0Anetworkd-util.h:int config=5Fparse=5Faddress=5F=
family=5Fboolean=5Fwith=5Fkernel(const char* unit, const char *filename, un=
signed line, const char *section, unsigned section=5Fline, const char *lval=
ue, int ltype, const char *rvalue, void *data, void *userdata);=0A/* =0A *+=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
=0A		    --------- EOF --------=0A *+++++++++++++++++++++++++++++++++++++++=
+++++++++++++++++++++++++++++++++++++=0A*/=0A

--0__=8FBBF468DFC11B1C8f9e8a93df938690918c8FBBF468DFC11B1C--
