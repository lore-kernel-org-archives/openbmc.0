Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y7Y0m5hwbzDqp8
 for <openbmc@lists.ozlabs.org>; Fri,  6 Oct 2017 13:06:48 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v9624qN6086774
 for <openbmc@lists.ozlabs.org>; Thu, 5 Oct 2017 22:06:47 -0400
Received: from e38.co.us.ibm.com (e38.co.us.ibm.com [32.97.110.159])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2de08vsa45-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 05 Oct 2017 22:06:47 -0400
Received: from localhost
 by e38.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 5 Oct 2017 20:06:46 -0600
Received: from b03cxnp08026.gho.boulder.ibm.com (9.17.130.18)
 by e38.co.us.ibm.com (192.168.1.138) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 5 Oct 2017 20:06:43 -0600
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v9626gpF65339408; Thu, 5 Oct 2017 19:06:42 -0700
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CBEA4C603E;
 Thu,  5 Oct 2017 20:06:42 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.85.157.182])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP id D5B77C603C;
 Thu,  5 Oct 2017 20:06:41 -0600 (MDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, andrew@aj.id.au, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 v4 19/31] drivers: fsi: occ: Return ENODEV if
 client is NULL
Date: Thu,  5 Oct 2017 21:05:41 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1507255553-13301-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1507255553-13301-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17100602-0028-0000-0000-00000875E535
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007847; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000235; SDB=6.00927058; UDB=6.00466443; IPR=6.00707311; 
 BA=6.00005623; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017415; XFM=3.00000015;
 UTC=2017-10-06 02:06:44
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17100602-0029-0000-0000-000037D37CCE
Message-Id: <1507255553-13301-20-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-10-06_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1710060029
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
X-List-Received-Date: Fri, 06 Oct 2017 02:06:49 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Safeguard the access functions.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/fsi/occ.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/fsi/occ.c b/drivers/fsi/occ.c
index 55f293d..322af5a 100644
--- a/drivers/fsi/occ.c
+++ b/drivers/fsi/occ.c
@@ -168,11 +168,16 @@ static ssize_t occ_read_common(struct occ_client *client, char __user *ubuf,
 {
 	int rc;
 	size_t bytes;
-	struct occ_xfr *xfr = &client->xfr;
+	struct occ_xfr *xfr;
+
+	if (!client)
+		return -ENODEV;
 
 	if (len > OCC_SRAM_BYTES)
 		return -EINVAL;
 
+	xfr = &client->xfr;
+
 	spin_lock_irq(&client->lock);
 
 	if (!test_bit(CLIENT_XFR_PENDING, &client->flags)) {
@@ -263,11 +268,16 @@ static ssize_t occ_write_common(struct occ_client *client,
 	int rc;
 	unsigned int i;
 	u16 data_length, checksum = 0;
-	struct occ_xfr *xfr = &client->xfr;
+	struct occ_xfr *xfr;
+
+	if (!client)
+		return -ENODEV;
 
 	if (len > (OCC_CMD_DATA_BYTES + 3) || len < 3)
 		return -EINVAL;
 
+	xfr = &client->xfr;
+
 	spin_lock_irq(&client->lock);
 	if (test_and_set_bit(CLIENT_XFR_PENDING, &client->flags)) {
 		rc = -EBUSY;
@@ -327,8 +337,14 @@ static ssize_t occ_write(struct file *file, const char __user *buf,
 
 static int occ_release_common(struct occ_client *client)
 {
-	struct occ_xfr *xfr = &client->xfr;
-	struct occ *occ = client->occ;
+	struct occ *occ;
+	struct occ_xfr *xfr;
+
+	if (!client)
+		return -ENODEV;
+
+	xfr = &client->xfr;
+	occ = client->occ;
 
 	spin_lock_irq(&client->lock);
 
-- 
1.8.3.1
