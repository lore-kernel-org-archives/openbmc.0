Return-Path: <ratagupt@in.ibm.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=in.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=ratagupt@in.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yMS0k3gW1zDqY9
 for <openbmc@lists.ozlabs.org>; Wed, 25 Oct 2017 22:03:01 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v9PAxLgD012947
 for <openbmc@lists.ozlabs.org>; Wed, 25 Oct 2017 07:02:58 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [158.85.210.104])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2dtnrbvjer-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 25 Oct 2017 07:02:58 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <ratagupt@in.ibm.com>;
 Wed, 25 Oct 2017 11:02:56 -0000
Received: from us1b3-smtp07.a3dr.sjc01.isc4sb.com (10.122.203.198)
 by smtp.notes.na.collabserv.com (10.122.47.44) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 25 Oct 2017 11:02:53 -0000
Received: from us1b3-mail111.a3dr.sjc01.isc4sb.com ([10.122.203.129])
 by us1b3-smtp07.a3dr.sjc01.isc4sb.com
 with ESMTP id 2017102511025261-339728 ;
 Wed, 25 Oct 2017 11:02:52 +0000 
Subject: Re: phoshor-network manager daemon + IPMI
In-Reply-To: <OFA8BE74E9.C41FAFA0-ON002581C3.00503AF9@LocalDomain>
From: "Ratan K Gupta" <ratagupt@in.ibm.com>
To: venture@google.com
Cc: david.j.cobbley@linux.intel.com, openbmc@lists.ozlabs.org
Date: Wed, 25 Oct 2017 11:02:52 +0000
Sensitivity: 
MIME-Version: 1.0
References: <OFA8BE74E9.C41FAFA0-ON002581C3.00503AF9@LocalDomain>,
 <CAO=notwM=vVT6FNahQJ-U5UxMa9KRptPawVeXQbiGyMpce44Bg@mail.gmail.com>
 <19cf3888-1eee-8e66-655e-8fba5fba166a@linux.intel.com>
 <OF0B4D03B3.93D53D9F-ON002581C2.00659A8A@LocalDomain>
 <OF4AE1F920.ECC72211-ON002581C3.0037DD9F-002581C3.00386F1F@notes.na.collabserv.com>
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: IBM Verse Build 15600-1257 | IBM Domino Build
 SCN17263_20170920T0022_FP4 October 11, 2017 at 08:48
X-KeepSent: C47AE895:C7BA821A-002581C4:003A3CAE;
 type=4; name=$KeepSent
