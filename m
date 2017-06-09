Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wkqq01rmWzDq9m
 for <openbmc@lists.ozlabs.org>; Sat, 10 Jun 2017 04:01:16 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v59HxRYa052820
 for <openbmc@lists.ozlabs.org>; Fri, 9 Jun 2017 14:01:14 -0400
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2aytuf1aub-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 09 Jun 2017 14:01:13 -0400
Received: from localhost
 by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Fri, 9 Jun 2017 12:01:13 -0600
Received: from b03cxnp07028.gho.boulder.ibm.com (9.17.130.15)
 by e35.co.us.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 9 Jun 2017 12:01:11 -0600
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v59I1Aue590254; Fri, 9 Jun 2017 11:01:10 -0700
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AD06378041;
 Fri,  9 Jun 2017 12:01:10 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP id 6C0C57805C;
 Fri,  9 Jun 2017 12:01:10 -0600 (MDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 v2 1/5] drivers: fsi: occ: Fix 1 byte response
 and rc for O_NONBLOCK
Date: Fri,  9 Jun 2017 13:01:01 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1497031265-29545-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1497031265-29545-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17060918-0012-0000-0000-0000146CC69A
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007202; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000212; SDB=6.00872403; UDB=6.00434054; IPR=6.00652472; 
 BA=6.00005406; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015762; XFM=3.00000015;
 UTC=2017-06-09 18:01:12
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17060918-0013-0000-0000-00004E0F026E
Message-Id: <1497031265-29545-2-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-06-09_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1706090312
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
X-List-Received-Date: Fri, 09 Jun 2017 18:01:16 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Couple of bug fixes.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/fsi/occ.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/fsi/occ.c b/drivers/fsi/occ.c
index fc014b6..a1508f2 100644
--- a/drivers/fsi/occ.c
+++ b/drivers/fsi/occ.c
@@ -188,7 +188,7 @@ static ssize_t occ_read_common(struct occ_client *client, char __user *ubuf,
 
 	if (!test_bit(XFR_COMPLETE, &xfr->flags)) {
 		if (test_bit(CLIENT_NONBLOCKING, &client->flags)) {
-			rc = -ERESTARTSYS;
+			rc = -EAGAIN;
 			goto done;
 		}
 
@@ -593,11 +593,13 @@ static void occ_worker(struct work_struct *work)
 		goto done;
 	}
 
-	/* already got 3 bytes resp, also need 2 bytes checksum */
-	rc = occ_getsram(sbefifo, 0xFFFBF008, &xfr->buf[8],
-			 resp_data_length - 1);
-	if (rc)
-		goto done;
+	if (resp_data_length > 1) {
+		/* already got 3 bytes resp, also need 2 bytes checksum */
+		rc = occ_getsram(sbefifo, 0xFFFBF008, &xfr->buf[8],
+				 resp_data_length - 1);
+		if (rc)
+			goto done;
+	}
 
 	xfr->resp_data_length = resp_data_length + 7;
 
-- 
1.8.3.1
