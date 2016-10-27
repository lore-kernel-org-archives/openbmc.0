Return-Path: <alastair@au1.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t49lw51qqzDvJD
 for <openbmc@lists.ozlabs.org>; Thu, 27 Oct 2016 13:27:56 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 u9R2Ppll024824
 for <openbmc@lists.ozlabs.org>; Wed, 26 Oct 2016 22:27:54 -0400
Received: from e23smtp03.au.ibm.com (e23smtp03.au.ibm.com [202.81.31.145])
 by mx0b-001b2d01.pphosted.com with ESMTP id 26b7pu28j3-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 26 Oct 2016 22:27:53 -0400
Received: from localhost
 by e23smtp03.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <alastair@au1.ibm.com>;
 Thu, 27 Oct 2016 12:27:50 +1000
Received: from d23dlp03.au.ibm.com (202.81.31.214)
 by e23smtp03.au.ibm.com (202.81.31.209) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Thu, 27 Oct 2016 12:27:42 +1000
Received: from d23relay10.au.ibm.com (d23relay10.au.ibm.com [9.190.26.77])
 by d23dlp03.au.ibm.com (Postfix) with ESMTP id 750FF357805D
 for <openbmc@lists.ozlabs.org>; Thu, 27 Oct 2016 13:27:40 +1100 (EST)
Received: from d23av02.au.ibm.com (d23av02.au.ibm.com [9.190.235.138])
 by d23relay10.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u9R2ReJh51707908
 for <openbmc@lists.ozlabs.org>; Thu, 27 Oct 2016 13:27:40 +1100
Received: from d23av02.au.ibm.com (localhost [127.0.0.1])
 by d23av02.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u9R2RdmG017001
 for <openbmc@lists.ozlabs.org>; Thu, 27 Oct 2016 13:27:40 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av02.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u9R2Rddn016998; Thu, 27 Oct 2016 13:27:39 +1100
Received: from adsilva.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id A6FF8A0217;
 Thu, 27 Oct 2016 13:27:39 +1100 (AEDT)
From: alastair@au1.ibm.com
To: openbmc@lists.ozlabs.org
Cc: clg@koad.org, andrew@aj.id.au, "Alastair D'Silva" <alastair@d-silva.org>
Subject: [PATCH 2/3] Connect an RX8900 RTC to i2c12 of the AST2500 SOC at
 address 0x32
Date: Thu, 27 Oct 2016 13:27:12 +1100
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1477535233-7760-1-git-send-email-alastair@au1.ibm.com>
References: <1477535233-7760-1-git-send-email-alastair@au1.ibm.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16102702-0008-0000-0000-000000D5B7CF
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16102702-0009-0000-0000-0000085AD1D1
Message-Id: <1477535233-7760-3-git-send-email-alastair@au1.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-10-27_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1609300000
 definitions=main-1610270039
X-Mailman-Approved-At: Thu, 27 Oct 2016 14:33:06 +1100
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
X-List-Received-Date: Thu, 27 Oct 2016 02:27:57 -0000

From: Alastair D'Silva <alastair@d-silva.org>

Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 hw/arm/aspeed.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index c7206fd..8ccac3e 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -100,6 +100,7 @@ static void aspeed_board_init(MachineState *machine,
 {
     AspeedBoardState *bmc;
     AspeedSoCClass *sc;
+    I2CBus *i2c12;
 
     bmc = g_new0(AspeedBoardState, 1);
     object_initialize(&bmc->soc, (sizeof(bmc->soc)), cfg->soc_name);
@@ -137,6 +138,9 @@ static void aspeed_board_init(MachineState *machine,
     aspeed_board_binfo.ram_size = ram_size;
     aspeed_board_binfo.loader_start = sc->info->sdram_base;
 
+    i2c12 = aspeed_i2c_get_bus((DeviceState *)&bmc->soc.i2c, 11);
+    i2c_create_slave(i2c12, "rx8900", 0x32);
+
     arm_load_kernel(ARM_CPU(first_cpu), &aspeed_board_binfo);
 }
 
-- 
2.7.4
