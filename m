Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xGZCp0039zDqv6
 for <openbmc@lists.ozlabs.org>; Tue, 25 Jul 2017 07:25:25 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v6OLOcpk029123
 for <openbmc@lists.ozlabs.org>; Mon, 24 Jul 2017 17:25:23 -0400
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2bwquwtamv-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 24 Jul 2017 17:25:23 -0400
Received: from localhost
 by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Mon, 24 Jul 2017 17:25:22 -0400
Received: from b01cxnp22033.gho.pok.ibm.com (9.57.198.23)
 by e16.ny.us.ibm.com (146.89.104.203) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 24 Jul 2017 17:25:20 -0400
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v6OLPJ6x23134422; Mon, 24 Jul 2017 21:25:19 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 366D32803A;
 Mon, 24 Jul 2017 17:25:13 -0400 (EDT)
Received: from Christophers-MacBook-Pro.local.com (unknown [9.83.3.94])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP id 11E462803D;
 Mon, 24 Jul 2017 17:25:10 -0400 (EDT)
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
To: joel@jms.id.au
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 1/2] drivers/iio: dps310 Temperature
 measurement fix.
Date: Mon, 24 Jul 2017 16:25:08 -0500
X-Mailer: git-send-email 2.10.1 (Apple Git-78)
In-Reply-To: <20170724212509.85197-1-cbostic@linux.vnet.ibm.com>
References: <20170724212509.85197-1-cbostic@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17072421-0024-0000-0000-000002B503B0
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007419; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00892366; UDB=6.00446018; IPR=6.00672530; 
 BA=6.00005489; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016356; XFM=3.00000015;
 UTC=2017-07-24 21:25:21
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17072421-0025-0000-0000-000044DD520E
Message-Id: <20170724212509.85197-2-cbostic@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-07-24_13:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1707240327
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
X-List-Received-Date: Mon, 24 Jul 2017 21:25:26 -0000

Add a manufacturer's suggested workaround to deal with early revisions
of chip that don't indicate correct temperature.  Readings can be in the
~60C range when they should be in the ~20's.

Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
---
 drivers/iio/pressure/dps310.c | 49 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 48 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/pressure/dps310.c b/drivers/iio/pressure/dps310.c
index 1b54ae0..f351c26 100644
--- a/drivers/iio/pressure/dps310.c
+++ b/drivers/iio/pressure/dps310.c
@@ -56,7 +56,12 @@
 #define  DPS310_FIFO_EN		BIT(5)
 #define  DPS310_SPI_EN		BIT(6)
 #define DPS310_RESET		0x0c
+#define DPS310_TEMP_FIX_E	0x0e
+#define DPS310_TEMP_FIX_F	0x0f
 #define  DPS310_RESET_MAGIC	(BIT(0) | BIT(3))
+#define DPS310_TEMP_FIX_32	0x32
+#define  DPS310_TEMP_ERR_FIXED	BIT(1)
+#define DPS310_TEMP_FIX_62	0x62
 #define DPS310_COEF_BASE	0x10
 
 #define DPS310_PRS_BASE		DPS310_PRS_B0
@@ -219,6 +224,9 @@ static bool dps310_is_writeable_reg(struct device *dev, unsigned int reg)
 	case DPS310_MEAS_CFG:
 	case DPS310_CFG_REG:
 	case DPS310_RESET:
+	case DPS310_TEMP_FIX_E:
+	case DPS310_TEMP_FIX_F:
+	case DPS310_TEMP_FIX_62:
 		return true;
 	default:
 		return false;
@@ -308,7 +316,7 @@ static int dps310_read_raw(struct iio_dev *iio,
 	.writeable_reg = dps310_is_writeable_reg,
 	.volatile_reg = dps310_is_volatile_reg,
 	.cache_type = REGCACHE_RBTREE,
-	.max_register = 0x29,
+	.max_register = 0x62,
 };
 
 static const struct iio_info dps310_info = {
@@ -317,6 +325,41 @@ static int dps310_read_raw(struct iio_dev *iio,
 	.write_raw = dps310_write_raw,
 };
 
+/*
+ * Some verions of chip will read temperatures in the ~60C range when
+ * its acutally ~20C. This is the manufacturer recommended workaround
+ * to correct the issue.
+ */
+static int dps310_temp_workaround(struct dps310_data *data)
+{
+	int r, reg;
+
+	r = regmap_read(data->regmap, DPS310_TEMP_FIX_32, &reg);
+	if (r < 0)
+		return r;
+
+	if (!(reg & DPS310_TEMP_ERR_FIXED)) {
+		r = regmap_write(data->regmap, DPS310_TEMP_FIX_E, 0xA5);
+		if (r < 0)
+			return r;
+
+		r = regmap_write(data->regmap, DPS310_TEMP_FIX_F, 0x96);
+		if (r < 0)
+			return r;
+
+		r = regmap_write(data->regmap, DPS310_TEMP_FIX_62, 0x02);
+		if (r < 0)
+			return r;
+
+		r = regmap_write(data->regmap, DPS310_TEMP_FIX_E, 0x00);
+		if (r < 0)
+			return r;
+
+		r = regmap_write(data->regmap, DPS310_TEMP_FIX_F, 0x00);
+	}
+	return r;
+}
+
 static int dps310_probe(struct i2c_client *client,
 			const struct i2c_device_id *id)
 {
@@ -379,6 +422,10 @@ static int dps310_probe(struct i2c_client *client,
 	if (r < 0)
 		return r;
 
+	r = dps310_temp_workaround(data);
+	if (r < 0)
+		return r;
+
 	r = devm_iio_device_register(&client->dev, iio);
 	if (r)
 		return r;
-- 
1.8.2.2
