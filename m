Return-Path: <austenc@us.ibm.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=us.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=austenc@us.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xzJv350TvzDqjC
 for <openbmc@lists.ozlabs.org>; Sat, 23 Sep 2017 02:33:18 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v8MGW4tk132310
 for <openbmc@lists.ozlabs.org>; Fri, 22 Sep 2017 12:33:16 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.91])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2d52br749h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 22 Sep 2017 12:33:16 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Fri, 22 Sep 2017 16:33:15 -0000
Received: from us1a3-smtp02.a3.dal06.isc4sb.com (10.106.154.159)
 by smtp.notes.na.collabserv.com (10.106.227.143) with
 smtp.notes.na.collabserv.com ESMTP; Fri, 22 Sep 2017 16:33:12 -0000
Received: from us1a3-mail75.a3.dal09.isc4sb.com ([10.142.3.82])
 by us1a3-smtp02.a3.dal06.isc4sb.com
 with ESMTP id 2017092216331241-791502 ;
 Fri, 22 Sep 2017 16:33:12 +0000 
MIME-Version: 1.0
In-Reply-To: <CAEX+82KH9Mhq9k=2BD+BkF06sGXg8RJuvLkBTRupfZHmMifH6g@mail.gmail.com>
Subject: Re: Porting OpenBMC to Raspberry PI 3.
To: Javier Romero <xavinux@gmail.com>
Cc: openbmc@lists.ozlabs.org
From: "Chris Austen" <austenc@us.ibm.com>
Date: Fri, 22 Sep 2017 11:33:10 -0500
References: <CAEX+82KH9Mhq9k=2BD+BkF06sGXg8RJuvLkBTRupfZHmMifH6g@mail.gmail.com>
X-KeepSent: A0C3CA6A:D52682A0-862581A3:005A0DBB;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1EXT SHF766 December 14, 2016
X-LLNOutbound: False
X-Disclaimed: 55903
X-TNEFEvaluated: 1
Content-type: multipart/alternative; 
 Boundary="0__=09BB0B30DFC98B2B8f9e8a93df938690918c09BB0B30DFC98B2B"
Content-Disposition: inline
x-cbid: 17092216-9951-0000-0000-0000046CBFCD
X-IBM-SpamModules-Scores: BY=0.262494; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.449102; ST=0; TS=0; UL=0; ISC=; MB=0.250890
X-IBM-SpamModules-Versions: BY=3.00007778; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000231; SDB=6.00920785; UDB=6.00462710; IPR=6.00701006; 
 BA=6.00005601; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017249; XFM=3.00000015;
 UTC=2017-09-22 16:33:14
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2017-09-22 05:07:18 - 6.00007364
x-cbparentid: 17092216-9952-0000-0000-0000EC988585
Message-Id: <OFA0C3CA6A.D52682A0-ON862581A3.005A0DBB-862581A3.005AEDA7@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-09-22_06:, , signatures=0
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
X-List-Received-Date: Fri, 22 Sep 2017 16:33:20 -0000


--0__=09BB0B30DFC98B2B8f9e8a93df938690918c09BB0B30DFC98B2B
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=ISO-8859-1




Chris Austen

"openbmc" <openbmc-bounces+austenc=3Dus.ibm.com@lists.ozlabs.org> wrote on
09/22/2017 10:49:54 AM:

> From: Javier Romero <xavinux@gmail.com>
> To: openbmc@lists.ozlabs.org
> Date: 09/22/2017 10:50 AM
> Subject: Porting OpenBMC to Raspberry PI 3.
> Sent by: "openbmc" <openbmc-bounces+austenc=3Dus.ibm.com@lists.ozlabs.org>
>
> Hello,

> Have a Raspberry PI 3 and seems that could be useful to port OpenBMC
> to this device.

> Suggestions on how to start working with this will be welcome.


before anything, make sure you have successfully created a build
https://github.com/openbmc/openbmc#setting-up-your-openbmc-project
Target Palmetto

Then build the simulator
https://github.com/openbmc/openbmc#setting-up-your-openbmc-project

Then run the simulator
https://github.com/openbmc/openbmc#setting-up-your-openbmc-project


Once that is done Target a Romulus for build/simulation.  You will notice
Palmetto is built from ast-2400 and Romulus is ast-2500
You should notice some layers change between the two.  That gives you a
base framework.  Next, and this is where no one has done work on the
team...

I would try to build an online example of using yocto for raspberry images.
Get that to work.  This step has nothing to do with OpenBMC.  It has to do
about learning how to build a working raspberrypi image.

