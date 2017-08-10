Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xSXZ23KMbzDqrx
 for <openbmc@lists.ozlabs.org>; Thu, 10 Aug 2017 12:45:45 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v7A2j4Xr129913
 for <openbmc@lists.ozlabs.org>; Wed, 9 Aug 2017 22:45:43 -0400
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2c8993e5pg-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 09 Aug 2017 22:45:43 -0400
Received: from localhost
 by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Wed, 9 Aug 2017 22:45:42 -0400
Received: from b01cxnp22036.gho.pok.ibm.com (9.57.198.26)
 by e13.ny.us.ibm.com (146.89.104.200) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 9 Aug 2017 22:45:39 -0400
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v7A2jcbE25231492; Thu, 10 Aug 2017 02:45:38 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4ECECB2046;
 Wed,  9 Aug 2017 22:43:05 -0400 (EDT)
Received: from oc3016140333.ibm.com (unknown [9.85.205.55])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP id EF170B204E;
 Wed,  9 Aug 2017 22:43:04 -0400 (EDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10] hwmon: (occ): Add error thresholding back in
Date: Wed,  9 Aug 2017 21:45:30 -0500
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
x-cbid: 17081002-0008-0000-0000-0000026C55F9
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007516; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000219; SDB=6.00900088; UDB=6.00450588; IPR=6.00680294; 
 BA=6.00005520; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016620; XFM=3.00000015;
 UTC=2017-08-10 02:45:41
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17081002-0009-0000-0000-00003652DA7B
Message-Id: <1502333130-19673-1-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-08-10_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1708100044
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
X-List-Received-Date: Thu, 10 Aug 2017 02:45:47 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Threshold communication and message errors to the OCC, such that errors
are only valid after two have been observed in a row. This thresholding
is required by the OCC specification. An old P8 OCC spec is available
here:
https://github.com/open-power/docs/blob/master/occ/OCC_OpenPwr_FW_Interfaces.pdf

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/hwmon/occ/common.c | 3 ++-
 drivers/hwmon/occ/common.h | 2 ++
 drivers/hwmon/occ/p8_i2c.c | 4 +++-
 drivers/hwmon/occ/p9_sbe.c | 2 ++
 4 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
index a793834..3f63467 100644
--- a/drivers/hwmon/occ/common.c
+++ b/drivers/hwmon/occ/common.c
@@ -166,7 +166,8 @@ void occ_parse_poll_response(struct occ *occ)
 void occ_set_error(struct occ *occ, int error)
 {
 	occ->error_count++;
-	occ->error = error;
+	if (occ->error_count > OCC_ERROR_COUNT_THRESHOLD)
+		occ->error = error;
 }
 
 void occ_reset_error(struct occ *occ)
diff --git a/drivers/hwmon/occ/common.h b/drivers/hwmon/occ/common.h
index ca5969c..acb50bc 100644
--- a/drivers/hwmon/occ/common.h
+++ b/drivers/hwmon/occ/common.h
@@ -13,6 +13,8 @@
 #include <linux/hwmon-sysfs.h>
 #include <linux/sysfs.h>
 
+#define OCC_ERROR_COUNT_THRESHOLD	2
+
 #define OCC_UPDATE_FREQUENCY		msecs_to_jiffies(1000)
 #define OCC_RESP_DATA_BYTES		4089
 
diff --git a/drivers/hwmon/occ/p8_i2c.c b/drivers/hwmon/occ/p8_i2c.c
index 05af16b..269cb91 100644
--- a/drivers/hwmon/occ/p8_i2c.c
+++ b/drivers/hwmon/occ/p8_i2c.c
@@ -169,7 +169,7 @@ static int p8_i2c_occ_send_cmd(struct occ *occ, u8 *cmd)
 
 	data_length = get_unaligned_be16(&resp->data_length_be);
 	if (data_length > OCC_RESP_DATA_BYTES) {
-		rc = -EIO;
+		rc = -EMSGSIZE;
 		dev_warn(&client->dev, "occ bad data length:%d\n",
 			 data_length);
 		goto assign;
@@ -186,8 +186,10 @@ static int p8_i2c_occ_send_cmd(struct occ *occ, u8 *cmd)
 
 err:
 	dev_err(&client->dev, "i2c scom op failed rc:%d\n", rc);
+
 assign:
 	error = rc;
+
 done:
 	occ_set_error(occ, error);
 	return rc;
diff --git a/drivers/hwmon/occ/p9_sbe.c b/drivers/hwmon/occ/p9_sbe.c
index 2d50a94..db30a2d 100644
--- a/drivers/hwmon/occ/p9_sbe.c
+++ b/drivers/hwmon/occ/p9_sbe.c
@@ -86,8 +86,10 @@ static int p9_sbe_occ_send_cmd(struct occ *occ, u8 *cmd)
 err:
 	occ_drv_release(client);
 	dev_err(occ->bus_dev, "occ bus op failed rc:%d\n", rc);
+
 assign:
 	error = rc;
+
 done:
 	occ_set_error(occ, error);
 	return rc;
-- 
1.8.3.1