X-LLNOutbound: False
X-Disclaimed: 14027
X-TNEFEvaluated: 1
X-LLNXfer: False
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 17102511-7301-0000-0000-000001E1A11E
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.407427; ST=0; TS=0; UL=0; ISC=; MB=0.000024
X-IBM-SpamModules-Versions: BY=3.00007948; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000239; SDB=6.00936212; UDB=6.00471753; IPR=6.00716477; 
 BA=6.00005660; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017704; XFM=3.00000015;
 UTC=2017-10-25 11:02:54
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2017-10-25 07:36:55 - 6.00007514
x-cbparentid: 17102511-7302-0000-0000-00002F45A566
Message-Id: <OFC47AE895.C7BA821A-ON002581C4.003A3CAE-002581C4.003CB01C@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-10-25_06:, , signatures=0
X-Proofpoint-Spam-Reason: safe
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 25 Oct 2017 11:03:03 -0000

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial, H=
elvetica, sans-serif;font-size:10.5pt" ><div dir=3D"ltr" >Hi Patrick,</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Certain test cases which we tried through IPMI,Here are f=
ew.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Valid conf</div>
<div dir=3D"ltr" >=3D=3D=3D=3D=3D=3D=3D=3D=3D</div>
<div dir=3D"ltr" >ipmitool -I dbus lan set 1 ipsrc static<br>ipmitool -I db=
us lan set 1 ipaddr x.x.x.x<br>ipmitool -I dbus lan set 1 netmask x.x.x.x<b=
r>ipmitool -I dbus lan set 1 defgw ipaddr x.x.x.x<br>ipmitool -I dbus raw 0=
x06 0x40</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >InvalidIP</div>
<div dir=3D"ltr" >=3D=3D=3D=3D=3D=3D=3D=3D</div>
<div dir=3D"ltr" >ipmitool -I dbus lan set 1 ipsrc static<br>ipmitool -I db=
us lan set 1 ipaddr &lt;invalid ip address&gt;<br>ipmitool -I dbus lan set =
1 netmask x.x.x.x<br>ipmitool -I dbus lan set 1 defgw ipaddr x.x.x.x<br>ipm=
itool -I dbus raw 0x06 0x40</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Invalid Gateway</div>
<div dir=3D"ltr" >=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</div>
<div dir=3D"ltr" >ipmitool -I dbus lan set 1 ipsrc static<br>ipmitool -I db=
us lan set 1 ipaddr 9.3.185.83<br>ipmitool -I dbus lan set 1 netmask 255.25=
5.255.0<br>ipmitool -I dbus lan set 1 defgw ipaddr &lt;invalid gateway&gt;<=
br>ipmitool -I dbus raw 0x06 0x40</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Regards</div>
<div dir=3D"ltr" >Ratan Gupta</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >&nbsp;</div>
<blockquote data-history-content-modified=3D"1" dir=3D"ltr" style=3D"border=
-left:solid #aaaaaa 2px; margin-left:5px; padding-left:5px; direction:ltr; =
margin-right:0px" >----- Original message -----<br>From: Patrick Venture &l=
t;venture@google.com&gt;<br>To: Ratan K Gupta &lt;ratagupt@in.ibm.com&gt;<b=
r>Cc: Dave Cobbley &lt;david.j.cobbley@linux.intel.com&gt;, OpenBMC Maillis=
t &lt;openbmc@lists.ozlabs.org&gt;<br>Subject: Re: phoshor-network manager =
daemon + IPMI<br>Date: Tue, Oct 24, 2017 8:06 PM<br>&nbsp;
<div><font size=3D"2" face=3D"Default Monospace,Courier New,Courier,monospa=
ce" >On Tue, Oct 24, 2017 at 3:16 AM, Ratan K Gupta &lt;ratagupt@in.ibm.com=
&gt; wrote:<br>&gt; Hi Dave,<br>&gt;<br>&gt; We have enabled the link local=
 address auto configuration,thats why you are<br>&gt; noticing the link loc=
al address,<br>&gt; But as a side effect of this,you should not notice this=
 problem that the<br>&gt; DHCP IP has not get assigned to the<br>&gt; BMC.<=
br>&gt;<br>&gt; Please try the "ip addr show dev eth0" instead of ifconfig.=
<br>&gt;<br>&gt; Now days kernel supports ip aliasing where a single interf=
ace can have<br>&gt; multiple ip adress,so on a intterface you may see link=
 local address<br>&gt; as well as DHCP assigned/Static Assigned IP address.=
<br>&gt;<br>&gt; I have tried on our setup and it is working fine.<br><br>H=
owever, have you tried updating the IP address over IPMI? &nbsp;As part of<=
br>that code, it calls delete on those interfaces and IPs (all of them).<br=
>Which fails. &nbsp;Should there be logic in the ipmi daemon to only delete=
<br>non-local-link addresses? &nbsp;And then, if you try to delete a DHCP<b=
r>assigned address, it also fails -- so how does one transition from<br>DHC=
P to static? &nbsp;I'd just like to hear how these cases were tested so<br>=
I can verify the problem is on my end with my configuration, or<br>possibly=
 that more work is required before this is working fine.<br><br>&gt;<br>&gt=
; Regards<br>&gt; Ratan<br>&gt;<br>&gt;<br>&gt; ----- Original message ----=
-<br>&gt; From: Patrick Venture &lt;venture@google.com&gt;<br>&gt; Sent by:=
 "openbmc" &lt;openbmc-bounces+ratagupt=3Din.ibm.com@lists.ozlabs.org&gt;<b=
r>&gt; To: Dave Cobbley &lt;david.j.cobbley@linux.intel.com&gt;<br>&gt; Cc:=
 OpenBMC Maillist &lt;openbmc@lists.ozlabs.org&gt;<br>&gt; Subject: Re: pho=
shor-network manager daemon + IPMI<br>&gt; Date: Mon, Oct 23, 2017 11:59 PM=
<br>&gt;<br>&gt; On Mon, Oct 23, 2017 at 10:18 AM, Dave Cobbley<br>&gt; &lt=
;david.j.cobbley@linux.intel.com&gt; wrote:<br>&gt;&gt; I have been digging=
 into the network manager as well.<br>&gt;&gt; The link local problem has b=
