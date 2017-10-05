Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y7N5J2R1pzDrJR
 for <openbmc@lists.ozlabs.org>; Fri,  6 Oct 2017 06:25:08 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v95JNj1T088539
 for <openbmc@lists.ozlabs.org>; Thu, 5 Oct 2017 15:25:04 -0400
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ddsann0m4-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 05 Oct 2017 15:25:04 -0400
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 5 Oct 2017 13:25:04 -0600
Received: from b03cxnp08027.gho.boulder.ibm.com (9.17.130.19)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 5 Oct 2017 13:25:01 -0600
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v95JP1Kb64094226; Thu, 5 Oct 2017 12:25:01 -0700
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 455DF136044;
 Thu,  5 Oct 2017 13:25:01 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.41.174.252])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP id 061DC13603A;
 Thu,  5 Oct 2017 13:25:00 -0600 (MDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, andrew@aj.id.au, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 v3 26/31] drivers: fsi: occ: Add OCC response
 definitions to header
Date: Thu,  5 Oct 2017 14:24:19 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1507231464-13635-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1507231464-13635-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17100519-0004-0000-0000-0000130560F0
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007847; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000235; SDB=6.00926924; UDB=6.00466363; IPR=6.00707180; 
 BA=6.00005623; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017410; XFM=3.00000015;
 UTC=2017-10-05 19:25:02
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17100519-0005-0000-0000-0000845C47CD
Message-Id: <1507231464-13635-27-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-10-05_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1710050269
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
X-List-Received-Date: Thu, 05 Oct 2017 19:25:08 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Also fix include guards.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 include/linux/occ.h | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/include/linux/occ.h b/include/linux/occ.h
index d78332c..0a4a54a 100644
--- a/include/linux/occ.h
+++ b/include/linux/occ.h
@@ -11,12 +11,26 @@
  * GNU General Public License for more details.
  */
 
-#ifndef __OCC_H__
-#define __OCC_H__
+#ifndef LINUX_FSI_OCC_H
+#define LINUX_FSI_OCC_H
 
 struct device;
 struct occ_client;
 
+#define OCC_RESP_CMD_IN_PRG		0xFF
+#define OCC_RESP_SUCCESS		0
+#define OCC_RESP_CMD_INVAL		0x11
+#define OCC_RESP_CMD_LEN_INVAL		0x12
+#define OCC_RESP_DATA_INVAL		0x13
+#define OCC_RESP_CHKSUM_ERR		0x14
+#define OCC_RESP_INT_ERR		0x15
+#define OCC_RESP_BAD_STATE		0x16
+#define OCC_RESP_CRIT_EXCEPT		0xE0
+#define OCC_RESP_CRIT_INIT		0xE1
+#define OCC_RESP_CRIT_WATCHDOG		0xE2
+#define OCC_RESP_CRIT_OCB		0xE3
+#define OCC_RESP_CRIT_HW		0xE4
+
 extern struct occ_client *occ_drv_open(struct device *dev,
 				       unsigned long flags);
 extern int occ_drv_read(struct occ_client *client, char *buf, size_t len);
@@ -24,4 +38,4 @@ extern int occ_drv_write(struct occ_client *client, const char *buf,
 			 size_t len);
 extern void occ_drv_release(struct occ_client *client);
 
-#endif /* __OCC_H__ */
+#endif /* LINUX_FSI_OCC_H */
-- 
1.8.3.1
