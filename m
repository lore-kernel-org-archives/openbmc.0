Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xKZDx2czYzDrj2
 for <openbmc@lists.ozlabs.org>; Sun, 30 Jul 2017 04:36:49 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v6TIY2hD094721
 for <openbmc@lists.ozlabs.org>; Sat, 29 Jul 2017 14:36:46 -0400
Received: from e18.ny.us.ibm.com (e18.ny.us.ibm.com [129.33.205.208])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2c0pgtyrwy-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Sat, 29 Jul 2017 14:36:46 -0400
Received: from localhost
 by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Sat, 29 Jul 2017 14:36:46 -0400
Received: from b01cxnp22036.gho.pok.ibm.com (9.57.198.26)
 by e18.ny.us.ibm.com (146.89.104.205) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Sat, 29 Jul 2017 14:36:44 -0400
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v6TIahYr26083524; Sat, 29 Jul 2017 18:36:43 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A2787AE04E;
 Sat, 29 Jul 2017 14:36:56 -0400 (EDT)
Received: from Christophers-MacBook-Pro.local.com (unknown [9.85.181.170])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP id 50342AE03B;
 Sat, 29 Jul 2017 14:36:56 -0400 (EDT)
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
To: joel@jms.id.au
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 v6 2/2] drivers/leds: pca955x count LED lines
 as GPIO
Date: Sat, 29 Jul 2017 13:36:38 -0500
X-Mailer: git-send-email 2.10.1 (Apple Git-78)
In-Reply-To: <20170729183638.17503-1-cbostic@linux.vnet.ibm.com>
References: <20170729183638.17503-1-cbostic@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17072918-0044-0000-0000-000003751A39
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007448; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00894699; UDB=6.00447398; IPR=6.00674866; 
 BA=6.00005499; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016443; XFM=3.00000015;
 UTC=2017-07-29 18:36:45
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17072918-0045-0000-0000-000007A32942
Message-Id: <20170729183638.17503-3-cbostic@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-07-29_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1707290309
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
X-List-Received-Date: Sat, 29 Jul 2017 18:36:49 -0000

In order for gpio-keys-polled driver to properly register pins
connected to the pca955x chip it is necessary to count 'LED' lines
as part of the total gpio count.  The assocated gpio_chip struct
for the pca955x is then set to all available I/O (LEDS and 'GPIO').
Failure to do so will cause any pin # > GPIO pin count to fail
gpio-keys-polled probe/registration as it falls outside the bounds
of what the gpio_chip struct indicates is available.

Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
---
 drivers/leds/leds-pca955x.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
index 9216742..4fa58b9 100644
--- a/drivers/leds/leds-pca955x.c
+++ b/drivers/leds/leds-pca955x.c
@@ -472,6 +472,8 @@ static int pca955x_probe(struct i2c_client *client,
 			ngpios++;
 			break;
 		case PCA955X_TYPE_LED:
+			ngpios++;
+
 			/*
 			 * Platform data can specify LED names and
 			 * default triggers
-- 
1.8.2.2
