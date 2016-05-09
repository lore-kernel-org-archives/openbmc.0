Return-Path: <ratagupt@in.ibm.com>
Received: from e28smtp06.in.ibm.com (e28smtp06.in.ibm.com [125.16.236.6])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r3JxL2xCszDq5m
 for <openbmc@lists.ozlabs.org>; Mon,  9 May 2016 20:47:33 +1000 (AEST)
Received: from localhost
 by e28smtp06.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <ratagupt@in.ibm.com>;
 Mon, 9 May 2016 16:17:29 +0530
Received: from d28dlp02.in.ibm.com (9.184.220.127)
 by e28smtp06.in.ibm.com (192.168.1.136) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Mon, 9 May 2016 16:17:28 +0530
X-IBM-Helo: d28dlp02.in.ibm.com
X-IBM-MailFrom: ratagupt@in.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d28relay08.in.ibm.com (d28relay08.in.ibm.com [9.184.220.159])
 by d28dlp02.in.ibm.com (Postfix) with ESMTP id BA7D73940062
 for <openbmc@lists.ozlabs.org>; Mon,  9 May 2016 16:17:27 +0530 (IST)
Received: from d50lp03.ny.us.ibm.com (d50lp03.pok.ibm.com [146.89.104.211])
 by d28relay08.in.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u49AlQq19371720
 for <openbmc@lists.ozlabs.org>; Mon, 9 May 2016 16:17:26 +0530
Message-Id: <201605091047.u49AlQq19371720@d28relay08.in.ibm.com>
Received: from localhost
 by d50lp03.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <ratagupt@in.ibm.com>;
 Mon, 9 May 2016 06:46:17 -0400
Received: from smtp.notes.na.collabserv.com (192.155.248.81)
 by d50lp03.ny.us.ibm.com (158.87.18.22) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Mon, 9 May 2016 06:46:14 -0400
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: ratagupt@in.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <ratagupt@in.ibm.com>;
 Mon, 9 May 2016 10:46:11 -0000
Received: from us1a3-smtp05.a3.dal06.isc4sb.com (10.146.71.159)
 by smtp.notes.na.collabserv.com (10.106.227.88) with
 smtp.notes.na.collabserv.com ESMTP; Mon, 9 May 2016 10:43:53 -0000
Received: from us1a3-mail111.a3.dal06.isc4sb.com ([10.146.45.113])
 by us1a3-smtp05.a3.dal06.isc4sb.com
 with ESMTP id 2016050910434886-136712 ;
 Mon, 9 May 2016 10:43:48 +0000 
In-Reply-To: <OF93E2D9B5.2823EF4B-ON00257FAB.00146EAE-00257FAB.002B1B25@LocalDomain>
Subject: Re: OpenBMC Story(151536):- IPMI Network Settings Override
From: "Ratan K Gupta" <ratagupt@in.ibm.com>
To: openbmc@lists.ozlabs.org
Date: Mon, 9 May 2016 10:43:49 +0000
Sensitivity: 
MIME-Version: 1.0
References: <OF93E2D9B5.2823EF4B-ON00257FAB.00146EAE-00257FAB.002B1B25@LocalDomain>
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: Lotus Domino Web Server Build V851SAAS_04182016_FP2 April 21, 2016
X-LLNOutbound: False
X-Disclaimed: 24635
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 16050910-0021-0000-0000-00000C548710
X-IBM-ISS-SpamDetectors: Score=0.394815; BY=0.294036; FL=0; FP=0; FZ=0; HX=0; 
 KW=0; PH=0; SC=0.394815; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00005258; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000166; SDB=6.00699616; UDB=6.00323679; UTC=2016-05-09
 10:44:00
x-cbparentid: 16050910-4536-0000-0000-0000079EA077
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-Content-Scanned: Fidelis XPS MAILER
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 09 May 2016 10:47:35 -0000

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial;fo=
nt-size:10.5pt" ><div dir=3D"ltr" style=3D"font-family:Arial;font-size:10.5=
pt" ><div dir=3D"ltr" >Hi Team,</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >I had two approaches to store the Host Network config,We =
can store it in the global settings object where we are keeping all the hos=
t related data.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; Or</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >We can store it in some other file specific for host netw=
ork config.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >if we go with 1st approach where we will keep the info in=
 the global settings object.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >1) we can create separate attr for network=5Fconfig and t=
