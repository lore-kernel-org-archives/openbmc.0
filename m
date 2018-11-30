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
 by lists.ozlabs.org (Postfix) with ESMTPS id 435tSD3fX8zDrDZ
 for <openbmc@lists.ozlabs.org>; Fri, 30 Nov 2018 23:07:40 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 wAUBwoeS116814
 for <openbmc@lists.ozlabs.org>; Fri, 30 Nov 2018 07:07:36 -0500
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.73])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2p33q9kmp9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 30 Nov 2018 07:07:35 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <sivas.srr@in.ibm.com>;
 Fri, 30 Nov 2018 12:07:35 -0000
Received: from us1a3-smtp08.a3.dal06.isc4sb.com (10.146.103.57)
 by smtp.notes.na.collabserv.com (10.106.227.90) with
 smtp.notes.na.collabserv.com ESMTP; Fri, 30 Nov 2018 12:06:56 -0000
Received: from us1a3-mail65.a3.dal09.isc4sb.com ([10.142.3.169])
 by us1a3-smtp08.a3.dal06.isc4sb.com
 with ESMTP id 2018113012065576-570936 ;
 Fri, 30 Nov 2018 12:06:55 +0000 
In-Reply-To: 
Subject: MoM of 29 Nov Test work group
From: "Sivas Srr" <sivas.srr@in.ibm.com>
To: openbmc@lists.ozlabs.org
Date: Fri, 30 Nov 2018 12:06:55 +0000
Sensitivity: 
References: 
MIME-Version: 1.0
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: IBM Verse Build 16616-1491 | IBM Domino Build
 SCN1812108_20180501T0841_FP17 November 02, 2018 at 16:08
X-LLNOutbound: False
X-Disclaimed: 57011
X-TNEFEvaluated: 1
x-cbid: 18113012-3107-0000-0000-000009203694
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.423878; ST=0; TS=0; UL=0; ISC=; MB=0.351767
X-IBM-SpamModules-Versions: BY=3.00010147; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000270; SDB=6.01124919; UDB=6.00584092; IPR=6.00905046; 
 BA=6.00006167; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00024398; XFM=3.00000015;
 UTC=2018-11-30 12:07:33
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2018-11-30 09:12:50 - 6.00009284
x-cbparentid: 18113012-3108-0000-0000-00001EA13D04
Message-Id: <OF51AC6707.F5F903B6-ON00258355.00410E80-00258355.00428D78@notes.na.collabserv.com>
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-11-30_05:, , signatures=0
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
X-List-Received-Date: Fri, 30 Nov 2018 12:07:41 -0000

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial, H=
elvetica, sans-serif;font-size:10.5pt" ><div dir=3D"ltr" >Dear All,</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Here is the update from yesterday test work group meeting=
.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" ><div>Attendees:&nbsp; Joseph Reynolds, Kaushik Venkatesh,=
 Rahul Maheswari, Nancy &amp; Sivas</div>
<div>(Thursday 29 Nov 2018, 10 PM IST)</div>
<div>&nbsp;</div>
<div>Topic discussed:</div>
<div>&nbsp;</div>
<div><strong>Key test date confirmation:</strong></div>
<div>&nbsp;</div>
<div style=3D"margin-left:36.0pt;" >&nbsp;Based on discussion with Kurt Tay=
lor, &nbsp;Updated Key dates: (And team agreed on it)</div>
<div style=3D"margin-left:36.0pt;" >Target test complete by 31 Jan 2019 bef=
ore the release date 4 Feb 2019</div>
<div style=3D"margin-left:36.0pt;" >&nbsp;</div>
<div><strong>Objective/Goal of Test signoff: </strong></div>
<div>&nbsp;</div>
<ul>        <li>Test plan design based on the development design available,=
</li>        <li>Test cases preparation and automation,</li>        <li>Sha=
re test result in google drive which was agreed upon ( no need to share any=
 internal information)</li></ul>