een popping up on our systems as well.<br>&gt;&gt;<br>&gt;&gt; I'm not sure=
 why linklocaladdress causes our systems to get the 169.XX IP<br>&gt;&gt; A=
ddress.<br>&gt;&gt; I suspect is has something to do with the way our DHCP =
servers are setup<br>&gt;&gt; on<br>&gt;&gt; the network, systemd-networkd =
is not recognizing that we do in fact get an<br>&gt;&gt; IP from DHCP.<br>&=
gt;&gt;<br>&gt;&gt; I'm assuming engineers at IBM are not seeing this behav=
ior since the patch<br>&gt;&gt; was accepted (please correct me if I'm wron=
g).<br>&gt;&gt; Therefore this is more likely not a bug in systemd, but som=
ething strange<br>&gt;&gt; with the configuration of network infrastructure=
.<br>&gt;&gt; Either way, root cause needs to be identified.<br>&gt;&gt;<br=
>&gt;&gt; To work around it, simply delete the line linklocaladdress=3Dxxxx=
 from<br>&gt;&gt; /etc/systemd/networkd/00-bmc-ethx.network<br>&gt;<br>&gt;=
 I ended up updating the default configuration file writer to not set<br>&g=
t; that, then found that once it had DHCP=3Dyes in it, it also would crash<=
br>&gt; on attempt to delete (from the exception it raises when you try)<br=
>&gt;<br>&gt;&gt;<br>&gt;&gt; Let me know if you make any more observations=
 about the strange behavior<br>&gt;&gt; (it<br>&gt;&gt; would be nice to ge=
t past this issue).<br>&gt;&gt;<br>&gt;&gt; Thanks,<br>&gt;&gt; -Dave Cobbl=
ey<br>&gt;&gt;<br>&gt;&gt;<br>&gt;&gt; On 10/23/2017 07:48 AM, Patrick Vent=
ure wrote:<br>&gt;&gt;<br>&gt;&gt;&gt; I'm curious if anyone has experience=
 using the phosphor-network<br>&gt;&gt;&gt; manager daemon. I've run into s=
ome oddities using it for instance, if<br>&gt;&gt;&gt; you don't configure =
anything it sets up both links as LinkLocal and<br>&gt;&gt;&gt; enables DHC=
P, etc -- and then even if DHCP fails, it doesn't update it<br>&gt;&gt;&gt;=
 (although it's aware of the failure) -- and when I then go to set the<br>&=
gt;&gt;&gt; IP address over IPMI to a static IP, I run the two lan channel =
set<br>&gt;&gt;&gt; commands which work (because they just set the object c=
ontents) --<br>&gt;&gt;&gt; when i call "access on" over IPMI, it tries to =
delete all the dbus<br>&gt;&gt;&gt; objects for the network, which fail bec=
ause of checks in the network<br>&gt;&gt;&gt; daemon that prevent this, whi=
ch causes the network daemon to crash.<br>&gt;&gt;&gt;<br>&gt;&gt;&gt; Ulti=
mately I'm going to enable the host ipmi daemon to support<br>&gt;&gt;&gt; =
multiple channels -- the trick is then to map the channel to an<br>&gt;&gt;=
&gt; ethernet device... &nbsp;Some patches will be send up today to reviewi=
ng<br>&gt;&gt;&gt; this type of change.<br>&gt;&gt;&gt;<br>&gt;&gt;&gt; I'm=
 going through the uses cases now trying to get it working, and<br>&gt;&gt;=
&gt; just curious what I should be doing to get it to work.<br>&gt;&gt;&gt;=
<br>&gt;&gt;&gt; Also of note, when I set the MAC address -- which works :)=
, it doesn't<br>&gt;&gt;&gt; update the configuration for the systemd netwo=
rk file with that<br>&gt;&gt;&gt; information &nbsp;-- I'll be sending a pa=
tch for that today -- but I was<br>&gt;&gt;&gt; curious if that was deliber=
ate, etc.<br>&gt;&gt;&gt;<br>&gt;&gt;&gt; Thanks,<br>&gt;&gt;&gt; Patrick<b=
r>&gt;&gt;<br>&gt;&gt;<br>&gt;<br>&gt;<br>&gt;<br>&gt;<br>&gt;</font><br>&n=
bsp;</div></blockquote>
<div dir=3D"ltr" >&nbsp;</div></div><BR>
