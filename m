Return-Path: <austenc@us.ibm.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=us.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=austenc@us.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xzQ2T2nkWzDrJL
 for <openbmc@lists.ozlabs.org>; Sat, 23 Sep 2017 06:25:04 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v8MKNxg8117076
 for <openbmc@lists.ozlabs.org>; Fri, 22 Sep 2017 16:25:02 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.82])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2d52brg0p2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 22 Sep 2017 16:25:02 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Fri, 22 Sep 2017 20:25:01 -0000
Received: from us1a3-smtp08.a3.dal06.isc4sb.com (10.146.103.57)
 by smtp.notes.na.collabserv.com (10.106.227.105) with
 smtp.notes.na.collabserv.com ESMTP; Fri, 22 Sep 2017 20:24:59 -0000
Received: from us1a3-mail75.a3.dal09.isc4sb.com ([10.142.3.82])
 by us1a3-smtp08.a3.dal06.isc4sb.com
 with ESMTP id 2017092220245914-938310 ;
 Fri, 22 Sep 2017 20:24:59 +0000 
MIME-Version: 1.0
In-Reply-To: <CAEX+82+yw1TL84Ew3S5i3SkmcxPtJ9B7+TvK1L8gP2-nNqofjQ@mail.gmail.com>
Subject: Re: Porting OpenBMC to Raspberry PI 3.
To: Javier Romero <xavinux@gmail.com>
Cc: openbmc@lists.ozlabs.org
From: "Chris Austen" <austenc@us.ibm.com>
Date: Fri, 22 Sep 2017 15:24:57 -0500
References: <CAEX+82KH9Mhq9k=2BD+BkF06sGXg8RJuvLkBTRupfZHmMifH6g@mail.gmail.com>
 <OFA0C3CA6A.D52682A0-ON862581A3.005A0DBB-862581A3.005AEDA7@notes.na.collabserv.com>
 <CAEX+82JJfAEpkZ57tzn_V1_0TfqSaj=-zLRBqK4+GSAeO=aCXw@mail.gmail.com>
 <CAEX+82+yw1TL84Ew3S5i3SkmcxPtJ9B7+TvK1L8gP2-nNqofjQ@mail.gmail.com>
X-KeepSent: 70CFC593:C16E6AA1-862581A3:006F7F1D;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1EXT SHF766 December 14, 2016
X-LLNOutbound: False
X-Disclaimed: 56515
X-TNEFEvaluated: 1
Content-type: multipart/alternative; 
 Boundary="0__=09BB0B30DFFCF98D8f9e8a93df938690918c09BB0B30DFFCF98D"
Content-Disposition: inline
x-cbid: 17092220-5101-0000-0000-00000658AEA5
X-IBM-SpamModules-Scores: BY=0.021701; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.431554; ST=0; TS=0; UL=0; ISC=; MB=0.207463
X-IBM-SpamModules-Versions: BY=3.00007779; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000231; SDB=6.00920862; UDB=6.00462756; IPR=6.00701084; 
 BA=6.00005601; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017251; XFM=3.00000015;
 UTC=2017-09-22 20:25:00
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2017-09-22 19:07:38 - 6.00007365
x-cbparentid: 17092220-5102-0000-0000-0000DE5F6538
Message-Id: <OF70CFC593.C16E6AA1-ON862581A3.006F7F1D-862581A3.00702603@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-09-22_09:, , signatures=0
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
X-List-Received-Date: Fri, 22 Sep 2017 20:25:05 -0000


--0__=09BB0B30DFFCF98D8f9e8a93df938690918c09BB0B30DFFCF98D
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=ISO-8859-1


As you can see there has been a desire for over a year to have it
supported.  Raspberrypi supported is interesting since it allows for an
easy reference board to develop and learn from.  It provides other
communities to get involved and it presents a very cheap model for test
automation.  The developers talking on that issue had other systems and
timelines that got in the way of providing the community a cheap usable
hardware reference.

As you yourself discovered, OpenBMC kernel development can be difficult
without system level specs.  With the Pi you remove the problem.



Chris Austen
POWER Systems Enablement Manager
(512) 286-5184 (T/L: 363-5184)

Javier Romero <xavinux@gmail.com> wrote on 09/22/2017 01:56:45 PM:

> From: Javier Romero <xavinux@gmail.com>
> To: Chris Austen <austenc@us.ibm.com>
> Cc: openbmc@lists.ozlabs.org
> Date: 09/22/2017 01:56 PM
> Subject: Re: Porting OpenBMC to Raspberry PI 3.
>
> Seems that obmc on Raspberry PI is not a primary use case...
>
> https://github.com/openbmc/openbmc/issues/399
>
> Javier Romero
> E-mail: xavinux@gmail.com
> Skype: xavinux
>
> 2017-09-22 13:47 GMT-03:00 Javier Romero <xavinux@gmail.com>:
> Chris,

