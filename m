Return-Path: <prkatti1@in.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=in.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=prkatti1@in.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=in.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 445X4F0zTMzDqWx
 for <openbmc@lists.ozlabs.org>; Sat, 23 Feb 2019 00:19:18 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x1MDGbXf143971
 for <openbmc@lists.ozlabs.org>; Fri, 22 Feb 2019 08:19:16 -0500
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.75])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2qtg1twgdq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 22 Feb 2019 08:19:16 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <prkatti1@in.ibm.com>;
 Fri, 22 Feb 2019 13:19:15 -0000
Received: from us1a3-smtp02.a3.dal06.isc4sb.com (10.106.154.159)
 by smtp.notes.na.collabserv.com (10.106.227.123) with
 smtp.notes.na.collabserv.com ESMTP; Fri, 22 Feb 2019 13:19:12 -0000
Received: from us1a3-mail267.a3.dal06.isc4sb.com ([10.146.127.216])
 by us1a3-smtp02.a3.dal06.isc4sb.com
 with ESMTP id 2019022213191209-478458 ;
 Fri, 22 Feb 2019 13:19:12 +0000 
In-Reply-To: 
Subject: Redfish: Network test findings
From: "Prashanth Katti1" <prkatti1@in.ibm.com>
To: openbmc@lists.ozlabs.org
Date: Fri, 22 Feb 2019 13:19:11 +0000
Sensitivity: 
References: 
MIME-Version: 1.0
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: IBM Verse Build 17009-1545 | IBM Domino Build
 SCN1812108_20180501T0841_FP26 January 03, 2019 at 15:20
X-LLNOutbound: False
X-Disclaimed: 21603
X-TNEFEvaluated: 1
x-cbid: 19022213-3815-0000-0000-00000A574262
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.423878; ST=0; TS=0; UL=0; ISC=; MB=0.000000
X-IBM-SpamModules-Versions: BY=3.00010643; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000281; SDB=6.01164742; UDB=6.00608263; IPR=6.00945328; 
 BA=6.00006237; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00025697; XFM=3.00000015;
 UTC=2019-02-22 13:19:14
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2019-02-22 10:07:25 - 6.00009616
x-cbparentid: 19022213-3816-0000-0000-00000E615BBF
Message-Id: <OF7495FEE7.41DE7631-ON002583A9.004907D9-002583A9.00492B2F@notes.na.collabserv.com>
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-02-22_10:, , signatures=0
X-Proofpoint-Spam-Reason: safe
X-Mailman-Approved-At: Mon, 04 Mar 2019 13:02:06 +1100
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
X-List-Received-Date: Fri, 22 Feb 2019 13:19:26 -0000

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial, H=
elvetica, sans-serif;font-size:10.5pt" ><div dir=3D"ltr" ><font size=3D"2" =
style=3D"outline: none; color: rgb(18, 18, 18); font-family: &quot;Helvetic=
a Neue&quot;, Helvetica, Arial, &quot;Lucida Grande&quot;, sans-serif; font=
-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; =
font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; te=
xt-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-=
spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 25=
5, 255); text-decoration-style: initial; text-decoration-color: initial;" >=
Hi Ed Tanous,</font><br style=3D"outline: none; color: rgb(18, 18, 18); fon=
t-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Lucida Grande=
&quot;, sans-serif; font-size: 12px; font-style: normal; font-variant-ligat=
ures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: no=
ne; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-=
width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: in=
itial; text-decoration-color: initial;" ><br style=3D"outline: none; color:=
 rgb(18, 18, 18); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial=
, &quot;Lucida Grande&quot;, sans-serif; font-size: 12px; font-style: norma=
l; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: =
400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0p=
x; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px;=
 -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text=
-decoration-style: initial; text-decoration-color: initial;" ><font size=3D=
"2" style=3D"outline: none; color: rgb(18, 18, 18); font-family: &quot;Helv=
etica Neue&quot;, Helvetica, Arial, &quot;Lucida Grande&quot;, sans-serif; =
font-style: normal; font-variant-ligatures: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start=
; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; w=
ord-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255=
, 255, 255); text-decoration-style: initial; text-decoration-color: initial=
;" >Here are the finding on Network test for bmcweb.</font><br style=3D"out=
line: none; color: rgb(18, 18, 18); font-family: &quot;Helvetica Neue&quot;=
, Helvetica, Arial, &quot;Lucida Grande&quot;, sans-serif; font-size: 12px;=
 font-style: normal; font-variant-ligatures: normal; font-variant-caps: nor=
mal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: star=
t; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(25=
5, 255, 255); text-decoration-style: initial; text-decoration-color: initia=
l;" ><font size=3D"2" style=3D"outline: none; color: rgb(18, 18, 18); font-=
family: &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Lucida Grande&q=
uot;, sans-serif; font-style: normal; font-variant-ligatures: normal; font-=
variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2;=
 text-align: start; text-indent: 0px; text-transform: none; white-space: no=
