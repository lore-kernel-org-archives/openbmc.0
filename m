Return-Path: <anoo@us.ibm.com>
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r4yF963v8zDqCc
 for <openbmc@lists.ozlabs.org>; Thu, 12 May 2016 12:51:57 +1000 (AEST)
Received: from localhost
 by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@us.ibm.com>;
 Wed, 11 May 2016 22:51:55 -0400
Received: from d01dlp01.pok.ibm.com (9.56.250.166)
 by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 11 May 2016 22:51:52 -0400
X-IBM-Helo: d01dlp01.pok.ibm.com
X-IBM-MailFrom: anoo@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24])
 by d01dlp01.pok.ibm.com (Postfix) with ESMTP id F41BF38C803B
 for <openbmc@lists.ozlabs.org>; Wed, 11 May 2016 22:51:51 -0400 (EDT)
Received: from d01av02.pok.ibm.com (d01av02.pok.ibm.com [9.56.224.216])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u4C2ppwE35520672
 for <openbmc@lists.ozlabs.org>; Thu, 12 May 2016 02:51:51 GMT
Received: from d01av02.pok.ibm.com (localhost [127.0.0.1])
 by d01av02.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u4C2ppHq030740
 for <openbmc@lists.ozlabs.org>; Wed, 11 May 2016 22:51:51 -0400
Received: from d50lp03.ny.us.ibm.com (d50lp03.pok.ibm.com [146.89.104.211])
 by d01av02.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u4C2ppbx030735
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
 for <openbmc@lists.ozlabs.org>; Wed, 11 May 2016 22:51:51 -0400
Message-Id: <201605120251.u4C2ppbx030735@d01av02.pok.ibm.com>
Received: from localhost
 by d50lp03.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@us.ibm.com>;
 Wed, 11 May 2016 22:51:51 -0400
Received: from smtp.notes.na.collabserv.com (192.155.248.93)
 by d50lp03.ny.us.ibm.com (158.87.18.22) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Wed, 11 May 2016 22:51:49 -0400
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: anoo@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <anoo@us.ibm.com>;
 Thu, 12 May 2016 02:51:48 -0000
Received: from us1a3-smtp05.a3.dal06.isc4sb.com (10.146.71.159)
 by smtp.notes.na.collabserv.com (10.106.227.39) with
 smtp.notes.na.collabserv.com ESMTP; Thu, 12 May 2016 02:51:46 -0000
Received: from us1a3-mail52.a3.dal06.isc4sb.com ([10.146.77.168])
 by us1a3-smtp05.a3.dal06.isc4sb.com
 with ESMTP id 2016051202514499-8448 ;
 Thu, 12 May 2016 02:51:44 +0000 
In-Reply-To: <201605091047.u49AlQq19371720@d28relay08.in.ibm.com>
To: "Ratan K Gupta" <ratagupt@in.ibm.com>
Cc: openbmc@lists.ozlabs.org
Subject: Re: OpenBMC Story(151536):- IPMI Network Settings Override
From: "Adriana Kobylak" <anoo@us.ibm.com>
Date: Wed, 11 May 2016 21:51:33 -0500
References: <OF93E2D9B5.2823EF4B-ON00257FAB.00146EAE-00257FAB.002B1B25@LocalDomain>
 <201605091047.u49AlQq19371720@d28relay08.in.ibm.com>
MIME-Version: 1.0
X-KeepSent: A3C1CF74:D7C04B31-86257FB1:000F389C;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1EXT September 15, 2015
X-LLNOutbound: False
X-Disclaimed: 21795
X-TNEFEvaluated: 1
Content-Type: multipart/alternative;
 boundary="=_alternative 000FB1C086257FB1_="
x-cbid: 16051202-0041-0000-0000-0000041BCCA0
X-IBM-ISS-SpamDetectors: Score=0.387138; BY=0.04736; FL=0; FP=0; FZ=0; HX=0;
 KW=0; PH=0; SC=0.387138; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00005270; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000166; SDB=6.00700887; UDB=6.00324436; UTC=2016-05-12
 02:51:47
