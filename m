Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zHZch3DdWzF0Zc
 for <openbmc@lists.ozlabs.org>; Fri, 12 Jan 2018 05:47:32 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w0BIhgEa038210
 for <openbmc@lists.ozlabs.org>; Thu, 11 Jan 2018 13:47:29 -0500
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2feb9k6am8-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 11 Jan 2018 13:47:29 -0500
Received: from localhost
 by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 11 Jan 2018 13:47:28 -0500
Received: from b01cxnp22035.gho.pok.ibm.com (9.57.198.25)
 by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 11 Jan 2018 13:47:25 -0500
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w0BIlOYu48562242; Thu, 11 Jan 2018 18:47:24 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 261F9112034;
 Thu, 11 Jan 2018 13:45:35 -0500 (EST)
Received: from talon7.ibm.com (unknown [9.41.241.240])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP id B4A78112047;
 Thu, 11 Jan 2018 13:45:34 -0500 (EST)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, Eddie James <eajames@linux.vnet.ibm.com>,
 "Edward A. James" <eajames@us.ibm.com>, Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH linux dev-4.10 3/5] hwmon: (pmbus) Export pmbus device debugfs
 directory entry
Date: Thu, 11 Jan 2018 12:47:15 -0600
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1515696437-10508-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1515696437-10508-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 18011118-0040-0000-0000-000003E01DC5
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008361; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000245; SDB=6.00973566; UDB=6.00493310; IPR=6.00753511; 
 BA=6.00005773; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00018983; XFM=3.00000015;
 UTC=2018-01-11 18:47:26
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18011118-0041-0000-0000-000007D578E9
Message-Id: <1515696437-10508-4-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-01-11_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
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
X-List-Received-Date: Thu, 11 Jan 2018 18:47:32 -0000

Pmbus client drivers, if they want to use debugfs, should use the same
root directory as the pmbus debugfs entries are using. Therefore, export
the device dentry for the pmbus client.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/pmbus/pmbus.h      | 1 +
 drivers/hwmon/pmbus/pmbus_core.c | 8 ++++++++
 2 files changed, 9 insertions(+)

diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
index c028d31..e32de81 100644
--- a/drivers/hwmon/pmbus/pmbus.h
+++ b/drivers/hwmon/pmbus/pmbus.h
@@ -452,5 +452,6 @@ int pmbus_do_probe(struct i2c_client *client, const struct i2c_device_id *id,
 int pmbus_do_remove(struct i2c_client *client);
 const struct pmbus_driver_info *pmbus_get_driver_info(struct i2c_client
 						      *client);
+struct dentry *pmbus_get_debugfs_dir(struct i2c_client *client);
 
 #endif /* PMBUS_H */
diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 37ab3666..cf52820 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -2368,6 +2368,14 @@ int pmbus_do_remove(struct i2c_client *client)
 }
 EXPORT_SYMBOL_GPL(pmbus_do_remove);
 
+struct dentry *pmbus_get_debugfs_dir(struct i2c_client *client)
+{
+	struct pmbus_data *data = i2c_get_clientdata(client);
+
+	return data->debugfs;
+}
+EXPORT_SYMBOL_GPL(pmbus_get_debugfs_dir);
+
 static int __init pmbus_core_init(void)
 {
 	pmbus_debugfs_dir = debugfs_create_dir("pmbus", NULL);
-- 
1.8.3.1
