Return-Path: <rahulmaheshwari@in.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wK6dD0r2kzDqCL
 for <openbmc@lists.ozlabs.org>; Fri,  5 May 2017 19:52:31 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v459mp22062047
 for <openbmc@lists.ozlabs.org>; Fri, 5 May 2017 05:52:28 -0400
Received: from e23smtp01.au.ibm.com (e23smtp01.au.ibm.com [202.81.31.143])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2a8k76jqh3-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 05 May 2017 05:52:28 -0400
Received: from localhost
 by e23smtp01.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <rahulmaheshwari@in.ibm.com>;
 Fri, 5 May 2017 19:51:25 +1000
Received: from d23relay10.au.ibm.com (202.81.31.229)
 by e23smtp01.au.ibm.com (202.81.31.207) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Fri, 5 May 2017 19:51:24 +1000
Received: from d23av02.au.ibm.com (d23av02.au.ibm.com [9.190.235.138])
 by d23relay10.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v459pFrk63832094
 for <openbmc@lists.ozlabs.org>; Fri, 5 May 2017 19:51:23 +1000
Received: from d23av02.au.ibm.com (localhost [127.0.0.1])
 by d23av02.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 v459ojet021906
 for <openbmc@lists.ozlabs.org>; Fri, 5 May 2017 19:50:45 +1000
Received: from d50lp32.co.us.ibm.com (d50lp32.boulder.ibm.com [9.17.249.36])
 by d23av02.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 v459ohBF021526
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <openbmc@lists.ozlabs.org>; Fri, 5 May 2017 19:50:45 +1000
Received: from localhost
 by d50lp32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <rahulmaheshwari@in.ibm.com>;
 Fri, 5 May 2017 03:50:41 -0600
Received: from smtp.notes.na.collabserv.com (192.155.248.82)
 by d50lp32.co.us.ibm.com (192.168.2.143) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128/128)
 Fri, 5 May 2017 03:50:40 -0600
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <rahulmaheshwari@in.ibm.com>;
 Fri, 5 May 2017 09:50:39 -0000
Received: from us1a3-smtp04.a3.dal06.isc4sb.com (10.106.154.237)
 by smtp.notes.na.collabserv.com (10.106.227.105) with
 smtp.notes.na.collabserv.com ESMTP; Fri, 5 May 2017 09:50:37 -0000
Received: from us1a3-mail57.a3.dal09.isc4sb.com ([10.142.3.65])
 by us1a3-smtp04.a3.dal06.isc4sb.com
 with ESMTP id 2017050509503693-251699 ;
 Fri, 5 May 2017 09:50:36 +0000 
In-Reply-To: 
Subject: Consistent naming for physical LED.
From: "Rahul Maheshwari3" <rahulmaheshwari@in.ibm.com>
To: openbmc@lists.ozlabs.org
Date: Fri, 5 May 2017 09:50:37 +0000
Sensitivity: 
References: 
MIME-Version: 1.0
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: IBM Verse Build 14114-1129 | IBM Domino Build SCN_20170424T1816_FP2
 April 27, 2017 at 17:16
X-LLNOutbound: False
X-Disclaimed: 10847
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 17050509-1617-0000-0000-000001CAA29A
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.423878; ST=0; TS=0; UL=0; ISC=; MB=0.000125
X-IBM-SpamModules-Versions: BY=3.00007025; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000209; SDB=6.00856447; UDB=6.00424039; IPR=6.00635715; 
 BA=6.00005326; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015317; XFM=3.00000014;
 UTC=2017-05-05 09:50:38
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2017-05-05 05:31:14 - 6.00006692
x-cbparentid: 17050509-5102-0000-0000-000039E5D092
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-TM-AS-MML: disable
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
Message-Id: <OF867BE263.6CF5588B-ON00258117.003404BD-00258117.003612B8@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-05-05_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=2
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1705050107
X-Mailman-Approved-At: Sat, 06 May 2017 04:03:22 +1000
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
X-List-Received-Date: Fri, 05 May 2017 09:52:32 -0000

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial, H=
elvetica, sans-serif;font-size:10.5pt" ><div dir=3D"ltr" >Hi</div>
<div dir=3D"ltr" >With new xyz interface, I see that physical Identify LED =
is named differently as "id" in Witherspoon and system state led as "beep" =
in Barreleye. Also I see that we have 3rd LED in Witherspoon is&nbsp;"fault=
" (for enclosure fault) and&nbsp;in Barreleye and palmetto "heartbeat" (for=
 BMC state state).</div>
<div dir=3D"ltr" ><div><div>&nbsp;</div>
<div>Can we have same set of name/xyz url for physical LED across different=
 systems?</div>
<div>&nbsp;</div>
<div>Witherspoon<br>&nbsp; &nbsp; "/xyz/openbmc=5Fproject/led/physical/powe=
r", &nbsp; &nbsp; &nbsp; &nbsp; System State LED<br>&nbsp; &nbsp; "/xyz/ope=
nbmc=5Fproject/led/physical/id", &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;Identify LED<br>&nbsp; &nbsp; "/xyz/openbmc=5Fproject/led/phys=
ical/fault" &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Enclosure fault LED</=
div>
<div>Barreleye</div>
<div>&nbsp; &nbsp; "/xyz/openbmc=5Fproject/led/physical/identify", &nbsp; &=
nbsp; &nbsp; &nbsp;Identify LED<br>&nbsp; &nbsp; "/xyz/openbmc=5Fproject/le=
d/physical/beep", &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; System State LED<br>&n=
bsp; &nbsp; "/xyz/openbmc=5Fproject/led/physical/heartbeat" &nbsp; &nbsp; B=
MC state</div>
<div>Palmetto<br>&nbsp; &nbsp; "/xyz/openbmc=5Fproject/led/physical/power",=
 &nbsp; &nbsp; &nbsp; &nbsp; System state<br>&nbsp; &nbsp; "/xyz/openbmc=5F=
project/led/physical/identify", &nbsp; &nbsp; &nbsp; &nbsp;Identify LED<br>=
&nbsp; &nbsp; "/xyz/openbmc=5Fproject/led/physical/heartbeat" &nbsp; &nbsp;=
 BMC state<br>&nbsp;</div></div>
<div>Thanks</div>
<div>Rahul</div></div></div><BR>
