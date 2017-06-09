Return-Path: <anoo@us.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wkpXc27y3zDqL9
 for <openbmc@lists.ozlabs.org>; Sat, 10 Jun 2017 03:03:43 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v59Gwo2b052579
 for <openbmc@lists.ozlabs.org>; Fri, 9 Jun 2017 13:03:41 -0400
Received: from e37.co.us.ibm.com (e37.co.us.ibm.com [32.97.110.158])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2aysj4u06h-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 09 Jun 2017 13:03:41 -0400
Received: from localhost
 by e37.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@us.ibm.com>;
 Fri, 9 Jun 2017 11:03:39 -0600
Received: from b03cxnp08026.gho.boulder.ibm.com (9.17.130.18)
 by e37.co.us.ibm.com (192.168.1.137) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 9 Jun 2017 11:03:36 -0600
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v59H3Zc018874702
 for <openbmc@lists.ozlabs.org>; Fri, 9 Jun 2017 10:03:35 -0700
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8005478037
 for <openbmc@lists.ozlabs.org>; Fri,  9 Jun 2017 11:03:35 -0600 (MDT)
Received: from d50lp01.ny.us.ibm.com (unknown [146.89.104.207])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS id 4E53D78041
 for <openbmc@lists.ozlabs.org>; Fri,  9 Jun 2017 11:03:35 -0600 (MDT)
Received: from localhost
 by d50lp01.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@us.ibm.com>;
 Fri, 9 Jun 2017 13:03:34 -0400
Received: from smtp.notes.na.collabserv.com (192.155.248.66)
 by d50lp01.ny.us.ibm.com (158.87.18.20) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128/128)
 Fri, 9 Jun 2017 13:03:31 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <anoo@us.ibm.com>;
 Fri, 9 Jun 2017 17:03:30 -0000
Received: from us1a3-smtp04.a3.dal06.isc4sb.com (10.106.154.237)
 by smtp.notes.na.collabserv.com (10.106.227.127) with
 smtp.notes.na.collabserv.com ESMTP; Fri, 9 Jun 2017 17:03:26 -0000
Received: from us1a3-mail52.a3.dal06.isc4sb.com ([10.146.77.168])
 by us1a3-smtp04.a3.dal06.isc4sb.com
 with ESMTP id 2017060917032558-739224 ;
 Fri, 9 Jun 2017 17:03:25 +0000 
Subject: Re: Switch up eth0 and eth1 to BMC shared and dedicated resp. ( Zaius
 )
In-Reply-To: <1497022202970.71679@rackspace.com>
From: "Adriana Kobylak" <anoo@us.ibm.com>
To: adi.gangidi@rackspace.com, openbmc@lists.ozlabs.org
Cc: "Adrian Barrera" <abarrera@us.ibm.com>, brad.debauche@RACKSPACE.COM,
 chad.somerlot@RACKSPACE.COM, kenneth.wilke@RACKSPACE.COM,
 rlippert@google.com, ryan.dc.yu@foxconn.com
Date: Fri, 9 Jun 2017 17:03:26 +0000
Sensitivity: 
MIME-Version: 1.0
References: <1497022202970.71679@rackspace.com>,
 <EDE9FA85-CF2B-4B72-9974-1E92EE9EC676@rackspace.com>
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: IBM Verse Build 14672-1213 | IBM Domino Build
 SCN17143_20170523T0509_FP4.1 June 01, 2017 at 10:36
