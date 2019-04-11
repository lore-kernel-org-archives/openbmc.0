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
 by lists.ozlabs.org (Postfix) with ESMTPS id 44g1JP5YrSzDqTG
 for <openbmc@lists.ozlabs.org>; Thu, 11 Apr 2019 22:57:08 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x3BCu36O013594
 for <openbmc@lists.ozlabs.org>; Thu, 11 Apr 2019 08:57:05 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2rt5j7swuc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 11 Apr 2019 08:57:03 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <sivas.srr@in.ibm.com>;
 Thu, 11 Apr 2019 12:57:02 -0000
Received: from us1a3-smtp02.a3.dal06.isc4sb.com (10.106.154.159)
 by smtp.notes.na.collabserv.com (10.106.227.158) with
 smtp.notes.na.collabserv.com ESMTP; Thu, 11 Apr 2019 12:56:56 -0000
Received: from us1a3-mail64.a3.dal09.isc4sb.com ([10.142.3.172])
 by us1a3-smtp02.a3.dal06.isc4sb.com
 with ESMTP id 2019041112565625-495654 ;
 Thu, 11 Apr 2019 12:56:56 +0000 
In-Reply-To: <CAGMNF6VHifnF8qC61HN2bboY8duArOuQ1FvK3mP1gA6Xbazcow@mail.gmail.com>
Subject: Re: BMC health metrics (again!)
From: "Sivas Srr" <sivas.srr@in.ibm.com>
To: kunyi@google.com
Cc: openbmc@lists.ozlabs.org
Date: Thu, 11 Apr 2019 12:56:56 +0000
Sensitivity: 
MIME-Version: 1.0
References: 
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: IBM Verse Build 17394-1588 | IBM Domino Build
 SCN1812108_20180501T0841_FP36 March 27, 2019 at 21:47
X-KeepSent: 97C597AB:3CC72488-002583D9:002BEC19;
 type=4; name=$KeepSent
X-LLNOutbound: False
X-Disclaimed: 12171
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 19041112-6059-0000-0000-00000E2A7C6F
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.407427; ST=0; TS=0; UL=0; ISC=; MB=0.340194
X-IBM-SpamModules-Versions: BY=3.00010908; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000284; SDB=6.01187535; UDB=6.00622048; IPR=6.00968298; 
 BA=6.00006280; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00026393; XFM=3.00000015;
 UTC=2019-04-11 12:57:00
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2019-04-11 10:04:46 - 6.00009790
x-cbparentid: 19041112-6060-0000-0000-000079E8863B
Message-Id: <OF97C597AB.3CC72488-ON002583D9.002BEC19-002583D9.00472178@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-11_08:, , signatures=0
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
X-List-Received-Date: Thu, 11 Apr 2019 12:57:10 -0000

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial, H=
elvetica, sans-serif;font-size:10.5pt" ><div dir=3D"ltr" style=3D"font-fami=
ly:Arial, Helvetica, sans-serif;font-size:10.5pt" ><div dir=3D"ltr" >Thank =
you Kun Yi for your proposal.</div>
<div dir=3D"ltr" >My input starts with word "Response:".</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >With regards,</div>
<div dir=3D"ltr" >Sivas</div>
<div dir=3D"ltr" >&nbsp;</div>
<blockquote data-history-content-modified=3D"1" data-history-expanded=3D"1"=
 dir=3D"ltr" style=3D"border-left:solid #aaaaaa 2px; margin-left:5px; paddi=
ng-left:5px; direction:ltr; margin-right:0px" >----- Original message -----=
<br>From: Kun Yi &lt;kunyi@google.com&gt;<br>Sent by: "openbmc" &lt;openbmc=
-bounces+sivas.srr=3Din.ibm.com@lists.ozlabs.org&gt;<br>To: OpenBMC Maillis=
t &lt;openbmc@lists.ozlabs.org&gt;<br>Cc:<br>Subject: BMC health metrics (a=
gain!)<br>Date: Tue, Apr 9, 2019 9:57 PM<br>&nbsp;<br><font size=3D"3" >Hel=
lo there,</font><br><br><font size=3D"3" >This topic has been brought up se=
veral times on the mailing list and offline, but in general seems we as a c=
ommunity didn't reach a consensus on what things would be the most valuable=
 to monitor, and how to monitor them. While it seems a general purposed mon=
itoring infrastructure for OpenBMC is a hard problem, I have some simple id=
eas that I hope can provide immediate and direct benefits.</font><br><br><f=
ont size=3D"3" >1. Monitoring host IPMI link reliability (host side)</font>=
<br><br><font size=3D"3" >The essentials I want are "IPMI commands sent" an=
d "IPMI commands succeeded" counts over time. More metrics like response ti=
me would be&nbsp;helpful as well. The issue to address here: when some IPMI=
 sensor readings are flaky, it would be really helpful to tell from IPMI co=
mmand stats to determine whether it is a hardware issue, or IPMI issue. Mor=
eover, it would be a very useful regression test metric for rolling out new=
 BMC software.</font><br><br><font size=3D"3" >Looking at the host IPMI sid=
