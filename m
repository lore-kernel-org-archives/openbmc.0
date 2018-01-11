Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zHbNW0ZdxzF0hQ
 for <openbmc@lists.ozlabs.org>; Fri, 12 Jan 2018 06:22:02 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w0BJL4gs019147
 for <openbmc@lists.ozlabs.org>; Thu, 11 Jan 2018 14:22:01 -0500
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2feb9k7tre-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 11 Jan 2018 14:22:00 -0500
Received: from localhost
 by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 11 Jan 2018 12:21:59 -0700
Received: from b03cxnp08028.gho.boulder.ibm.com (9.17.130.20)
 by e35.co.us.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 11 Jan 2018 12:21:57 -0700
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w0BJLuuW12517812; Thu, 11 Jan 2018 12:21:56 -0700
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A46496E040;
 Thu, 11 Jan 2018 12:21:56 -0700 (MST)
Received: from talon7.ibm.com (unknown [9.41.241.240])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP id 4AA3A6E035;
 Thu, 11 Jan 2018 12:21:56 -0700 (MST)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, Eddie James <eajames@linux.vnet.ibm.com>,
 Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH linux dev-4.13 3/4] hwmon: (pmbus) cffps: Add
 PMBUS_SKIP_STATUS_CHECK
Date: Thu, 11 Jan 2018 13:21:49 -0600
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1515698510-16619-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1515698510-16619-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 18011119-0012-0000-0000-00001596302A
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008361; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000245; SDB=6.00973577; UDB=6.00493317; IPR=6.00753522; 
 BA=6.00005773; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00018983; XFM=3.00000015;
 UTC=2018-01-11 19:21:58
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18011119-0013-0000-0000-000051050AC0
Message-Id: <1515698510-16619-4-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-01-11_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1801110264
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
X-List-Received-Date: Thu, 11 Jan 2018 19:22:03 -0000

This power supply device regularly fails to read VOUT_MODE due to the
CML bit going high. This results in an incorrect exponent used for the
voltage data, and therefore the power supply reports incorrect voltage.
Work around this by setting the pmbus flag to skip the CML check.

Signed-off-by: Eddie James <eajames@linux.vnet.ibm.com>
Fixes: f69316d62c70 ("hwmon: (pmbus) Add IBM Common Form Factor (CFF) ...")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/pmbus/ibm-cffps.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/hwmon/pmbus/ibm-cffps.c b/drivers/hwmon/pmbus/ibm-cffps.c
index de254747..2d6f4f4 100644
--- a/drivers/hwmon/pmbus/ibm-cffps.c
+++ b/drivers/hwmon/pmbus/ibm-cffps.c
@@ -15,6 +15,7 @@
 #include <linux/jiffies.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
+#include <linux/pmbus.h>
 
 #include "pmbus.h"
 
@@ -268,6 +269,10 @@ static int ibm_cffps_read_word_data(struct i2c_client *client, int page,
 	.read_word_data = ibm_cffps_read_word_data,
 };
 
+static struct pmbus_platform_data ibm_cffps_pdata = {
+	.flags = PMBUS_SKIP_STATUS_CHECK,
+};
+
 static int ibm_cffps_probe(struct i2c_client *client,
 			   const struct i2c_device_id *id)
 {
@@ -276,6 +281,7 @@ static int ibm_cffps_probe(struct i2c_client *client,
 	struct dentry *ibm_cffps_dir;
 	struct ibm_cffps *psu;
 
+	client->dev.platform_data = &ibm_cffps_pdata;
 	rc = pmbus_do_probe(client, id, &ibm_cffps_info);
 	if (rc)
 		return rc;
-- 
1.8.3.1
