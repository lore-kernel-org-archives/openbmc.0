Return-Path: <ngorugan@in.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=in.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=ngorugan@in.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=in.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40xYY86ZKpzDrbk
 for <openbmc@lists.ozlabs.org>; Fri,  1 Jun 2018 02:57:29 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w4VGsKJp041336
 for <openbmc@lists.ozlabs.org>; Thu, 31 May 2018 12:57:26 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.91])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2jamx0r71e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 31 May 2018 12:57:26 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <ngorugan@in.ibm.com>;
 Thu, 31 May 2018 16:57:25 -0000
Received: from us1a3-smtp08.a3.dal06.isc4sb.com (10.146.103.57)
 by smtp.notes.na.collabserv.com (10.106.227.143) with
 smtp.notes.na.collabserv.com ESMTP; Thu, 31 May 2018 16:57:22 -0000
Received: from us1a3-mail129.a3.dal06.isc4sb.com ([10.146.45.217])
 by us1a3-smtp08.a3.dal06.isc4sb.com
 with ESMTP id 2018053116572235-756674 ;
 Thu, 31 May 2018 16:57:22 +0000 
In-Reply-To: <CADfYTpFfoEe2SvvBAsjL-UAPocC02Z49o-rTDxA7JwA9OagHnw@mail.gmail.com>
To: Nancy Yuen <yuenn@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: OpenBMC Fix-It
From: "Nagaraju Goruganti" <ngorugan@in.ibm.com>
Date: Thu, 31 May 2018 22:27:21 +0530
References: <CADfYTpFfoEe2SvvBAsjL-UAPocC02Z49o-rTDxA7JwA9OagHnw@mail.gmail.com>
MIME-Version: 1.0
X-KeepSent: 4D5901BC:3B61EC5B-0025829E:005CF88A;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1 October 14, 2013
X-LLNOutbound: False
X-Disclaimed: 60811
X-TNEFEvaluated: 1
x-cbid: 18053116-9951-0000-0000-000007FB2033
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.429909; ST=0; TS=0; UL=0; ISC=; MB=0.043213
X-IBM-SpamModules-Versions: BY=3.00009103; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000264; SDB=6.01040385; UDB=6.00532562; IPR=6.00819514; 
 BA=6.00005990; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00021397; XFM=3.00000015;
 UTC=2018-05-31 16:57:24
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2018-05-31 06:47:28 - 6.00008521
x-cbparentid: 18053116-9952-0000-0000-00006F693202
Message-Id: <OF4D5901BC.3B61EC5B-ON0025829E.005CF88A-6525829E.005D246E@notes.na.collabserv.com>
Content-Type: multipart/alternative;
 boundary="=_alternative 005D212E6525829E_="
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-05-31_09:, , signatures=0
X-Proofpoint-Spam-Reason: safe
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 31 May 2018 16:57:33 -0000


--=_alternative 005D212E6525829E_=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"

Hi Nancy,

I am in.

Regards,
Nagaraju G



From:   Nancy Yuen <yuenn@google.com>
To:     OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date:   05/09/2018 01:00 AM
Subject:        OpenBMC Fix-It
Sent by:        "openbmc"=20
<openbmc-bounces+ngorugan=3Din.ibm.com@lists.ozlabs.org>



Please join my team for an OpenBMC  community "fix-it" event in June!

My team is devoting the week of 6/11/-15 to a Google OpenBMC "fix it" as=20
part of a larger fix-it initiative. OpenBMC is a large part of our project =

so I'd like to spend part of the week on a fix-it on OpenBMC.

I propose to have the fix it on Tues and Wed 6/12 & 6/13.  We could set up =

an IRC channel for the fix it where everyone participating would hang out=20
for the day.  We could pick one or two areas to focus on for those days,=20
put together a list of things to "fix" in those areas ahead of time.  On=20
the day, we all tackle things on the list (or something not on the list),=20
discuss over IRC and do code reviews.  Inevitably, people have meetings or =

things they can't get out of, but if you can be available for most of the=20
day, that would be enough!

Anyone interested in participating?

----------
Nancy



--=_alternative 005D212E6525829E_=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="US-ASCII"

<font size=3D2 face=3D"sans-serif">Hi Nancy,</font><br><br><font size=3D2 f=
ace=3D"sans-serif">I am in.</font><br><br><font size=3D2 face=3D"sans-serif=
">Regards,</font><br><font size=3D2 face=3D"sans-serif">Nagaraju G</font><b=
r><br><br><br><font size=3D1 color=3D#5f5f5f face=3D"sans-serif">From: &nbs=
p; &nbsp; &nbsp;
&nbsp;</font><font size=3D1 face=3D"sans-serif">Nancy Yuen &lt;yuenn@google=
.com&gt;</font><br><font size=3D1 color=3D#5f5f5f face=3D"sans-serif">To: &=
nbsp; &nbsp; &nbsp;
&nbsp;</font><font size=3D1 face=3D"sans-serif">OpenBMC Maillist &lt;openbm=
c@lists.ozlabs.org&gt;</font><br><font size=3D1 color=3D#5f5f5f face=3D"san=
s-serif">Date: &nbsp; &nbsp; &nbsp;
&nbsp;</font><font size=3D1 face=3D"sans-serif">05/09/2018 01:00 AM</font><=
br><font size=3D1 color=3D#5f5f5f face=3D"sans-serif">Subject: &nbsp; &nbsp;
&nbsp; &nbsp;</font><font size=3D1 face=3D"sans-serif">OpenBMC Fix-It</font=
><br><font size=3D1 color=3D#5f5f5f face=3D"sans-serif">Sent by: &nbsp; &nb=
sp;
&nbsp; &nbsp;</font><font size=3D1 face=3D"sans-serif">&quot;openbmc&quot;
&lt;openbmc-bounces+ngorugan=3Din.ibm.com@lists.ozlabs.org&gt;</font><br><h=
r noshade><br><br><br><font size=3D4>Please join my team for an OpenBMC&nbs=
p; community &quot;fix-it&quot;
event in June!</font><br><br><font size=3D4>My team is devoting the week of=
 6/11/-15 to a Google OpenBMC
&quot;fix it&quot; as part of a larger fix-it initiative. OpenBMC is a
large part of our project so I'd like to spend part of the week on a fix-it
on OpenBMC.</font><br><br><font size=3D4>I propose to have the fix it on Tu=
es and Wed 6/12 &amp;
6/13.&nbsp; We could set up an IRC channel for the fix it where everyone
participating would hang out for the day.&nbsp; We could pick one or two
areas to focus on for those days, put together a list of things to &quot;fi=
x&quot;
in those areas ahead of time.&nbsp; On the day, we all tackle things on
the list (or something not on the list), discuss over IRC and do code revie=
ws.&nbsp;
Inevitably, people have meetings or things they can't get out of, but if
you can be available for most of the day, that would be enough!</font><br><=
br><font size=3D4>Anyone interested in participating?</font><br><br><font s=
ize=3D4>----------<br>Nancy</font><br><BR>
--=_alternative 005D212E6525829E_=--
