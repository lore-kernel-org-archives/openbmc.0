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
 by lists.ozlabs.org (Postfix) with ESMTPS id 42V51f0MHTzF3MR
 for <openbmc@lists.ozlabs.org>; Wed, 10 Oct 2018 05:12:53 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w99I4Hsq088003
 for <openbmc@lists.ozlabs.org>; Tue, 9 Oct 2018 14:12:51 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [158.85.210.109])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2n105y33ek-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 09 Oct 2018 14:12:50 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <sivas.srr@in.ibm.com>;
 Tue, 9 Oct 2018 18:12:50 -0000
Received: from us1b3-smtp06.a3dr.sjc01.isc4sb.com (10.122.203.184)
 by smtp.notes.na.collabserv.com (10.122.47.48) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 9 Oct 2018 18:12:46 -0000
Received: from us1b3-mail65.a3dr.sjc01.isc4sb.com ([10.122.7.228])
 by us1b3-smtp06.a3dr.sjc01.isc4sb.com
 with ESMTP id 2018100918124575-783330 ;
 Tue, 9 Oct 2018 18:12:45 +0000 
Subject: Re: In-band IPMI Update over IPMI Blobs
In-Reply-To: <CAO=notydThsUDN+8Vw1KLGh1YmLnS-S9fzvMGr=sk3WwHsSV1Q@mail.gmail.com>
From: "Sivas Srr" <sivas.srr@in.ibm.com>
To: venture@google.com
Cc: openbmc@lists.ozlabs.org
Date: Tue, 9 Oct 2018 18:12:46 +0000
Sensitivity: 
References: <CAO=notydThsUDN+8Vw1KLGh1YmLnS-S9fzvMGr=sk3WwHsSV1Q@mail.gmail.com>,
 <CAO=notxnKj28mUG_GtN-7aBcQvdiO4RaTynGEe8Zc3awb31C5Q@mail.gmail.com>
 <OFB2E13EB3.61719782-ON00258320.00188DA9-00258320.0018D968@notes.na.collabserv.com>
 <CAO=notw=12OD1PRaOh1G7iWxgd-D_oU6FXy_Tyj5Gjnv2TFdww@mail.gmail.com>
 <OF52FCD065.2F4D9B00-ON00258320.00521B13-00258320.00525C58@notes.na.collabserv.com>
 <CAO=notyEVo_o+BazyRAvqBD6uW6QTj4azLBcOfutzuZ7=L8mPg@mail.gmail.com>
 <CAO=notxBdVwRNTc2-tHQW_H+KTHBJTn64os9OnFRCeD2EQtJag@mail.gmail.com>
 <OF8FA802D2.4C9B6633-ON00258321.00148559-00258321.0014855D@notes.na.collabserv.com>
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: IBM Verse Build 16616-1491 | IBM Domino Build
 SCN1812108_20180501T0841_FP7 September 27, 2018 at 13:56
X-KeepSent: A53F09B0:66FB304B-00258321:0063F01E;
 type=4; name=$KeepSent
X-LLNOutbound: False
X-Disclaimed: 33403
X-TNEFEvaluated: 1
x-cbid: 18100918-3721-0000-0000-000004B7CC39
X-IBM-SpamModules-Scores: BY=0.117976; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.422781; ST=0; TS=0; UL=0; ISC=; MB=0.135652
X-IBM-SpamModules-Versions: BY=3.00009849; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000268; SDB=6.01100245; UDB=6.00569237; IPR=6.00880294; 
 BA=6.00006118; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00023684; XFM=3.00000015;
 UTC=2018-10-09 18:12:48
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2018-10-09 17:13:19 - 6.00009072
x-cbparentid: 18100918-3722-0000-0000-0000D945E73E
Message-Id: <OFA53F09B0.66FB304B-ON00258321.0063F01E-00258321.00640BBE@notes.na.collabserv.com>
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: Quoted-printable
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-10-09_12:, , signatures=0
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
X-List-Received-Date: Tue, 09 Oct 2018 18:12:54 -0000

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial, H=
elvetica, sans-serif;font-size:10.5pt" ><div dir=3D"ltr" >May be baselined =
document link can be populated in wiki for a given function, with both desi=
gn doc / test plan doc.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Or as mentioned by you (Patrick) in same document, we can=
 have test details as well. All at one place.</div>