X-LLNOutbound: False
X-Disclaimed: 61615
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 17060917-0024-0000-0000-0000169CA23B
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.417846; ST=0; TS=0; UL=0; ISC=; MB=0.032780
X-IBM-SpamModules-Versions: BY=3.00007201; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000212; SDB=6.00872383; UDB=6.00434042; IPR=6.00652452; 
 BA=6.00005406; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015762; XFM=3.00000015;
 UTC=2017-06-09 17:03:28
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2017-06-09 12:30:56 - 6.00006868
x-cbparentid: 17060917-6358-0000-0000-0000111A74FB
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-TM-AS-GCONF: 00
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007201; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000212; SDB=6.00872383; UDB=6.00434042; IPR=6.00652453; 
 BA=6.00005406; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015762; XFM=3.00000015;
 UTC=2017-06-09 17:03:36
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
Message-Id: <OF6B672B6D.E6759427-ON0025813A.005D800E-0025813A.005DB2CB@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-06-09_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1706090295
X-Mailman-Approved-At: Wed, 14 Jun 2017 12:03:37 +1000
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
X-List-Received-Date: Fri, 09 Jun 2017 17:03:44 -0000

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial, H=
elvetica, sans-serif;font-size:10.5pt" ><div dir=3D"ltr" >Looping in the co=
mmunity for feedback.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >&nbsp;</div>
<blockquote data-history-content-modified=3D"1" data-history-expanded=3D"1"=
 dir=3D"ltr" style=3D"border-left:solid #aaaaaa 2px; margin-left:5px; paddi=
ng-left:5px; direction:ltr; margin-right:0px" >----- Original message -----=
<br>From: Adi Gangidi &lt;adi.gangidi@rackspace.com&gt;<br>To: "anoo@us.ibm=
.com" &lt;anoo@us.ibm.com&gt;, Kenneth Wilke &lt;kenneth.wilke@RACKSPACE.CO=
M&gt;, Brad DeBauche &lt;brad.debauche@RACKSPACE.COM&gt;, Chad Somerlot &lt=
;chad.somerlot@RACKSPACE.COM&gt;, "abarrera@us.ibm.com" &lt;abarrera@us.ibm=
.com&gt;, "ryan.dc.yu@foxconn.com" &lt;ryan.dc.yu@foxconn.com&gt;, "Rob Lip=
pert" &lt;rlippert@google.com&gt;<br>Cc:<br>Subject: Re: Switch up eth0 and=
 eth1 to BMC shared and dedicated resp. ( Zaius )<br>Date: Fri, Jun 9, 2017=
 10:30 AM<br>&nbsp;
<div><font face=3D"Default Monospace,Courier New,Courier,monospace" size=3D=
"2" >Sorry for couple of typo below, corrected them now.<br><br>Please read=
 again if it didn't make sense before.<br><br>-Adi<br>=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F<br>From: Adi Gangidi<br>Sent: Friday, June 9, 2017=
 10:06 AM<br>To: anoo@us.ibm.com; Kenneth Wilke; Brad DeBauche; Chad Somerl=
ot; abarrera@us.ibm.com; ryan.dc.yu@foxconn.com; Rob Lippert<br>Subject: Sw=
itch up eth0 and eth1 to BMC shared and dedicated resp. ( Zaius )<br><br>Hi=
 Adriana /. &nbsp;Ryan ( Foxconn )<br><br>Right now on openBMC<br>BMC Share=
d &nbsp; &nbsp; &nbsp;=3D eth0<br>BMC Dedicated =3D eth1<br><br><br>Instead=
, Is there a way we can make sure the BMC dedicated comes up as eth0 &nbsp;=
and BMC shared link comes up as eth1, in Zaius / Barreleye G2 ?<br><br><br>=
In how it works currently . you could have BMC dedicated be eth0 or eth1 de=
pending upon the hardware config ( Whether or not Broadcom 5719A is popped =
OR de-popped ) . That could confusing to support operators who don't unders=
tand the nuances .<br><br>If you guys are busy with other things to make th=
e change &nbsp;, can I have your thoughts on if this can be changed ? I'm g=
uessing this is a u-boot change . &nbsp;Any thoughts on how we could make t=
his change ourselves ?<br><br>-Adi</font><br><br><br>&nbsp;</div></blockquo=
te>
<div dir=3D"ltr" >&nbsp;</div></div><BR>