<div>&nbsp;</div>
<div><strong>Test Sign up Concern: </strong></div>
<div>&nbsp;</div>
<div style=3D"margin-left:36.0pt;" >Not seeing much signing for testing.</d=
iv>
<div style=3D"margin-left:36.0pt;" ><a href=3D"https://drive.google.com/fil=
e/d/1-BuVY802-WRqBlrRmIPOKowEqQ-oYPCI/view" >https://drive.google.com/file/=
d/1-BuVY802-WRqBlrRmIPOKowEqQ-oYPCI/view</a></div>
<div style=3D"margin-left:36.0pt;" >&nbsp;</div>
<div style=3D"margin-left:36.0pt;" >Security test =E2=80=93 Joseph Reynolds=
</div>
<div style=3D"margin-left:36.0pt;" >LDAP =E2=80=93 Sivas</div>
<div style=3D"margin-left:36.0pt;" >IPMI Inband =E2=80=93 Nancy will assign=
 some of her resource to sign up ( priority to complete internal test and t=
hen team will take it up)</div>
<div style=3D"margin-left:36.0pt;" >GUI =E2=80=93 Rahul / Kaushik Venkatesh=
 interested</div>
<div style=3D"margin-left:36.0pt;" >&nbsp;</div>
<div style=3D"margin-left:36.0pt;" >Need more help from other community mem=
bers like Intel and other organization.</div>
<div style=3D"margin-left:36.0pt;" >&nbsp;</div>
<div><strong>&nbsp;Representative from Test group in Release Planning call:=
</strong></div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; As =
Release planning call happen during India mid night time,&nbsp; Joseph Reyn=
olds voluntered to represent Test group and get design updates, code availa=
blity date etc. from Release planning meeting. Thank you Joseph Reynolds.</=
div>
<div style=3D"text-indent:36.0pt;" >&nbsp;</div>
<div style=3D"text-indent:36.0pt;" >There are questions related to new feat=
ure PECI, IPMB, Dynamic Sensor configuration &amp; Scanning where there is =
no design lik and don=E2=80=99t know its progress. And also observing WG le=
ad as null under column J of release planning worksheet (Openbmc release pr=
iorities)</div>
<div>&nbsp;</div>
<div style=3D"text-indent:36.0pt;" >May be need to finalize list of feature=
s and its availability for February release.&nbsp;</div>
<div>&nbsp;</div>
<div><strong>Nancy highlighted that test efforts should be shared and sprea=
d across. </strong></div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div><strong>Action Items:</strong></div>
<div>&nbsp;</div>
<ul>        <li value=3D"NaN" >Sivas to check on Group management and also =
align the feature name same as Release planning worksheet.</li>        <li =
value=3D"NaN" >Joseph Reynolds to add Release planning workgroup meeting an=
d get the updated release planning worksheet with desing link, primary owne=
r, code availability date</li>        <li value=3D"NaN" >Nancy to assign so=
me one to do functional test for IPMI Inband / other test</li></ul>
<div>&nbsp;</div>
<div><strong>Important Links:</strong></div>
<div>&nbsp;</div>
<div>Test workgroup wiki link: <a href=3D"https://github.com/openbmc/openbm=
c/wiki/Test-work-group" >https://github.com/openbmc/openbmc/wiki/Test-work-=
group</a></div>
<div>Test sign up link:&nbsp;&nbsp; <a href=3D"https://drive.google.com/fil=
e/d/1-BuVY802-WRqBlrRmIPOKowEqQ-oYPCI/view?usp=3Dsharing" rel=3D"nofollow" =
>https://drive.google.com/file/d/1-BuVY802-WRqBlrRmIPOKowEqQ-oYPCI/view?usp=
=3Dsharing</a></div>
<div>&nbsp;</div>
<div>Note: Grab Opportunity to give back to community, Thank you in advance=
.&nbsp; And thank you all for those who already contributing in terms of te=
st / automation etc. Appreciate it.</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>With regards,</div>
<div>Sivas</div></div></div><BR>
