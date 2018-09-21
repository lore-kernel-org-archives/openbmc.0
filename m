Return-Path: <gkeishin@in.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=in.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=gkeishin@in.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=in.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42GlpN2MhrzF3Q0
 for <openbmc@lists.ozlabs.org>; Fri, 21 Sep 2018 17:38:48 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w8L7Z3R2043848
 for <openbmc@lists.ozlabs.org>; Fri, 21 Sep 2018 03:38:46 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.66])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2mmtsfv9fp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 21 Sep 2018 03:38:46 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <gkeishin@in.ibm.com>;
 Fri, 21 Sep 2018 07:38:45 -0000
Received: from us1a3-smtp06.a3.dal06.isc4sb.com (10.146.103.243)
 by smtp.notes.na.collabserv.com (10.106.227.127) with
 smtp.notes.na.collabserv.com ESMTP; Fri, 21 Sep 2018 07:38:40 -0000
Received: from us1a3-mail113.a3.dal06.isc4sb.com ([10.146.6.4])
 by us1a3-smtp06.a3.dal06.isc4sb.com
 with ESMTP id 2018092107383927-191336 ;
 Fri, 21 Sep 2018 07:38:39 +0000 
In-Reply-To: <CAARXrtmDv74030kX_tZ+n7qAHKCX6BRXhj_i9Rni3wdj_D3h-w@mail.gmail.com>
To: Lei YU <mine260309@gmail.com>, Alexander Amelkin <a.amelkin@yadro.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "openbmc"<openbmc-bounces+gkeishin=in.ibm.com@lists.ozlabs.org>, "Michael
 Walsh" <micwalsh@us.ibm.com>
Subject: Re: Version and Functional FRU fields for motherboard and membuf
From: "George Keishing" <gkeishin@in.ibm.com>
Date: Fri, 21 Sep 2018 13:08:38 +0530
References: <11b98338b00640daa3cbeba50c6ef324@yadro.com>
 <33ffdf42-0d9d-0331-0e14-2898cd1a1e73@yadro.com>
 <CAARXrtmmeixPcYx4U11Zy19fm0GnOLbvUD2MTpZOEp-ytQ9T2g@mail.gmail.com>
 <0c38bf32fc3c43f79a4356170fe23df0@yadro.com>
 <CAARXrtmDv74030kX_tZ+n7qAHKCX6BRXhj_i9Rni3wdj_D3h-w@mail.gmail.com>
X-KeepSent: 753FD5AF:343964B8-0025830F:002727AF;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1FP10 SHF68 March 06, 2018
X-LLNOutbound: False
X-Disclaimed: 62279
X-TNEFEvaluated: 1
x-cbid: 18092107-6357-0000-0000-0000078F820E
X-IBM-SpamModules-Scores: BY=0.26039; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.429909; ST=0; TS=0; UL=0; ISC=; MB=0.345897
X-IBM-SpamModules-Versions: BY=3.00009744; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000266; SDB=6.01091426; UDB=6.00563929; IPR=6.00871450; 
 BA=6.00006102; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00023427; XFM=3.00000015;
 UTC=2018-09-21 07:38:44
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2018-09-21 07:22:33 - 6.00008995
x-cbparentid: 18092107-6358-0000-0000-00002BF285EF
Message-Id: <OF753FD5AF.343964B8-ON0025830F.002727AF-6525830F.0029FC4F@notes.na.collabserv.com>
Content-Type: multipart/alternative;
 boundary="=_alternative 0029DB186525830F_="
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-09-21_01:, , signatures=0
X-Proofpoint-Spam-Reason: safe
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 21 Sep 2018 07:38:53 -0000


--=_alternative 0029DB186525830F_=
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: Quoted-printable

> By the way, what is at all the meaning and purpose of the 'Functional'=20
property? Is it an indicator of a component functioning properly, or is it=
=20
a 'handle' to turn a component off before hot removal/replacement?
>>>> Correct, the Field 'Functional' indicates the component is=20
functioning.  so Functional is a 'status' and not a 'control'.

> There is no description anywhere that we could find.
>>>> You can look at the YAML state/ namespace for it
>>>>=20
https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc=
_project/State/Decorator/OperationalStatus.interface.yaml