> Thank you for your answer. I'll start working on those points
you'vesuggested.

> Regards,
>

>
> Javier Romero
> E-mail: xavinux@gmail.com
> Skype: xavinux
>
> 2017-09-22 13:33 GMT-03:00 Chris Austen <austenc@us.ibm.com>:
>
> Chris Austen
>
> "openbmc" <openbmc-bounces+austenc=3Dus.ibm.com@lists.ozlabs.org>
> wrote on 09/22/2017 10:49:54 AM:
>
> > From: Javier Romero <xavinux@gmail.com>
> > To: openbmc@lists.ozlabs.org
> > Date: 09/22/2017 10:50 AM
> > Subject: Porting OpenBMC to Raspberry PI 3.
> > Sent by: "openbmc" <openbmc-bounces
+austenc=3Dus.ibm.com@lists.ozlabs.org>
> >
> > Hello,
>
> > Have a Raspberry PI 3 and seems that could be useful to port OpenBMC
> > to this device.
>
> > Suggestions on how to start working with this will be welcome.
>
>
> before anything, make sure you have successfully created a build
> https://github.com/openbmc/openbmc#setting-up-your-openbmc-project
> Target Palmetto
>
> Then build the simulator https://github.com/openbmc/openbmc#setting-
> up-your-openbmc-project
>
> Then run the simulator https://github.com/openbmc/openbmc#setting-
> up-your-openbmc-project
>
>
> Once that is done Target a Romulus for build/simulation.=A0 You will
> notice Palmetto is built from ast-2400 and Romulus is ast-2500
> You should notice some layers change between the two.=A0 That gives
> you a base framework.=A0 Next, and this is where no one has done work
> on the team...
>
> I would try to build an online example of using yocto for raspberry
> images.=A0 Get that to work.=A0 This step has nothing to do with
> OpenBMC.=A0 It has to do about learning how to build a working
> raspberrypi image.
>
> Once you have done that, the next and most difficult thing...
> merging the two. =A0document everything in a blog post (maybe your
> userid in github) and that will let people see what you are doing
> and find helpful hints.
>
>
>
> > Best Regards,
> >
> >
> >
>
> > Javier Romero
> > E-mail: xavinux@gmail.com
> > Skype: xavinux

--0__=09BB0B30DFFCF98D8f9e8a93df938690918c09BB0B30DFFCF98D
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=ISO-8859-1
Content-Disposition: inline

<html><body><p><font size=3D"2">As you can see there has been a desire for =
over a year to have it supported.  Raspberrypi supported is interesting sin=
ce it allows for an easy reference board to develop and learn from.  It pro=
vides other communities to get involved and it presents a very cheap model =
for test automation.  The developers talking on that issue had other system=
s and timelines that got in the way of providing the community a cheap usab=
le hardware reference.</font><br><br><font size=3D"2">As you yourself disco=
vered, OpenBMC kernel development can be difficult without system level spe=
cs.  With the Pi you remove the problem.  </font><br><br><br><font size=3D"=
2"><br>Chris Austen<br>POWER Systems Enablement Manager <br>(512) 286-5184 =
(T/L: 363-5184)</font><br><br><tt><font size=3D"2">Javier Romero &lt;xavinu=
x@gmail.com&gt; wrote on 09/22/2017 01:56:45 PM:<br><br>&gt; From: Javier R=
omero &lt;xavinux@gmail.com&gt;</font></tt><br><tt><font size=3D"2">&gt; To=
: Chris Austen &lt;austenc@us.ibm.com&gt;</font></tt><br><tt><font size=3D"=
2">&gt; Cc: openbmc@lists.ozlabs.org</font></tt><br><tt><font size=3D"2">&g=
t; Date: 09/22/2017 01:56 PM</font></tt><br><tt><font size=3D"2">&gt; Subje=
ct: Re: Porting OpenBMC to Raspberry PI 3.</font></tt><br><tt><font size=3D=
"2">&gt; <br>&gt; Seems that obmc on Raspberry PI is not a primary use case=
...<br>&gt; <br>&gt; <a href=3D"https://github.com/openbmc/openbmc/issues/3=
99">https://github.com/openbmc/openbmc/issues/399</a></font></tt><br><tt><f=
ont size=3D"2">&gt; <br>&gt; Javier Romero</font></tt><br><tt><font size=3D=
"2">&gt; E-mail: xavinux@gmail.com</font></tt><br><tt><font size=3D"2">&gt;=
 Skype: xavinux</font></tt><br><tt><font size=3D"2">&gt; <br>&gt; 2017-09-2=
