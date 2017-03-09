Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vdrDg06VhzDqXc
 for <openbmc@lists.ozlabs.org>; Thu,  9 Mar 2017 11:02:26 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v28NrhmJ056546
 for <openbmc@lists.ozlabs.org>; Wed, 8 Mar 2017 19:02:24 -0500
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209])
 by mx0a-001b2d01.pphosted.com with ESMTP id 292j6yncw6-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 08 Mar 2017 19:02:24 -0500
Received: from localhost
 by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Wed, 8 Mar 2017 19:02:23 -0500
Received: from b01cxnp22034.gho.pok.ibm.com (9.57.198.24)
 by e19.ny.us.ibm.com (146.89.104.206) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 8 Mar 2017 19:02:21 -0500
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v2902KOL39780388; Thu, 9 Mar 2017 00:02:20 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 804F711206B;
 Wed,  8 Mar 2017 19:02:19 -0500 (EST)
Received: from Christophers-MacBook-Pro.local.com (unknown [9.81.214.151])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP id 370B3112034;
 Wed,  8 Mar 2017 19:02:16 -0500 (EST)
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
To: joel@jms.id.au
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.7] drivers/fsi: Flag FSI bus errors with dev_err( )
Date: Wed,  8 Mar 2017 18:02:13 -0600
X-Mailer: git-send-email 2.10.1 (Apple Git-78)
X-TM-AS-GCONF: 00
x-cbid: 17030900-0056-0000-0000-000002F89BC1
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006747; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000206; SDB=6.00831915; UDB=6.00408209; IPR=6.00609507; 
 BA=6.00005201; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014565; XFM=3.00000013;
 UTC=2017-03-09 00:02:21
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17030900-0057-0000-0000-0000072EB01F
Message-Id: <20170309000213.20262-1-cbostic@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-03-08_18:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1702020001
 definitions=main-1703080185
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
X-List-Received-Date: Thu, 09 Mar 2017 00:02:27 -0000

Currently not seeing details of any FSI bus errors that may
occur.  Send info via dev_err so that the type of FSI bus fail
can be determined.

Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
---
 drivers/fsi/fsi-master-gpio.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
index 49f3399..c2f2fe2 100644
--- a/drivers/fsi/fsi-master-gpio.c
+++ b/drivers/fsi/fsi-master-gpio.c
@@ -218,8 +218,8 @@ static int poll_for_response(struct fsi_master_gpio *master, uint8_t expected,
 				break;
 		}
 		if (i >= FSI_GPIO_MTOE_COUNT) {
-			dev_dbg(master->master.dev,
-				"Master time out waiting for response\n");
+			dev_err(master->master.dev,
+				"MTOE: Master time out waiting for response\n");
 			drain_response(master);
 			fsi_master_gpio_error(master, FSI_GPIO_MTOE);
 			return -EIO;
@@ -257,8 +257,8 @@ static int poll_for_response(struct fsi_master_gpio *master, uint8_t expected,
 
 		case FSI_GPIO_RESP_ERRA:
 		case FSI_GPIO_RESP_ERRC:
-			dev_dbg(master->master.dev, "ERR received: %d\n",
-				(int)response.msg);
+			dev_err(master->master.dev, "ERRA/C received: %d\n",
+				response_id);
 			/*
 			 * todo: Verify crc from slave and in general
 			 * only act on any response if crc is correct
@@ -283,7 +283,7 @@ static int poll_for_response(struct fsi_master_gpio *master, uint8_t expected,
 		/* Read in the crc and check it */
 		serial_in(master, &response, FSI_GPIO_CRC_SIZE);
 		if (crc_in != response.msg) {
-			dev_dbg(master->master.dev, "ERR response CRC\n");
+			dev_err(master->master.dev, "ERR response CRC\n");
 			fsi_master_gpio_error(master, FSI_GPIO_CRC_INVAL);
 			return -EIO;
 		}
@@ -293,7 +293,7 @@ static int poll_for_response(struct fsi_master_gpio *master, uint8_t expected,
 
 	} while (busy_count++ < FSI_GPIO_MAX_BUSY);
 
-	dev_dbg(master->master.dev, "ERR slave is stuck in busy state\n");
+	dev_err(master->master.dev, "ERR slave is stuck in busy state\n");
 	fsi_master_gpio_error(master, FSI_GPIO_ERR_BUSY);
 
 	return -EIO;
-- 
1.8.2.2
