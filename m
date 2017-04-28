Return-Path: <ojayanth@in.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wDtvk4JwTzDq5W
 for <openbmc@lists.ozlabs.org>; Fri, 28 Apr 2017 22:50:26 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v3SCo9Zo123290
 for <openbmc@lists.ozlabs.org>; Fri, 28 Apr 2017 08:50:18 -0400
Received: from e28smtp04.in.ibm.com (e28smtp04.in.ibm.com [125.16.236.4])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2a3fk8dh5a-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 28 Apr 2017 08:50:17 -0400
Received: from localhost
 by e28smtp04.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <ojayanth@in.ibm.com>;
 Fri, 28 Apr 2017 18:20:07 +0530
Received: from d28relay10.in.ibm.com (9.184.220.161)
 by e28smtp04.in.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Fri, 28 Apr 2017 18:20:05 +0530
Received: from d28av08.in.ibm.com (d28av08.in.ibm.com [9.184.220.148])
 by d28relay10.in.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v3SCmbJe19792052
 for <openbmc@lists.ozlabs.org>; Fri, 28 Apr 2017 18:18:37 +0530
Received: from d28av08.in.ibm.com (localhost [127.0.0.1])
 by d28av08.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 v3SCo5cs032654
 for <openbmc@lists.ozlabs.org>; Fri, 28 Apr 2017 18:20:05 +0530
Received: from d50lp01.ny.us.ibm.com (d50lp01.pok.ibm.com [146.89.104.207])
 by d28av08.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 v3SCo2VJ032629
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Fri, 28 Apr 2017 18:20:04 +0530
Received: from localhost
 by d50lp01.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <ojayanth@in.ibm.com>;
 Fri, 28 Apr 2017 08:50:02 -0400
Received: from smtp.notes.na.collabserv.com (192.155.248.67)
 by d50lp01.ny.us.ibm.com (158.87.18.20) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128/128)
 Fri, 28 Apr 2017 08:49:59 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <ojayanth@in.ibm.com>;
 Fri, 28 Apr 2017 12:49:58 -0000
Received: from us1a3-smtp03.a3.dal06.isc4sb.com (10.106.154.98)
 by smtp.notes.na.collabserv.com (10.106.227.16) with
 smtp.notes.na.collabserv.com ESMTP; Fri, 28 Apr 2017 12:49:56 -0000
Received: from us1a3-mail76.a3.dal09.isc4sb.com ([10.142.3.53])
 by us1a3-smtp03.a3.dal06.isc4sb.com
 with ESMTP id 2017042812495587-334590 ;
 Fri, 28 Apr 2017 12:49:55 +0000 
Subject: Re: OpenBMC Debug data collection tool evaluation updates
In-Reply-To: <8737ctcmbs.fsf@linux.vnet.ibm.com>
From: "Jayanth Othayoth" <ojayanth@in.ibm.com>
To: stewart@linux.vnet.ibm.com
Cc: openbmc@lists.ozlabs.org
Date: Fri, 28 Apr 2017 12:49:56 +0000
Sensitivity: 
MIME-Version: 1.0
References: <8737ctcmbs.fsf@linux.vnet.ibm.com>,
 <OF887D4BA6.3DF1614A-ON0025810D.004324D1-0025810D.0043964E@notes.na.collabserv.com>
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: IBM Verse Build 14114-1129 | IBM Domino Build
 SCN17101_20170411T0540_FP3 April 25, 2017 at 12:55
X-LLNOutbound: False
X-Disclaimed: 38803
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 17042812-0012-0000-0000-000003E6ADE6
X-IBM-SpamModules-Scores: BY=0.022364; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.417846; ST=0; TS=0; UL=0; ISC=; MB=0.372449
X-IBM-SpamModules-Versions: BY=3.00006989; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000208; SDB=6.00853577; UDB=6.00422106; IPR=6.00632518; 
 BA=6.00005316; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015218; XFM=3.00000014;
 UTC=2017-04-28 12:49:57
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2017-04-28 11:41:56 - 6.00006662
x-cbparentid: 17042812-0328-0000-0000-000014CF598C
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-TM-AS-MML: disable
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
Message-Id: <OFE2BDAB07.BB5C47BF-ON00258110.00464427-00258110.00467D7A@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-04-28_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=2
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1704280187
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
X-List-Received-Date: Fri, 28 Apr 2017 12:50:27 -0000

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial, H=
elvetica, sans-serif;font-size:10.5pt" ><div dir=3D"ltr" >Allowed Flash spa=
ce for these tool is 200 K .&nbsp; As mentioned in the earlier&nbsp; mail S=
OSreport base package size it self is 360K ( Python package) .</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Thanks &amp; Regards<br><br>Jayanth Othayoth<br>PFW<br>Ph=
: 91-80-40256823<br>T/L : 7221723<br><br>mailto:ojayanth@in.ibm.com</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >&nbsp;</div>
<blockquote data-history-content-modified=3D"1" dir=3D"ltr" style=3D"border=
-left:solid #aaaaaa 2px; margin-left:5px; padding-left:5px; direction:ltr; =
margin-right:0px" >----- Original message -----<br>From: Stewart Smith &lt;=
stewart@linux.vnet.ibm.com&gt;<br>To: Jayanth Othayoth/India/IBM@IBMIN, ope=
nbmc@lists.ozlabs.org<br>Cc:<br>Subject: Re: OpenBMC Debug data collection =
tool evaluation updates<br>Date: Fri, Apr 28, 2017 7:42 AM<br>&nbsp;
<div><font face=3D"Default Monospace,Courier New,Courier,monospace" size=3D=
"2" >Jayanth Othayoth &lt;ojayanth@in.ibm.com&gt; writes:<br>&gt; Base SOS =
Package with minimal plugin size: 360K (based on Fedora distribution)<br>&g=
t; Base Package size: 2.65MB (based on Fedora distribution)<br><br>I'm not =
sure these sizes are too valid as to what would show up in<br>OpenBMC.<br><=
br>Distro packages are not build with -Os, which can halve binary size in<b=
r>some cases. Additionally, the binaries are likely to be compressed on<br>=
flash for OpenBMC, and things like man pages aren't going to be needed.<br>=
<br>--<br>Stewart Smith<br>OPAL Architect, IBM.</font></div></blockquote>
<div dir=3D"ltr" >&nbsp;</div></div><BR>