he value would be string</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >&nbsp;&nbsp; eg settings file:</div>
<div dir=3D"ltr" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D</div>
<div dir=3D"ltr" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<div>#!/usr/bin/python -u<br>SETTINGS=3D{'host': {'bootflags': {'default': =
'default', 'type': 's', 'name': 'boot=5Fflags'}, 'powercap': {'name': 'powe=
r=5Fcap', 'min': 0, 'default': 0, 'max': 1000, 'type': 'i', 'unit': 'watts'=
}, 'sysstate': {'default': '', 'type': 's', 'name': 'system=5Fstate'}, 'pow=
erpolicy': {'default': 'RESTORE=5FLAST=5FSTATE', 'type': 's', 'name': 'powe=
r=5Fpolicy'}, 'restrictedmode': {'default': False, 'type': 'b', 'name': 're=
stricted=5Fmode'}, <strong>'networkConfig': {default': {ipaddress:x.x.x.x,s=
ubnetmask:x.x.x.x,gateway:x.x.x.x,Mac:x:x:x:x:x:x},'name':network=5Fconfig,=
'type':'s'}}}</strong></div>
<div>&nbsp;</div>
<div>We have to parse this string in IPMI to get the network config details=
.</div>
<div>&nbsp;</div>
<div>2) We can use the network object interface to set the host network pro=
perties.like setAddress4 and setHwAddress.But in this case also we have to =
overload these functions as we can take one more parameter named "Target",I=
f target is BMC then do whatever we are doingt it today,Otherwise give the =
new functionality.</div>
<div>&nbsp;</div>
<div>In this approach we can not store the host related settings in Global =
settings file as both(network,GlobalSettings) are different object.so for s=
toring this host network info we need to introduce one more file to persist=
 the info.</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>Recommendation:- We can go with first approach as all the host related=
 settings in the global settings object and we can set all the network rela=
ted attr in one atomic operation.</div>
<div>&nbsp;</div>
<div>Please let me know your thoughts in this.</div>
<div>&nbsp;</div>
<div dir=3D"ltr" style=3D"font-family:Arial;font-size:10.5pt" ><div>Ratan</=
div>
<div>&nbsp;</div>
<div>----- Original message -----</div>
<blockquote data-history-content-modified=3D"1" dir=3D"ltr" style=3D"border=
-left:solid #aaaaaa 2px; margin-left:5px; padding-left:5px; direction:ltr; =
margin-right:0px" >From: Adriana Kobylak/Austin/IBM<br>To: Bradley W Bishop=
/Rochester/IBM@IBMUS, Chris Austen/Austin/IBM@IBMUS, Douglas Griffith/Austi=
n/IBM@IBMUS, Gus Schlachter/Austin/IBM@IBMUS, Hariharasubramanian Ramasubra=
manian/India/IBM@IBMIN, Rahul Maheshwari3/India/IBM@IBMIN, Ratan K Gupta/In=
dia/IBM@IBMIN, Tom Joseph2/India/IBM@IBMIN, Vishwanatha Subbanna/India/IBM@=
IBMIN, Nan KX Li/China/IBM@IBMCN, Yi TZ Li/China/IBM@IBMCN<br>Cc: Norman Ja=
mes/Austin/IBM@IBMUS, Patrick Williams III/Rochester/IBM@IBMUS<br>Subject: =
Re: OpenBMC May Sprint<br>Date: Fri, May 6, 2016 1:50 AM<br>&nbsp;<br><font=
 size=3D"2" >Per popular demand during today's call, here are the issues an=
