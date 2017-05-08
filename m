Return-Path: <rahulmaheshwari@in.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wM0m30VkYzDqG4
 for <openbmc@lists.ozlabs.org>; Mon,  8 May 2017 21:34:58 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v48BTpD2114965
 for <openbmc@lists.ozlabs.org>; Mon, 8 May 2017 07:34:54 -0400
Received: from e23smtp03.au.ibm.com (e23smtp03.au.ibm.com [202.81.31.145])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2aaj65gfq2-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 08 May 2017 07:34:54 -0400
Received: from localhost
 by e23smtp03.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <rahulmaheshwari@in.ibm.com>;
 Mon, 8 May 2017 20:12:38 +1000
Received: from d23relay09.au.ibm.com (202.81.31.228)
 by e23smtp03.au.ibm.com (202.81.31.209) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Mon, 8 May 2017 20:11:41 +1000
Received: from d23av06.au.ibm.com (d23av06.au.ibm.com [9.190.235.151])
 by d23relay09.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v48AAbX437552348
 for <openbmc@lists.ozlabs.org>; Mon, 8 May 2017 20:10:45 +1000
Received: from d23av06.au.ibm.com (localhost [127.0.0.1])
 by d23av06.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 v48AAC3p031669
 for <openbmc@lists.ozlabs.org>; Mon, 8 May 2017 20:10:12 +1000
Received: from d50lp32.co.us.ibm.com (d50lp32.boulder.ibm.com [9.17.249.36])
 by d23av06.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 v48AAAm8031092
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <openbmc@lists.ozlabs.org>; Mon, 8 May 2017 20:10:12 +1000
Received: from localhost
 by d50lp32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <rahulmaheshwari@in.ibm.com>;
 Mon, 8 May 2017 04:10:02 -0600
Received: from smtp.notes.na.collabserv.com (192.155.248.74)
 by d50lp32.co.us.ibm.com (192.168.2.143) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128/128)
 Mon, 8 May 2017 04:10:00 -0600
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <rahulmaheshwari@in.ibm.com>;
 Mon, 8 May 2017 10:09:59 -0000
Received: from us1a3-smtp07.a3.dal06.isc4sb.com (10.146.103.14)
 by smtp.notes.na.collabserv.com (10.106.227.92) with
 smtp.notes.na.collabserv.com ESMTP; Mon, 8 May 2017 10:09:55 -0000
Received: from us1a3-mail57.a3.dal09.isc4sb.com ([10.142.3.65])
 by us1a3-smtp07.a3.dal06.isc4sb.com
 with ESMTP id 2017050810095498-198382 ;
 Mon, 8 May 2017 10:09:54 +0000 
Subject: Re: Consistent naming for physical LED.
In-Reply-To: <20170505180537.GG25937@heinlein.lan>
From: "Rahul Maheshwari3" <rahulmaheshwari@in.ibm.com>
To: patrick@stwcx.xyz
Cc: openbmc@lists.ozlabs.org
Date: Mon, 8 May 2017 10:09:55 +0000
Sensitivity: 
MIME-Version: 1.0
References: <20170505180537.GG25937@heinlein.lan>,
 <OF867BE263.6CF5588B-ON00258117.003404BD-00258117.003612B8@notes.na.collabserv.com>
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: IBM Verse Build 14114-1129 | IBM Domino Build
 SCN_20170424T1816_FP2.0.1 May 05, 2017 at 12:16
X-LLNOutbound: False
X-Disclaimed: 51311
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 17050810-0008-0000-0000-0000012A9C14
X-IBM-SpamModules-Scores: BY=0.02366; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.417846; ST=0; TS=0; UL=0; ISC=; MB=0.291473
X-IBM-SpamModules-Versions: BY=3.00007034; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000209; SDB=6.00857692; UDB=6.00424875; IPR=6.00637121; 
 BA=6.00005330; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015356; XFM=3.00000014;
 UTC=2017-05-08 10:09:57
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2017-05-08 09:46:48 - 6.00006710
x-cbparentid: 17050810-7582-0000-0000-0000056BC038
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-TM-AS-MML: disable
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
Message-Id: <OF8328B8DE.E0C57A25-ON0025811A.00373812-0025811A.0037D739@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-05-08_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=2
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1705080065
X-Mailman-Approved-At: Mon, 08 May 2017 23:38:24 +1000
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
X-List-Received-Date: Mon, 08 May 2017 11:35:00 -0000

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial, H=
elvetica, sans-serif;font-size:10.5pt" ><div dir=3D"ltr" ><div>Patrick</div>
<div>I was believing that these 3 physical LEDs(Identify, Fault, Power) wil=
l be lit on/off based on group LED asserted state. Example: Physical's faul=
t LED will be lit ON when any fault LED(e.g. cpu0fault) in group is asserte=
d.</div>
<div>If that is not the case and we need to rely on below LED groups to get=
 full system status then - how are we going to display state like blink in =
