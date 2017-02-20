Return-Path: <miltonm@us.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vRz1Y6mFwzDqC0
 for <openbmc@lists.ozlabs.org>; Tue, 21 Feb 2017 09:33:37 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v1KMTmd1114888
 for <openbmc@lists.ozlabs.org>; Mon, 20 Feb 2017 17:33:35 -0500
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153])
 by mx0b-001b2d01.pphosted.com with ESMTP id 28r2pnfxg8-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 20 Feb 2017 17:33:35 -0500
Received: from localhost
 by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Mon, 20 Feb 2017 15:33:34 -0700
Received: from d03dlp01.boulder.ibm.com (9.17.202.177)
 by e35.co.us.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 20 Feb 2017 15:33:32 -0700
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by d03dlp01.boulder.ibm.com (Postfix) with ESMTP id BA04E1FF0028
 for <openbmc@lists.ozlabs.org>; Mon, 20 Feb 2017 15:33:09 -0700 (MST)
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v1KMXWvK15991204
 for <openbmc@lists.ozlabs.org>; Mon, 20 Feb 2017 15:33:32 -0700
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 38E6C13603A
 for <openbmc@lists.ozlabs.org>; Mon, 20 Feb 2017 15:33:32 -0700 (MST)
Received: from d50lp02.ny.us.ibm.com (unknown [146.89.104.208])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTPS id F117F136046
 for <openbmc@lists.ozlabs.org>; Mon, 20 Feb 2017 15:33:31 -0700 (MST)
Received: from localhost
 by d50lp02.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Mon, 20 Feb 2017 17:33:31 -0500
Received: from smtp.notes.na.collabserv.com (192.155.248.74)
 by d50lp02.ny.us.ibm.com (158.87.18.21) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128/128)
 Mon, 20 Feb 2017 17:33:28 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Mon, 20 Feb 2017 22:33:27 -0000
Received: from us1a3-smtp04.a3.dal06.isc4sb.com (10.106.154.237)
 by smtp.notes.na.collabserv.com (10.106.227.92) with
 smtp.notes.na.collabserv.com ESMTP; Mon, 20 Feb 2017 22:33:25 -0000
Received: from us1a3-mail79.a3.dal09.isc4sb.com ([10.142.3.136])
 by us1a3-smtp04.a3.dal06.isc4sb.com
 with ESMTP id 2017022022332426-567156 ;
 Mon, 20 Feb 2017 22:33:24 +0000 
In-Reply-To: <1487624750-7425-1-git-send-email-eajames@linux.vnet.ibm.com>
Subject: Re: [PATCH linux dev-4.7] drivers: fsi: Copy all data out
From: "Milton Miller II" <miltonm@us.ibm.com>
To: Eddie James <eajames@linux.vnet.ibm.com>
Cc: openbmc@lists.ozlabs.org, joel@jms.id.au,
 "Edward James" <eajames@us.ibm.com>
Date: Mon, 20 Feb 2017 22:33:24 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <1487624750-7425-1-git-send-email-eajames@linux.vnet.ibm.com>
X-Mailer: IBM iNotes ($HaikuForm 914) | IBM Domino Build SCN_20170207T0116_FP6
 February 15, 2017 at 10:35
X-LLNOutbound: False
X-Disclaimed: 7359
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 17022022-0012-0000-0000-000013B66999
X-IBM-SpamModules-Scores: BY=0.027661; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.40962; ST=0; TS=0; UL=0; ISC=; MB=0.000005
X-IBM-SpamModules-Versions: BY=3.00006653; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000204; SDB=6.00824726; UDB=6.00403745; IPR=6.00602182; 
 BA=6.00005158; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014363; XFM=3.00000011;
 UTC=2017-02-20 22:33:26
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2017-02-20 16:49:08 - 6.00006330
x-cbparentid: 17022022-7582-0000-0000-0000042A1276
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006653; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000204; SDB=6.00824726; UDB=6.00403745; IPR=6.00602182; 
 BA=6.00005158; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014363; XFM=3.00000011;
 UTC=2017-02-20 22:33:33
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
Message-Id: <OF7EE21505.D63A2F41-ON002580CD.007BE8A7-002580CD.007BE8AB@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-02-20_18:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1702200207
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
X-List-Received-Date: Mon, 20 Feb 2017 22:33:38 -0000



-----"openbmc" <openbmc-bounces+miltonm=3Dus.ibm.com@lists.ozlabs.org> wrot=
e: -----
>From: Eddie James=20
>Date: 02/20/2017 03:06PM
>
>From: "Edward A. James" <eajames@us.ibm.com>
>
>Driver was only copying 32 bits out to the user-provided data
>pointer.
>
>Signed-off-by: Edward A. James <eajames@us.ibm.com>
>---
> drivers/fsi/fsi-master-gpio.c | 5 +++--
> 1 file changed, 3 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/fsi/fsi-master-gpio.c
>b/drivers/fsi/fsi-master-gpio.c
>index 3ed82ea..3eb6ec2 100644
>--- a/drivers/fsi/fsi-master-gpio.c
>+++ b/drivers/fsi/fsi-master-gpio.c
>@@ -203,7 +203,7 @@ static void fsi=5Fmaster=5Fgpio=5Ferror(struct
>fsi=5Fmaster=5Fgpio *master, int error)
> static int poll=5Ffor=5Fresponse(struct fsi=5Fmaster=5Fgpio *master, uint=
8=5Ft
>expected,
> 			uint8=5Ft size, void *data)
> {
>-	int busy=5Fcount =3D 0, i;
>+	int busy=5Fcount =3D 0, i, j;
> 	struct fsi=5Fgpio=5Fmsg response, cmd;
> 	int bits=5Fremaining =3D 0, bit=5Fcount, response=5Fid, id;
> 	uint64=5Ft resp =3D 0;
>@@ -274,7 +274,8 @@ static int poll=5Ffor=5Fresponse(struct
>fsi=5Fmaster=5Fgpio *master, uint8=5Ft expected,
> 			resp <<=3D bits=5Fremaining;
> 			resp |=3D response.msg;
> 			bits=5Freceived +=3D bits=5Fremaining;
>-			*((uint32=5Ft *)data) =3D response.msg;
>+			for (j =3D 0; j < size; ++j)
>+				((uint8=5Ft *)data)[j] =3D ((uint8=5Ft *)&response.msg)[j];

A lot of casting for memcpy(data, &response.msg, size);

> 		}
>=20
> 		crc=5Fin =3D fsi=5Fcrc4(0, resp | (0x1ULL << bits=5Freceived),
>--=20
>1.8.3.1

milton