e, there is some metrics exposed through&nbsp;/proc/ipmi/0/si=5Fstats if ip=
mi=5Fsi driver is used, but I haven't dug into whether it contains informat=
ion mapping to the interrupts. Time to read the source code I guess.</font>=
<br><br><font size=3D"3" >Another idea would be to instrument caller librar=
ies like the interfaces in ipmitool, though I feel that approach is harder =
due to fragmentation of IPMI libraries.</font></blockquote>
<div class=3D"history-quote-1554969498636" data-history-expanded=3D"1" dir=
=3D"ltr" style=3D"border-left: 2px solid rgb(170, 170, 170); margin-left: 5=
px; padding-left: 5px; direction: ltr; margin-right: 0px;" ><font size=3D"3=
" >Response: Can we have it as a part of debug / tarball image to get respo=
nse time and this can be used only at that time.</font></div>
<div class=3D"history-quote-1554969498636" data-history-expanded=3D"1" dir=
=3D"ltr" style=3D"border-left: 2px solid rgb(170, 170, 170); margin-left: 5=
px; padding-left: 5px; direction: ltr; margin-right: 0px;" ><font size=3D"3=
" >And more over IPMI interface is not fading away? Will let others to prov=
ide input. </font></div>
<blockquote class=3D"history-quote-1554969498636" data-history-expanded=3D"=
1" dir=3D"ltr" style=3D"border-left:solid #aaaaaa 2px; margin-left:5px; pad=
ding-left:5px; direction:ltr; margin-right:0px" ><br><font size=3D"3" >2. R=
ead and expose core BMC performance metrics from procfs</font><br><br><font=
 size=3D"3" >This is straightforward: have a smallish daemon (or bmc-state-=
manager) read,parse, and process procfs and put values on D-Bus. Core metri=
cs I'm interested in getting through this way: load average, memory, disk u=
sed/available, net stats... The values can then simply be exported as IPMI =
sensors or Redfish resource properties.</font><br><br><font size=3D"3" >A n=
ice byproduct of this effort would be a procfs parsing library. Since diffe=
rent platforms would probably have different monitoring requirements and pr=
ocfs output format has no standard, I'm thinking the user would just provid=
e a configuration file containing list of (procfs path, property regex, D-B=
us property name), and the compile-time&nbsp;generated code to provide an o=
bject for each property.&nbsp;</font><br><br><font size=3D"3" >All of this =
is merely thoughts and nothing concrete. With that said, it would be really=
 great if you could provide some feedback such as "I want this, but I reall=
y need that feature", or let me know it's all implemented already :)</font>=
<br><br><font size=3D"3" >If this seems valuable, after gathering more feed=
back of feature requirements, I'm going to turn them into design docs and u=
pload for review.</font></blockquote>
<blockquote class=3D"history-quote-1554969498636" data-history-expanded=3D"=
1" dir=3D"ltr" style=3D"border-left:solid #aaaaaa 2px; margin-left:5px; pad=
ding-left:5px; direction:ltr; margin-right:0px" >Response: As BMC is small =
embedded system, Do we really need to put this and may need to decide based=
 on memory / flash foot print.</blockquote>
<div class=3D"history-quote-1554969498636" data-history-expanded=3D"1" dir=
=3D"ltr" style=3D"border-left: 2px solid rgb(170, 170, 170); margin-left: 5=
px; padding-left: 5px; direction: ltr; margin-right: 0px;" ><u><strong>Feat=
ure to get even when BMC usage goes &gt; 90%:</strong></u></div>
<blockquote class=3D"history-quote-1554969498636" data-history-expanded=3D"=
1" dir=3D"ltr" style=3D"border-left:solid #aaaaaa 2px; margin-left:5px; pad=
ding-left:5px; direction:ltr; margin-right:0px" >From end user perspective,=
&nbsp; If BMC performance / usages reaches consistently &gt; 90% of BMC CPU=
 utilization / BMC Memory / BMC file system then we should have way to get =
an event accordingly. This will help end user. I feel this is higher priori=
ty.</blockquote>
<blockquote class=3D"history-quote-1554969498636" data-history-expanded=3D"=
1" dir=3D"ltr" style=3D"border-left:solid #aaaaaa 2px; margin-left:5px; pad=
ding-left:5px; direction:ltr; margin-right:0px" >May be based on the event,=
 involved application should try to correct itself.</blockquote>
<div class=3D"history-quote-1554969498636" data-history-expanded=3D"1" dir=
=3D"ltr" style=3D"border-left: 2px solid rgb(170, 170, 170); margin-left: 5=
px; padding-left: 5px; direction: ltr; margin-right: 0px;" >If After this, =
BMC have good foot print then nothing wrong in having small daemon like pro=
cfs and use d-bus to get&nbsp; performance metrics.</div>
<div class=3D"history-quote-1554969498636" data-history-expanded=3D"1" dir=
=3D"ltr" style=3D"border-left: 2px solid rgb(170, 170, 170); margin-left: 5=
px; padding-left: 5px; direction: ltr; margin-right: 0px;" >&nbsp;</div>
<div class=3D"history-quote-1554969498636" data-history-expanded=3D"1" dir=
=3D"ltr" style=3D"border-left: 2px solid rgb(170, 170, 170); margin-left: 5=
px; padding-left: 5px; direction: ltr; margin-right: 0px;" >With regards,</=
div>
<div class=3D"history-quote-1554969498636" data-history-expanded=3D"1" dir=
=3D"ltr" style=3D"border-left: 2px solid rgb(170, 170, 170); margin-left: 5=
px; padding-left: 5px; direction: ltr; margin-right: 0px;" >Sivas</div>
<div class=3D"history-quote-1554969498636" data-history-expanded=3D"1" dir=
=3D"ltr" style=3D"border-left: 2px solid rgb(170, 170, 170); margin-left: 5=
px; padding-left: 5px; direction: ltr; margin-right: 0px;" ><font size=3D"3=
" >-- </font></div>
<blockquote class=3D"history-quote-1554969498636" data-history-expanded=3D"=
1" dir=3D"ltr" style=3D"border-left:solid #aaaaaa 2px; margin-left:5px; pad=
ding-left:5px; direction:ltr; margin-right:0px" ><font size=3D"3" >Regards,=
</font><br><font size=3D"3" >Kun</font></blockquote>
<div dir=3D"ltr" >&nbsp;</div></div></div><BR>