future using these group LED?</div>
<div>&nbsp;</div>
<div>/xyz/openbmc=5Fproject/led/groups/enclosure=5Ffault<br>/xyz/openbmc=5F=
project/led/groups/enclosure=5Fidentify<br>/xyz/openbmc=5Fproject/led/group=
s/power=5Fon<br>/xyz/openbmc=5Fproject/led/groups/power=5Foff</div>
<div>&nbsp;</div>
<div>Thanks</div>
<div>Rahul</div></div>
<div dir=3D"ltr" >&nbsp;</div>
<blockquote data-history-content-modified=3D"1" dir=3D"ltr" style=3D"border=
-left:solid #aaaaaa 2px; margin-left:5px; padding-left:5px; direction:ltr; =
margin-right:0px" >----- Original message -----<br>From: Patrick Williams &=
lt;patrick@stwcx.xyz&gt;<br>To: Rahul Maheshwari3 &lt;rahulmaheshwari@in.ib=
m.com&gt;<br>Cc: openbmc@lists.ozlabs.org<br>Subject: Re: Consistent naming=
 for physical LED.<br>Date: Fri, May 5, 2017 11:35 PM<br>&nbsp;
<div><font face=3D"Default Monospace,Courier New,Courier,monospace" size=3D=
"2" >On Fri, May 05, 2017 at 09:50:37AM +0000, Rahul Maheshwari3 wrote:<br>=
&gt; &nbsp; &nbsp;Hi<br>&gt; &nbsp; &nbsp;With new xyz interface, I see tha=
t physical Identify LED is named<br>&gt; &nbsp; &nbsp;differently as "id" i=
n Witherspoon and system state led as "beep" in<br>&gt; &nbsp; &nbsp;Barrel=
eye. Also I see that we have 3rd LED in Witherspoon is "fault"<br>&gt; &nbs=
p; &nbsp;(for enclosure fault) and in Barreleye and palmetto "heartbeat" (f=
or<br>&gt; &nbsp; &nbsp;BMC state state).<br>&gt;<br>&gt; &nbsp; &nbsp;Can =
we have same set of name/xyz url for physical LED across different<br>&gt; =
&nbsp; &nbsp;systems?<br>&gt;<br>&gt; &nbsp; &nbsp;Witherspoon<br>&gt; &nbs=
p; &nbsp; &nbsp; &nbsp;"/xyz/openbmc=5Fproject/led/physical/power", &nbsp; =
&nbsp; &nbsp; &nbsp; System State LED<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp;"/=
xyz/openbmc=5Fproject/led/physical/id", &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;Identify LED<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp;"/xyz/o=
penbmc=5Fproject/led/physical/fault" &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; Enclosure<br>&gt; &nbsp; &nbsp;fault LED<br>&gt; &nbsp; &nbsp;Barreleye=
<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp;"/xyz/openbmc=5Fproject/led/physical/id=
entify", &nbsp; &nbsp; &nbsp; &nbsp;Identify LED<br>&gt; &nbsp; &nbsp; &nbs=
p; &nbsp;"/xyz/openbmc=5Fproject/led/physical/beep", &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; System State<br>&gt; &nbsp; &nbsp;LED<br>&gt; &nbsp; &nbsp; &n=
bsp; &nbsp;"/xyz/openbmc=5Fproject/led/physical/heartbeat" &nbsp; &nbsp; BM=
C state<br>&gt; &nbsp; &nbsp;Palmetto<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp;"/=
xyz/openbmc=5Fproject/led/physical/power", &nbsp; &nbsp; &nbsp; &nbsp; Syst=
em state<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp;"/xyz/openbmc=5Fproject/led/phy=
sical/identify", &nbsp; &nbsp; &nbsp; &nbsp;Identify LED<br>&gt; &nbsp; &nb=
sp; &nbsp; &nbsp;"/xyz/openbmc=5Fproject/led/physical/heartbeat" &nbsp; &nb=
sp; BMC state<br>&gt;<br>&gt; &nbsp; &nbsp;Thanks<br>&gt; &nbsp; &nbsp;Rahu=
l<br><br>Rahul,<br><br>We expect those to potentially be generated from boa=
rd schematics and<br>are not intended to be used as a universal identifier =
for anything. &nbsp;We<br>do have requirements on the naming of the LED gro=
ups, which is what we<br>intend users to interact with. &nbsp;What are you =
trying to use the physical<br>LED for that you would like some kind of cons=
istent naming and are you<br>sure the group would not be more appropriate f=
or your purpose?<br><br>--<br>Patrick Williams</font></div>
<div id=3D"MIMEAttachInfoDiv" style=3D"display:none" title=3D"pgp-signature=
|signature.asc" >&nbsp;</div></blockquote>
<div dir=3D"ltr" >&nbsp;</div></div><BR>
