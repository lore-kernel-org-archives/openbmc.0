Return-Path: <miltonm@us.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wY7QH0d7NzDqZQ
 for <openbmc@lists.ozlabs.org>; Thu, 25 May 2017 09:09:42 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v4ON8YB3039347
 for <openbmc@lists.ozlabs.org>; Wed, 24 May 2017 19:09:40 -0400
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2anhshbsfx-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 24 May 2017 19:09:40 -0400
Received: from localhost
 by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Wed, 24 May 2017 19:09:38 -0400
Received: from b01cxnp22034.gho.pok.ibm.com (9.57.198.24)
 by e12.ny.us.ibm.com (146.89.104.199) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 24 May 2017 19:09:37 -0400
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v4ON9axi11469232
 for <openbmc@lists.ozlabs.org>; Wed, 24 May 2017 23:09:36 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 796CAAC03F
 for <openbmc@lists.ozlabs.org>; Wed, 24 May 2017 19:09:36 -0400 (EDT)
Received: from d50lp03.ny.us.ibm.com (unknown [146.89.104.211])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS id 646FEAC03A
 for <openbmc@lists.ozlabs.org>; Wed, 24 May 2017 19:09:36 -0400 (EDT)
Received: from localhost
 by d50lp03.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Wed, 24 May 2017 19:09:36 -0400
Received: from smtp.notes.na.collabserv.com (192.155.248.67)
 by d50lp03.ny.us.ibm.com (158.87.18.22) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128/128)
 Wed, 24 May 2017 19:09:34 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Wed, 24 May 2017 23:09:33 -0000
Received: from us1a3-smtp05.a3.dal06.isc4sb.com (10.146.71.159)
 by smtp.notes.na.collabserv.com (10.106.227.16) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 24 May 2017 23:09:32 -0000
Received: from us1a3-mail79.a3.dal09.isc4sb.com ([10.142.3.136])
 by us1a3-smtp05.a3.dal06.isc4sb.com
 with ESMTP id 2017052423093192-895134 ;
 Wed, 24 May 2017 23:09:31 +0000 
In-Reply-To: <1495657987-12488-1-git-send-email-eajames@linux.vnet.ibm.com>
Subject: Re: [PATCH linux dev-4.10] arm: dts: barreleye: Add missing clock
 sources
From: "Milton Miller II" <miltonm@us.ibm.com>
To: Eddie James <eajames@linux.vnet.ibm.com>
Cc: openbmc@lists.ozlabs.org, "Edward James" <eajames@us.ibm.com>
Date: Wed, 24 May 2017 23:09:31 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <1495657987-12488-1-git-send-email-eajames@linux.vnet.ibm.com>
X-Mailer: IBM iNotes ($HaikuForm 953) | IBM Domino Build
 SCN17129_20170509T0510_FP3.1 May 18, 2017 at 09:24
X-LLNOutbound: False
X-Disclaimed: 355
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 17052423-0048-0000-0000-0000018DEA7B
X-IBM-SpamModules-Scores: BY=0.051465; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.373977; ST=0; TS=0; UL=0; ISC=; MB=0.000000
X-IBM-SpamModules-Versions: BY=3.00007112; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000212; SDB=6.00865163; UDB=6.00429560; IPR=6.00644943; 
 BA=6.00005372; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015572; XFM=3.00000015;
 UTC=2017-05-24 23:09:33
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2017-05-24 20:00:07 - 6.00006788
x-cbparentid: 17052423-0328-0000-0000-0000152815A6
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-TM-AS-GCONF: 00
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007112; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000212; SDB=6.00865163; UDB=6.00429559; IPR=6.00644944; 
 BA=6.00005372; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015572; XFM=3.00000015;
 UTC=2017-05-24 23:09:38
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
Message-Id: <OF30BAB535.4127AB0D-ON0025812A.007E3A9F-0025812A.007F3704@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-05-24_16:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1705240142
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
X-List-Received-Date: Wed, 24 May 2017 23:09:43 -0000

<font face=3D"Default Sans Serif,Verdana,Arial,Helvetica,sans-serif" size=
=3D"2"><br>On 05/24/2017 at 03:33PM in some timezone,&nbsp; Eddie James wro=
te:<br>&gt;<br>&gt;Prevented BMC from booting on Barreleye in 4.10 kernel, =
with new<br>&gt;aspeed-smc driver.<br>&gt;<br>&gt;Signed-off-by: Edward A. =
James &lt;<a href=3D"mailto:eajames@us.ibm.com" target=3D"=5Fblank">eajames=
@us.ibm.com</a>&gt;<br>&gt;---<br>&gt; arch/arm/boot/dts/aspeed-bmc-opp-bar=
releye.dts | 7 +++++++<br>&gt; 1 file changed, 7 insertions(+)<br>&gt;<br>&=
gt;diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts<br>&gt;b/arc=
h/arm/boot/dts/aspeed-bmc-opp-barreleye.dts<br>&gt;index be1f2d1..9b59587 1=
00644<br>&gt;--- a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts<br>&gt;++=
+ b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts<br>&gt;@@ -37,10 +37,14 =
@@<br>&gt;                                 0x20000000 0x02000000 &gt;;<br>&=
gt;                         #address-cells =3D &lt;1&gt;;<br>&gt;          =
               #size-cells =3D &lt;0&gt;;<br>&gt;+                        i=
nterrupts =3D &lt;19&gt;;<br>&gt;                         compatible =3D "a=
speed,ast2400-fmc";<br>&gt;+                        clocks =3D &lt;&amp;clk=
=5Fahb&gt;;<br>&gt;+                        clock-names =3D "ahb";<br>&gt; =
                        flash@0 {<br>&gt;                                 r=
eg =3D &lt; 0 &gt;;<br>&gt;                                 compatible =3D =
"jedec,spi-nor" ;<br>&gt;+                                m25p,fast-read;<b=
r>&gt; #include "aspeed-bmc-opp-flash-layout.dtsi"<br>&gt;                 =
        };<br><br>Since the clocks and interrupts are all inside the SOC th=
ey should be part of the aspeed-g4 dtsi.<br><br>It looks like this was fact=
ored better on the g5 vs the g4 dtsi.<br><br>&gt;                 };<br>&gt=
;@@ -51,10 +55,13 @@<br>&gt;                         #address-cells =3D &lt=
;1&gt;;<br>&gt;                         #size-cells =3D &lt;0&gt;;<br>&gt; =
                        compatible =3D "aspeed,ast2400-spi";<br>&gt;+      =
                  clocks =3D &lt;&amp;clk=5Fahb&gt;;<br>&gt;+              =
          clock-names =3D "ahb";<br>&gt;                         flash@0 {<=
br>&gt;                                 reg =3D &lt; 0 &gt;;<br>&gt;       =
                          compatible =3D "jedec,spi-nor" ;<br>&gt;         =
                        label =3D "pnor";<br>&gt;+                         =
       m25p,fast-read;<br><br><br>milton<br></font><BR>
