Return-Path: <miltonm@us.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xJT4h5L0BzDrLW
 for <openbmc@lists.ozlabs.org>; Fri, 28 Jul 2017 09:40:52 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v6RNeTNn140100
 for <openbmc@lists.ozlabs.org>; Thu, 27 Jul 2017 19:40:50 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [158.85.210.104])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2bymq4mkf6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 27 Jul 2017 19:40:50 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Thu, 27 Jul 2017 23:40:50 -0000
Received: from us1b3-smtp01.a3dr.sjc01.isc4sb.com (10.122.7.174)
 by smtp.notes.na.collabserv.com (10.122.47.44) with
 smtp.notes.na.collabserv.com ESMTP; Thu, 27 Jul 2017 23:40:46 -0000
Received: from us1b3-mail79.a3dr.sjc01.isc4sb.com ([10.122.105.126])
 by us1b3-smtp01.a3dr.sjc01.isc4sb.com
 with ESMTP id 2017072723404575-945409 ;
 Thu, 27 Jul 2017 23:40:45 +0000 
In-Reply-To: <1501181400-31373-1-git-send-email-austenc@us.ibm.com>
Subject: Re: [PATCH linux dev-4.10] ARM: dts: Romulus: Identify LED is too
 active
From: "Milton Miller II" <miltonm@us.ibm.com>
To: "Chris Austen" <austenc@us.ibm.com>
Cc: openbmc@lists.ozlabs.org, joel@jms.id.au, Chris Austen <austencj@yahoo.com>
Date: Thu, 27 Jul 2017 23:40:46 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <1501181400-31373-1-git-send-email-austenc@us.ibm.com>
X-Mailer: IBM iNotes ($HaikuForm 971.2) | IBM Domino Build
 SCN17178_20170627T0038_FP6.2 July 11, 2017 at 09:53
X-LLNOutbound: False
X-Disclaimed: 42615
X-TNEFEvaluated: 1
X-LLNXfer: False
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 17072723-7301-0000-0000-00000184D783
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.411265; ST=0; TS=0; UL=0; ISC=; MB=0.028687
X-IBM-SpamModules-Versions: BY=3.00007437; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00893851; UDB=6.00446908; IPR=6.00674011; 
 BA=6.00005495; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016414; XFM=3.00000015;
 UTC=2017-07-27 23:40:48
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2017-07-27 22:00:01 - 6.00007089
x-cbparentid: 17072723-7302-0000-0000-00006B350773
Message-Id: <OF4576094D.35522701-ON0025816A.008206D6-0025816A.00821340@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-07-27_14:, , signatures=0
X-Proofpoint-Spam-Reason: safe
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
X-List-Received-Date: Thu, 27 Jul 2017 23:40:53 -0000



-----"openbmc" <openbmc-bounces+miltonm=3Dus.ibm.com@lists.ozlabs.org> wrot=
e: -----

>To: openbmc@lists.ozlabs.org, joel@jms.id.au
>From: causten=20
>Sent by: "openbmc"=20
>Date: 07/27/2017 01:50PM
>Cc: Chris Austen <austencj@yahoo.com>
>Subject: [PATCH linux dev-4.10] ARM: dts: Romulus: Identify LED is
>too active
>
>Identify LED is coming on ever boot.  This is because

every boot?

>it should have been set to ACTIVE=5FHIGH
>
>Signed-Off-By: Chris Austen <austencj@yahoo.com>
>---
> arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
>b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
>index a9e3615..45a3c99 100644
>--- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
>+++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
>@@ -35,7 +35,7 @@
> 		};
>=20
> 		identify {
>-			gpios =3D <&gpio ASPEED=5FGPIO(N, 4) GPIO=5FACTIVE=5FLOW>;
>+			gpios =3D <&gpio ASPEED=5FGPIO(N, 4) GPIO=5FACTIVE=5FHIGH>;
> 		};
>=20
> 		power {
>--=20
>2.7.4
>
>