x-cbparentid: 16051202-3202-0000-0000-0000003D4290
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-TM-AS-MML: disable
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
X-List-Received-Date: Thu, 12 May 2016 02:51:58 -0000


--=_alternative 000FB1C086257FB1_=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"

Hi Ratan,

Discussing with the team tonight, we agreed that your suggestion #1 is the =

preferred one, one point of discussion was that if this was some other=20
type of data, we'd put it in the settings file anyways with the rest of=20
the host stuff, so host network info shouldn't be different.




From:   "Ratan K Gupta" <ratagupt@in.ibm.com>
To:     openbmc@lists.ozlabs.org
Date:   05/09/2016 05:47 AM
Subject:        Re: OpenBMC Story(151536):- IPMI Network Settings Override
Sent by:        "openbmc"=20
<openbmc-bounces+anoo=3Dus.ibm.com@lists.ozlabs.org>



Hi Team,
=20
I had two approaches to store the Host Network config,We can store it in=20
the global settings object where we are keeping all the host related data.
=20
                                       Or
=20
We can store it in some other file specific for host network config.
=20
if we go with 1st approach where we will keep the info in the global=20
settings object.
=20
1) we can create separate attr for network=5Fconfig and the value would be =

string
=20
   eg settings file:
        =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
#!/usr/bin/python -u
SETTINGS=3D{'host': {'bootflags': {'default': 'default', 'type': 's',=20
'name': 'boot=5Fflags'}, 'powercap': {'name': 'power=5Fcap', 'min': 0,=20
'default': 0, 'max': 1000, 'type': 'i', 'unit': 'watts'}, 'sysstate':=20
{'default': '', 'type': 's', 'name': 'system=5Fstate'}, 'powerpolicy':=20
{'default': 'RESTORE=5FLAST=5FSTATE', 'type': 's', 'name': 'power=5Fpolicy'=
},=20
'restrictedmode': {'default': False, 'type': 'b', 'name':=20
'restricted=5Fmode'}, 'networkConfig': {default':=20
{ipaddress:x.x.x.x,subnetmask:x.x.x.x,gateway:x.x.x.x,Mac:x:x:x:x:x:x},'nam=
e':network=5Fconfig,'type':'s'}}}
=20
We have to parse this string in IPMI to get the network config details.
=20
2) We can use the network object interface to set the host network=20
properties.like setAddress4 and setHwAddress.But in this case also we have =

to overload these functions as we can take one more parameter named=20
"Target",If target is BMC then do whatever we are doingt it=20
today,Otherwise give the new functionality.
=20
In this approach we can not store the host related settings in Global=20
settings file as both(network,GlobalSettings) are different object.so for=20
storing this host network info we need to introduce one more file to=20
persist the info.
=20
=20
Recommendation:- We can go with first approach as all the host related=20
settings in the global settings object and we can set all the network=20
related attr in one atomic operation.
=20
Please let me know your thoughts in this.
=20
Ratan
=20
----- Original message -----
From: Adriana Kobylak/Austin/IBM
To: Bradley W Bishop/Rochester/IBM@IBMUS, Chris Austen/Austin/IBM@IBMUS,=20
Douglas Griffith/Austin/IBM@IBMUS, Gus Schlachter/Austin/IBM@IBMUS,=20
Hariharasubramanian Ramasubramanian/India/IBM@IBMIN, Rahul=20
Maheshwari3/India/IBM@IBMIN, Ratan K Gupta/India/IBM@IBMIN, Tom=20
Joseph2/India/IBM@IBMIN, Vishwanatha Subbanna/India/IBM@IBMIN, Nan KX=20
Li/China/IBM@IBMCN, Yi TZ Li/China/IBM@IBMCN
Cc: Norman James/Austin/IBM@IBMUS, Patrick Williams=20
III/Rochester/IBM@IBMUS
Subject: Re: OpenBMC May Sprint
Date: Fri, May 6, 2016 1:50 AM
=20
Per popular demand during today's call, here are the issues and wish list=20
items that are candidates for the next tag, we'll call it our short Sprint =

9.
For those that are ready to get started, choose one and add a comment to=20
the github issue or RTC with your name on it to know you'll be working on=20
it, or just ping me with your choice.

(As a side note, after "short sprint 9", we'll be transitioning from RTC=20
to using github for story management, so install the firefox/chrome plugin =

zenhub https://www.zenhub.io to get ready)

------

Small - Skeleton - System state not updated.=20
https://github.com/openbmc/openbmc/issues/196

Small/Med - IPMI boot options - Implement network override.=20
https://jazz07.rchland.ibm.com:13443/jazz/web/projects/OpenBMC#action=3Dcom=
.ibm.team.workitem.viewWorkItem&id=3D151536


Medium - Bitbake Recipes - PAM authentication. Only turn on PAM without=20
turning off busybox.
Medium - User management (python) - Switch to useradd that takes=20
arguments, parallel with PAM story.=20
https://github.com/openbmc/phosphor-networkd/issues/9

Debug (unknown size):
https://github.com/openbmc/openbmc/issues/194
https://github.com/openbmc/openbmc/issues/206

Code Cleanup and error path:
https://github.com/openbmc/phosphor-host-ipmid/issues/75
https://github.com/openbmc/phosphor-host-ipmid/issues/76
https://github.com/openbmc/skeleton/issues/56
https://github.com/openbmc/openbmc/issues/202




Adriana Kobylak---05/01/2016 02:29:03 PM---Hi team, We'll be transitioning =

to SP-Next in the next few weeks. The current plan for the next 2 we

From: Adriana Kobylak/Austin/IBM
To: Bradley W Bishop/Rochester/IBM@IBMUS, Chris Austen/Austin/IBM@IBMUS,=20
Douglas Griffith/Austin/IBM@IBMUS, Gus Schlachter/Austin/IBM@IBMUS,=20
Hariharasubramanian Ramasubramanian/India/IBM@IBMIN, Rahul=20
Maheshwari3/India/IBM@IBMIN, Ratan K Gupta/India/IBM@IBMIN, Tom=20
Joseph2/India/IBM@IBMIN, Vishwanatha Subbanna/India/IBM@IBMIN, Nan KX=20
Li/China/IBM@IBMCN, Yi TZ Li/China/IBM@IBMCN
Date: 05/01/2016 02:29 PM
Subject: OpenBMC May Sprint=20

Hi team,

We'll be transitioning to SP-Next in the next few weeks. The current plan=20
for the next 2 weeks (while Patrick is on vacation):=20
Complete the GA2 items you've been working on. As availability permits,=20
pick a GA3 item that can be contained in a week. Objective is to close all =

GA2 items and complete as many GA3 items as possible by May 15th, at which =

point we'll conclude features targeted for Rackspace and tag that build as =

v1.0.=20

Beginning May 15th the whole team will start with SP-Next development,=20
some of you like Brad and Tom are already started, some new members will=20
join us as well. At that time we'll split our current meeting into daily=20
scrums with separate twice a week tech talks.

I'll be at at a workshop monday-tuesday may 2-3, so we'll resume scrum on=20
thursday. See you then.
=20
=20
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
openbmc mailing list
openbmc@lists.ozlabs.org
https://lists.ozlabs.org/listinfo/openbmc





--=_alternative 000FB1C086257FB1_=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="US-ASCII"

<font size=3D2 face=3D"sans-serif">Hi Ratan,</font><br><br><font size=3D2 f=
ace=3D"sans-serif">Discussing with the team tonight, we
agreed that your suggestion #1 is the preferred one, one point of discussion
was that if this was some other type of data, we'd put it in the settings
file anyways with the rest of the host stuff, so host network info shouldn't
be different.</font><br><br><br><br><br><font size=3D1 color=3D#5f5f5f face=
=3D"sans-serif">From: &nbsp; &nbsp; &nbsp;
&nbsp;</font><font size=3D1 face=3D"sans-serif">&quot;Ratan K Gupta&quot;
&lt;ratagupt@in.ibm.com&gt;</font><br><font size=3D1 color=3D#5f5f5f face=
=3D"sans-serif">To: &nbsp; &nbsp; &nbsp;
&nbsp;</font><font size=3D1 face=3D"sans-serif">openbmc@lists.ozlabs.org</f=
ont><br><font size=3D1 color=3D#5f5f5f face=3D"sans-serif">Date: &nbsp; &nb=
sp; &nbsp;
&nbsp;</font><font size=3D1 face=3D"sans-serif">05/09/2016 05:47 AM</font><=
br><font size=3D1 color=3D#5f5f5f face=3D"sans-serif">Subject: &nbsp; &nbsp;
&nbsp; &nbsp;</font><font size=3D1 face=3D"sans-serif">Re: OpenBMC
Story(151536):- IPMI Network Settings Override</font><br><font size=3D1 col=
or=3D#5f5f5f face=3D"sans-serif">Sent by: &nbsp; &nbsp;
&nbsp; &nbsp;</font><font size=3D1 face=3D"sans-serif">&quot;openbmc&quot;
&lt;openbmc-bounces+anoo=3Dus.ibm.com@lists.ozlabs.org&gt;</font><br><hr no=
shade><br><br><br><font size=3D2 face=3D"Arial">Hi Team,</font><br><font si=
ze=3D2 face=3D"Arial">&nbsp;</font><br><font size=3D2 face=3D"Arial">I had =
two approaches to store the Host Network
config,We can store it in the global settings object where we are keeping
all the host related data.</font><br><font size=3D2 face=3D"Arial">&nbsp;</=
font><br><font size=3D2 face=3D"Arial">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp;Or</font><br><font size=3D2 face=3D"Arial">&nbsp;</font=
><br><font size=3D2 face=3D"Arial">We can store it in some other file speci=
fic
for host network config.</font><br><font size=3D2 face=3D"Arial">&nbsp;</fo=
nt><br><font size=3D2 face=3D"Arial">if we go with 1st approach where we wi=
ll
keep the info in the global settings object.</font><br><font size=3D2 face=
=3D"Arial">&nbsp;</font><br><font size=3D2 face=3D"Arial">1) we can create =
separate attr for network=5Fconfig
and the value would be string</font><br><font size=3D2 face=3D"Arial">&nbsp=
;</font><br><font size=3D2 face=3D"Arial">&nbsp; &nbsp;eg settings file:</f=
ont><br><font size=3D2 face=3D"Arial">&nbsp; &nbsp; &nbsp; &nbsp; =3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D</font><br><font size=3D2 face=3D"Arial">&nbsp; &nb=
sp; &nbsp; &nbsp;</font><br><font size=3D2 face=3D"Arial">#!/usr/bin/python=
 -u<br>SETTINGS=3D{'host': {'bootflags': {'default': 'default', 'type': 's'=
, 'name':
'boot=5Fflags'}, 'powercap': {'name': 'power=5Fcap', 'min': 0, 'default': 0,
'max': 1000, 'type': 'i', 'unit': 'watts'}, 'sysstate': {'default': '',
'type': 's', 'name': 'system=5Fstate'}, 'powerpolicy': {'default': 'RESTORE=
=5FLAST=5FSTATE',
'type': 's', 'name': 'power=5Fpolicy'}, 'restrictedmode': {'default': False,
'type': 'b', 'name': 'restricted=5Fmode'}, <b>'networkConfig': {default':
{ipaddress:x.x.x.x,subnetmask:x.x.x.x,gateway:x.x.x.x,Mac:x:x:x:x:x:x},'nam=
e':network=5Fconfig,'type':'s'}}}</b></font><br><font size=3D2 face=3D"Aria=
l">&nbsp;</font><br><font size=3D2 face=3D"Arial">We have to parse this str=
ing in IPMI to get
the network config details.</font><br><font size=3D2 face=3D"Arial">&nbsp;<=
/font><br><font size=3D2 face=3D"Arial">2) We can use the network object in=
terface
to set the host network properties.like setAddress4 and setHwAddress.But
in this case also we have to overload these functions as we can take one
more parameter named &quot;Target&quot;,If target is BMC then do whatever
we are doingt it today,Otherwise give the new functionality.</font><br><fon=
t size=3D2 face=3D"Arial">&nbsp;</font><br><font size=3D2 face=3D"Arial">In=
 this approach we can not store the host
related settings in Global settings file as both(network,GlobalSettings)
are different object.so for storing this host network info we need to intro=
duce
one more file to persist the info.</font><br><font size=3D2 face=3D"Arial">=
&nbsp;</font><br><font size=3D2 face=3D"Arial">&nbsp;</font><br><font size=
=3D2 face=3D"Arial">Recommendation:- We can go with first approach
as all the host related settings in the global settings object and we can
set all the network related attr in one atomic operation.</font><br><font s=
ize=3D2 face=3D"Arial">&nbsp;</font><br><font size=3D2 face=3D"Arial">Pleas=
e let me know your thoughts in this.</font><br><font size=3D2 face=3D"Arial=
">&nbsp;</font><br><font size=3D2 face=3D"Arial">Ratan</font><br><font size=
=3D2 face=3D"Arial">&nbsp;</font><br><font size=3D2 face=3D"Arial">----- Or=
iginal message -----</font><br><font size=3D2 face=3D"Arial">From: Adriana =
Kobylak/Austin/IBM<br>To: Bradley W Bishop/Rochester/IBM@IBMUS, Chris Auste=
n/Austin/IBM@IBMUS,
Douglas Griffith/Austin/IBM@IBMUS, Gus Schlachter/Austin/IBM@IBMUS, Harihar=
asubramanian
Ramasubramanian/India/IBM@IBMIN, Rahul Maheshwari3/India/IBM@IBMIN, Ratan
K Gupta/India/IBM@IBMIN, Tom Joseph2/India/IBM@IBMIN, Vishwanatha Subbanna/=
India/IBM@IBMIN,
Nan KX Li/China/IBM@IBMCN, Yi TZ Li/China/IBM@IBMCN<br>Cc: Norman James/Aus=
tin/IBM@IBMUS, Patrick Williams III/Rochester/IBM@IBMUS<br>Subject: Re: Ope=
nBMC May Sprint<br>Date: Fri, May 6, 2016 1:50 AM<br> </font><font size=3D2=
 face=3D"Arial"><br>Per popular demand during today's call, here are the is=
sues and wish list
items that are candidates for the next tag, we'll call it our short Sprint
9.<br>For those that are ready to get started, choose one and add a comment=
 to
the github issue or RTC with your name on it to know you'll be working
on it, or just ping me with your choice.</font><font size=3D2 face=3D"Arial=
"><br></font><font size=3D2 face=3D"Arial"><br>(As a side note, after &quot=
;short sprint 9&quot;, we'll be transitioning
from RTC to using github for story management, so install the firefox/chrome
plugin zenhub </font><a href=3Dhttps://www.zenhub.io/ target=3D=5Fblank><fo=
nt size=3D2 color=3Dblue face=3D"Arial"><u>https://www.zenhub.io</u></font>=
</a><font size=3D2 face=3D"Arial">to get ready)</font><font size=3D2 face=
=3D"Arial"><br></font><font size=3D2 face=3D"Arial"><br>------</font><font =
size=3D2 face=3D"Arial"><br></font><font size=3D2 face=3D"Arial"><br>Small =
- Skeleton - System state not updated. </font><a href=3Dhttps://github.com/=
openbmc/openbmc/issues/196 target=3D=5Fblank><font size=3D2 color=3Dblue fa=
ce=3D"Arial"><u>https://github.com/openbmc/openbmc/issues/196</u></font></a=
><font size=3D2 face=3D"Arial"><br></font><font size=3D2 face=3D"Arial"><br=
>Small/Med - IPMI boot options - Implement network override. </font><a href=
=3D"https://jazz07.rchland.ibm.com:13443/jazz/web/projects/OpenBMC#action=
=3Dcom.ibm.team.workitem.viewWorkItem&amp;id=3D151536" target=3D=5Fblank><f=
ont size=3D2 color=3Dblue face=3D"Arial"><u>https://jazz07.rchland.ibm.com:=
13443/jazz/web/projects/OpenBMC#action=3Dcom.ibm.team.workitem.viewWorkItem=
&amp;id=3D151536</u></font></a><font size=3D2 face=3D"Arial"><br></font><fo=
nt size=3D2 face=3D"Arial"><br>Medium - Bitbake Recipes - PAM authenticatio=
n. Only turn on PAM without
turning off busybox.<br>Medium - User management (python) - Switch to usera=
dd that takes arguments,
parallel with PAM story. </font><a href=3D"https://github.com/openbmc/phosp=
hor-networkd/issues/9" target=3D=5Fblank><font size=3D2 color=3Dblue face=
=3D"Arial"><u>https://github.com/openbmc/phosphor-networkd/issues/9</u></fo=
nt></a><font size=3D2 face=3D"Arial"><br></font><font size=3D2 face=3D"Aria=
l"><br>Debug (unknown size):</font><font size=3D2 color=3Dblue face=3D"Aria=
l"><u><br></u></font><a href=3Dhttps://github.com/openbmc/openbmc/issues/19=
4 target=3D=5Fblank><font size=3D2 color=3Dblue face=3D"Arial"><u>https://g=
ithub.com/openbmc/openbmc/issues/194</u></font></a><font size=3D2 color=3Db=
lue face=3D"Arial"><u><br></u></font><a href=3Dhttps://github.com/openbmc/o=
penbmc/issues/206 target=3D=5Fblank><font size=3D2 color=3Dblue face=3D"Ari=
al"><u>https://github.com/openbmc/openbmc/issues/206</u></font></a><font si=
ze=3D2 face=3D"Arial"><br></font><font size=3D2 face=3D"Arial"><br>Code Cle=
anup and error path:</font><font size=3D2 color=3Dblue face=3D"Arial"><u><b=
r></u></font><a href=3D"https://github.com/openbmc/phosphor-host-ipmid/issu=
es/75" target=3D=5Fblank><font size=3D3 color=3Dblue face=3D"Helvetica"><u>=
https://github.com/openbmc/phosphor-host-ipmid/issues/75</u></font></a><fon=
t size=3D2 color=3Dblue face=3D"Arial"><u><br></u></font><a href=3D"https:/=
/github.com/openbmc/phosphor-host-ipmid/issues/76" target=3D=5Fblank><font =
size=3D3 color=3Dblue face=3D"Helvetica"><u>https://github.com/openbmc/phos=
phor-host-ipmid/issues/76</u></font></a><font size=3D2 color=3Dblue face=3D=
"Arial"><u><br></u></font><a href=3Dhttps://github.com/openbmc/skeleton/iss=
ues/56 target=3D=5Fblank><font size=3D3 color=3Dblue face=3D"Helvetica"><u>=
https://github.com/openbmc/skeleton/issues/56</u></font></a><font size=3D3 =
color=3Dblue face=3D"Helvetica"><u><br></u></font><a href=3Dhttps://github.=
com/openbmc/openbmc/issues/202 target=3D=5Fblank><font size=3D3 color=3Dblu=
e face=3D"Helvetica"><u>https://github.com/openbmc/openbmc/issues/202</u></=
font></a><font size=3D2 face=3D"Arial"><br><br><br><br><br></font><font siz=
e=3D2 color=3D#424282 face=3D"Arial">Adriana Kobylak---05/01/2016
02:29:03 PM---Hi team, We'll be transitioning to SP-Next in the next few
weeks. The current plan for the next 2 we</font><font size=3D2 face=3D"Aria=
l"><br></font><font size=3D2 color=3D#5f5f5f face=3D"Arial"><br>From: </fon=
t><font size=3D2 face=3D"Arial">Adriana Kobylak/Austin/IBM</font><font size=
=3D2 color=3D#5f5f5f face=3D"Arial"><br>To: </font><font size=3D2 face=3D"A=
rial">Bradley W Bishop/Rochester/IBM@IBMUS,
Chris Austen/Austin/IBM@IBMUS, Douglas Griffith/Austin/IBM@IBMUS, Gus Schla=
chter/Austin/IBM@IBMUS,
Hariharasubramanian Ramasubramanian/India/IBM@IBMIN, Rahul Maheshwari3/Indi=
a/IBM@IBMIN,
Ratan K Gupta/India/IBM@IBMIN, Tom Joseph2/India/IBM@IBMIN, Vishwanatha
Subbanna/India/IBM@IBMIN, Nan KX Li/China/IBM@IBMCN, Yi TZ Li/China/IBM@IBM=
CN</font><font size=3D2 color=3D#5f5f5f face=3D"Arial"><br>Date: </font><fo=
nt size=3D2 face=3D"Arial">05/01/2016 02:29 PM</font><font size=3D2 color=
=3D#5f5f5f face=3D"Arial"><br>Subject: </font><font size=3D2 face=3D"Arial"=
>OpenBMC May Sprint</font><font size=3D2 face=3D"Arial"></font><hr><font si=
ze=3D2 face=3D"Arial"><br></font><font size=3D2 face=3D"Arial"><br>Hi team,=
</font><font size=3D2 face=3D"Arial"><br></font><font size=3D2 face=3D"Aria=
l"><br>We'll be transitioning to SP-Next in the next few weeks. The current=
 plan
for the next 2 weeks (while Patrick is on vacation):</font><font size=3D2 f=
ace=3D"Arial"></font><ul><li><font size=3D2 face=3D"Arial">Complete the GA2=
 items you've been working
on. As availability permits, pick a GA3 item that can be contained in a
week. Objective is to close all GA2 items and complete as many GA3 items
as possible by May 15th, at which point we'll conclude features targeted
for Rackspace and tag that build as v1.0. </font><br><font size=3D2 face=3D=
"Arial"><br>Beginning May 15th the whole team will start with SP-Next devel=
opment,
some of you like Brad and Tom are already started, some new members will
join us as well. At that time we'll split our current meeting into daily
scrums with separate twice a week tech talks.</font><font size=3D2 face=3D"=
Arial"><br></font><font size=3D2 face=3D"Arial"><br>I'll be at at a worksho=
p monday-tuesday may 2-3, so we'll resume scrum
on thursday. See you then.</font></ul><font size=3D2 face=3D"Arial">&nbsp;<=
/font><br><font size=3D2 face=3D"Arial">&nbsp;</font><br><tt><font size=3D2=
>=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F<br>op=
enbmc mailing list<br>openbmc@lists.ozlabs.org<br></font></tt><a href=3Dhtt=
ps://lists.ozlabs.org/listinfo/openbmc><tt><font size=3D2>https://lists.ozl=
abs.org/listinfo/openbmc</font></tt></a><tt><font size=3D2><br></font></tt>=
<br><br><BR>
--=_alternative 000FB1C086257FB1_=--
