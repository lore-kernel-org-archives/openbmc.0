Return-Path: <miltonm@us.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wzHcD6FwvzDr5g
 for <openbmc@lists.ozlabs.org>; Fri, 30 Jun 2017 10:35:08 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v5U0YZkx038020
 for <openbmc@lists.ozlabs.org>; Thu, 29 Jun 2017 20:35:06 -0400
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2bd1dtv0sy-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 29 Jun 2017 20:35:06 -0400
Received: from localhost
 by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Thu, 29 Jun 2017 18:35:05 -0600
Received: from b03cxnp08027.gho.boulder.ibm.com (9.17.130.19)
 by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 29 Jun 2017 18:35:02 -0600
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v5U0Z2sY39256230
 for <openbmc@lists.ozlabs.org>; Thu, 29 Jun 2017 17:35:02 -0700
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 600F16E03D
 for <openbmc@lists.ozlabs.org>; Thu, 29 Jun 2017 18:35:02 -0600 (MDT)
Received: from d50lp02.ny.us.ibm.com (unknown [146.89.104.208])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTPS id 3EEDD6E040
 for <openbmc@lists.ozlabs.org>; Thu, 29 Jun 2017 18:35:02 -0600 (MDT)
Received: from localhost
 by d50lp02.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Thu, 29 Jun 2017 20:35:01 -0400
Received: from smtp.notes.na.collabserv.com (192.155.248.75)
 by d50lp02.ny.us.ibm.com (158.87.18.21) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128/128)
 Thu, 29 Jun 2017 20:34:58 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Fri, 30 Jun 2017 00:34:57 -0000
Received: from us1a3-smtp08.a3.dal06.isc4sb.com (10.146.103.57)
 by smtp.notes.na.collabserv.com (10.106.227.123) with
 smtp.notes.na.collabserv.com ESMTP; Fri, 30 Jun 2017 00:34:55 -0000
Received: from us1a3-mail79.a3.dal09.isc4sb.com ([10.142.3.136])
 by us1a3-smtp08.a3.dal06.isc4sb.com
 with ESMTP id 2017063000345519-1031511 ;
 Fri, 30 Jun 2017 00:34:55 +0000 
In-Reply-To: <20170629133008.13045-1-c_mykolak@mellanox.com>
Subject: Re: [PATCH linux dev-4.10] aspeed: Set max gpio num.
From: "Milton Miller II" <miltonm@us.ibm.com>
To: Mykola Kostenok <c_mykolak@mellanox.com>
Cc: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
Date: Fri, 30 Jun 2017 00:34:55 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <20170629133008.13045-1-c_mykolak@mellanox.com>
X-Mailer: IBM iNotes ($HaikuForm 964) | IBM Domino Build
 SCN17157_20170606T0034 June 06, 2017 at 00:34
X-LLNOutbound: False
X-Disclaimed: 31463
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 17063000-0008-0000-0000-000008219B14
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.40962; ST=0; TS=0; UL=0; ISC=; MB=0.000006
X-IBM-SpamModules-Versions: BY=3.00007295; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00880616; UDB=6.00439017; IPR=6.00660769; 
 BA=6.00005447; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016015; XFM=3.00000015;
 UTC=2017-06-30 00:34:56
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2017-06-29 21:15:46 - 6.00006950
x-cbparentid: 17063000-3816-0000-0000-0000251D76B8
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-TM-AS-GCONF: 00
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007295; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00880616; UDB=6.00439017; IPR=6.00660769; 
 BA=6.00005447; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016015; XFM=3.00000015;
 UTC=2017-06-30 00:35:03
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
Message-Id: <OFC401AD1C.D9F923CA-ON0025814E.007AD5AE-0025814F.000332A5@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-06-29_17:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1706300007
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
X-List-Received-Date: Fri, 30 Jun 2017 00:35:09 -0000

On June 29 2017 at 8:31 in some time zone, Mykola Kostenok wrote:
>
>Set maximum number of gpio for ARCH=5FASPEED.
>
>Signed-off-by: Mykola Kostenok <c=5Fmykolak@mellanox.com>

>diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
>index 186c4c214e0a..9d373685c628 100644
>--- a/arch/arm/Kconfig
>+++ b/arch/arm/Kconfig
>@@ -1492,6 +1492,7 @@ config ARCH=5FNR=5FGPIO
> 	default 352 if ARCH=5FVT8500
> 	default 288 if ARCH=5FROCKCHIP
> 	default 264 if MACH=5FH4700
>+	default 232 if ARCH=5FASPEED
> 	default 0
> 	help
> 	  Maximum number of GPIOs in the system.


This is a bad idea.  This sets the maximum total number=20
of gpios supported by the kernel, and setting it to this=20
value would not allow any space for the various pca=20
expanders to define additional gpios.

The logic in asm-generic/gpio.h says if the CONFIG=20
number is 0 use 512 else use the supplied value.

I'm guessing this was motivated to make the gpio numbers=20
match with the controller.  Unfortunately the gpios from=20
the device tree are assigned numbers from the end of=20
the number space.

If we need to assign a specific range, we should try=20
to define an optional property in the gpio chip binding=20
and assign the value to gpio-chip.base in gpio-aspeed.c,=20
but I am doubtful that such a patch would be accepted=20
upstream. =20

milton
