Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vq0T81QwRzDqb7
 for <openbmc@lists.ozlabs.org>; Fri, 24 Mar 2017 08:45:00 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v2NLhjjY125572
 for <openbmc@lists.ozlabs.org>; Thu, 23 Mar 2017 17:44:58 -0400
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 by mx0a-001b2d01.pphosted.com with ESMTP id 29c4ywwwkt-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 23 Mar 2017 17:44:58 -0400
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 23 Mar 2017 15:44:57 -0600
Received: from b03cxnp07028.gho.boulder.ibm.com (9.17.130.15)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 23 Mar 2017 15:44:55 -0600
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v2NLissX13893950; Thu, 23 Mar 2017 14:44:54 -0700
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 92AE878038;
 Thu, 23 Mar 2017 15:44:54 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP id 5ACF678056;
 Thu, 23 Mar 2017 15:44:54 -0600 (MDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Subject: [RFC linux dev-4.7 6/7] drivers: i2c: Add bus recovery for FSI
 algorithm
Date: Thu, 23 Mar 2017 16:44:38 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1490305479-17065-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1490305479-17065-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17032321-0004-0000-0000-000011D548CD
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006837; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000206; SDB=6.00837962; UDB=6.00412009; IPR=6.00615725; 
 BA=6.00005234; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014782; XFM=3.00000013;
 UTC=2017-03-23 21:44:55
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17032321-0005-0000-0000-00007E0E2D84
Message-Id: <1490305479-17065-7-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-03-23_19:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1702020001
 definitions=main-1703230184
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
X-List-Received-Date: Thu, 23 Mar 2017 21:45:00 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Bus recovery should reset the engine and force clock the bus 9 times
to recover most situations.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/i2c/busses/i2c-fsi.c | 82 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
index 1d16440..73931ee 100644
--- a/drivers/i2c/busses/i2c-fsi.c
+++ b/drivers/i2c/busses/i2c-fsi.c
@@ -457,11 +457,93 @@ static u32 fsi_i2c_functionality(struct i2c_adapter *adap)
 	return I2C_FUNC_I2C | I2C_FUNC_PROTOCOL_MANGLING | I2C_FUNC_10BIT_ADDR;
 }
 
+static int fsi_i2c_low_level_recover_bus(struct fsi_i2c_master *i2c)
+{
+	int i, rc;
+	u32 mode, dummy = 0;
+
+	rc = fsi_device_read(i2c->fsi, I2C_FSI_MODE, &mode, sizeof(mode));
+	if (rc)
+		return rc;
+
+	mode |= I2C_MODE_DIAG;
+	rc = fsi_device_write(i2c->fsi, I2C_FSI_MODE, &mode, sizeof(mode));
+	if (rc)
+		return rc;
+
+	for (i = 0; i < 9; ++i) {
+		rc = fsi_device_write(i2c->fsi, I2C_FSI_RESET_SCL, &dummy,
+				      sizeof(dummy));
+		if (rc)
+			return rc;
+
+		rc = fsi_device_write(i2c->fsi, I2C_FSI_SET_SCL, &dummy,
+				      sizeof(dummy));
+		if (rc)
+			return rc;
+	}
+
+	rc = fsi_device_write(i2c->fsi, I2C_FSI_RESET_SCL, &dummy,
+			      sizeof(dummy));
+	if (rc)
+		return rc;
+
+	rc = fsi_device_write(i2c->fsi, I2C_FSI_RESET_SDA, &dummy,
+			      sizeof(dummy));
+	if (rc)
+		return rc;
+
+	rc = fsi_device_write(i2c->fsi, I2C_FSI_SET_SCL, &dummy,
+			      sizeof(dummy));
+	if (rc)
+		return rc;
+
+	rc = fsi_device_write(i2c->fsi, I2C_FSI_SET_SDA, &dummy,
+			      sizeof(dummy));
+	if (rc)
+		return rc;
+
+	mode &= ~I2C_MODE_DIAG;
+	rc = fsi_device_write(i2c->fsi, I2C_FSI_MODE, &mode, sizeof(mode));
+
+	return rc;
+}
+
+static int fsi_i2c_recover_bus(struct i2c_adapter *adap)
+{
+	int rc;
+	u32 dummy = 0;
+	struct fsi_i2c_port *port = adap->algo_data;
+	struct fsi_i2c_master *i2c = port->master;
+
+	rc = fsi_device_write(i2c->fsi, I2C_FSI_RESET_I2C, &dummy,
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
+	rc = fsi_device_write(i2c->fsi, I2C_FSI_RESET_ERR, &dummy,
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
-- 
1.8.3.1