The `Functional` property means if a FRU is functional or not, e.g. if a=20
DIMM
is plugged but has problem, it will be garded. At that time, the DIMM is
`Present`, but not `Functional`.

For this case, I think the test code shall be updated to skip the checks=20
for
Functional, Version on specific FRU items.
>>>> I looked at the code, so it expect if its present , its needs to be=20
functional at least, but yes for the use case where it leads to `Present`,=
=20
but not `Functional`,  there is no skipping logic for a given particular=20
FRU's.=20
>>>> Thinking out loud myself on this, test to add smarter logic checks to=
=20
detect the garded FRU if there is standard method before its run and skip=20
it.
>>>> If you open could up a ticket on=20
https://github.com/openbmc/openbmc-test-automation/issues and describe=20
more so that the test community can look at this and address the changes=20
it may need.

Thanks and Regards,
   George Keishing




From:   Lei YU <mine260309@gmail.com>
To:     Alexander Amelkin <a.amelkin@yadro.com>
Cc:     OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date:   09/21/2018 12:17 PM
Subject:        Re: Version and Functional FRU fields for motherboard and=20
membuf
Sent by:        "openbmc"=20
<openbmc-bounces+gkeishin=3Din.ibm.com@lists.ozlabs.org>



On Wed, Sep 19, 2018 at 6:33 PM Alexander Amelkin <a.amelkin@yadro.com>=20
wrote:
>
>
> Sivas, Lei? Any chance to get an answer to this? The test still fails=20
for us and we can't decide whether we should disable the test or add thos=20
properties to motherboard and membuf objects.
>
> By the way, what is at all the meaning and purpose of the 'Functional'=20
property? Is it an indicator of a component functioning properly, or is it=
=20
a 'handle' to turn a component off before hot removal/replacement?
> There is no description anywhere that we could find.

The `Functional` property means if a FRU is functional or not, e.g. if a=20
DIMM
is plugged but has problem, it will be garded. At that time, the DIMM is
`Present`, but not `Functional`.

For this case, I think the test code shall be updated to skip the checks=20
for
Functional, Version on specific FRU items.

Ping @Sivas again for comment.






--=_alternative 0029DB186525830F_=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="US-ASCII"

