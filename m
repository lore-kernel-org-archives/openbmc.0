Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vg19h63SXzDqYR
 for <openbmc@lists.ozlabs.org>; Sat, 11 Mar 2017 08:48:56 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v2ALY3K6012769
 for <openbmc@lists.ozlabs.org>; Fri, 10 Mar 2017 16:48:42 -0500
Received: from e15.ny.us.ibm.com (e15.ny.us.ibm.com [129.33.205.205])
 by mx0a-001b2d01.pphosted.com with ESMTP id 293w6qkd12-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 10 Mar 2017 16:48:42 -0500
Received: from localhost
 by e15.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Fri, 10 Mar 2017 16:48:41 -0500
Received: from b01cxnp22035.gho.pok.ibm.com (9.57.198.25)
 by e15.ny.us.ibm.com (146.89.104.202) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 10 Mar 2017 16:48:39 -0500
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v2ALmcDT55574738; Fri, 10 Mar 2017 21:48:38 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8A62A112060;
 Fri, 10 Mar 2017 16:48:37 -0500 (EST)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP id 2E0F6112054;
 Fri, 10 Mar 2017 16:48:37 -0500 (EST)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: cbostic@linux.vnet.ibm.com, joel@jms.id.au,
 "Edward A. James" <eajames@us.ibm.com>
Subject: [RFC linux dev-4.7 4/5] drivers: i2c: Add bus recovery for FSI
 algorithm
Date: Fri, 10 Mar 2017 15:48:25 -0600
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1489182506-20505-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1489182506-20505-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17031021-0036-0000-0000-000001A09040
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006759; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000206; SDB=6.00832829; UDB=6.00408758; IPR=6.00610417; 
 BA=6.00005202; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014600; XFM=3.00000013;
 UTC=2017-03-10 21:48:40
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17031021-0037-0000-0000-00003EC5C079
Message-Id: <1489182506-20505-5-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-03-10_15:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1702020001
 definitions=main-1703100168
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
X-List-Received-Date: Fri, 10 Mar 2017 21:48:57 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Reset engine and force the bus to clock 9 times to recover in most
situations.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/i2c/busses/i2c-fsi.c | 82 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
index ebdfa72..545d507 100644
--- a/drivers/i2c/busses/i2c-fsi.c
+++ b/drivers/i2c/busses/i2c-fsi.c
@@ -417,11 +417,92 @@ static u32 fsi_i2c_functionality(struct i2c_adapter *adap)
 	return I2C_FUNC_I2C | I2C_FUNC_PROTOCOL_MANGLING | I2C_FUNC_10BIT_ADDR;
 }
 
+static int fsi_i2c_low_level_recover_bus(struct fsi_i2c_bus *i2c)
+{
+	int i, rc;
+	u32 mode, dummy = 0;
+
+	rc = fsi_device_read(i2c->fsi, I2C_BOE_MODE, &mode, sizeof(mode));
+	if (rc)
+		return rc;
+
+	mode |= I2C_BOE_MODE_DIAG;
+	rc = fsi_device_write(i2c->fsi, I2C_BOE_MODE, &mode, sizeof(mode));
+	if (rc)
+		return rc;
+
+	for (i = 0; i < 9; ++i) {
+		rc = fsi_device_write(i2c->fsi, I2C_BOE_RESET_SCL, &dummy,
+				      sizeof(dummy));
+		if (rc)
+			return rc;
+
+		rc = fsi_device_write(i2c->fsi, I2C_BOE_SET_SCL, &dummy,
+				      sizeof(dummy));
+		if (rc)
+			return rc;
+	}
+
+	rc = fsi_device_write(i2c->fsi, I2C_BOE_RESET_SCL, &dummy,
+			      sizeof(dummy));
+	if (rc)
+		return rc;
+
+	rc = fsi_device_write(i2c->fsi, I2C_BOE_RESET_SDA, &dummy,
+			      sizeof(dummy));
+	if (rc)
+		return rc;
+
+	rc = fsi_device_write(i2c->fsi, I2C_BOE_SET_SCL, &dummy,
+			      sizeof(dummy));
+	if (rc)
+		return rc;
+
+	rc = fsi_device_write(i2c->fsi, I2C_BOE_SET_SDA, &dummy,
+			      sizeof(dummy));
+	if (rc)
+		return rc;
+
+	mode &= ~I2C_BOE_MODE_DIAG;
+	rc = fsi_device_write(i2c->fsi, I2C_BOE_MODE, &mode, sizeof(mode));
+
+	return rc;
+}
+
+static int fsi_i2c_recover_bus(struct i2c_adapter *adap)
+{
+	int rc;
+	u32 dummy = 0;
+	struct fsi_i2c_bus *i2c = adap->algo_data;
+
+	rc = fsi_device_write(i2c->fsi, I2C_BOE_RESET_I2C, &dummy,
+			      sizeof(dummy));
+	if (rc)
+		return rc;
+
+	rc = fsi_i2c_dev_init(i2c);
+	if (rc)
+		return rc;
+
+	rc = fsi_i2c_low_level_recover_bus(i2c);
+	if (rc)
+		return rc;
+
+	rc = fsi_device_write(i2c->fsi, I2C_BOE_RESET_ERR, &dummy,
+			      sizeof(dummy));
+
+	return rc;
+}
+
 static const struct i2c_algorithm fsi_i2c_algorithm = {
 	.master_xfer = fsi_i2c_xfer,
 	.functionality = fsi_i2c_functionality,
 };
 
+static struct i2c_bus_recovery_info fsi_i2c_bus_recovery_info = {
+	.recover_bus = fsi_i2c_recover_bus,
+};
+
 static const char *compatible_strings[] = {
 	"ibm,power8-i2cm",
 	"ibm,power9-i2cm",
@@ -445,6 +526,7 @@ static int fsi_i2c_probe(struct device *dev)
 	i2c->adapter.dev.parent = dev;
 	i2c->adapter.algo = &fsi_i2c_algorithm;
 	i2c->adapter.algo_data = i2c;
+	i2c->adapter.bus_recovery_info = &fsi_i2c_bus_recovery_info;
 	strncpy(i2c->adapter.name, "power_i2cm", sizeof(i2c->adapter.name));
 
 	/* find node that matches FSI address */
-- 
1.8.3.1
