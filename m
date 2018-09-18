Return-Path: <jrey@us.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=us.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=jrey@us.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=us.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42FFW94Kv2zDqnK
 for <openbmc@lists.ozlabs.org>; Wed, 19 Sep 2018 06:50:29 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w8IKmhkX097265
 for <openbmc@lists.ozlabs.org>; Tue, 18 Sep 2018 16:50:26 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.75])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2mk7w821nm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 18 Sep 2018 16:50:26 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <jrey@us.ibm.com>;
 Tue, 18 Sep 2018 20:50:25 -0000
Received: from us1a3-smtp07.a3.dal06.isc4sb.com (10.146.103.14)
 by smtp.notes.na.collabserv.com (10.106.227.123) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 18 Sep 2018 20:50:22 -0000
Received: from us1a3-mail269.a3.dal06.isc4sb.com ([10.146.127.27])
 by us1a3-smtp07.a3.dal06.isc4sb.com
 with ESMTP id 2018091820502154-1131750 ;
 Tue, 18 Sep 2018 20:50:21 +0000 
Subject: Re: Re: OpenBMC Hackathon @ OpenPower Summit
In-Reply-To: <mailman.3784.1537302065.438.openbmc@lists.ozlabs.org>
From: "Joseph Reynolds" <jrey@us.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: openbmc@lists.ozlabs.org
Date: Tue, 18 Sep 2018 20:50:21 +0000
Sensitivity: 
References: <mailman.3784.1537302065.438.openbmc@lists.ozlabs.org>
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: IBM Verse Build 16007-1287 | IBM Domino Build
 SCN1812108_20180501T0841_FP1 July 10, 2018 at 11:23
X-LLNOutbound: False
X-Disclaimed: 32579
X-TNEFEvaluated: 1
x-cbid: 18091820-3815-0000-0000-0000082FE457
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.397008; ST=0; TS=0; UL=0; ISC=; MB=0.085565
X-IBM-SpamModules-Versions: BY=3.00009729; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000266; SDB=6.01090260; UDB=6.00563227; IPR=6.00870281; 
 BA=6.00006100; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00023371; XFM=3.00000015;
 UTC=2018-09-18 20:50:24
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2018-09-18 19:08:05 - 6.00008982
x-cbparentid: 18091820-3816-0000-0000-0000D0023564
Message-Id: <OF36A601F8.2CD85D51-ON0025830C.0070FB72-0025830C.00727954@notes.na.collabserv.com>
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: Quoted-printable
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-09-18_08:, , signatures=0
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
X-List-Received-Date: Tue, 18 Sep 2018 20:50:30 -0000

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial, H=
elvetica, sans-serif;font-size:10.5pt" ><blockquote data-history-content-mo=
dified=3D"1" data-history-expanded=3D"1" dir=3D"ltr" style=3D"border-left:s=
olid #aaaaaa 2px; margin-left:5px; padding-left:5px; direction:ltr; margin-=
right:0px" >&nbsp;
<div><font size=3D"2" face=3D"Default Monospace,Courier New,Courier,monospa=
ce" >Message: 5<br>Date: Tue, 18 Sep 2018 15:20:47 -0500<br>From: Andrew Ge=
issler &lt;geissonator@gmail.com&gt;<br>To: sdasari@fb.com<br>Cc: OpenBMC M=
aillist &lt;openbmc@lists.ozlabs.org&gt;, Stewart Smith<br>&lt;stewart@linu=
x.vnet.ibm.com&gt;, &nbsp;Joel Stanley &lt;joel.stan@gmail.com&gt;,<br>Jere=
my Kerr &lt;jk@ozlabs.org&gt;<br>Subject: Re: OpenBMC Hackathon @ OpenPower=
 Summit?<br>Message-ID:<br>&lt;CALLMt=3Dp+dH3e-C2M8L9Zv43vTDw9rcd9MpfcqFXge=
2aTkzk6Hw@mail.gmail.com&gt;<br>Content-Type: text/plain; charset=3D"UTF-8"=
<br><br>On Tue, Sep 18, 2018 at 2:56 PM Sai Dasari &lt;sdasari@fb.com&gt; w=
rote:<br>&gt;<br>&gt; <a href=3D"https://openpowerfoundation.org/summit-201=
8-10-eu/" target=3D"_blank">https://openpowerfoundation.org/summit-2018-10-=
eu/</a><br>&gt; Team,<br>&gt; Saw above agenda mentioning ?OpenBMC Hackatho=
n? and wondering any further details on who from this team is planning to a=
ttend.<br><br>Hey Sai, looks like Stewart, Joel, Jeremy, and myself will al=
l be attending.<br><br>We're just building the agenda now but we were think=
ing some basic<br>overviews, then some kernel hacking, SDK/QEMU hacking (sy=
stemd,<br>journald, service intros), and some customization hacking (adding=
 new<br>machine layer, customizing web UI for your system). &nbsp;Any other=
<br>thoughts/ideas from the group appreciated. &nbsp;</font></div></blockqu=
ote>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >I am interested in this type of {introductory, background=
, how-to} information.&nbsp; Some ideas for you:</div>
<div dir=3D"ltr" >- Can some the presentations or sessions be written up an=
d added to the openbmc/docs repo?&nbsp; It is sometimes hard to find presen=
tations after they are done.&nbsp; It is also much easier to keep details u=
p to date when they are in a plain text format (compared to powerpoint).</d=
iv>
<div dir=3D"ltr" >- As a thought experiment, how much of your presentations=
 can you give by simply referring to existing OpenBMC documentation, such a=
s is in the repos under github.com/openbmc?&nbsp; If you need to explain mo=
re, can that information be added to the OpenBMC docs?</div>
<div dir=3D"ltr" >- When you are at the event, can you get a sense of pain =
points in the documentation?</div>
<div dir=3D"ltr" >- I would be happy to review your presentation before or =
after the event.</div>
<div dir=3D"ltr" >&nbsp;</div>
<blockquote class=3D"history-quote-1537302823164" data-history-content-modi=
fied=3D"1" data-history-expanded=3D"1" dir=3D"ltr" style=3D"border-left:sol=
id #aaaaaa 2px; margin-left:5px; padding-left:5px; direction:ltr; margin-ri=
ght:0px" ><div>&nbsp;</div>
<div><font size=3D"2" face=3D"Default Monospace,Courier New,Courier,monospa=
ce" >The overall goal is to<br>teach people unfamiliar with openbmc how to =
dive in and start hacking<br>at it. The OpenBMC community hackathon will be=
 at the Intel summit<br>middle of next month up in Oregon.<br><br>Andrew<br=
><br>&gt; Thanks,<br>&gt;<br>&gt; Sai.</font><br>&nbsp;</div></blockquote>
<div dir=3D"ltr" >&nbsp;</div></div><BR>