Once you have done that, the next and most difficult thing... merging the
two.  document everything in a blog post (maybe your userid in github) and
that will let people see what you are doing and find helpful hints.



> Best Regards,
>
>
>

> Javier Romero
> E-mail: xavinux@gmail.com
> Skype: xavinux

--0__=09BB0B30DFC98B2B8f9e8a93df938690918c09BB0B30DFC98B2B
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=ISO-8859-1
Content-Disposition: inline

<html><body><p><font size=3D"2"><br>Chris Austen<br></font><br><tt><font si=
ze=3D"2">&quot;openbmc&quot; &lt;openbmc-bounces+austenc=3Dus.ibm.com@lists=
.ozlabs.org&gt; wrote on 09/22/2017 10:49:54 AM:<br><br>&gt; From: Javier R=
omero &lt;xavinux@gmail.com&gt;</font></tt><br><tt><font size=3D"2">&gt; To=
: openbmc@lists.ozlabs.org</font></tt><br><tt><font size=3D"2">&gt; Date: 0=
9/22/2017 10:50 AM</font></tt><br><tt><font size=3D"2">&gt; Subject: Portin=
g OpenBMC to Raspberry PI 3.</font></tt><br><tt><font size=3D"2">&gt; Sent =
by: &quot;openbmc&quot; &lt;openbmc-bounces+austenc=3Dus.ibm.com@lists.ozla=
bs.org&gt;</font></tt><br><tt><font size=3D"2">&gt; <br>&gt; Hello,<br></fo=
nt></tt><br><tt><font size=3D"2">&gt; Have a Raspberry PI 3 and seems that =
could be useful to port OpenBMC<br>&gt; to this device.<br></font></tt><br>=
<tt><font size=3D"2">&gt; Suggestions on how to start working with this wil=
l be welcome.<br></font></tt><br><br><font size=3D"2">before anything, make=
 sure you have successfully created a build </font><br><a href=3D"https://g=
ithub.com/openbmc/openbmc#setting-up-your-openbmc-project"><tt><font size=
=3D"2">https://github.com/openbmc/openbmc#setting-up-your-openbmc-project</=
font></tt></a><br><tt><font size=3D"2">Target Palmetto</font></tt><br><br><=
tt><font size=3D"2">Then build the simulator </font></tt><a href=3D"https:/=
/github.com/openbmc/openbmc#setting-up-your-openbmc-project"><tt><font size=
=3D"2">https://github.com/openbmc/openbmc#setting-up-your-openbmc-project</=
font></tt></a><br><br><tt><font size=3D"2">Then run the simulator </font></=
tt><a href=3D"https://github.com/openbmc/openbmc#setting-up-your-openbmc-pr=
oject"><tt><font size=3D"2">https://github.com/openbmc/openbmc#setting-up-y=
our-openbmc-project</font></tt></a><br><br><br><tt><font size=3D"2">Once th=
at is done Target a Romulus for build/simulation. &nbsp;You will notice Pal=
metto is built from ast-2400 and Romulus is ast-2500</font></tt><br><tt><fo=
nt size=3D"2">You should notice some layers change between the two. &nbsp;T=
hat gives you a base framework. &nbsp;Next, and this is where no one has do=
ne work on the team...</font></tt><br><br><tt><font size=3D"2">I would try =
to build an online example of using yocto for raspberry images. &nbsp;Get t=
hat to work. &nbsp;This step has nothing to do with OpenBMC. &nbsp;It has t=
o do about learning how to build a working raspberrypi image. &nbsp;</font>=
</tt><br><br><tt><font size=3D"2">Once you have done that, the next and mos=
t difficult thing... merging the two. &nbsp;document everything in a blog p=
ost (maybe your userid in github) and that will let people see what you are=
 doing and find helpful hints.</font></tt><br><br><br><br><tt><font size=3D=
"2">&gt; Best Regards,<br>&gt; <br>&gt; =A0</font></tt><br><tt><font size=
=3D"2">&gt; <br></font></tt><br><tt><font size=3D"2">&gt; Javier Romero</fo=
nt></tt><br><tt><font size=3D"2">&gt; E-mail: xavinux@gmail.com</font></tt>=
<br><tt><font size=3D"2">&gt; Skype: xavinux</font></tt><BR>
</body></html>

--0__=09BB0B30DFC98B2B8f9e8a93df938690918c09BB0B30DFC98B2B--
