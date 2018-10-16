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
 by lists.ozlabs.org (Postfix) with ESMTPS id 42ZJwj1Y5JzF3Vw
 for <openbmc@lists.ozlabs.org>; Wed, 17 Oct 2018 02:23:16 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w9GFM9ft084400
 for <openbmc@lists.ozlabs.org>; Tue, 16 Oct 2018 11:23:13 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [158.85.210.113])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2n5hgv3q6s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 16 Oct 2018 11:23:13 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <sivas.srr@in.ibm.com>;
 Tue, 16 Oct 2018 15:23:12 -0000
Received: from us1b3-smtp01.a3dr.sjc01.isc4sb.com (10.122.7.174)
 by smtp.notes.na.collabserv.com (10.122.47.56) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 16 Oct 2018 15:23:10 -0000
Received: from us1b3-mail65.a3dr.sjc01.isc4sb.com ([10.122.7.228])
 by us1b3-smtp01.a3dr.sjc01.isc4sb.com
 with ESMTP id 2018101615230990-675300 ;
 Tue, 16 Oct 2018 15:23:09 +0000 
In-Reply-To: 
Subject: Test signup &  test cases review
From: "Sivas Srr" <sivas.srr@in.ibm.com>
To: openbmc@lists.ozlabs.org
Date: Tue, 16 Oct 2018 15:23:09 +0000
Sensitivity: 
References: 
MIME-Version: 1.0
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: IBM Verse Build 16616-1491 | IBM Domino Build
 SCN1812108_20180501T0841_FP7 September 27, 2018 at 13:56
X-KeepSent: E211CEB7:ECC7DD39-00258328:0054413B;
 type=4; name=$KeepSent
X-LLNOutbound: False
X-Disclaimed: 12619
X-TNEFEvaluated: 1
x-cbid: 18101615-1529-0000-0000-000004506EC9
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.428813; ST=0; TS=0; UL=0; ISC=; MB=0.272677
X-IBM-SpamModules-Versions: BY=3.00009886; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000268; SDB=6.01103542; UDB=6.00571218; IPR=6.00883594; 
 BA=6.00006123; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00023780; XFM=3.00000015;
 UTC=2018-10-16 15:23:11
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2018-10-16 09:19:22 - 6.00009099
x-cbparentid: 18101615-1530-0000-0000-000048A87B23
Message-Id: <OFE211CEB7.ECC7DD39-ON00258328.0054413B-00258328.00548488@notes.na.collabserv.com>
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-10-16_10:, , signatures=0
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
X-List-Received-Date: Tue, 16 Oct 2018 15:23:18 -0000

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial, H=
elvetica, sans-serif;font-size:10.5pt" ><div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Dear All,</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" ><div>As I am on leave, So cancelling our Thursday (18 Oct=
) instance of our meeting.</div>
<div>&nbsp;</div>
<div>Kindly sign-up for test your loved openbmc functionality.</div>
<div><a href=3D"https://drive.google.com/file/d/1-BuVY802-WRqBlrRmIPOKowEqQ=
-oYPCI/view?usp=3Dsharing" >https://drive.google.com/file/d/1-BuVY802-WRqBl=
rRmIPOKowEqQ-oYPCI/view?usp=3Dsharing</a></div>
<div>&nbsp;</div>
<div>Test cases to be reviewed by development owner and provide feedback by=
 15 Dec 2018.<br style=3D"box-sizing: border-box; color: rgb(36, 41, 46); f=
ont-family: -apple-system, system-ui, &quot;Segoe UI&quot;, Helvetica, Aria=
l, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &=
quot;Segoe UI Symbol&quot;; font-size: 16px; font-style: normal; font-varia=
nt-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-s=
pacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-trans=
form: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text=
-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-s=
tyle: initial; text-decoration-color: initial;" ><a href=3D"https://docs.go=
ogle.com/spreadsheets/d/1TW706qauln3EPQNd11lOzvnRVM8=5F-ll-WCvdxm5NR6Y/edit=
?usp=3Dsharing" >https://docs.google.com/spreadsheets/d/1TW706qauln3EPQNd11=
lOzvnRVM8=5F-ll-WCvdxm5NR6Y/edit?usp=3Dsharing</a></div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>Test results to be published by 31 Jan 2019.</div>
<div>&nbsp;</div>
<div>All dates are proposed date only, we can discuss with Kurt Taylor and =
also get suggestion / opinion from our openbmc community friends as well.</=
div>
<div>&nbsp;</div>
<div>&nbsp;</div>&nbsp;

<div>With regards,</div>
<div>Sivas</div></div></div><BR>