<tt><span style=3D" font-size:10pt">&gt; By the way, what is at all the
meaning and purpose of the 'Functional' property? Is it an indicator of
a component functioning properly, or is it a 'handle' to turn a component
off before hot removal/replacement?<br></span></tt><span style=3D" font-siz=
e:10pt;font-family:sans-serif">&gt;&gt;&gt;&gt;
Correct, the Field 'Functional' indicates the component is functioning.
&nbsp;so Functional is a 'status' and not a 'control'.</span><br><br><tt><s=
pan style=3D" font-size:10pt">&gt; There is no description anywhere
that we could find.</span></tt><br><span style=3D" font-size:10pt;font-fami=
ly:sans-serif">&gt;&gt;&gt;&gt;
You can look at the YAML state/ namespace for it<br>&gt;&gt;&gt;&gt; </span=
><a href=3D"https://github.com/openbmc/phosphor-dbus-interfaces/blob/master=
/xyz/openbmc=5Fproject/State/Decorator/OperationalStatus.interface.yaml"><s=
pan style=3D" font-size:10pt;color:blue;font-family:sans-serif">https://git=
hub.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc=5Fproject/=
State/Decorator/OperationalStatus.interface.yaml</span></a><br><br><br><tt>=
<span style=3D" font-size:10pt">The `Functional` property means if
a FRU is functional or not, e.g. if a DIMM<br>is plugged but has problem, i=
t will be garded. At that time, the DIMM is<br>`Present`, but not `Function=
al`.<br><br>For this case, I think the test code shall be updated to skip t=
he checks
for<br>Functional, Version on specific FRU items.</span></tt><br><span styl=
e=3D" font-size:10pt;font-family:sans-serif">&gt;&gt;&gt;&gt;
I looked at the code, so it expect if its present , its needs to be functio=
nal
at least, but yes for the use case where it leads to </span><tt><span style=
=3D" font-size:10pt">`Present`,
but not `Functional</span></tt><span style=3D" font-size:10pt;font-family:s=
ans-serif">`,
&nbsp;there is no skipping logic for a given particular FRU's. </span><br><=
span style=3D" font-size:10pt;font-family:sans-serif">&gt;&gt;&gt;&gt;
Thinking out loud myself on this, test to add smarter logic checks to detect
the garded FRU if there is standard method before its run and skip it.</spa=
n><br><span style=3D" font-size:10pt;font-family:sans-serif">&gt;&gt;&gt;&g=
t;
If you open could up a ticket on </span><a href=3D"https://github.com/openb=
mc/openbmc-test-automation/issues"><span style=3D" font-size:10pt;color:blu=
e;font-family:sans-serif">https://github.com/openbmc/openbmc-test-automatio=
n/issues</span></a><span style=3D" font-size:10pt;font-family:sans-serif">a=
nd describe more so that the test community can look at this and address
the changes it may need.</span><br><br><span style=3D" font-size:10pt;color=
:blue;font-family:sans-serif"><b>Thanks
and Regards,</b></span><br><span style=3D" font-size:10pt;color:blue;font-f=
amily:sans-serif">&nbsp;
&nbsp;George Keishing</span><br><br><br><br><br><span style=3D" font-size:9=
pt;color:#5f5f5f;font-family:sans-serif">From:
&nbsp; &nbsp; &nbsp; &nbsp;</span><span style=3D" font-size:9pt;font-family=
:sans-serif">Lei
YU &lt;mine260309@gmail.com&gt;</span><br><span style=3D" font-size:9pt;col=
or:#5f5f5f;font-family:sans-serif">To:
&nbsp; &nbsp; &nbsp; &nbsp;</span><span style=3D" font-size:9pt;font-family=
:sans-serif">Alexander
Amelkin &lt;a.amelkin@yadro.com&gt;</span><br><span style=3D" font-size:9pt=
;color:#5f5f5f;font-family:sans-serif">Cc:
&nbsp; &nbsp; &nbsp; &nbsp;</span><span style=3D" font-size:9pt;font-family=
:sans-serif">OpenBMC
Maillist &lt;openbmc@lists.ozlabs.org&gt;</span><br><span style=3D" font-si=
ze:9pt;color:#5f5f5f;font-family:sans-serif">Date:
&nbsp; &nbsp; &nbsp; &nbsp;</span><span style=3D" font-size:9pt;font-family=
:sans-serif">09/21/2018
12:17 PM</span><br><span style=3D" font-size:9pt;color:#5f5f5f;font-family:=
sans-serif">Subject:
&nbsp; &nbsp; &nbsp; &nbsp;</span><span style=3D" font-size:9pt;font-family=
:sans-serif">Re:
Version and Functional FRU fields for motherboard and membuf</span><br><spa=
n style=3D" font-size:9pt;color:#5f5f5f;font-family:sans-serif">Sent
by: &nbsp; &nbsp; &nbsp; &nbsp;</span><span style=3D" font-size:9pt;font-fa=
mily:sans-serif">&quot;openbmc&quot;
&lt;openbmc-bounces+gkeishin=3Din.ibm.com@lists.ozlabs.org&gt;</span><br><h=
r noshade><br><br><br><tt><span style=3D" font-size:10pt">On Wed, Sep 19, 2=
018 at 6:33 PM Alexander
Amelkin &lt;a.amelkin@yadro.com&gt; wrote:<br>&gt;<br>&gt;<br>&gt; Sivas, L=
ei? Any chance to get an answer to this? The test still fails
for us and we can't decide whether we should disable the test or add thos
properties to motherboard and membuf objects.<br>&gt;<br>&gt; By the way, w=
hat is at all the meaning and purpose of the 'Functional'
property? Is it an indicator of a component functioning properly, or is
it a 'handle' to turn a component off before hot removal/replacement?<br>&g=
t; There is no description anywhere that we could find.<br><br>The `Functio=
nal` property means if a FRU is functional or not, e.g. if
a DIMM<br>is plugged but has problem, it will be garded. At that time, the =
DIMM is<br>`Present`, but not `Functional`.<br><br>For this case, I think t=
he test code shall be updated to skip the checks
for<br>Functional, Version on specific FRU items.<br><br>Ping @Sivas again =
for comment.<br><br></span></tt><br><br><BR>
--=_alternative 0029DB186525830F_=--