d wish list items that are candidates for the next tag, we'll call it our s=
hort Sprint 9.</font><br><font size=3D"2" >For those that are ready to get =
started, choose one and add a comment to the github issue or RTC with your =
name on it to know you'll be working on it, or just ping me with your choic=
e.</font><br><br><font size=3D"2" >(As a side note, after "short sprint 9",=
 we'll be transitioning from RTC to using github for story management, so i=
nstall the firefox/chrome plugin zenhub </font><a href=3D"https://www.zenhu=
b.io/" target=3D"=5Fblank" ><font size=3D"2" >https://www.zenhub.io</font><=
/a><font size=3D"2" >&nbsp;to get ready)</font><br><br><font size=3D"2" >--=
----</font><br><br><font size=3D"2" >Small - Skeleton - System state not up=
dated. </font><a href=3D"https://github.com/openbmc/openbmc/issues/196" tar=
get=3D"=5Fblank" ><font size=3D"2" >https://github.com/openbmc/openbmc/issu=
es/196</font></a><br><br><font size=3D"2" >Small/Med - IPMI boot options - =
Implement network override. </font><a href=3D"https://jazz07.rchland.ibm.co=
m:13443/jazz/web/projects/OpenBMC#action=3Dcom.ibm.team.workitem.viewWorkIt=
em&amp;id=3D151536" target=3D"=5Fblank" ><font size=3D"2" >https://jazz07.r=
chland.ibm.com:13443/jazz/web/projects/OpenBMC#action=3Dcom.ibm.team.workit=
em.viewWorkItem&amp;id=3D151536</font></a><br><br><font size=3D"2" >Medium =
- Bitbake Recipes - PAM authentication. Only turn on PAM without turning of=
f busybox.</font><br><font size=3D"2" >Medium - User management (python) - =
Switch to useradd that takes arguments, parallel with PAM story. </font><a =
href=3D"https://github.com/openbmc/phosphor-networkd/issues/9" target=3D"=
=5Fblank" ><font size=3D"2" >https://github.com/openbmc/phosphor-networkd/i=
ssues/9</font></a><br><br><font size=3D"2" >Debug (unknown size):</font><br=
><a href=3D"https://github.com/openbmc/openbmc/issues/194" target=3D"=5Fbla=
nk" ><font size=3D"2" >https://github.com/openbmc/openbmc/issues/194</font>=
</a><br><a href=3D"https://github.com/openbmc/openbmc/issues/206" target=3D=
"=5Fblank" ><font size=3D"2" >https://github.com/openbmc/openbmc/issues/206=
</font></a><br><br><font size=3D"2" >Code Cleanup and error path:</font><br=
><a href=3D"https://github.com/openbmc/phosphor-host-ipmid/issues/75" targe=
t=3D"=5Fblank" ><font face=3D"Helvetica" size=3D"3" >https://github.com/ope=
nbmc/phosphor-host-ipmid/issues/75</font></a><br><a href=3D"https://github.=
com/openbmc/phosphor-host-ipmid/issues/76" target=3D"=5Fblank" ><font face=
=3D"Helvetica" size=3D"3" >https://github.com/openbmc/phosphor-host-ipmid/i=
ssues/76</font></a><br><a href=3D"https://github.com/openbmc/skeleton/issue=
s/56" target=3D"=5Fblank" ><font face=3D"Helvetica" size=3D"3" >https://git=
hub.com/openbmc/skeleton/issues/56</font></a><br><font face=3D"Helvetica" s=
ize=3D"3" ><a href=3D"https://github.com/openbmc/openbmc/issues/202" target=
=3D"=5Fblank" >https://github.com/openbmc/openbmc/issues/202</a></font><br>=
<br><br><br><br><img alt=3D"Inactive hide details for Adriana Kobylak---05/=
01/2016 02:29:03 PM---Hi team, We'll be transitioning to SP-Next in the nex=
t few" src=3D"/icons/graycol.gif" height=3D"16" width=3D"16" border=3D"0" >=
<font color=3D"#424282" size=3D"2" >Adriana Kobylak---05/01/2016 02:29:03 P=
M---Hi team, We'll be transitioning to SP-Next in the next few weeks. The c=
urrent plan for the next 2 we</font><br><br><font color=3D"#5F5F5F" size=3D=
"2" >From: </font><font size=3D"2" >Adriana Kobylak/Austin/IBM</font><br><f=
ont color=3D"#5F5F5F" size=3D"2" >To: </font><font size=3D"2" >Bradley W Bi=
shop/Rochester/IBM@IBMUS, Chris Austen/Austin/IBM@IBMUS, Douglas Griffith/A=
ustin/IBM@IBMUS, Gus Schlachter/Austin/IBM@IBMUS, Hariharasubramanian Ramas=
ubramanian/India/IBM@IBMIN, Rahul Maheshwari3/India/IBM@IBMIN, Ratan K Gupt=
a/India/IBM@IBMIN, Tom Joseph2/India/IBM@IBMIN, Vishwanatha Subbanna/India/=
IBM@IBMIN, Nan KX Li/China/IBM@IBMCN, Yi TZ Li/China/IBM@IBMCN</font><br><f=
ont color=3D"#5F5F5F" size=3D"2" >Date: </font><font size=3D"2" >05/01/2016=
 02:29 PM</font><br><font color=3D"#5F5F5F" size=3D"2" >Subject: </font><fo=
nt size=3D"2" >OpenBMC May Sprint</font>
<hr style=3D"color:#8091A5; " align=3D"left" size=3D"2" width=3D"100%" ><br=
><br><font size=3D"2" >Hi team,</font><br><br><font size=3D"2" >We'll be tr=
ansitioning to SP-Next in the next few weeks. The current plan for the next=
 2 weeks (while Patrick is on vacation):</font>
<ul style=3D"padding-left: 18pt; margin-left: 0px" type=3D"disc" >        <=
li><font size=3D"2" >Complete the GA2 items you've been working on. As avai=
lability permits, pick a GA3 item that can be contained in a week. Objectiv=
e is to close all GA2 items and complete as many GA3 items as possible by M=
ay 15th, at which point we'll conclude features targeted for Rackspace and =
tag that build as v1.0. </font></li></ul><br><font size=3D"2" >Beginning Ma=
y 15th the whole team will start with SP-Next development, some of you like=
 Brad and Tom are already started, some new members will join us as well. A=
t that time we'll split our current meeting into daily scrums with separate=
 twice a week tech talks.</font><br><br><font size=3D"2" >I'll be at at a w=
orkshop monday-tuesday may 2-3, so we'll resume scrum on thursday. See you =
then.</font></blockquote>
<div dir=3D"ltr" >&nbsp;</div></div></div>
<div dir=3D"ltr" >&nbsp;</div></div></div><BR>