<div dir=3D"ltr" >&nbsp;</div>
<blockquote data-history-content-modified=3D"1" dir=3D"ltr" style=3D"border=
-left:solid #aaaaaa 2px; margin-left:5px; padding-left:5px; direction:ltr; =
margin-right:0px" >----- Original message -----<br>From: Patrick Venture &l=
t;venture@google.com&gt;<br>To: Sivas Srr &lt;sivas.srr@in.ibm.com&gt;, Ope=
nBMC Maillist &lt;openbmc@lists.ozlabs.org&gt;<br>Cc:<br>Subject: Re: In-ba=
nd IPMI Update over IPMI Blobs<br>Date: Tue, Oct 9, 2018 10:09 PM<br>&nbsp;=
<br><tt><font size=3D"3" face=3D"" >On Mon, Oct 8, 2018 at 8:44 PM Sivas Sr=
r &lt;sivas.srr@in.ibm.com&gt; wrote:</font></tt><br><tt><font size=3D"3" f=
ace=3D"" >&gt;</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&nbsp;Our=
 parent wiki, Patrick.</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&=
nbsp;<a href=3D"https://github.com/openbmc/openbmc/wiki" target=3D"_blank">=
https://github.com/openbmc/openbmc/wiki</a></font></tt><br><br><tt><font si=
ze=3D"3" face=3D"" >I don't see a mechanism for comment or review with wiki=
 pages, so I</font></tt><br><tt><font size=3D"3" face=3D"" >think it makes =
more sense to publish the design to openbmc/docs with</font></tt><br><tt><f=
ont size=3D"3" face=3D"" >the testing details etc, as a review and gather c=
omments.</font></tt><br><br><tt><font size=3D"3" face=3D"" >&gt;</font></tt=
><br><tt><font size=3D"3" face=3D"" >&gt;</font></tt><br><tt><font size=3D"=
3" face=3D"" >&gt;&nbsp;----- Original message -----</font></tt><br><tt><fo=
nt size=3D"3" face=3D"" >&gt;&nbsp;From: Patrick Venture &lt;venture@google=
.com&gt;</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&nbsp;To: Sivas=
 Srr &lt;sivas.srr@in.ibm.com&gt;, OpenBMC Maillist &lt;openbmc@lists.ozlab=
s.org&gt;</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&nbsp;Cc:</fon=
t></tt><br><tt><font size=3D"3" face=3D"" >&gt;&nbsp;Subject: Re: In-band I=
PMI Update over IPMI Blobs</font></tt><br><tt><font size=3D"3" face=3D"" >&=
gt;&nbsp;Date: Tue, Oct 9, 2018 4:54 AM</font></tt><br><tt><font size=3D"3"=
 face=3D"" >&gt;</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&nbsp;O=
n Mon, Oct 8, 2018 at 4:23 PM Patrick Venture &lt;venture@google.com&gt; wr=
ote:</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&nbsp;&gt;</font></=
tt><br><tt><font size=3D"3" face=3D"" >&gt;&nbsp;&gt; On Mon, Oct 8, 2018 a=
t 7:59 AM Sivas Srr &lt;sivas.srr@in.ibm.com&gt; wrote:</font></tt><br><tt>=
<font size=3D"3" face=3D"" >&gt;&nbsp;&gt; &gt;</font></tt><br><tt><font si=
ze=3D"3" face=3D"" >&gt;&nbsp;&gt; &gt;&nbsp;Yes Patrick, Would like to hav=
e Wiki for each function.</font></tt><br><tt><font size=3D"3" face=3D"" >&g=
t;&nbsp;&gt; &gt;</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&nbsp;=
&gt; &gt;&nbsp;And would like to see following in that:</font></tt><br><tt>=
<font size=3D"3" face=3D"" >&gt;&nbsp;&gt; &gt;</font></tt><br><tt><font si=
ze=3D"3" face=3D"" >&gt;&nbsp;&gt; &gt;</font></tt><br><tt><font size=3D"3"=
 face=3D"" >&gt;&nbsp;&gt; &gt;&nbsp;Use case scenarios</font></tt><br><tt>=
