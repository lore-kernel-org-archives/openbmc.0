Return-Path: <miltonm@us.ibm.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=us.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=miltonm@us.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y2d6W5sHczDsN9
 for <openbmc@lists.ozlabs.org>; Thu, 28 Sep 2017 11:54:42 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v8S1rYm6119167
 for <openbmc@lists.ozlabs.org>; Wed, 27 Sep 2017 21:54:39 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.74])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2d8ks3b5e5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 27 Sep 2017 21:54:39 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Thu, 28 Sep 2017 01:54:38 -0000
Received: from us1a3-smtp04.a3.dal06.isc4sb.com (10.106.154.237)
 by smtp.notes.na.collabserv.com (10.106.227.92) with
 smtp.notes.na.collabserv.com ESMTP; Thu, 28 Sep 2017 01:54:36 -0000
Received: from us1a3-mail79.a3.dal09.isc4sb.com ([10.142.3.136])
 by us1a3-smtp04.a3.dal06.isc4sb.com
 with ESMTP id 2017092801543609-1202266 ;
 Thu, 28 Sep 2017 01:54:36 +0000 
In-Reply-To: <20170927212712.4804-1-cbostic@linux.vnet.ibm.com>
Subject: Re: [PATCH u-boot v2016.07] aspeed: clear all asserting watchdog
 conditions
From: "Milton Miller II" <miltonm@us.ibm.com>
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Cc: joel@jms.id.au, openbmc@lists.ozlabs.org, "Andrew Jeffery"
 <andrewrj@au1.ibm.com>
Date: Thu, 28 Sep 2017 01:54:36 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <20170927212712.4804-1-cbostic@linux.vnet.ibm.com>
X-Mailer: IBM iNotes ($HaikuForm 998) | IBM Domino Build
 SCN17248_20170905T0050_FP2.1 September 19, 2017 at 09:56
X-LLNOutbound: False
X-Disclaimed: 34695
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 17092801-7581-0000-0000-0000040E0610
X-IBM-SpamModules-Scores: BY=0.259975; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.40962; ST=0; TS=0; UL=0; ISC=; MB=0.015035
X-IBM-SpamModules-Versions: BY=3.00007802; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000232; SDB=6.00923364; UDB=6.00464191; IPR=6.00703507; 
 BA=6.00005609; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017296; XFM=3.00000015;
 UTC=2017-09-28 01:54:38
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2017-09-27 23:15:40 - 6.00007384
x-cbparentid: 17092801-7582-0000-0000-00005EFC5292
Message-Id: <OFC966264B.614C040D-ON002581A9.000A7E30-002581A9.000A7E38@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-09-28_01:, , signatures=0
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
X-List-Received-Date: Thu, 28 Sep 2017 01:54:44 -0000

On 09/27/2017 around 04:27PM in some time zone, Christopher Bostic wrote:
>Clear out all flagged watchdog conditions to allow the following
>kernel load to complete successfully.  This will allow the kernel
>to determine the next boot side instead of leaving it to u-boot.
>This method of side switching has been suggested by Milton Miller
>and Adirana Kobylak.

I'm not immediately sure what the SCU3C write is about, but we
can't do the others in u-boot as we need to continue to access
the secondary flash during u-boot.

I was suggesting we clear the watchdog alt-boot overrides when
we start the linux kernel so that the kernel chip selects match
the hardware, while allowing the alternate u-boot to continue
to read from the chip its started out of.

I'll work more urgently on drafting a more detailed proposal.

>
>Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
>---
> arch/arm/mach-aspeed/reset.c | 6 ++++++
> 1 file changed, 6 insertions(+)
>
>diff --git a/arch/arm/mach-aspeed/reset.c
>b/arch/arm/mach-aspeed/reset.c
>index 1a44b3a..7d88d99 100644
>--- a/arch/arm/mach-aspeed/reset.c
>+++ b/arch/arm/mach-aspeed/reset.c
>@@ -9,6 +9,12 @@
>=20
> void reset=5Fcpu(ulong addr)
> {
>+	/* Clear out all flagged watchdog events */
>+	=5F=5Fraw=5Fwritel(0x1, AST=5FWDT1=5FBASE+0x14);
>+	=5F=5Fraw=5Fwritel(0x1, AST=5FWDT2=5FBASE+0x14);
>+	=5F=5Fraw=5Fwritel(0x1, AST=5FWDT3=5FBASE+0x14);
>+	=5F=5Fraw=5Fwritel(=5F=5Fraw=5Freadl(AST=5FSCU=5FBASE+0x3C) & 0x03,
>AST=5FSCU=5FBASE+0x3C);
>+
> 	=5F=5Fraw=5Fwritel(0x10 , AST=5FWDT1=5FBASE+0x04);
> 	=5F=5Fraw=5Fwritel(0x4755, AST=5FWDT1=5FBASE+0x08);
> 	=5F=5Fraw=5Fwritel(0x3, AST=5FWDT1=5FBASE+0x0c);
>--=20
>1.8.2.2
>
>
