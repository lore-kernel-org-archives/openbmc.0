Return-Path: <anoo@linux.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=anoo@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43x2sG3fz5zDqbf
 for <openbmc@lists.ozlabs.org>; Sat,  9 Feb 2019 04:55:27 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x18HtIQt091188
 for <openbmc@lists.ozlabs.org>; Fri, 8 Feb 2019 12:55:24 -0500
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2qhdyq1j9w-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 08 Feb 2019 12:55:20 -0500
Received: from localhost
 by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@linux.ibm.com>;
 Fri, 8 Feb 2019 17:55:11 -0000
Received: from b01cxnp22036.gho.pok.ibm.com (9.57.198.26)
 by e14.ny.us.ibm.com (146.89.104.201) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 8 Feb 2019 17:55:10 -0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x18Ht9YK17629342
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 8 Feb 2019 17:55:09 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 09EEC124055;
 Fri,  8 Feb 2019 17:55:09 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C25BB124052;
 Fri,  8 Feb 2019 17:55:08 +0000 (GMT)
Received: from habcap11p1.aus.stglabs.ibm.com (unknown [9.41.164.53])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri,  8 Feb 2019 17:55:08 +0000 (GMT)
From: Adriana Kobylak <anoo@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH] aspeed: flash: Add MT25QL01GB chip
Date: Fri,  8 Feb 2019 11:55:07 -0600
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1549646915-5300-1-git-send-email-anoo@linux.ibm.com>
References: <1549646915-5300-1-git-send-email-anoo@linux.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 19020817-0052-0000-0000-0000038720E2
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010560; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000279; SDB=6.01158176; UDB=6.00604289; IPR=6.00938708; 
 MB=3.00025496; MTD=3.00000008; XFM=3.00000015; UTC=2019-02-08 17:55:10
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19020817-0053-0000-0000-00005FC5C66C
Message-Id: <1549648507-6368-1-git-send-email-anoo@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-02-08_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=958 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1902080122
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
X-List-Received-Date: Fri, 08 Feb 2019 17:55:31 -0000

The MT25QL01GB is a 128MB NOR flash chip planned to be used on
a Witherspoon system (AST2500).

Signed-off-by: Adriana Kobylak <anoo@linux.ibm.com>
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
