Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vRx4T6CgVzDq5W
 for <openbmc@lists.ozlabs.org>; Tue, 21 Feb 2017 08:06:01 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v1KL3k5B022780
 for <openbmc@lists.ozlabs.org>; Mon, 20 Feb 2017 16:05:59 -0500
Received: from e38.co.us.ibm.com (e38.co.us.ibm.com [32.97.110.159])
 by mx0b-001b2d01.pphosted.com with ESMTP id 28r2w8vpt6-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 20 Feb 2017 16:05:59 -0500
Received: from localhost
 by e38.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Mon, 20 Feb 2017 14:05:58 -0700
Received: from d03dlp02.boulder.ibm.com (9.17.202.178)
 by e38.co.us.ibm.com (192.168.1.138) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 20 Feb 2017 14:05:56 -0700
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23])
 by d03dlp02.boulder.ibm.com (Postfix) with ESMTP id DF8C93E40048;
 Mon, 20 Feb 2017 14:05:55 -0700 (MST)
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v1KL5txi42205282; Mon, 20 Feb 2017 21:05:55 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9DCC7AE04B;
 Mon, 20 Feb 2017 16:05:52 -0500 (EST)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP id 4EBFAAE034;
 Mon, 20 Feb 2017 16:05:52 -0500 (EST)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org, joel@jms.id.au
Cc: "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.7] drivers: fsi: Copy all data out
Date: Mon, 20 Feb 2017 15:05:50 -0600
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17022021-0028-0000-0000-000007183866
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006652; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000204; SDB=6.00824697; UDB=6.00403728; IPR=6.00602152; 
 BA=6.00005158; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014363; XFM=3.00000011;
 UTC=2017-02-20 21:05:57
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17022021-0029-0000-0000-000033BAF046
Message-Id: <1487624750-7425-1-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-02-20_17:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1702200195
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
X-List-Received-Date: Mon, 20 Feb 2017 21:06:02 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Driver was only copying 32 bits out to the user-provided data pointer.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/fsi/fsi-master-gpio.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
index 3ed82ea..3eb6ec2 100644
--- a/drivers/fsi/fsi-master-gpio.c
+++ b/drivers/fsi/fsi-master-gpio.c
@@ -203,7 +203,7 @@ static void fsi_master_gpio_error(struct fsi_master_gpio *master, int error)
 static int poll_for_response(struct fsi_master_gpio *master, uint8_t expected,
 			uint8_t size, void *data)
 {
-	int busy_count = 0, i;
+	int busy_count = 0, i, j;
 	struct fsi_gpio_msg response, cmd;
 	int bits_remaining = 0, bit_count, response_id, id;
 	uint64_t resp = 0;
@@ -274,7 +274,8 @@ static int poll_for_response(struct fsi_master_gpio *master, uint8_t expected,
 			resp <<= bits_remaining;
 			resp |= response.msg;
 			bits_received += bits_remaining;
-			*((uint32_t *)data) = response.msg;
+			for (j = 0; j < size; ++j)
+				((uint8_t *)data)[j] = ((uint8_t *)&response.msg)[j];
 		}
 
 		crc_in = fsi_crc4(0, resp | (0x1ULL << bits_received),
-- 
1.8.3.1
