Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y7Y032Df2zDqlm
 for <openbmc@lists.ozlabs.org>; Fri,  6 Oct 2017 13:06:11 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v9624gOg019533
 for <openbmc@lists.ozlabs.org>; Thu, 5 Oct 2017 22:06:08 -0400
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ddvq3styh-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 05 Oct 2017 22:06:08 -0400
Received: from localhost
 by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 5 Oct 2017 20:06:08 -0600
Received: from b03cxnp08027.gho.boulder.ibm.com (9.17.130.19)
 by e36.co.us.ibm.com (192.168.1.136) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 5 Oct 2017 20:06:05 -0600
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v96264Mr61734986; Thu, 5 Oct 2017 19:06:04 -0700
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ACADBC6037;
 Thu,  5 Oct 2017 20:06:04 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.85.157.182])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP id BC57CC603C;
 Thu,  5 Oct 2017 20:06:03 -0600 (MDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, andrew@aj.id.au, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 v4 03/31] drivers: fsi: sbefifo: Use __be32 for
 big endian values
Date: Thu,  5 Oct 2017 21:05:25 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1507255553-13301-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1507255553-13301-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17100602-0020-0000-0000-00000CCF29F0
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007847; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000235; SDB=6.00927057; UDB=6.00466443; IPR=6.00707311; 
 BA=6.00005623; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017415; XFM=3.00000015;
 UTC=2017-10-06 02:06:06
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17100602-0021-0000-0000-00005E670CAA
Message-Id: <1507255553-13301-4-git-send-email-eajames@linux.vnet.ibm.com>
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
X-List-Received-Date: Fri, 06 Oct 2017 02:06:11 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Use a real __be32 value instead of u32 for big endian values.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/fsi/fsi-sbefifo.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/fsi/fsi-sbefifo.c b/drivers/fsi/fsi-sbefifo.c
index 2e45a75..c5eeace 100644
--- a/drivers/fsi/fsi-sbefifo.c
+++ b/drivers/fsi/fsi-sbefifo.c
@@ -103,7 +103,7 @@ struct sbefifo_client {
 static int sbefifo_inw(struct sbefifo *sbefifo, int reg, u32 *word)
 {
 	int rc;
-	u32 raw_word;
+	__be32 raw_word;
 
 	rc = fsi_device_read(sbefifo->fsi_dev, reg, &raw_word,
 			     sizeof(raw_word));
@@ -111,17 +111,19 @@ static int sbefifo_inw(struct sbefifo *sbefifo, int reg, u32 *word)
 		return rc;
 
 	*word = be32_to_cpu(raw_word);
+
 	return 0;
 }
 
 static int sbefifo_outw(struct sbefifo *sbefifo, int reg, u32 word)
 {
-	u32 raw_word = cpu_to_be32(word);
+	__be32 raw_word = cpu_to_be32(word);
 
 	return fsi_device_write(sbefifo->fsi_dev, reg, &raw_word,
 				sizeof(raw_word));
 }
 
+/* Don't flip endianness of data to/from FIFO, just pass through. */
 static int sbefifo_readw(struct sbefifo *sbefifo, u32 *word)
 {
 	return fsi_device_read(sbefifo->fsi_dev, SBEFIFO_DWN, word,
-- 
1.8.3.1