<font size=3D"3" face=3D"" >&gt;&nbsp;&gt; &gt;&nbsp;Requirements</font></t=
t><br><tt><font size=3D"3" face=3D"" >&gt;&nbsp;&gt; &gt;&nbsp;Design</font=
></tt><br><tt><font size=3D"3" face=3D"" >&gt;&nbsp;&gt; &gt;&nbsp;Test Cas=
es - Unit / Functional</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&=
nbsp;&gt;</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&nbsp;&gt; So =
which wiki should I use?</font></tt><br><tt><font size=3D"3" face=3D"" >&gt=
;&nbsp;&gt;</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&nbsp;&gt; &=
gt;</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&nbsp;&gt; &gt;</fon=
t></tt><br><tt><font size=3D"3" face=3D"" >&gt;&nbsp;&gt; &gt;</font></tt><=
br><tt><font size=3D"3" face=3D"" >&gt;&nbsp;&gt; &gt;</font></tt><br><tt><=
font size=3D"3" face=3D"" >&gt;&nbsp;&gt; &gt;</font></tt><br><tt><font siz=
e=3D"3" face=3D"" >&gt;&nbsp;&gt; &gt;&nbsp;----- Original message -----</f=
ont></tt><br><tt><font size=3D"3" face=3D"" >&gt;&nbsp;&gt; &gt;&nbsp;From:=
 Patrick Venture &lt;venture@google.com&gt;</font></tt><br><tt><font size=
=3D"3" face=3D"" >&gt;&nbsp;&gt; &gt;&nbsp;To: Sivas Srr &lt;sivas.srr@in.i=
bm.com&gt;</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&nbsp;&gt; &g=
t;&nbsp;Cc:</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&nbsp;&gt; &=
gt;&nbsp;Subject: Re: In-band IPMI Update over IPMI Blobs</font></tt><br><t=
t><font size=3D"3" face=3D"" >&gt;&nbsp;&gt; &gt;&nbsp;Date: Mon, Oct 8, 20=
18 7:55 PM</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&nbsp;&gt; &g=
t;</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&nbsp;&gt; &gt;&nbsp;=
On Sun, Oct 7, 2018 at 9:31 PM Sivas Srr &lt;sivas.srr@in.ibm.com&gt; wrote=
:</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&nbsp;&gt; &gt;&nbsp;&=
gt;</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&nbsp;&gt; &gt;&nbsp=
;&gt; Nice Patrick, As discussed in test work group meeting,</font></tt><br=
><tt><font size=3D"3" face=3D"" >&gt;&nbsp;&gt; &gt;&nbsp;&gt; Shall we hav=
e this feature with identified</font></tt><br><tt><font size=3D"3" face=3D"=
" >&gt;&nbsp;&gt; &gt;&nbsp;&gt; Use case Scenarios -&gt; Requirement -&gt;=
 Design -&gt; Test cases</font></tt><br><tt><font size=3D"3" face=3D"" >&gt=
;&nbsp;&gt; &gt;&nbsp;&gt;</font></tt><br><tt><font size=3D"3" face=3D"" >&=
gt;&nbsp;&gt; &gt;&nbsp;&gt; Because code update is the feature which all e=
nd users will do at least once.</font></tt><br><tt><font size=3D"3" face=3D=
"" >&gt;&nbsp;&gt; &gt;&nbsp;&gt; We can have a wiki as IPMI Inband code up=
date and then populate design over there.</font></tt><br><tt><font size=3D"=
3" face=3D"" >&gt;&nbsp;&gt; &gt;&nbsp;&gt; Once design is baselined, we ca=
n move it under presentations / document of github.</font></tt><br><tt><fon=
t size=3D"3" face=3D"" >&gt;&nbsp;&gt; &gt;&nbsp;&gt;</font></tt><br><tt><f=
ont size=3D"3" face=3D"" >&gt;&nbsp;&gt; &gt;&nbsp;&gt; Please let know you=
r thoughts.</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&nbsp;&gt; &=
gt;</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&nbsp;&gt; &gt;&nbsp=
;I don't understand your email. &nbsp;Are you saying there should be a wiki=
</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&nbsp;&gt; &gt;&nbsp;wh=
ere the design lives while it's under review? &nbsp;Or are the test cases</=
font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&nbsp;&gt; &gt;&nbsp;goin=
g under the wiki? &nbsp;And isn't it all under github?</font></tt><br><tt><=
font size=3D"3" face=3D"" >&gt;&nbsp;&gt; &gt;</font></tt><br><tt><font siz=
e=3D"3" face=3D"" >&gt;&nbsp;&gt; &gt;&nbsp;&gt;</font></tt><br><tt><font s=
ize=3D"3" face=3D"" >&gt;&nbsp;&gt; &gt;&nbsp;&gt;</font></tt><br><tt><font=
 size=3D"3" face=3D"" >&gt;&nbsp;&gt; &gt;&nbsp;&gt;</font></tt><br><tt><fo=
