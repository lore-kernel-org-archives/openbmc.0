Return-Path: <cyrilbur@gmail.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vpYZD2SVyzDr2S
 for <openbmc@lists.ozlabs.org>; Thu, 23 Mar 2017 15:32:52 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v2N4SXbP030755
 for <openbmc@lists.ozlabs.org>; Thu, 23 Mar 2017 00:32:38 -0400
Received: from e23smtp06.au.ibm.com (e23smtp06.au.ibm.com [202.81.31.148])
 by mx0a-001b2d01.pphosted.com with ESMTP id 29bt5cdh68-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 23 Mar 2017 00:32:37 -0400
Received: from localhost
 by e23smtp06.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cyrilbur@gmail.com>;
 Thu, 23 Mar 2017 14:32:34 +1000
Received: from d23relay10.au.ibm.com (202.81.31.229)
 by e23smtp06.au.ibm.com (202.81.31.212) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Thu, 23 Mar 2017 14:32:33 +1000
Received: from d23av04.au.ibm.com (d23av04.au.ibm.com [9.190.235.139])
 by d23relay10.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v2N4WORS27394266
 for <openbmc@lists.ozlabs.org>; Thu, 23 Mar 2017 15:32:32 +1100
Received: from d23av04.au.ibm.com (localhost [127.0.0.1])
 by d23av04.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 v2N4VxA1010658
 for <openbmc@lists.ozlabs.org>; Thu, 23 Mar 2017 15:32:00 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av04.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 v2N4VwBW010343; Thu, 23 Mar 2017 15:31:59 +1100
Received: from camb691.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher DHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 835FFA01A5;
 Thu, 23 Mar 2017 15:31:34 +1100 (AEDT)
From: Cyril Bur <cyrilbur@gmail.com>
To: greg@kroah.com
Cc: openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, joel@jms.id.au,
 benh@kernel.crashing.org, sfr@canb.auug.org.au, linux-next@vger.kernel.org
Subject: [PATCH] drivers/misc: Aspeed LPC control fix format string warning
Date: Thu, 23 Mar 2017 15:29:05 +1100
X-Mailer: git-send-email 2.12.1
X-TM-AS-MML: disable
x-cbid: 17032304-0040-0000-0000-00000300783B
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17032304-0041-0000-0000-00000C7746BC
Message-Id: <20170323042905.10354-1-cyrilbur@gmail.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-03-23_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1702020001
 definitions=main-1703230041
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
X-List-Received-Date: Thu, 23 Mar 2017 04:32:52 -0000

resource_size_t is a derivative of phys_addr_t and should also be
printed with %pap:
    drivers/misc/aspeed-lpc-ctrl.c:232:17: warning: format '%x' expects
    argument of type 'unsigned int', but argument 4 has type
    'resource_size_t {aka long long unsigned int}' [-Wformat=] dev_info(dev,
    "Loaded at %pap (0x%08x)\n",

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
---
 drivers/misc/aspeed-lpc-ctrl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/aspeed-lpc-ctrl.c b/drivers/misc/aspeed-lpc-ctrl.c
index c654651a7b6d..2f6bb2244be5 100644
--- a/drivers/misc/aspeed-lpc-ctrl.c
+++ b/drivers/misc/aspeed-lpc-ctrl.c
@@ -229,8 +229,8 @@ static int aspeed_lpc_ctrl_probe(struct platform_device *pdev)
 	if (rc)
 		dev_err(dev, "Unable to register device\n");
 	else
-		dev_info(dev, "Loaded at %pap (0x%08x)\n",
-			&lpc_ctrl->mem_base, lpc_ctrl->mem_size);
+		dev_info(dev, "Loaded at %pap (%pap)\n",
+			&lpc_ctrl->mem_base, &lpc_ctrl->mem_size);
 
 	return rc;
 }
-- 
2.12.1
