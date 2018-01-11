Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zHZcd5mPMzF0Zc
 for <openbmc@lists.ozlabs.org>; Fri, 12 Jan 2018 05:47:29 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w0BIkiN6038617
 for <openbmc@lists.ozlabs.org>; Thu, 11 Jan 2018 13:47:28 -0500
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2feaq37xgr-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 11 Jan 2018 13:47:27 -0500
Received: from localhost
 by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 11 Jan 2018 13:47:26 -0500
Received: from b01cxnp22034.gho.pok.ibm.com (9.57.198.24)
 by e12.ny.us.ibm.com (146.89.104.199) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 11 Jan 2018 13:47:23 -0500
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w0BIlM1V53215254; Thu, 11 Jan 2018 18:47:22 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 358B7112057;
 Thu, 11 Jan 2018 13:45:33 -0500 (EST)
Received: from talon7.ibm.com (unknown [9.41.241.240])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP id D12C3112040;
 Thu, 11 Jan 2018 13:45:32 -0500 (EST)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, Eddie James <eajames@linux.vnet.ibm.com>,
 Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH linux dev-4.10 2/5] hwmon: (pmbus) cffps: Add
 PMBUS_SKIP_STATUS_CHECK
Date: Thu, 11 Jan 2018 12:47:14 -0600
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1515696437-10508-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1515696437-10508-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 18011118-0048-0000-0000-000002231C3C
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008361; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000245; SDB=6.00973566; UDB=6.00493310; IPR=6.00753511; 
 BA=6.00005773; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00018983; XFM=3.00000015;
 UTC=2018-01-11 18:47:24
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18011118-0049-0000-0000-000043BE40B3
Message-Id: <1515696437-10508-3-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-01-11_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1801110255
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
X-List-Received-Date: Thu, 11 Jan 2018 18:47:30 -0000

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
index 1a6294c..3269617 100644
--- a/drivers/hwmon/pmbus/ibm-cffps.c
+++ b/drivers/hwmon/pmbus/ibm-cffps.c
@@ -9,6 +9,7 @@
 
 #include <linux/device.h>
 #include <linux/i2c.h>
+#include <linux/i2c/pmbus.h>
 #include <linux/jiffies.h>
 #include <linux/module.h>
 
@@ -116,9 +117,14 @@ static int ibm_cffps_read_word_data(struct i2c_client *client, int page,
 	.read_word_data = ibm_cffps_read_word_data,
 };
 
+static struct pmbus_platform_data ibm_cffps_pdata = {
+	.flags = PMBUS_SKIP_STATUS_CHECK,
+};
+
 static int ibm_cffps_probe(struct i2c_client *client,
 			   const struct i2c_device_id *id)
 {
+	client->dev.platform_data = &ibm_cffps_pdata;
 	return pmbus_do_probe(client, id, &ibm_cffps_info);
 }
 
-- 
1.8.3.1