nt size=3D"3" face=3D"" >&gt;&nbsp;&gt; &gt;&nbsp;&gt; ----- Original messa=
ge -----</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&nbsp;&gt; &gt;=
&nbsp;&gt; From: Patrick Venture &lt;venture@google.com&gt;</font></tt><br>=
<tt><font size=3D"3" face=3D"" >&gt;&nbsp;&gt; &gt;&nbsp;&gt; Sent by: "ope=
nbmc" &lt;openbmc-bounces+sivas.srr=3Din.ibm.com@lists.ozlabs.org&gt;</font=
></tt><br><tt><font size=3D"3" face=3D"" >&gt;&nbsp;&gt; &gt;&nbsp;&gt; To:=
 OpenBMC Maillist &lt;openbmc@lists.ozlabs.org&gt;</font></tt><br><tt><font=
 size=3D"3" face=3D"" >&gt;&nbsp;&gt; &gt;&nbsp;&gt; Cc:</font></tt><br><tt=
><font size=3D"3" face=3D"" >&gt;&nbsp;&gt; &gt;&nbsp;&gt; Subject: In-band=
 IPMI Update over IPMI Blobs</font></tt><br><tt><font size=3D"3" face=3D"" =
>&gt;&nbsp;&gt; &gt;&nbsp;&gt; Date: Fri, Oct 5, 2018 8:16 PM</font></tt><b=
r><tt><font size=3D"3" face=3D"" >&gt;&nbsp;&gt; &gt;&nbsp;&gt;</font></tt>=
<br><tt><font size=3D"3" face=3D"" >&gt;&nbsp;&gt; &gt;&nbsp;&gt; For those=
 who have been watching, we have been upstreaming how we</font></tt><br><tt=
><font size=3D"3" face=3D"" >&gt;&nbsp;&gt; &gt;&nbsp;&gt; currently handle=
 in-band updates over IPMI/LPC/PCI to</font></tt><br><tt><font size=3D"3" f=
ace=3D"" >&gt;&nbsp;&gt; &gt;&nbsp;&gt; phosphor-ipmi-flash. &nbsp;However,=
 recently we also upstreamed a generic</font></tt><br><tt><font size=3D"3" =
face=3D"" >&gt;&nbsp;&gt; &gt;&nbsp;&gt; blob interface, phosphor-ipmi-blob=
s. &nbsp;Until</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&nbsp;&gt=
; &gt;&nbsp;&gt; <a href=3D"https://gerrit.openbmc-project.xyz/13620" targe=
t=3D"_blank">https://gerrit.openbmc-project.xyz/13620</a> it wasn't a suita=
ble</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&nbsp;&gt; &gt;&nbsp=
;&gt; mechanism for the firmware update due to an inability to do a clean</=
font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&nbsp;&gt; &gt;&nbsp;&gt;=
 method mapping between the protocols.</font></tt><br><tt><font size=3D"3" =
