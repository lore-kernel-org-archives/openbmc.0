Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r4N313NT9zDqGD
 for <openbmc@lists.ozlabs.org>; Wed, 11 May 2016 14:11:09 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1462939862857679.8321948329957;
 Tue, 10 May 2016 21:11:02 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux] [hwmon pmbus]: Enable adm1278 VOUT sampling
Date: Tue, 10 May 2016 23:11:00 -0500
Message-Id: <1462939860-27192-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1462939860-27192-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1462939860-27192-1-git-send-email-openbmc-patches@stwcx.xyz>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 11 May 2016 04:11:09 -0000

From: Yi Li <adamliyi@msn.com>

The reset value of ADM1278 PMON_CONFIG register does not enable VOUT sampling.
This patch enables VOUT sampling in ADM1278 PMON_CONFIG register.

The patch fixes issue: https://github.com/openbmc/linux/issues/71.

Signed-off-by: Yi Li <adamliyi@msn.com>
---
 drivers/hwmon/pmbus/adm1275.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/hwmon/pmbus/adm1275.c b/drivers/hwmon/pmbus/adm1275.c
index 1476a12..006b1ef 100644
--- a/drivers/hwmon/pmbus/adm1275.c
+++ b/drivers/hwmon/pmbus/adm1275.c
@@ -514,6 +514,19 @@ static int adm1275_probe(struct i2c_client *client,
 		tindex = 3;
 
 		info->func[0] |= PMBUS_HAVE_PIN | PMBUS_HAVE_STATUS_INPUT;
+
+		/* By default when reset VOUT is not enabled */
+		if (!(config & ADM1278_VOUT_EN)) {
+			config |= ADM1278_VOUT_EN;
+			ret = i2c_smbus_write_byte_data(client,
+					ADM1275_PMON_CONFIG, (u8)config);
+			if (ret < 0) {
+				dev_err(&client->dev,
+					"Fail to write ADM1275_PMON_CONFIG\n");
+				return ret;
+			}
+		}
+
 		if (config & ADM1278_TEMP1_EN)
 			info->func[0] |=
 				PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP;
-- 
2.8.1
