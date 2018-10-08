Return-Path: <sivas.srr@in.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=in.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=sivas.srr@in.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=in.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42T6rQ12wWzF35Q
 for <openbmc@lists.ozlabs.org>; Mon,  8 Oct 2018 15:31:33 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w984TaXF006131
 for <openbmc@lists.ozlabs.org>; Mon, 8 Oct 2018 00:31:30 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.66])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2myyw1rvcr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 08 Oct 2018 00:31:30 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <sivas.srr@in.ibm.com>;
 Mon, 8 Oct 2018 04:31:30 -0000
Received: from us1a3-smtp04.a3.dal06.isc4sb.com (10.106.154.237)
 by smtp.notes.na.collabserv.com (10.106.227.127) with
 smtp.notes.na.collabserv.com ESMTP; Mon, 8 Oct 2018 04:31:26 -0000
Received: from us1a3-mail65.a3.dal09.isc4sb.com ([10.142.3.169])
 by us1a3-smtp04.a3.dal06.isc4sb.com
 with ESMTP id 2018100804312555-34006 ;
 Mon, 8 Oct 2018 04:31:25 +0000 
Subject: Re: In-band IPMI Update over IPMI Blobs
In-Reply-To: <CAO=notxnKj28mUG_GtN-7aBcQvdiO4RaTynGEe8Zc3awb31C5Q@mail.gmail.com>
From: "Sivas Srr" <sivas.srr@in.ibm.com>
To: venture@google.com
Cc: openbmc@lists.ozlabs.org
Date: Mon, 8 Oct 2018 04:31:25 +0000
Sensitivity: 
References: <CAO=notxnKj28mUG_GtN-7aBcQvdiO4RaTynGEe8Zc3awb31C5Q@mail.gmail.com>
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: IBM Verse Build 16007-1287 | IBM Domino Build
 SCN1812108_20180501T0841_FP6 September 23, 2018 at 19:35
X-LLNOutbound: False
X-Disclaimed: 6579
X-TNEFEvaluated: 1
x-cbid: 18100804-6357-0000-0000-000007D146A5
X-IBM-SpamModules-Scores: BY=0.118142; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.397008; ST=0; TS=0; UL=0; ISC=; MB=0.035829
X-IBM-SpamModules-Versions: BY=3.00009839; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000267; SDB=6.01099493; UDB=6.00568785; IPR=6.00879540; 
 BA=6.00006116; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00023655; XFM=3.00000015;
 UTC=2018-10-08 04:31:28
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2018-10-08 00:14:19 - 6.00009066
x-cbparentid: 18100804-6358-0000-0000-00002C47473C
Message-Id: <OFB2E13EB3.61719782-ON00258320.00188DA9-00258320.0018D968@notes.na.collabserv.com>
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: Quoted-printable
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-10-08_02:, , signatures=0
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
X-List-Received-Date: Mon, 08 Oct 2018 04:31:34 -0000

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial, H=
elvetica, sans-serif;font-size:10.5pt" ><div dir=3D"ltr" >Nice Patrick, As =
discussed in test work group meeting,</div>
<div dir=3D"ltr" >Shall we have this feature with identified</div>
<div dir=3D"ltr" >Use case Scenarios -&gt; Requirement -&gt; Design -&gt; T=
est cases</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Because code update is the feature which all end users wi=
ll do at least once.</div>
<div dir=3D"ltr" >We can have a wiki as IPMI Inband code update and then po=
pulate design over there.</div>
<div dir=3D"ltr" >Once design is baselined, we can move it under presentati=
ons / document of github.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Please let know your thoughts.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >&nbsp;</div>
<blockquote data-history-content-modified=3D"1" dir=3D"ltr" style=3D"border=
-left:solid #aaaaaa 2px; margin-left:5px; padding-left:5px; direction:ltr; =
margin-right:0px" >----- Original message -----<br>From: Patrick Venture &l=
t;venture@google.com&gt;<br>Sent by: "openbmc" &lt;openbmc-bounces+sivas.sr=
r=3Din.ibm.com@lists.ozlabs.org&gt;<br>To: OpenBMC Maillist &lt;openbmc@lis=
ts.ozlabs.org&gt;<br>Cc:<br>Subject: In-band IPMI Update over IPMI Blobs<br=
>Date: Fri, Oct 5, 2018 8:16 PM<br>&nbsp;<br><tt><font size=3D"3" face=3D""=
 >For those who have been watching, we have been upstreaming how we</font><=
/tt><br><tt><font size=3D"3" face=3D"" >currently handle in-band updates ov=
er IPMI/LPC/PCI to</font></tt><br><tt><font size=3D"3" face=3D"" >phosphor-=
ipmi-flash. &nbsp;However, recently we also upstreamed a generic</font></tt=
><br><tt><font size=3D"3" face=3D"" >blob interface, phosphor-ipmi-blobs. &=
nbsp;Until</font></tt><br><tt><font size=3D"3" face=3D"" ><a href=3D"https:=
//gerrit.openbmc-project.xyz/13620" target=3D"_blank">https://gerrit.openbm=
c-project.xyz/13620</a> it wasn't a suitable</font></tt><br><tt><font size=
=3D"3" face=3D"" >mechanism for the firmware update due to an inability to =
do a clean</font></tt><br><tt><font size=3D"3" face=3D"" >method mapping be=
tween the protocols.</font></tt><br><br><tt><font size=3D"3" face=3D"" >I'v=
e written up a proposal (downstream for now) to port the</font></tt><br><tt=
><font size=3D"3" face=3D"" >phosphor-ipmi-flash implementation into a blob=
 handler that just goes</font></tt><br><tt><font size=3D"3" face=3D"" >thro=
ugh phosphor-ipmi-blobs. &nbsp;The thinking is to have more things</font></=
tt><br><tt><font size=3D"3" face=3D"" >leverage the generic blob handler in=
stead of having a fully separate</font></tt><br><tt><font size=3D"3" face=
=3D"" >OEM IPMI command set for everything (although phosphor-ipmi-flash go=
es</font></tt><br><tt><font size=3D"3" face=3D"" >over the Firmware Netfn).=
</font></tt><br><br><tt><font size=3D"3" face=3D"" >It's now a pretty trivi=
al transformation, and once the design has some</font></tt><br><tt><font si=
ze=3D"3" face=3D"" >age downstream (1-2 days :D), then I'm going to send it=
 here for</font></tt><br><tt><font size=3D"3" face=3D"" >review.</font></tt=
><br><br><tt><font size=3D"3" face=3D"" >Unless there are obvious objection=
s.</font></tt><br><br><tt><font size=3D"3" face=3D"" >And as food for thoug=
ht, other Blob protocol use-cases in the works:</font></tt><br><tt><font si=
ze=3D"3" face=3D"" >- mechanism for downloading core dumps and crash logs o=
ver IPMI (no</font></tt><br><tt><font size=3D"3" face=3D"" >network access)=
</font></tt><br><tt><font size=3D"3" face=3D"" >- mechanism for sending com=
mands down for special hardware</font></tt><br><tt><font size=3D"3" face=3D=
"" >- mechanism for reading back configuration files for whitelisted debug<=
/font></tt><br><tt><font size=3D"3" face=3D"" >- mechanism for randomly cre=
ating large files such that the flash</font></tt><br><tt><font size=3D"3" f=
ace=3D"" >fills up and the system never boots again.</font></tt><br><br><tt=
><font size=3D"3" face=3D"" >Patrick</font></tt></blockquote>
<div dir=3D"ltr" >&nbsp;</div></div><BR>