face=3D"" >&gt;&nbsp;&gt; &gt;&nbsp;&gt;</font></tt><br><tt><font size=3D"3=
" face=3D"" >&gt;&nbsp;&gt; &gt;&nbsp;&gt; I've written up a proposal (down=
stream for now) to port the</font></tt><br><tt><font size=3D"3" face=3D"" >=
&gt;&nbsp;&gt; &gt;&nbsp;&gt; phosphor-ipmi-flash implementation into a blo=
b handler that just goes</font></tt><br><tt><font size=3D"3" face=3D"" >&gt=
;&nbsp;&gt; &gt;&nbsp;&gt; through phosphor-ipmi-blobs. &nbsp;The thinking =
is to have more things</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&=
nbsp;&gt; &gt;&nbsp;&gt; leverage the generic blob handler instead of havin=
g a fully separate</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&nbsp=
;&gt; &gt;&nbsp;&gt; OEM IPMI command set for everything (although phosphor=
-ipmi-flash goes</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&nbsp;&=
gt; &gt;&nbsp;&gt; over the Firmware Netfn).</font></tt><br><tt><font size=
=3D"3" face=3D"" >&gt;&nbsp;&gt; &gt;&nbsp;&gt;</font></tt><br><tt><font si=
ze=3D"3" face=3D"" >&gt;&nbsp;&gt; &gt;&nbsp;&gt; It's now a pretty trivial=
 transformation, and once the design has some</font></tt><br><tt><font size=
=3D"3" face=3D"" >&gt;&nbsp;&gt; &gt;&nbsp;&gt; age downstream (1-2 days :D=
), then I'm going to send it here for</font></tt><br><tt><font size=3D"3" f=
ace=3D"" >&gt;&nbsp;&gt; &gt;&nbsp;&gt; review.</font></tt><br><tt><font si=
ze=3D"3" face=3D"" >&gt;&nbsp;&gt; &gt;&nbsp;&gt;</font></tt><br><tt><font =
size=3D"3" face=3D"" >&gt;&nbsp;&gt; &gt;&nbsp;&gt; Unless there are obviou=
s objections.</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&nbsp;&gt;=
 &gt;&nbsp;&gt;</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&nbsp;&g=
t; &gt;&nbsp;&gt; And as food for thought, other Blob protocol use-cases in=
 the works:</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&nbsp;&gt; &=
gt;&nbsp;&gt; - mechanism for downloading core dumps and crash logs over IP=
MI (no</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&nbsp;&gt; &gt;&n=
bsp;&gt; network access)</font></tt><br><tt><font size=3D"3" face=3D"" >&gt=
;&nbsp;&gt; &gt;&nbsp;&gt; - mechanism for sending commands down for specia=
l hardware</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&nbsp;&gt; &g=
t;&nbsp;&gt; - mechanism for reading back configuration files for whitelist=
ed debug</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&nbsp;&gt; &gt;=
&nbsp;&gt; - mechanism for randomly creating large files such that the flas=
h</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&nbsp;&gt; &gt;&nbsp;&=
gt; fills up and the system never boots again.</font></tt><br><tt><font siz=
e=3D"3" face=3D"" >&gt;&nbsp;&gt; &gt;&nbsp;&gt;</font></tt><br><tt><font s=
ize=3D"3" face=3D"" >&gt;&nbsp;&gt; &gt;&nbsp;&gt; Patrick</font></tt><br><=
tt><font size=3D"3" face=3D"" >&gt;&nbsp;&gt; &gt;&nbsp;&gt;</font></tt><br=
><tt><font size=3D"3" face=3D"" >&gt;&nbsp;&gt; &gt;&nbsp;&gt;</font></tt><=
br><tt><font size=3D"3" face=3D"" >&gt;&nbsp;&gt; &gt;&nbsp;&gt;</font></tt=
><br><tt><font size=3D"3" face=3D"" >&gt;&nbsp;&gt; &gt;</font></tt><br><tt=
><font size=3D"3" face=3D"" >&gt;&nbsp;&gt; &gt;</font></tt><br><tt><font s=
ize=3D"3" face=3D"" >&gt;&nbsp;&gt; &gt;</font></tt><br><tt><font size=3D"3=
" face=3D"" >&gt;&nbsp;+OpenBMC Maillist</font></tt><br><tt><font size=3D"3=
" face=3D"" >&gt;</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;</font=
></tt><br><tt><font size=3D"3" face=3D"" >&gt;</font></tt></blockquote>
<div dir=3D"ltr" >&nbsp;</div></div><BR>
