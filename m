Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yJ1Hg5y6dzDqR8
 for <openbmc@lists.ozlabs.org>; Fri, 20 Oct 2017 07:49:03 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v9JKmAGa090149
 for <openbmc@lists.ozlabs.org>; Thu, 19 Oct 2017 16:49:01 -0400
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2dq0xbpvqe-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 19 Oct 2017 16:49:01 -0400
Received: from localhost
 by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 19 Oct 2017 16:49:00 -0400
Received: from b01cxnp23033.gho.pok.ibm.com (9.57.198.28)
 by e11.ny.us.ibm.com (146.89.104.198) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 19 Oct 2017 16:48:56 -0400
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v9JKmtLZ3408162; Thu, 19 Oct 2017 20:48:55 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D35D92803A;
 Thu, 19 Oct 2017 16:48:48 -0400 (EDT)
Received: from oc3016140333.ibm.com (unknown [9.41.174.252])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP id 866CE28046;
 Thu, 19 Oct 2017 16:48:48 -0400 (EDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: andrew@aj.id.au, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10] drivers (pmbus): ir35221: Set PMBUS_PAGE
 before reading id and model
Date: Thu, 19 Oct 2017 15:48:53 -0500
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
x-cbid: 17101920-2213-0000-0000-0000022E4CAC
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007919; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000238; SDB=6.00933536; UDB=6.00470216; IPR=6.00713824; 
 BA=6.00005651; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017612; XFM=3.00000015;
 UTC=2017-10-19 20:48:58
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17101920-2214-0000-0000-000057E8725B
Message-Id: <1508446133-11823-1-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-10-19_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1710190282
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
X-List-Received-Date: Thu, 19 Oct 2017 20:49:05 -0000

From: "Edward A. James" <eajames@us.ibm.com>

The MFR_ID and MFR_MODEL, which are manually read before probing the
pmbus core,  are only valid for the two pages that the ir35221 has
available. Since we don't know the state of the device when we start
probing, set the page number first before reading id and model.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/hwmon/pmbus/ir35221.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/hwmon/pmbus/ir35221.c b/drivers/hwmon/pmbus/ir35221.c
index cc7b3b5..9aae633 100644
--- a/drivers/hwmon/pmbus/ir35221.c
+++ b/drivers/hwmon/pmbus/ir35221.c
@@ -243,6 +243,12 @@ static int ir35221_probe(struct i2c_client *client,
 				| I2C_FUNC_SMBUS_READ_BLOCK_DATA))
 		return -ENODEV;
 
+	ret = i2c_smbus_write_byte_data(client, PMBUS_PAGE, 0);
+	if (ret < 0) {
+		dev_err(&client->dev, "Failed to set PMBUS_PAGE\n");
+		return ret;
+	}
+
 	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_ID, buf);
 	if (ret < 0) {
 		dev_err(&client->dev, "Failed to read PMBUS_MFR_ID\n");
-- 
1.8.3.1
