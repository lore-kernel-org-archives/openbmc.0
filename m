Return-Path: <austenc@us.ibm.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=us.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=austenc@us.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y1vl82DpbzDsPK
 for <openbmc@lists.ozlabs.org>; Wed, 27 Sep 2017 07:50:27 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v8QLnlUA052905
 for <openbmc@lists.ozlabs.org>; Tue, 26 Sep 2017 17:50:24 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.73])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2d7t2syhgn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 26 Sep 2017 17:50:24 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Tue, 26 Sep 2017 21:50:23 -0000
Received: from us1a3-smtp06.a3.dal06.isc4sb.com (10.146.103.243)
 by smtp.notes.na.collabserv.com (10.106.227.90) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 26 Sep 2017 21:50:22 -0000
Received: from us1a3-mail75.a3.dal09.isc4sb.com ([10.142.3.82])
 by us1a3-smtp06.a3.dal06.isc4sb.com
 with ESMTP id 2017092621502161-1047231 ;
 Tue, 26 Sep 2017 21:50:21 +0000 
MIME-Version: 1.0
Subject: OpenBMC growing leadership
To: OpenBMC <openbmc@lists.ozlabs.org>
From: "Chris Austen" <austenc@us.ibm.com>
Date: Tue, 26 Sep 2017 16:50:21 -0500
X-KeepSent: 7D68BAEA:1296BECD-862581A7:00632E79;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1EXT SHF766 December 14, 2016
X-LLNOutbound: False
X-Disclaimed: 22959
X-TNEFEvaluated: 1
Content-type: multipart/alternative; 
 Boundary="0__=09BB0B34DFF0A8E98f9e8a93df938690918c09BB0B34DFF0A8E9"
Content-Disposition: inline
x-cbid: 17092621-3107-0000-0000-00000325D637
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.439231; ST=0; TS=0; UL=0; ISC=; MB=0.192444
X-IBM-SpamModules-Versions: BY=3.00007798; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000231; SDB=6.00922803; UDB=6.00463854; IPR=6.00702945; 
 BA=6.00005608; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017285; XFM=3.00000015;
 UTC=2017-09-26 21:50:23
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2017-09-26 15:01:25 - 6.00007378
x-cbparentid: 17092621-3108-0000-0000-000069AF88F8
Message-Id: <OF7D68BAEA.1296BECD-ON862581A7.00632E79-862581A7.0077F790@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-09-26_07:, , signatures=0
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
X-List-Received-Date: Tue, 26 Sep 2017 21:50:29 -0000


--0__=09BB0B34DFF0A8E98f9e8a93df938690918c09BB0B34DFF0A8E9
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII



I wanted to let you know some pretty exciting news.  As you may be aware
The OpenBMC Project and the Facebook OpenBMC team have been looking for
ways to work together.  Over the past few weeks IBM, Google, Facebook,
Microsoft, Intel and OCP have been talking about the code and how to create
a common stack for all the world to reference.  There are plenty of items
to work through (like finding a hosting foundation, Governance, etc) but
the desire and momentum is there to work together.  Be assured that the
goals of our OpenBMC Project (which, as code contributors, you are part of)
remain the same; that our community is open and the code is designed to
enable your business needs.

This will not be a tear up or rewrite of github.com/openbmc.  The OpenBMC
Project repos will be used as the starting point.  I saw some presentations
at the Dallas OpenCompute Project engineering workshop that gets me excited
about the future.  You can see the entire workshop here...
https://www.youtube.com/watch?v=3DQFhEbXkHd0Q

Let me know if you have any questions



Chris Austen
OpenBMC

--0__=09BB0B34DFF0A8E98f9e8a93df938690918c09BB0B34DFF0A8E9
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline

<html><body><p><font size=3D"2">I wanted to let you know some pretty exciti=
ng news.  As you may be aware The OpenBMC Project and the Facebook OpenBMC =
team have been looking for ways to work together.  Over the past few weeks =
IBM, Google, Facebook, Microsoft, Intel and OCP have been talking about the=
 code and how to create a common stack for all the world to reference.  The=
re are plenty of items to work through (like finding a hosting foundation, =
Governance, etc) but the desire and momentum is there to work together.  Be=
 assured that the goals of our OpenBMC Project (which, as code contributors=
, you are part of) remain the same; that our community is open and the code=
 is designed to enable your business needs.  </font><br><br><font size=3D"2=
">This will not be a tear up or rewrite of github.com/openbmc.  The OpenBMC=
 Project repos will be used as the starting point.  I saw some presentation=
s at the Dallas OpenCompute Project engineering workshop that gets me excit=
ed about the future.  You can see the entire workshop here... </font><a hre=
f=3D"https://www.youtube.com/watch?v=3DQFhEbXkHd0Q"><font size=3D"2">https:=
//www.youtube.com/watch?v=3DQFhEbXkHd0Q</font></a><br><br><font size=3D"2">=
Let me know if you have any questions</font><br><br><br><font size=3D"2"><b=
r>Chris Austen<br>OpenBMC</font><BR>
</body></html>

--0__=09BB0B34DFF0A8E98f9e8a93df938690918c09BB0B34DFF0A8E9--
