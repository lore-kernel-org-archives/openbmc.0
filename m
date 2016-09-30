Return-Path: <miltonm@us.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sm1Hv1Y2RzDvJ1
 for <openbmc@lists.ozlabs.org>; Sat,  1 Oct 2016 05:11:06 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 u8UJ9DUt053323
 for <openbmc@lists.ozlabs.org>; Fri, 30 Sep 2016 15:11:03 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
 by mx0b-001b2d01.pphosted.com with ESMTP id 25sr5912dt-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 30 Sep 2016 15:11:03 -0400
Received: from localhost
 by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Fri, 30 Sep 2016 15:11:02 -0400
Received: from d01dlp02.pok.ibm.com (9.56.250.167)
 by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 30 Sep 2016 15:11:00 -0400
X-IBM-Helo: d01dlp02.pok.ibm.com
X-IBM-MailFrom: miltonm@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28])
 by d01dlp02.pok.ibm.com (Postfix) with ESMTP id 706C26E8041
 for <openbmc@lists.ozlabs.org>; Fri, 30 Sep 2016 15:10:36 -0400 (EDT)
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u8UJAxQ011665850
 for <openbmc@lists.ozlabs.org>; Fri, 30 Sep 2016 19:10:59 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5D61E124047
 for <openbmc@lists.ozlabs.org>; Fri, 30 Sep 2016 15:10:59 -0400 (EDT)
Received: from d50lp32.co.us.ibm.com (unknown [9.17.249.36])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTPS id 1F568124044
 for <openbmc@lists.ozlabs.org>; Fri, 30 Sep 2016 15:10:59 -0400 (EDT)
Received: from localhost
 by d50lp32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Fri, 30 Sep 2016 13:10:57 -0600
Received: from smtp.notes.na.collabserv.com (192.155.248.81)
 by d50lp32.co.us.ibm.com (192.168.2.143) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128/128)
 Fri, 30 Sep 2016 13:10:55 -0600
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Fri, 30 Sep 2016 19:10:54 -0000
Received: from us1a3-smtp02.a3.dal06.isc4sb.com (10.106.154.159)
 by smtp.notes.na.collabserv.com (10.106.227.88) with
 smtp.notes.na.collabserv.com ESMTP; Fri, 30 Sep 2016 19:10:51 -0000
Received: from us1a3-mail79.a3.dal09.isc4sb.com ([10.142.3.136])
 by us1a3-smtp02.a3.dal06.isc4sb.com
 with ESMTP id 2016093019105106-376408 ;
 Fri, 30 Sep 2016 19:10:51 +0000 
In-Reply-To: <CAFR_W8oXug8fKap4Eh-3T7qxXXoemG07-CAFxzXhJwwRW4Cz+w@mail.gmail.com>
Subject: Re: U-Boot ethXaddr environment variables are not propagating to Linux
From: "Milton Miller II" <miltonm@us.ibm.com>
To: Maxim Sloyko <maxims@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Fri, 30 Sep 2016 19:10:51 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <CAFR_W8oXug8fKap4Eh-3T7qxXXoemG07-CAFxzXhJwwRW4Cz+w@mail.gmail.com>
X-Mailer: IBM iNotes ($HaikuForm 835.3) | IBM Domino Build
 V851SAAS_08292016_FP2.2 September 23, 2016
X-LLNOutbound: False
X-Disclaimed: 60311
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 16093019-0040-0000-0000-000001797481
X-IBM-ISS-SpamDetectors: Score=0.394815; BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0;
 PH=0; SC=0.394815; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00005831; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000186; SDB=6.00763182; UDB=6.00363907; UTC=2016-09-30
 19:10:52
x-cbparentid: 16093019-7094-0000-0000-000001BDB70D
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00005831; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000186; SDB=6.00763183; UDB=6.00363907; IPR=6.00538353; 
 BA=6.00004775; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00012837; XFM=3.00000011;
 UTC=2016-09-30 19:11:01
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
Message-Id: <OFB05163AE.D69C2C6E-ON0025803E.00695D10-0025803E.00695D12@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-09-30_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1609280000
 definitions=main-1609300349
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
X-List-Received-Date: Fri, 30 Sep 2016 19:11:08 -0000

<font face=3D"Default Sans Serif,Verdana,Arial,Helvetica,sans-serif" size=
=3D"2"><br><br><font color=3D"#990099">-----"openbmc" &lt;<a href=3D"mailto=
:openbmc-bounces+miltonm=3Dus.ibm.com@lists.ozlabs.org" target=3D"=5Fblank"=
>openbmc-bounces+miltonm=3Dus.ibm.com@lists.ozlabs.org</a>&gt; wrote: -----=
</font><br><br>&gt;To: OpenBMC Maillist &lt;<a href=3D"mailto:openbmc@lists=
.ozlabs.org" target=3D"=5Fblank">openbmc@lists.ozlabs.org</a>&gt;<br>&gt;Fr=
om: Maxim Sloyko <br>&gt;Sent by: "openbmc" <br>&gt;Date: 09/30/2016 01:09P=
M<br>&gt;Subject: U-Boot ethXaddr environment variables are not propagating=
 to<br>&gt;Linux<br>&gt;<br>&gt;Hi all,<br>&gt;<br>&gt;This worked before, =
when I first tried it ~2 months ago on the eval<br>&gt;board: set ethaddr &=
amp; eth1addr in U-Boot, boot Linux and it will use<br>&gt;the same MAC add=
resses. I tried it again yesterday and it does not<br>&gt;work any more.<br=
><br>I think ethaddr made a difference.&nbsp; Not sure eth1addr ever did, u=
nless <br>you have two direct interfaces on your board?<br><br>&gt;<br>&gt;=
I tried it with openbmc/u-boot, to make sure my changes do not<br>&gt;inter=
fere. I verified, by reading MAC08 MAC0C registers, that MAC<br>&gt;address=
es are properly configured by U-Boot from env. However, when I<br>&gt;boote=
d Linux, it still generated random MAC address, rather then<br>&gt;reusing =
whatever was passed up from U-Boot.<br>&gt;<br>&gt;Any ideas on what change=
 might have affected this?<br><br><br>You have likely hit the same issue as=
 <br><a href=3D"https://github.com/openbmc/u-boot/issues/13" target=3D"=5Fb=
lank">https://github.com/openbmc/u-boot/issues/13</a><br><a href=3D"https:/=
/github.com/openbmc/openbmc/issues/578" target=3D"=5Fblank">https://github.=
com/openbmc/openbmc/issues/578</a><br><br>Basically u-boot was over optimiz=
ed and does not write the mac unless it <br>tries to use the network.<br><b=
r>You could add a ping (static addressing) or dhcp request (dhcp address) i=
n <br>your bootcmd as a workaround, or address the bug more directly.<br><b=
r>Note: even with NCSI this should not require 2 seconds, only the 10ms<br>=
sleep to wait for the clock stabilization.&nbsp; The 2 second delay likely =
comes <br>from the NCSI spec as the maximum time for packages to initialize=
.<br><br>milton<br><br></font><BR>
