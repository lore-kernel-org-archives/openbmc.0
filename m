Return-Path: <ratagupt@in.ibm.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=in.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=ratagupt@in.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yLq1W6VPWzDqhg
 for <openbmc@lists.ozlabs.org>; Tue, 24 Oct 2017 21:16:30 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v9OAEuQ3109804
 for <openbmc@lists.ozlabs.org>; Tue, 24 Oct 2017 06:16:28 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.75])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2dt2n9v17h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 24 Oct 2017 06:16:28 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <ratagupt@in.ibm.com>;
 Tue, 24 Oct 2017 10:16:27 -0000
Received: from us1a3-smtp08.a3.dal06.isc4sb.com (10.146.103.57)
 by smtp.notes.na.collabserv.com (10.106.227.123) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 24 Oct 2017 10:16:25 -0000
Received: from us1a3-mail111.a3.dal06.isc4sb.com ([10.146.45.113])
 by us1a3-smtp08.a3.dal06.isc4sb.com
 with ESMTP id 2017102410162484-311957 ;
 Tue, 24 Oct 2017 10:16:24 +0000 
Subject: Re: phoshor-network manager daemon + IPMI
In-Reply-To: <OF0B4D03B3.93D53D9F-ON002581C2.00659A8A@LocalDomain>
From: "Ratan K Gupta" <ratagupt@in.ibm.com>
To: venture@google.com
Cc: david.j.cobbley@linux.intel.com, openbmc@lists.ozlabs.org
Date: Tue, 24 Oct 2017 10:16:24 +0000
Sensitivity: 
MIME-Version: 1.0
References: <OF0B4D03B3.93D53D9F-ON002581C2.00659A8A@LocalDomain>,
 <CAO=notwM=vVT6FNahQJ-U5UxMa9KRptPawVeXQbiGyMpce44Bg@mail.gmail.com>
 <19cf3888-1eee-8e66-655e-8fba5fba166a@linux.intel.com>
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: IBM Verse Build 15600-1257 | IBM Domino Build
 SCN17263_20170920T0022_FP4 October 11, 2017 at 08:48
X-LLNOutbound: False
X-Disclaimed: 25187
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 17102410-3815-0000-0000-0000030BE5E5
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.417846; ST=0; TS=0; UL=0; ISC=; MB=0.000013
X-IBM-SpamModules-Versions: BY=3.00007944; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000239; SDB=6.00935717; UDB=6.00471457; IPR=6.00715983; 
 BA=6.00005657; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017686; XFM=3.00000015;
 UTC=2017-10-24 10:16:26
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2017-10-24 08:24:55 - 6.00007510
x-cbparentid: 17102410-3816-0000-0000-0000A889EEF3
Message-Id: <OF4AE1F920.ECC72211-ON002581C3.0037DD9F-002581C3.00386F1F@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-10-24_04:, , signatures=0
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
X-List-Received-Date: Tue, 24 Oct 2017 10:16:33 -0000

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial, H=
elvetica, sans-serif;font-size:10.5pt" ><div dir=3D"ltr" >Hi Dave,</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >We have enabled the link local address auto configuration=
,thats why you are noticing the link local address,</div>
<div dir=3D"ltr" >But as a side effect of this,you should not notice this p=
roblem that the DHCP IP has not get assigned to the</div>
<div dir=3D"ltr" >BMC.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Please try the "ip addr show dev eth0" instead of ifconfi=
g.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Now days kernel supports ip aliasing where a single inter=
face can have multiple ip adress,so on a intterface you may see link local =
address</div>
<div dir=3D"ltr" >as well as DHCP assigned/Static Assigned IP address.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >I have tried on our setup and it is working fine.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Regards</div>
<div dir=3D"ltr" >Ratan</div>
<div dir=3D"ltr" >&nbsp;</div>
<blockquote data-history-content-modified=3D"1" dir=3D"ltr" style=3D"border=
-left:solid #aaaaaa 2px; margin-left:5px; padding-left:5px; direction:ltr; =
margin-right:0px" >----- Original message -----<br>From: Patrick Venture &l=
t;venture@google.com&gt;<br>Sent by: "openbmc" &lt;openbmc-bounces+ratagupt=
=3Din.ibm.com@lists.ozlabs.org&gt;<br>To: Dave Cobbley &lt;david.j.cobbley@=
linux.intel.com&gt;<br>Cc: OpenBMC Maillist &lt;openbmc@lists.ozlabs.org&gt=
;<br>Subject: Re: phoshor-network manager daemon + IPMI<br>Date: Mon, Oct 2=
3, 2017 11:59 PM<br>&nbsp;
<div><font size=3D"2" face=3D"Default Monospace,Courier New,Courier,monospa=
ce" >On Mon, Oct 23, 2017 at 10:18 AM, Dave Cobbley<br>&lt;david.j.cobbley@=
linux.intel.com&gt; wrote:<br>&gt; I have been digging into the network man=
ager as well.<br>&gt; The link local problem has been popping up on our sys=
tems as well.<br>&gt;<br>&gt; I'm not sure why linklocaladdress causes our =
systems to get the 169.XX IP<br>&gt; Address.<br>&gt; I suspect is has some=
thing to do with the way our DHCP servers are setup on<br>&gt; the network,=
 systemd-networkd is not recognizing that we do in fact get an<br>&gt; IP f=
