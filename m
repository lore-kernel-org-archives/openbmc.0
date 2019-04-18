Return-Path: <miltonm@us.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=us.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=miltonm@us.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=us.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44lYd934NDzDqQX
 for <openbmc@lists.ozlabs.org>; Fri, 19 Apr 2019 08:27:24 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x3IMOdSC131776
 for <openbmc@lists.ozlabs.org>; Thu, 18 Apr 2019 18:27:20 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.72])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ry1s9rjx2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 18 Apr 2019 18:27:20 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Thu, 18 Apr 2019 22:27:20 -0000
Received: from us1a3-smtp03.a3.dal06.isc4sb.com (10.106.154.98)
 by smtp.notes.na.collabserv.com (10.106.227.158) with
 smtp.notes.na.collabserv.com ESMTP; Thu, 18 Apr 2019 22:27:15 -0000
Received: from us1a3-mail228.a3.dal06.isc4sb.com ([10.146.103.71])
 by us1a3-smtp03.a3.dal06.isc4sb.com
 with ESMTP id 2019041822271539-994156 ;
 Thu, 18 Apr 2019 22:27:15 +0000 
In-Reply-To: <20190417133941.22962-3-clg@kaod.org>
Subject: Re: [PATCH dev-5.0 2/4] mtd: spi-nor: aspeed: clarify 4BYTE address
 mode mask
From: "Milton Miller II" <miltonm@us.ibm.com>
To: "=?ISO-8859-1?Q?C=E9dric_Le_Goater?=" <clg@kaod.org>
Cc: openbmc@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>
Date: Thu, 18 Apr 2019 22:27:15 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <20190417133941.22962-3-clg@kaod.org>,
 <20190417133941.22962-1-clg@kaod.org>
X-Mailer: IBM iNotes ($HaikuForm 1048) | IBM Domino Build
 SCN1812108_20180501T0841_FP38 April 10, 2019 at 11:56
X-LLNOutbound: False
X-Disclaimed: 20303
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 19041822-6059-0000-0000-00000E43D61C
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.373977; ST=0; TS=0; UL=0; ISC=; MB=0.000001
X-IBM-SpamModules-Versions: BY=3.00010952; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000285; SDB=6.01191037; UDB=6.00624171; IPR=6.00971833; 
 BA=6.00006282; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00026507; XFM=3.00000015;
 UTC=2019-04-18 22:27:18
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2019-04-18 18:18:59 - 6.00009822
x-cbparentid: 19041822-6060-0000-0000-00007A0B163F
Message-Id: <OF6182D899.1A05425F-ON002583E0.0076364D-002583E0.007B584C@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-18_11:, , signatures=0
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
X-List-Received-Date: Thu, 18 Apr 2019 22:27:26 -0000

<font face=3D"Default Sans Serif,Verdana,Arial,Helvetica,sans-serif" size=
=3D"2"><div>About 04/17/2019 09:18AM in some timezone, C=C3=A9dric Le Goate=
r wrote:</div><div><br></div><div>&gt;Subject: [PATCH dev-5.0 2/4] mtd: spi=
-nor: aspeed: clarify 4BYTE</div>&gt;address mode mask<br>&gt;<br><div><br>=
</div><div>Missing&nbsp; change log here.<br></div><div><br></div><div>&gt;=
Signed-off-by: C=C3=A9dric Le Goater &lt;<a href=3D"mailto:clg@kaod.org" ta=
rget=3D"=5Fblank">clg@kaod.org</a>&gt;</div>&gt;---<br>&gt; drivers/mtd/spi=
-nor/aspeed-smc.c | 10 +++++++++-<br>&gt; 1 file changed, 9 insertions(+), =
1 deletion(-)<br>&gt;<br>&gt;diff --git a/drivers/mtd/spi-nor/aspeed-smc.c<=
br>&gt;b/drivers/mtd/spi-nor/aspeed-smc.c<br>&gt;index ee3059b27c07..143773=
2fdea1 100644<br>&gt;--- a/drivers/mtd/spi-nor/aspeed-smc.c<br>&gt;+++ b/dr=
ivers/mtd/spi-nor/aspeed-smc.c<br>&gt;@@ -884,7 +884,15 @@ static const uin=
t32=5Ft aspeed=5Fsmc=5Fhclk=5Fdivs[] =3D {<br>&gt; <br>&gt; static u32 aspe=
ed=5Fsmc=5Fdefault=5Fread(struct aspeed=5Fsmc=5Fchip *chip)<br>&gt; {<br>&g=
t;-        return (chip-&gt;ctl=5Fval[smc=5Fread] &amp; 0x2000) |<br>&gt;+ =
       /*<br>&gt;+         * Keep the 4Byte address mode on the AST2400 SPI=
 controller.<br>&gt;+         * Other controllers set the 4Byte mode in the=
 CE Control<br>&gt;+         * Register<br>&gt;+         */<br>&gt;+       =
 u32 ctl=5Fmask =3D chip-&gt;controller-&gt;info =3D=3D &amp;spi=5F2400=5Fi=
nfo ?<br>&gt;+                 CONTROL=5FIO=5FADDRESS=5F4B : 0;<br><div>&gt=
;+</div><div><br></div><div>I dislike this patch because it violates the da=
ta driven model of the types.</div><div><br></div><div>Either a dupicate me=
thod should be created or at least a member of the</div><div>type structure=
 should be used instead of a compare to a specific instance.<br></div><div>=
<br></div>&gt;+        return (chip-&gt;ctl=5Fval[smc=5Fread] &amp; ctl=5Fm=
ask) |<br>&gt;                 (0x00 &lt;&lt; 28) | /* Single bit */<br>&gt=
;                 (0x00 &lt;&lt; 24) | /* CE# max */<br>&gt;               =
  (0x03 &lt;&lt; 16) | /* use normal reads */<br>&gt;-- <br>&gt;2.20.1<br>&=
gt;<br>&gt;</font><BR>
