Return-Path: <devenrao@in.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=in.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=devenrao@in.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=in.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40xXWd4sSvzDrbk
 for <openbmc@lists.ozlabs.org>; Fri,  1 Jun 2018 02:11:05 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w4VGB01o074137
 for <openbmc@lists.ozlabs.org>; Thu, 31 May 2018 12:11:02 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [158.85.210.114])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2jajp34s3g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 31 May 2018 12:11:01 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <devenrao@in.ibm.com>;
 Thu, 31 May 2018 16:10:10 -0000
Received: from us1b3-smtp06.a3dr.sjc01.isc4sb.com (10.122.203.184)
 by smtp.notes.na.collabserv.com (10.122.47.58) with
 smtp.notes.na.collabserv.com ESMTP; Thu, 31 May 2018 16:10:07 -0000
Received: from us1b3-mail121.a3dr.sjc01.isc4sb.com ([10.122.203.8])
 by us1b3-smtp06.a3dr.sjc01.isc4sb.com
 with ESMTP id 2018053116100707-648374 ;
 Thu, 31 May 2018 16:10:07 +0000 
Subject: Re: OpenBMC Fix-It
In-Reply-To: <1526955547.469493.1380128576.5075A943@webmail.messagingengine.com>
From: "Devender Rao" <devenrao@in.ibm.com>
To: andrew@aj.id.au
Cc: openbmc@lists.ozlabs.org, yuenn@google.com
Date: Thu, 31 May 2018 16:10:07 +0000
Sensitivity: 
MIME-Version: 1.0
References: <1526955547.469493.1380128576.5075A943@webmail.messagingengine.com>,
 <CADfYTpFfoEe2SvvBAsjL-UAPocC02Z49o-rTDxA7JwA9OagHnw@mail.gmail.com>
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: IBM Verse Build 16007-1287 | IBM Domino Build
 SCN1809300_20180403T0021_FP2 April 18, 2018 at 18:02
X-KeepSent: EA27254A:2F5DEB1F-0025829E:0058D131;
 type=4; name=$KeepSent
X-LLNOutbound: False
X-Disclaimed: 57811
X-TNEFEvaluated: 1
X-LLNXfer: False
x-cbid: 18053116-9695-0000-0000-0000032C8D6C
X-IBM-SpamModules-Scores: BY=0.102565; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.407427; ST=0; TS=0; UL=0; ISC=; MB=0.000377
X-IBM-SpamModules-Versions: BY=3.00009103; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000264; SDB=6.01040369; UDB=6.00532553; IPR=6.00819498; 
 BA=6.00005990; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00021396; XFM=3.00000015;
 UTC=2018-05-31 16:10:09
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2018-05-31 06:38:39 - 6.00008521
x-cbparentid: 18053116-9696-0000-0000-0000E65B8EAC
Message-Id: <OFEA27254A.2F5DEB1F-ON0025829E.0058D131-0025829E.0058D135@notes.na.collabserv.com>
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-05-31_08:, , signatures=0
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
X-List-Received-Date: Thu, 31 May 2018 16:11:10 -0000

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial, H=
elvetica, sans-serif;font-size:10.5pt" ><div dir=3D"ltr" >Hi Nancy,</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >I would like to participate in the fix it week</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Devender</div>
<div dir=3D"ltr" >&nbsp;</div>
<blockquote data-history-content-modified=3D"1" dir=3D"ltr" style=3D"border=
-left:solid #aaaaaa 2px; margin-left:5px; padding-left:5px; direction:ltr; =
margin-right:0px" >----- Original message -----<br>From: Andrew Jeffery &lt=
;andrew@aj.id.au&gt;<br>Sent by: "openbmc" &lt;openbmc-bounces+devenrao=3Di=
n.ibm.com@lists.ozlabs.org&gt;<br>To: Nancy Yuen &lt;yuenn@google.com&gt;, =
OpenBMC Maillist &lt;openbmc@lists.ozlabs.org&gt;<br>Cc:<br>Subject: Re: Op=
enBMC Fix-It<br>Date: Tue, May 22, 2018 7:49 AM<br>&nbsp;
<div><font face=3D"Default Monospace,Courier New,Courier,monospace" size=3D=
"2" >On Wed, 9 May 2018, at 04:58, Nancy Yuen wrote:<br>&gt; Please join my=
 team for an OpenBMC &nbsp;community "fix-it" event in June!<br>&gt;<br>&gt=
; My team is devoting the week of 6/11/-15 to a Google OpenBMC "fix it" as<=
br>&gt; part of a larger fix-it initiative. OpenBMC is a large part of our =
project<br>&gt; so I'd like to spend part of the week on a fix-it on OpenBM=
C.<br>&gt;<br>&gt; I propose to have the fix it on Tues and Wed 6/12 &amp; =
6/13. &nbsp;We could set up<br>&gt; an IRC channel for the fix it where eve=
ryone participating would hang out<br>&gt; for the day. &nbsp;We could pick=
 one or two areas to focus on for those days,<br>&gt; put together a list o=
f things to "fix" in those areas ahead of time. &nbsp;On<br>&gt; the day, w=
e all tackle things on the list (or something not on the list),<br>&gt; dis=
cuss over IRC and do code reviews. &nbsp;Inevitably, people have meetings o=
r<br>&gt; things they can't get out of, but if you can be available for mos=
t of the<br>&gt; day, that would be enough!<br>&gt;<br>&gt; Anyone interest=
ed in participating?<br><br>Count me in :)</font><br>&nbsp;</div></blockquo=
te>
<div dir=3D"ltr" >&nbsp;</div></div><BR>