rom DHCP.<br>&gt;<br>&gt; I'm assuming engineers at IBM are not seeing this=
 behavior since the patch<br>&gt; was accepted (please correct me if I'm wr=
ong).<br>&gt; Therefore this is more likely not a bug in systemd, but somet=
hing strange<br>&gt; with the configuration of network infrastructure.<br>&=
gt; Either way, root cause needs to be identified.<br>&gt;<br>&gt; To work =
around it, simply delete the line linklocaladdress=3Dxxxx from<br>&gt; /etc=
/systemd/networkd/00-bmc-ethx.network<br><br>I ended up updating the defaul=
t configuration file writer to not set<br>that, then found that once it had=
 DHCP=3Dyes in it, it also would crash<br>on attempt to delete (from the ex=
ception it raises when you try)<br><br>&gt;<br>&gt; Let me know if you make=
 any more observations about the strange behavior (it<br>&gt; would be nice=
 to get past this issue).<br>&gt;<br>&gt; Thanks,<br>&gt; -Dave Cobbley<br>=
&gt;<br>&gt;<br>&gt; On 10/23/2017 07:48 AM, Patrick Venture wrote:<br>&gt;=
<br>&gt;&gt; I'm curious if anyone has experience using the phosphor-networ=
k<br>&gt;&gt; manager daemon. I've run into some oddities using it for inst=
ance, if<br>&gt;&gt; you don't configure anything it sets up both links as =
LinkLocal and<br>&gt;&gt; enables DHCP, etc -- and then even if DHCP fails,=
 it doesn't update it<br>&gt;&gt; (although it's aware of the failure) -- a=
nd when I then go to set the<br>&gt;&gt; IP address over IPMI to a static I=
P, I run the two lan channel set<br>&gt;&gt; commands which work (because t=
hey just set the object contents) --<br>&gt;&gt; when i call "access on" ov=
er IPMI, it tries to delete all the dbus<br>&gt;&gt; objects for the networ=
k, which fail because of checks in the network<br>&gt;&gt; daemon that prev=
ent this, which causes the network daemon to crash.<br>&gt;&gt;<br>&gt;&gt;=
 Ultimately I'm going to enable the host ipmi daemon to support<br>&gt;&gt;=
 multiple channels -- the trick is then to map the channel to an<br>&gt;&gt=
; ethernet device... &nbsp;Some patches will be send up today to reviewing<=
br>&gt;&gt; this type of change.<br>&gt;&gt;<br>&gt;&gt; I'm going through =
the uses cases now trying to get it working, and<br>&gt;&gt; just curious w=
hat I should be doing to get it to work.<br>&gt;&gt;<br>&gt;&gt; Also of no=
te, when I set the MAC address -- which works :), it doesn't<br>&gt;&gt; up=
date the configuration for the systemd network file with that<br>&gt;&gt; i=
nformation &nbsp;-- I'll be sending a patch for that today -- but I was<br>=
&gt;&gt; curious if that was deliberate, etc.<br>&gt;&gt;<br>&gt;&gt; Thank=
s,<br>&gt;&gt; Patrick<br>&gt;<br>&gt;</font><br>&nbsp;</div></blockquote>
<div dir=3D"ltr" >&nbsp;</div></div><BR>
