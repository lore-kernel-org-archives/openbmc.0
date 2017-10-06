Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y7Y135F43zDqlm
 for <openbmc@lists.ozlabs.org>; Fri,  6 Oct 2017 13:07:03 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v9624m9e090814
 for <openbmc@lists.ozlabs.org>; Thu, 5 Oct 2017 22:07:01 -0400
Received: from e31.co.us.ibm.com (e31.co.us.ibm.com [32.97.110.149])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ddy3241j0-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 05 Oct 2017 22:07:01 -0400
Received: from localhost
 by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 5 Oct 2017 20:07:00 -0600
Received: from b03cxnp07028.gho.boulder.ibm.com (9.17.130.15)
 by e31.co.us.ibm.com (192.168.1.131) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 5 Oct 2017 20:06:58 -0600
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v9626vHN4260292; Thu, 5 Oct 2017 19:06:57 -0700
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D24DBC603E;
 Thu,  5 Oct 2017 20:06:57 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.85.157.182])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP id 0023DC6037;
 Thu,  5 Oct 2017 20:06:56 -0600 (MDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, andrew@aj.id.au, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 v4 26/31] drivers: fsi: occ: Add OCC response
 definitions to header
Date: Thu,  5 Oct 2017 21:05:48 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1507255553-13301-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1507255553-13301-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17100602-8235-0000-0000-00000C5EC04E
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007847; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000235; SDB=6.00927058; UDB=6.00466443; IPR=6.00707311; 
 BA=6.00005623; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017415; XFM=3.00000015;
 UTC=2017-10-06 02:06:59
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17100602-8236-0000-0000-00003DECC9D2
Message-Id: <1507255553-13301-27-git-send-email-eajames@linux.vnet.ibm.com>
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
X-List-Received-Date: Fri, 06 Oct 2017 02:07:04 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Also fix include guards.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
Acked-by: Andrew Jeffery <andrew@aj.id.au>
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
