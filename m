Return-Path: <sivas.srr@in.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=in.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=sivas.srr@in.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=in.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42SfqG08vjzDqMh
 for <openbmc@lists.ozlabs.org>; Sun,  7 Oct 2018 21:28:56 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w97ASnCX013806
 for <openbmc@lists.ozlabs.org>; Sun, 7 Oct 2018 06:28:53 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [158.85.210.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2myaaemxe7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Sun, 07 Oct 2018 06:28:52 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <sivas.srr@in.ibm.com>;
 Sun, 7 Oct 2018 10:28:52 -0000
Received: from us1b3-smtp06.a3dr.sjc01.isc4sb.com (10.122.203.184)
 by smtp.notes.na.collabserv.com (10.122.47.39) with
 smtp.notes.na.collabserv.com ESMTP; Sun, 7 Oct 2018 10:28:49 -0000
Received: from us1b3-mail65.a3dr.sjc01.isc4sb.com ([10.122.7.228])
 by us1b3-smtp06.a3dr.sjc01.isc4sb.com
 with ESMTP id 2018100710284812-183255 ;
 Sun, 7 Oct 2018 10:28:48 +0000 
In-Reply-To: 
Subject: MoM of openbmc Test Work group meeting on 4 Oct 2018
From: "Sivas Srr" <sivas.srr@in.ibm.com>
To: openbmc@lists.ozlabs.org, bradleyb@fuzziesquirrel.com
Date: Sun, 7 Oct 2018 10:28:48 +0000
Sensitivity: 
References: 
MIME-Version: 1.0
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: IBM Verse Build 16007-1287 | IBM Domino Build
 SCN1812108_20180501T0841_FP6 September 23, 2018 at 19:35
X-KeepSent: 18E2102F:A3560F5B-0025831F:003918F6;
 type=4; name=$KeepSent
X-LLNOutbound: False
X-Disclaimed: 38927
X-TNEFEvaluated: 1
x-cbid: 18100710-6371-0000-0000-0000046EC05A
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.413459; ST=0; TS=0; UL=0; ISC=; MB=0.256235
X-IBM-SpamModules-Versions: BY=3.00009835; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000267; SDB=6.01099139; UDB=6.00568568; IPR=6.00879179; 
 BA=6.00006116; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00023649; XFM=3.00000015;
 UTC=2018-10-07 10:28:50
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2018-10-07 08:43:13 - 6.00009063
x-cbparentid: 18100710-6372-0000-0000-00005022C847
Message-Id: <OF18E2102F.A3560F5B-ON0025831F.003918F6-0025831F.003991B0@notes.na.collabserv.com>
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-10-07_06:, , signatures=0
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
X-List-Received-Date: Sun, 07 Oct 2018 10:28:59 -0000

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial, H=
elvetica, sans-serif;font-size:10.5pt" ><div dir=3D"ltr" >Dear All,</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Here is MoM of openbmc test work group meeting on 4 Oct 2=
018.</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/openbmc/wiki/Test-w=
ork-group" >https://github.com/openbmc/openbmc/wiki/Test-work-group</a></di=
v>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Kind request to start contributing and serve to the openb=
mc world</div>
<div dir=3D"ltr" >by signing up for testing.</div>
<div dir=3D"ltr" ><a href=3D"https://drive.google.com/file/d/1-BuVY802-WRqB=
lrRmIPOKowEqQ-oYPCI/view?usp=3Dsharing" rel=3D"nofollow" >https://drive.goo=
gle.com/file/d/1-BuVY802-WRqBlrRmIPOKowEqQ-oYPCI/view?usp=3Dsharing</a></di=
v>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Kindly sign up by end of October.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >@bradley Bishop, Would like to have the topic to discuss =
on document on test scenario in openbmc community meeting.</div>
<div dir=3D"ltr" >Basically wants to define scenario -&gt; Requirement-&gt;=
 Design -&gt; Test cases.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" ><strong><u>Agenda for next instance of meeting.</u></stro=
ng></div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" ><p>=E2=80=A2 <strong>1) Proposed Key Dates Discussion</st=
rong></p>
<p>Target test complete by 15 Jan 2019 before the release date 4 Feb 2019</=
p>
<p>HW Emulator Availability - 31 Dec 2018</p>
<p>Test cases to be reviewed by owner and provide feedback - 15 Dec 2018<br=
><a href=3D"https://docs.google.com/spreadsheets/d/1TW706qauln3EPQNd11lOzvn=
RVM8=5F-ll-WCvdxm5NR6Y/edit?usp=3Dsharing" rel=3D"nofollow" >https://docs.g=
oogle.com/spreadsheets/d/1TW706qauln3EPQNd11lOzvnRVM8=5F-ll-WCvdxm5NR6Y/edi=
t?usp=3Dsharing</a></p>
<p>Test results to be published by <strong>31 Jan 2019</strong></p>
<p>=E2=80=A2 2) Common repository (Github / other repository) to share all =
company test results (Google Drive Conformance)</p>
<p>=E2=80=A2 3) FFDC improvement for all generic HW</p>
<p>=E2=80=A2 4) Document on test scenario =E2=80=93 Update from bigger foru=
m</p>
<p>=E2=80=A2 5) Nuvoton Topic: How to test openbmc when BMC is not connecte=
d to the network</p>
<p>OpenBMC Feature Test Sign-on <a href=3D"https://drive.google.com/file/d/=
1-BuVY802-WRqBlrRmIPOKowEqQ-oYPCI/view?usp=3Dsharing" rel=3D"nofollow" >htt=
ps://drive.google.com/file/d/1-BuVY802-WRqBlrRmIPOKowEqQ-oYPCI/view?usp=3Ds=
haring</a></p>
<p>OpenBMC test cases in XL sheet: <a href=3D"https://docs.google.com/sprea=
dsheets/d/14UFFokv6kifk=5F2leUU=5F77yOFSNkv7sCE=5FKEAhaYXkyg/edit?usp=3Dsha=
ring" rel=3D"nofollow" >OpenBMC test cases in XL sheet</a> Updated Version:=
 <a href=3D"https://docs.google.com/spreadsheets/d/1TW706qauln3EPQNd11lOzvn=
RVM8=5F-ll-WCvdxm5NR6Y/edit?usp=3Dsharing" rel=3D"nofollow" >https://docs.g=
oogle.com/spreadsheets/d/1TW706qauln3EPQNd11lOzvnRVM8=5F-ll-WCvdxm5NR6Y/edi=
t?usp=3Dsharing</a></p></div></div><BR>
