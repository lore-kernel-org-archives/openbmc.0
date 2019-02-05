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
 by lists.ozlabs.org (Postfix) with ESMTPS id 43tyvX2v6zzDqKS
 for <openbmc@lists.ozlabs.org>; Tue,  5 Feb 2019 19:50:14 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x158iAef021189
 for <openbmc@lists.ozlabs.org>; Tue, 5 Feb 2019 03:50:12 -0500
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [158.85.210.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2qf73y0j34-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 05 Feb 2019 03:50:12 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <sivas.srr@in.ibm.com>;
 Tue, 5 Feb 2019 08:50:12 -0000
Received: from us1b3-smtp04.a3dr.sjc01.isc4sb.com (10.122.203.161)
 by smtp.notes.na.collabserv.com (10.122.47.39) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 5 Feb 2019 08:50:10 -0000
Received: from us1b3-mail65.a3dr.sjc01.isc4sb.com ([10.122.7.228])
 by us1b3-smtp04.a3dr.sjc01.isc4sb.com
 with ESMTP id 2019020508500999-247317 ;
 Tue, 5 Feb 2019 08:50:09 +0000 
In-Reply-To: 
Subject: 2.6 Master test result update
From: "Sivas Srr" <sivas.srr@in.ibm.com>
To: openbmc@lists.ozlabs.org
Date: Tue, 5 Feb 2019 08:50:09 +0000
Sensitivity: 
References: 
MIME-Version: 1.0
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: IBM Verse Build 17009-1545 | IBM Domino Build
 SCN1812108_20180501T0841_FP26 January 03, 2019 at 15:20
X-KeepSent: 2462F2B0:99064954-00258398:002ED4F7;
 type=4; name=$KeepSent
X-LLNOutbound: False
X-Disclaimed: 61123
X-TNEFEvaluated: 1
x-cbid: 19020508-6371-0000-0000-000005705BB1
X-IBM-SpamModules-Scores: BY=0.000001; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.413459; ST=0; TS=0; UL=0; ISC=; MB=0.285041
X-IBM-SpamModules-Versions: BY=3.00010539; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000279; SDB=6.01156602; UDB=6.00603320; IPR=6.00937089; 
 BA=6.00006221; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00025443; XFM=3.00000015;
 UTC=2019-02-05 08:50:11
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2019-02-05 04:46:54 - 6.00009549
x-cbparentid: 19020508-6372-0000-0000-0000DA8F842A
Message-Id: <OF2462F2B0.99064954-ON00258398.002ED4F7-00258398.003089B7@notes.na.collabserv.com>
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-02-05_03:, , signatures=0
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
X-List-Received-Date: Tue, 05 Feb 2019 08:50:17 -0000

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial, H=
elvetica, sans-serif;font-size:10.5pt" ><div dir=3D"ltr" >Hi All,</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Here with sending BMC community test release update:</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >BMC Master community release test result folder: <a href=
=3D"https://drive.google.com/drive/folders/1eBTVYVa6tOhzKlZg5iK10Y323UsJve8=
A?usp=3Dsharing" >https://drive.google.com/drive/folders/1eBTVYVa6tOhzKlZg5=
iK10Y323UsJve8A?usp=3Dsharing</a></div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" ><u><strong>BMC 2.6 Master community release test: </stron=
g></u></div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >BMC Version:2.6.0-rc1-135-g16e11aa:</div>
<div dir=3D"ltr" >Total Test: 173</div>
<div dir=3D"ltr" >Total Passed: 167</div>
<div dir=3D"ltr" >We have issues opened for 6 TC failures.</div>
<div dir=3D"ltr" >File Name: bmcweb=5Fredfish=5F2.6.0-rc1-135-g16e11aa=5FWi=
therspoon.csv</div>
<div dir=3D"ltr" ><a href=3D"https://drive.google.com/open?id=3D1jpGhs3SwcL=
ZTpgSxD-zzDfPfWgwdOhKi" >https://drive.google.com/open?id=3D1jpGhs3SwcLZTpg=
SxD-zzDfPfWgwdOhKi</a></div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" ><u><strong>GUI Test: </strong></u></div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Test Document located @:</div>
<div dir=3D"ltr" ><a href=3D"https://drive.google.com/open?id=3D1r6ywc3G5ZW=
4IBY6=5FiikvocJDTLRbvW2r" >https://drive.google.com/open?id=3D1r6ywc3G5ZW4I=
BY6=5FiikvocJDTLRbvW2r</a></div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Total Test: 75</div>
<div dir=3D"ltr" >Total Pass: 74</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >User Management related TC failed and issue opened, Devel=
opment had reverted</div>
<div dir=3D"ltr" >the changes and retested and works fine.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" ><u><strong>Security:</strong></u></div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Security related test done and didnt observe any major wo=
rrying issues at this time.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Also tested bmc2.6-thud release as well.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Note:</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Special thanks to the team ( George, Rahul Maheswari, Jos=
eph Reynolds, Kaushik, Arpana ). And keep up</div>
<div dir=3D"ltr" >the good work folks.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Others, We have tested using Witherspoon box, In case if =
any of our community member(s) who tested with</div>
<div dir=3D"ltr" >other platform, Please upload your result at <a href=3D"h=
ttps://drive.google.com/drive/folders/1eBTVYVa6tOhzKlZg5iK10Y323UsJve8A?usp=
=3Dsharing" >https://drive.google.com/drive/folders/1eBTVYVa6tOhzKlZg5iK10Y=
323UsJve8A?usp=3Dsharing . </a>Thank you in advance Team.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Based on the last community test group call, Google team =
also tested the master and they didnt observe any noticeable issues. Thank =
you Nancy for your update.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >With regards,</div>
<div dir=3D"ltr" >Sivas</div></div><BR>