2 13:47 GMT-03:00 Javier Romero &lt;xavinux@gmail.com&gt;:</font></tt><br><=
tt><font size=3D"2">&gt; Chris,<br></font></tt><br><tt><font size=3D"2">&gt=
; Thank you for your answer. I'll start working on those points you'vesugge=
sted.<br></font></tt><br><tt><font size=3D"2">&gt; Regards,<br>&gt; <br></f=
ont></tt><br><tt><font size=3D"2">&gt; <br>&gt; Javier Romero</font></tt><b=
r><tt><font size=3D"2">&gt; E-mail: xavinux@gmail.com</font></tt><br><tt><f=
ont size=3D"2">&gt; Skype: xavinux</font></tt><br><tt><font size=3D"2">&gt;=
 <br>&gt; 2017-09-22 13:33 GMT-03:00 Chris Austen &lt;austenc@us.ibm.com&gt=
;:</font></tt><br><tt><font size=3D"2">&gt; <br>&gt; Chris Austen<br>&gt; <=
br>&gt; &quot;openbmc&quot; &lt;openbmc-bounces+austenc=3Dus.ibm.com@lists.=
ozlabs.org&gt; <br>&gt; wrote on 09/22/2017 10:49:54 AM:<br>&gt; <br>&gt; &=
gt; From: Javier Romero &lt;xavinux@gmail.com&gt;<br>&gt; &gt; To: openbmc@=
lists.ozlabs.org<br>&gt; &gt; Date: 09/22/2017 10:50 AM<br>&gt; &gt; Subjec=
t: Porting OpenBMC to Raspberry PI 3.<br>&gt; &gt; Sent by: &quot;openbmc&q=
uot; &lt;openbmc-bounces+austenc=3Dus.ibm.com@lists.ozlabs.org&gt;<br>&gt; =
&gt; <br>&gt; &gt; Hello,<br>&gt; <br>&gt; &gt; Have a Raspberry PI 3 and s=
eems that could be useful to port OpenBMC<br>&gt; &gt; to this device.<br>&=
gt; <br>&gt; &gt; Suggestions on how to start working with this will be wel=
come.<br>&gt; <br>&gt; <br>&gt; before anything, make sure you have success=
fully created a build <br>&gt; <a href=3D"https://github.com/openbmc/openbm=
c#setting-up-your-openbmc-project">https://github.com/openbmc/openbmc#setti=
ng-up-your-openbmc-project</a><br>&gt; Target Palmetto<br>&gt; <br>&gt; The=
n build the simulator <a href=3D"https://github.com/openbmc/openbmc#setting=
-">https://github.com/openbmc/openbmc#setting-</a><br>&gt; up-your-openbmc-=
project<br>&gt; <br>&gt; Then run the simulator <a href=3D"https://github.c=
om/openbmc/openbmc#setting-">https://github.com/openbmc/openbmc#setting-</a=
><br>&gt; up-your-openbmc-project<br>&gt; <br>&gt; <br>&gt; Once that is do=
ne Target a Romulus for build/simulation.=A0 You will <br>&gt; notice Palme=
tto is built from ast-2400 and Romulus is ast-2500<br>&gt; You should notic=
e some layers change between the two.=A0 That gives <br>&gt; you a base fra=
mework.=A0 Next, and this is where no one has done work <br>&gt; on the tea=
m...<br>&gt; <br>&gt; I would try to build an online example of using yocto=
 for raspberry <br>&gt; images.=A0 Get that to work.=A0 This step has nothi=
ng to do with <br>&gt; OpenBMC.=A0 It has to do about learning how to build=
 a working <br>&gt; raspberrypi image. =A0<br>&gt; <br>&gt; Once you have d=
one that, the next and most difficult thing... <br>&gt; merging the two. =
=A0document everything in a blog post (maybe your <br>&gt; userid in github=
) and that will let people see what you are doing <br>&gt; and find helpful=
 hints.<br>&gt; <br>&gt; <br>&gt; <br>&gt; &gt; Best Regards,<br>&gt; &gt; =
<br>&gt; &gt; =A0<br>&gt; &gt; <br>&gt; <br>&gt; &gt; Javier Romero<br>&gt;=
 &gt; E-mail: xavinux@gmail.com<br>&gt; &gt; Skype: xavinux</font></tt><BR>
</body></html>

--0__=09BB0B30DFFCF98D8f9e8a93df938690918c09BB0B30DFFCF98D--
