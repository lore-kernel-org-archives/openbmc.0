Return-Path: <anoo@linux.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=anoo@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44Zlhx4T4qzDqMk
 for <openbmc@lists.ozlabs.org>; Fri,  5 Apr 2019 01:30:07 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x34EPVca131225
 for <openbmc@lists.ozlabs.org>; Thu, 4 Apr 2019 10:30:05 -0400
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2rnj25e644-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 04 Apr 2019 10:30:04 -0400
Received: from localhost
 by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@linux.ibm.com>;
 Thu, 4 Apr 2019 15:30:02 +0100
Received: from b01cxnp22035.gho.pok.ibm.com (9.57.198.25)
 by e11.ny.us.ibm.com (146.89.104.198) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 4 Apr 2019 15:30:01 +0100
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x34EU04l9896026
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 4 Apr 2019 14:30:00 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0F338112062;
 Thu,  4 Apr 2019 14:30:00 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B6085112063;
 Thu,  4 Apr 2019 14:29:59 +0000 (GMT)
Received: from habcap11p1.aus.stglabs.ibm.com (unknown [9.41.164.53])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu,  4 Apr 2019 14:29:59 +0000 (GMT)
From: Adriana Kobylak <anoo@linux.ibm.com>
To: joel@jms.id.au, openbmc@lists.ozlabs.org
Cc: Adriana Kobylak <anoo@us.ibm.com>
Subject: [PATCH u-boot v2016.07-aspeed-openbmc] aspeed/flash: Add MT25QL01GB
 chip
Date: Thu,  4 Apr 2019 09:29:57 -0500
X-Mailer: git-send-email 2.7.4
In-Reply-To: <CACPK8Xcq7w=h3azUzaPK3F-JUm1oZUOyfnjQ98k2W6_HcKg3rQ@mail.gmail.com>
References: <CACPK8Xcq7w=h3azUzaPK3F-JUm1oZUOyfnjQ98k2W6_HcKg3rQ@mail.gmail.com>
X-TM-AS-GCONF: 00
x-cbid: 19040414-2213-0000-0000-0000037162CC
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010872; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000284; SDB=6.01184237; UDB=6.00620054; IPR=6.00964990; 
 MB=3.00026295; MTD=3.00000008; XFM=3.00000015; UTC=2019-04-04 14:30:02
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19040414-2214-0000-0000-00005DE6E299
Message-Id: <1554388197-10251-1-git-send-email-anoo@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-04_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1904040092
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
X-List-Received-Date: Thu, 04 Apr 2019 14:30:10 -0000

From: Adriana Kobylak <anoo@us.ibm.com>

The MT25QL01GB is a 128MB NOR flash chip planned to be used on
a Witherspoon system (AST2500).

Signed-off-by: Adriana Kobylak <anoo@us.ibm.com>
Tested-by: Adriana Kobylak <anoo@us.ibm.com>
---
 arch/arm/mach-aspeed/flash.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/mach-aspeed/flash.c b/arch/arm/mach-aspeed/flash.c
index 907e785..54a6059 100644
--- a/arch/arm/mach-aspeed/flash.c
+++ b/arch/arm/mach-aspeed/flash.c
@@ -83,6 +83,7 @@ flash_info_t flash_info[CONFIG_SYS_MAX_FLASH_BANKS];		/* FLASH chips info */
 #define SST25VF040B		0x8d25bf
 #define AT25DF161		0x02461F
 #define AT25DF321		0x01471F
+#define MT25QL01GB		0x21ba20
 
 /* SPI Define */
 #define CS0_CTRL			0x10
@@ -1141,6 +1142,19 @@ static ulong flash_get_size (ulong base, flash_info_t *info)
 			ReadClk  = 50;
 			break;
 
+		case MT25QL01GB:
+			info->sector_count = 2048;
+			info->size = 0x8000000;
+			erase_region_size  = 0x10000;
+			info->readcmd = 0x0b;
+			info->dualport = 0;
+			info->dummybyte = 1;
+			info->buffersize = 1;
+			WriteClk = 50;
+			EraseClk = 25;
+			ReadClk  = 50;
+			break;
+
 		default:	/* use JEDEC ID */
 			printf("Unsupported SPI Flash!! 0x%08lx\n", info->flash_id);
 			erase_region_size  = 0x10000;
-- 
1.8.3.1
