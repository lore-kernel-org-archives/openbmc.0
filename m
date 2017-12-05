Return-Path: <mtritz@us.ibm.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=us.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=mtritz@us.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yrTfS1gLTzDx3Q
 for <openbmc@lists.ozlabs.org>; Tue,  5 Dec 2017 15:44:00 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 vB54ceaJ043545
 for <openbmc@lists.ozlabs.org>; Mon, 4 Dec 2017 23:43:58 -0500
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.66])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2eng4ps08f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 04 Dec 2017 23:43:57 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <mtritz@us.ibm.com>;
 Tue, 5 Dec 2017 04:43:57 -0000
Received: from us1a3-smtp04.a3.dal06.isc4sb.com (10.106.154.237)
 by smtp.notes.na.collabserv.com (10.106.227.127) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 5 Dec 2017 04:43:54 -0000
Received: from us1a3-mail200.a3.dal06.isc4sb.com ([10.146.77.116])
 by us1a3-smtp04.a3.dal06.isc4sb.com
 with ESMTP id 2017120504435436-44429 ;
 Tue, 5 Dec 2017 04:43:54 +0000 
In-Reply-To: 
Subject: Host factory reset - version priorities
From: "Michael Tritz" <mtritz@us.ibm.com>
To: openbmc@lists.ozlabs.org
Date: Tue, 5 Dec 2017 04:43:54 +0000
Sensitivity: 
References: 
MIME-Version: 1.0
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: IBM Verse Build 15753-1266 | IBM Domino Build
 SCN1731100_20171107T0034_FP4 November 21, 2017 at 13:37
X-LLNOutbound: False
X-Disclaimed: 27523
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 17120504-6357-0000-0000-00000327A7A3
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.423878; ST=0; TS=0; UL=0; ISC=; MB=0.003621
X-IBM-SpamModules-Versions: BY=3.00008152; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000243; SDB=6.00955608; UDB=6.00482987; IPR=6.00735645; 
 BA=6.00005727; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00018352; XFM=3.00000015;
 UTC=2017-12-05 04:43:55
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2017-12-04 23:14:33 - 6.00007716
x-cbparentid: 17120504-6358-0000-0000-0000E554B80A
Message-Id: <OF113B399A.B511E757-ON002581ED.0019E0EA-002581ED.0019FDF6@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-12-05_02:, , signatures=0
X-Proofpoint-Spam-Reason: safe
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Dec 2017 04:44:00 -0000

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial, H=
elvetica, sans-serif;font-size:10.5pt" ><div dir=3D"ltr" ><p style=3D"box-s=
izing: border-box; margin-bottom: 16px; color: rgb(36, 41, 46); font-family=
: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Helvetica, Arial=
, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &q=
uot;Segoe UI Symbol&quot;; margin-top: 0px !important;" >What should be hap=
pening on a host factory reset?</p>
<p style=3D"box-sizing: border-box; margin-top: 0px; margin-bottom: 16px; c=
olor: rgb(36, 41, 46); font-family: -apple-system, BlinkMacSystemFont, &quo=
t;Segoe UI&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quo=
t;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;;" >Suppose we h=
ave a machine with two host versions uploaded - one active, one not. Curren=
tly, the host factory reset will clear the persistence files with which we =
store the priority information for these versions. The next time the host s=
oftware updater is started, both versions are left with priority of 255, an=
d one of the two (maybe it's random, maybe it's based on upload order) is s=
elected as the active host version.</p>
<p style=3D"box-sizing: border-box; margin-top: 0px; color: rgb(36, 41, 46)=
; font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Hel=
vetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Em=
oji&quot;, &quot;Segoe UI Symbol&quot;; margin-bottom: 0px !important;" >Is=
 this the desired behavior? Would it be better to instead retain the versio=
n priority through a reset, or is clearing that setting under the scope of =
"restoring factory settings"?</p>
<div style=3D"box-sizing: border-box; margin-top: 0px; color: rgb(36, 41, 4=
6); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, H=
elvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI =
Emoji&quot;, &quot;Segoe UI Symbol&quot;; margin-bottom: 0px !important;" >=
&nbsp;</div>
<div style=3D"box-sizing: border-box; margin-top: 0px; color: rgb(36, 41, 4=
6); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, H=
elvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI =
Emoji&quot;, &quot;Segoe UI Symbol&quot;; margin-bottom: 0px !important;" >=
Michael</div></div></div><BR>
