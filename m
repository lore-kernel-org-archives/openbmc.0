Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zHZcc1sFNzF0Zk
 for <openbmc@lists.ozlabs.org>; Fri, 12 Jan 2018 05:47:27 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w0BIhkn3115677
 for <openbmc@lists.ozlabs.org>; Thu, 11 Jan 2018 13:47:25 -0500
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2fec2s3xnv-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 11 Jan 2018 13:47:24 -0500
Received: from localhost
 by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 11 Jan 2018 13:47:24 -0500
Received: from b01cxnp22035.gho.pok.ibm.com (9.57.198.25)
 by e13.ny.us.ibm.com (146.89.104.200) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 11 Jan 2018 13:47:21 -0500
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w0BIlKQm48496768; Thu, 11 Jan 2018 18:47:20 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3DDFC112034;
 Thu, 11 Jan 2018 13:45:31 -0500 (EST)
Received: from talon7.ibm.com (unknown [9.41.241.240])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP id DB381112040;
 Thu, 11 Jan 2018 13:45:30 -0500 (EST)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, Eddie James <eajames@linux.vnet.ibm.com>,
 "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 1/5] hwmon: (pmbus/core) Prevent unintentional
 setting of page to 0xFF
Date: Thu, 11 Jan 2018 12:47:13 -0600
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1515696437-10508-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1515696437-10508-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 18011118-0008-0000-0000-000002BE1E5E
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008361; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000245; SDB=6.00973566; UDB=6.00493310; IPR=6.00753511; 
 BA=6.00005773; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00018983; XFM=3.00000015;
 UTC=2018-01-11 18:47:22
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18011118-0009-0000-0000-000037E093F6
Message-Id: <1515696437-10508-2-git-send-email-eajames@linux.vnet.ibm.com>
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
X-List-Received-Date: Thu, 11 Jan 2018 18:47:28 -0000

The pmbus core may call read/write word data functions with a page value
of -1, intending to perform the operation without setting the page.
However, the read/write word data functions accept only unsigned 8-bit
page numbers, and therefore cannot check for negative page number to
avoid setting the page. This results in setting the page number to 0xFF.
This may result in errors or undefined behavior of some devices
(specifically the ir35221, which allows the page to be set to 0xFF,
but some subsequent operations to read registers may fail).

Switch the pmbus_set_page page parameter to an integer and perform the
check for negative page there. Make read/write functions consistent in
accepting an integer page number parameter.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/hwmon/pmbus/pmbus.h      |  6 +++---
 drivers/hwmon/pmbus/pmbus_core.c | 25 +++++++++++--------------
 2 files changed, 14 insertions(+), 17 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
index fd422cd..c028d31 100644
--- a/drivers/hwmon/pmbus/pmbus.h
+++ b/drivers/hwmon/pmbus/pmbus.h
@@ -433,9 +433,9 @@ struct pmbus_driver_info {
 /* Function declarations */
 
 void pmbus_clear_cache(struct i2c_client *client);
-int pmbus_set_page(struct i2c_client *client, u8 page);
-int pmbus_read_word_data(struct i2c_client *client, u8 page, u8 reg);
-int pmbus_write_word_data(struct i2c_client *client, u8 page, u8 reg, u16 word);
+int pmbus_set_page(struct i2c_client *client, int page);
+int pmbus_read_word_data(struct i2c_client *client, int page, u8 reg);
+int pmbus_write_word_data(struct i2c_client *client, int page, u8 reg, u16 word);
 int pmbus_read_byte_data(struct i2c_client *client, int page, u8 reg);
 int pmbus_write_byte(struct i2c_client *client, int page, u8 value);
 int pmbus_write_byte_data(struct i2c_client *client, int page, u8 reg,
diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index c4b551b..37ab3666 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -158,13 +158,13 @@ void pmbus_clear_cache(struct i2c_client *client)
 }
 EXPORT_SYMBOL_GPL(pmbus_clear_cache);
 
-int pmbus_set_page(struct i2c_client *client, u8 page)
+int pmbus_set_page(struct i2c_client *client, int page)
 {
 	struct pmbus_data *data = i2c_get_clientdata(client);
 	int rv = 0;
 	int newpage;
 
-	if (page == data->currpage)
+	if (page == data->currpage || page < 0)
 		return 0;
 
 	if (!(data->info->func[page] & PMBUS_PAGE_VIRTUAL)) {
@@ -195,11 +195,9 @@ int pmbus_write_byte(struct i2c_client *client, int page, u8 value)
 {
 	int rv;
 
-	if (page >= 0) {
-		rv = pmbus_set_page(client, page);
-		if (rv < 0)
-			return rv;
-	}
+	rv = pmbus_set_page(client, page);
+	if (rv < 0)
+		return rv;
 
 	return i2c_smbus_write_byte(client, value);
 }
@@ -223,7 +221,8 @@ static int _pmbus_write_byte(struct i2c_client *client, int page, u8 value)
 	return pmbus_write_byte(client, page, value);
 }
 
-int pmbus_write_word_data(struct i2c_client *client, u8 page, u8 reg, u16 word)
+int pmbus_write_word_data(struct i2c_client *client, int page, u8 reg,
+			  u16 word)
 {
 	int rv;
 
@@ -311,7 +310,7 @@ static int _pmbus_write_word_data(struct i2c_client *client, int page, int reg,
 	return pmbus_write_word_data(client, page, reg, word);
 }
 
-int pmbus_read_word_data(struct i2c_client *client, u8 page, u8 reg)
+int pmbus_read_word_data(struct i2c_client *client, int page, u8 reg)
 {
 	int rv;
 
@@ -384,11 +383,9 @@ int pmbus_read_byte_data(struct i2c_client *client, int page, u8 reg)
 {
 	int rv;
 
-	if (page >= 0) {
-		rv = pmbus_set_page(client, page);
-		if (rv < 0)
-			return rv;
-	}
+	rv = pmbus_set_page(client, page);
+	if (rv < 0)
+		return rv;
 
 	return i2c_smbus_read_byte_data(client, reg);
 }
-- 
1.8.3.1