rmal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; backgro=
und-color: rgb(255, 255, 255); text-decoration-style: initial; text-decorat=
ion-color: initial;" >.<span>&nbsp;</span></font><br style=3D"outline: none=
; color: rgb(18, 18, 18); font-family: &quot;Helvetica Neue&quot;, Helvetic=
a, Arial, &quot;Lucida Grande&quot;, sans-serif; font-size: 12px; font-styl=
e: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-=
weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-in=
dent: 0px; text-transform: none; white-space: normal; widows: 2; word-spaci=
ng: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 25=
5); text-decoration-style: initial; text-decoration-color: initial;" ><font=
 size=3D"2" style=3D"outline: none; color: rgb(18, 18, 18); font-family: &q=
uot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Lucida Grande&quot;, sans=
-serif; font-style: normal; font-variant-ligatures: normal; font-variant-ca=
ps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-alig=
n: start; text-indent: 0px; text-transform: none; white-space: normal; wido=
ws: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color:=
 rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color:=
 initial;" >Could you look into the following issues and let us know.</font=
></div>
<div dir=3D"ltr" >Configure IP address&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp=
;<a href=3D"https://github.com/openbmc/bmcweb/issues/36" >https://github.co=
m/openbmc/bmcweb/issues/36</a><br>&nbsp;Delete IP address&nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;&nbsp;<a href=3D"https://github.com/openbmc/bmcweb/i=
ssues/36" >https://github.com/openbmc/bmcweb/issues/36</a><br>&nbsp;Configu=
re DNS&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<a =
href=3D"https://github.com/openbmc/bmcweb/issues/50" >https://github.com/op=
enbmc/bmcweb/issues/50</a><br>&nbsp;Configure NTP&nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; <a href=3D"https://github.com/openbmc/bmcweb/=
issues/53" >https://github.com/openbmc/bmcweb/issues/53</a><br>&nbsp;Config=
ure VLAN&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<=
a href=3D"https://github.com/openbmc/bmcweb/issues/51" >https://github.com/=
openbmc/bmcweb/issues/51</a><br>&nbsp;Delete VLAN&nbsp;&nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<a href=3D"https://github.=
com/openbmc/bmcweb/issues/51" >https://github.com/openbmc/bmcweb/issues/51<=
/a><br>&nbsp;Configure DHCP(Enable/Disable) <a href=3D"https://github.com/o=
penbmc/bmcweb/issues/52" >https://github.com/openbmc/bmcweb/issues/52</a><b=
r>&nbsp;Configure DHCP options&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;<a href=
=3D"https://github.com/openbmc/bmcweb/issues/52" >https://github.com/openbm=
c/bmcweb/issues/52</a><br>&nbsp;Configure HostName&nbsp;&nbsp; &nbsp;&nbsp;=
&nbsp; &nbsp;<a href=3D"https://github.com/openbmc/bmcweb/issues/44" >https=
://github.com/openbmc/bmcweb/issues/44</a><br>&nbsp;Configure Default Gatae=
way&nbsp;&nbsp; &nbsp;<a href=3D"https://github.com/openbmc/bmcweb/issues/5=
4" >https://github.com/openbmc/bmcweb/issues/54</a><br>&nbsp;Configure MAC =
Address&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;<a href=3D"https://github.com/=
openbmc/bmcweb/issues/43" >https://github.com/openbmc/bmcweb/issues/43</a><=
br style=3D"outline: none; color: rgb(18, 18, 18); font-family: &quot;Helve=
tica Neue&quot;, Helvetica, Arial, &quot;Lucida Grande&quot;, sans-serif; f=
ont-size: 12px; font-style: normal; font-variant-ligatures: normal; font-va=
riant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; t=
ext-align: start; text-indent: 0px; text-transform: none; white-space: norm=
al; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; backgroun=
d-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoratio=
n-color: initial;" ><br style=3D"outline: none; color: rgb(18, 18, 18); fon=
t-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Lucida Grande=
&quot;, sans-serif; font-size: 12px; font-style: normal; font-variant-ligat=
ures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: no=
ne; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-=
width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: in=
itial; text-decoration-color: initial;" ><font size=3D"2" style=3D"outline:=
 none; color: rgb(18, 18, 18); font-family: &quot;Helvetica Neue&quot;, Hel=
vetica, Arial, &quot;Lucida Grande&quot;, sans-serif; font-style: normal; f=
ont-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;=
 letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; t=
ext-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-dec=
oration-style: initial; text-decoration-color: initial;" >Prashanth Katti</=
font></div></div><BR>
