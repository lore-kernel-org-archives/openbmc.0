Return-Path: <austenc@us.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xcDv94Tc2zDqlN
 for <openbmc@lists.ozlabs.org>; Wed, 23 Aug 2017 01:27:17 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v7MFPoll110979
 for <openbmc@lists.ozlabs.org>; Tue, 22 Aug 2017 11:27:14 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.82])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2cgjnfebhx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 22 Aug 2017 11:27:14 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Tue, 22 Aug 2017 15:27:13 -0000
Received: from us1a3-smtp01.a3.dal06.isc4sb.com (10.106.154.95)
 by smtp.notes.na.collabserv.com (10.106.227.105) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 22 Aug 2017 15:27:10 -0000
Received: from us1a3-mail75.a3.dal09.isc4sb.com ([10.142.3.82])
 by us1a3-smtp01.a3.dal06.isc4sb.com
 with ESMTP id 2017082215271016-697185 ;
 Tue, 22 Aug 2017 15:27:10 +0000 
MIME-Version: 1.0
Subject: What does it take for OpenBMC to merge code
To: openbmc@lists.ozlabs.org
From: "Chris Austen" <austenc@us.ibm.com>
Date: Tue, 22 Aug 2017 10:27:08 -0500
X-KeepSent: BCEEB1DF:062FDE5A-86258184:004F4953;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1EXT SHF766 December 14, 2016
X-LLNOutbound: False
X-Disclaimed: 46483
X-TNEFEvaluated: 1
Content-type: multipart/alternative; 
 Boundary="0__=09BB0B17DFDCCFC38f9e8a93df938690918c09BB0B17DFDCCFC3"
Content-Disposition: inline
x-cbid: 17082215-5101-0000-0000-0000061E95BF
X-IBM-SpamModules-Scores: FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0; SC=0.451295;
 ST=0; TS=0; UL=0; ISC=; MB=0.281396
X-IBM-SpamModules-Versions: BY=3.00007591; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000223; SDB=6.00906052; UDB=6.00454085; IPR=6.00686254; 
 BA=6.00005550; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016813; XFM=3.00000015;
 UTC=2017-08-22 15:27:11
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2017-08-22 11:29:05 - 6.00007217
x-cbparentid: 17082215-5102-0000-0000-0000D29C3A62
Message-Id: <OFBCEEB1DF.062FDE5A-ON86258184.004F4953-86258184.0054E20B@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-08-22_06:, , signatures=0
X-Proofpoint-Spam-Reason: safe
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 22 Aug 2017 15:27:17 -0000


--0__=09BB0B17DFDCCFC38f9e8a93df938690918c09BB0B17DFDCCFC3
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII



For a some time now a question keeps popping up.  I ask others for an
answer and get I different responses.  It's time I bring this to the
mailing list for further discussion... what will the OpenBMC project merge?
If I add my own meta layer will it be accepted?  What if I wrote a device
driver that satisfies my own hardware needs?  What if I wrote a dbus
telemetry monitor with the capability to download results in python?   The
https://github.com/openbmc/docs/blob/master/contributing.md file goes in to
some detail but is pretty blank on the practice of what kind of code will
go in.

So, what should the policy be?

Should the OpenBMC project be a collection of random software or a
structured framework or somewhere in between?  Some pieces may need to be
hosted independently... hosting non-comformant parts implies a level of
support and maintenance which is something we should not be doing.

What about code with existing modeled concepts.  IPC is done via dbus, LEDs
and Sensors too have established meta-phosphor implementations.  Changing
those idea would break down the fundamentals of what OpenBMC is.  For
models that have not been established yet perhaps the developer should be
active on the mailing list describing the issue so that we can provide
guidance?

Is there a place for staging?  The Linux kernel uses them for less stable
code.  Using a staging area does at least two things...
1) Recognizes anyone coming to the table brings their own companies history
and business requirements
2) Allows developers to share ideas that could build in to an approved
model


There are groups that want to get involved and are at various stages of
OpenBMC understanding.  We owe it to them to be very upfront about what the
community will and will not accept.

Thoughts?

Chris Austen

--0__=09BB0B17DFDCCFC38f9e8a93df938690918c09BB0B17DFDCCFC3
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline

<html><body><p><font size=3D"2">For a some time now a question keeps poppin=
g up.  I ask others for an answer and get I different responses.  It's time=
 I bring this to the mailing list for further discussion... what will the O=
penBMC project merge?  If I add my own meta layer will it be accepted?  Wha=
t if I wrote a device driver that satisfies my own hardware needs?  What if=
 I wrote a dbus telemetry monitor with the capability to download results i=
n python?   The </font><a href=3D"https://github.com/openbmc/docs/blob/mast=
er/contributing.md"><font size=3D"2">https://github.com/openbmc/docs/blob/m=
aster/contributing.md</font></a><font size=3D"2"> file goes in to some deta=
il but is pretty blank on the practice of what kind of code will go in.</fo=
nt><br><br><font size=3D"2">So, what should the policy be?</font><br><br><f=
ont size=3D"2">Should the OpenBMC project be a collection of random softwar=
e or a structured framework or somewhere in between?  Some pieces may need =
to be hosted independently... hosting non-comformant parts implies a level =
of support and maintenance which is something we should not be doing.  </fo=
nt><br><br><font size=3D"2">What about code with existing modeled concepts.=
  IPC is done via dbus, LEDs and Sensors too have established meta-phosphor=
 implementations.  Changing those idea would break down the fundamentals of=
 what OpenBMC is.  For models that have not been established yet perhaps th=
e developer should be active on the mailing list describing the issue so th=
at we can provide guidance?</font><br><br><font size=3D"2">Is there a place=
 for staging?  The Linux kernel uses them for less stable code.  Using a st=
aging area does at least two things...</font><br><font size=3D"2">1) Recogn=
izes anyone coming to the table brings their own companies history and busi=
ness requirements</font><br><font size=3D"2">2) Allows developers to share =
ideas that could build in to an approved model </font><br><br><br><font siz=
e=3D"2">There are groups that want to get involved and are at various stage=
s of OpenBMC understanding.  We owe it to them to be very upfront about wha=
t the community will and will not accept.</font><br><br><font size=3D"2">Th=
oughts?</font><br><br><font size=3D"2">Chris Austen<br></font><BR>
</body></html>

--0__=09BB0B17DFDCCFC38f9e8a93df938690918c09BB0B17DFDCCFC3--
