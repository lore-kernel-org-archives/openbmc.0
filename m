Return-Path: <miltonm@us.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=us.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=miltonm@us.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=us.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44lXD0634gzDq9R
 for <openbmc@lists.ozlabs.org>; Fri, 19 Apr 2019 07:24:00 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x3ILJnOf134267
 for <openbmc@lists.ozlabs.org>; Thu, 18 Apr 2019 17:23:55 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.66])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2rxy7fnas1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 18 Apr 2019 17:23:55 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Thu, 18 Apr 2019 21:23:54 -0000
Received: from us1a3-smtp02.a3.dal06.isc4sb.com (10.106.154.159)
 by smtp.notes.na.collabserv.com (10.106.227.127) with
 smtp.notes.na.collabserv.com ESMTP; Thu, 18 Apr 2019 21:23:50 -0000
Received: from us1a3-mail228.a3.dal06.isc4sb.com ([10.146.103.71])
 by us1a3-smtp02.a3.dal06.isc4sb.com
 with ESMTP id 2019041821234968-961276 ;
 Thu, 18 Apr 2019 21:23:49 +0000 
In-Reply-To: <20190417133941.22962-4-clg@kaod.org>
Subject: Re: [PATCH dev-5.0 3/4] mtd: spi-nor: aspeed: use memcpy_fromio() to
 capture the optimization buffer
From: "Milton Miller II" <miltonm@us.ibm.com>
To: "=?ISO-8859-1?Q?C=E9dric_Le_Goater?=" <clg@kaod.org>
Cc: openbmc@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>
Date: Thu, 18 Apr 2019 21:23:48 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <20190417133941.22962-4-clg@kaod.org>,
 <20190417133941.22962-1-clg@kaod.org>
X-Mailer: IBM iNotes ($HaikuForm 1048) | IBM Domino Build
 SCN1812108_20180501T0841_FP38 April 10, 2019 at 11:56
X-LLNOutbound: False
X-Disclaimed: 61919
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 19041821-6357-0000-0000-00000A7DADD5
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.388783; ST=0; TS=0; UL=0; ISC=; MB=0.000000
X-IBM-SpamModules-Versions: BY=3.00010952; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000285; SDB=6.01191015; UDB=6.00624158; IPR=6.00971813; 
 BA=6.00006282; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00026506; XFM=3.00000015;
 UTC=2019-04-18 21:23:53
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2019-04-18 18:44:03 - 6.00009822
x-cbparentid: 19041821-6358-0000-0000-00006F9BCBE1
Message-Id: <OF33F9274D.5DFDAC84-ON002583E0.00758962-002583E0.0075896A@notes.na.collabserv.com>
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
X-List-Received-Date: Thu, 18 Apr 2019 21:24:01 -0000

About 04/17/2019 09:20AM in some timezone, C=C3=A9dric Le Goater wrote:


>aspeed=5Fsmc=5Fread=5Ffrom=5Fahb() only reads the first word which is not
>what
>we want. We want to capture a CALIBRATE=5FBUF=5FSIZE size window of the
>flash contents to optimize the read.
>

NACK

This justifcation is false.  The routine reads the whole buffer
because it calls the =5Frep routine and takes the size.

In addition, the comment just before aspeed=5Fsmc=5Fread=5Ffrom=5Fahb
tells why memcpy=5Ffromio and memcpy=5Ftoio are broken on 32 bit
arm, and this is still the case judging from the recent bug
reportfrom a Nuvaton user [1].

[1] https://github.com/openbmc/openbmc/issues/3521

Andrew, Please revert this patch.

>Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>---
> drivers/mtd/spi-nor/aspeed-smc.c | 6 ++----
> 1 file changed, 2 insertions(+), 4 deletions(-)
>
>diff --git a/drivers/mtd/spi-nor/aspeed-smc.c
>b/drivers/mtd/spi-nor/aspeed-smc.c
>index 1437732fdea1..7e289ecb1c99 100644
>--- a/drivers/mtd/spi-nor/aspeed-smc.c
>+++ b/drivers/mtd/spi-nor/aspeed-smc.c
>@@ -796,8 +796,7 @@ static bool aspeed=5Fsmc=5Fcheck=5Freads(struct
>aspeed=5Fsmc=5Fchip *chip,
> 	int i;
>=20
> 	for (i =3D 0; i < 10; i++) {
>-		aspeed=5Fsmc=5Fread=5Ffrom=5Fahb(test=5Fbuf, chip->ahb=5Fbase,
>-					 CALIBRATE=5FBUF=5FSIZE);
>+		memcpy=5Ffromio(test=5Fbuf, chip->ahb=5Fbase, CALIBRATE=5FBUF=5FSIZE);
> 		if (memcmp(test=5Fbuf, golden=5Fbuf, CALIBRATE=5FBUF=5FSIZE) !=3D 0)
> 			return false;
> 	}
>@@ -921,8 +920,7 @@ static int aspeed=5Fsmc=5Foptimize=5Fread(struct
>aspeed=5Fsmc=5Fchip *chip,
>=20
> 	writel(chip->ctl=5Fval[smc=5Fread], chip->ctl);
>=20
>-	aspeed=5Fsmc=5Fread=5Ffrom=5Fahb(golden=5Fbuf, chip->ahb=5Fbase,
>-				 CALIBRATE=5FBUF=5FSIZE);
>+	memcpy=5Ffromio(golden=5Fbuf, chip->ahb=5Fbase, CALIBRATE=5FBUF=5FSIZE);
>=20
> 	/* Establish our read mode with freq field set to 0 (HCLK/16) */
> 	chip->ctl=5Fval[smc=5Fread] =3D save=5Fread=5Fval & 0xfffff0ff;
>--=20
>2.20.1
>
>
