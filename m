Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y81mv6vrhzDqlT
 for <openbmc@lists.ozlabs.org>; Sat,  7 Oct 2017 07:43:11 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v96Kd4ca137003
 for <openbmc@lists.ozlabs.org>; Fri, 6 Oct 2017 16:43:09 -0400
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2deeuqe894-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 06 Oct 2017 16:43:09 -0400
Received: from localhost
 by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Fri, 6 Oct 2017 14:43:09 -0600
Received: from b03cxnp07029.gho.boulder.ibm.com (9.17.130.16)
 by e35.co.us.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 6 Oct 2017 14:43:07 -0600
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v96Kh6Nx6881740; Fri, 6 Oct 2017 13:43:06 -0700
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C51F113604B;
 Fri,  6 Oct 2017 14:43:06 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.41.174.252])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP id 91D5C13603A;
 Fri,  6 Oct 2017 14:43:06 -0600 (MDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 2/2] drivers: hwmon: occ: Add sysfs_notify to
 throttling attributes
Date: Fri,  6 Oct 2017 15:43:01 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1507322581-13947-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1507322581-13947-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17100620-0012-0000-0000-0000151C3AE9
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007851; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000235; SDB=6.00927415; UDB=6.00466659; IPR=6.00707674; 
 BA=6.00005623; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017426; XFM=3.00000015;
 UTC=2017-10-06 20:43:08
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17100620-0013-0000-0000-00004FC5BB72
Message-Id: <1507322581-13947-3-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-10-06_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1710060289
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
X-List-Received-Date: Fri, 06 Oct 2017 20:43:12 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Need to alert user space when we change throttling state.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/hwmon/occ/common.c | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
index e8579b6..242ba40 100644
--- a/drivers/hwmon/occ/common.c
+++ b/drivers/hwmon/occ/common.c
@@ -182,6 +182,7 @@ int occ_poll(struct occ *occ)
 	u16 checksum = occ->poll_cmd_data + 1;
 	u8 cmd[8];
 	u8 occs_present = header->occs_present;
+	u8 ext_status = header->ext_status;
 
 	cmd[0] = 0;
 	cmd[1] = 0;
@@ -206,10 +207,26 @@ int occ_poll(struct occ *occ)
 	} else
 		occ->last_safe = 0;
 
-	if (occs_present != header->occs_present && occ->hwmon &&
-	    (header->status & OCC_STAT_MASTER)) {
-		sysfs_notify(&occ->bus_dev->kobj, NULL,
-			     occ->status_attrs[7].dev_attr.attr.name);
+	if (occ->hwmon) {
+		if (occs_present != header->occs_present &&
+		    (header->status & OCC_STAT_MASTER))
+			sysfs_notify(&occ->bus_dev->kobj, NULL,
+				     occ->status_attrs[7].dev_attr.attr.name);
+
+		if ((header->ext_status & OCC_EXT_STAT_DVFS_OT) != 
+		    (ext_status & OCC_EXT_STAT_DVFS_OT))
+			sysfs_notify(&occ->bus_dev->kobj, NULL,
+				     occ->status_attrs[2].dev_attr.attr.name);
+
+		if ((header->ext_status & OCC_EXT_STAT_DVFS_POWER) != 
+		    (ext_status & OCC_EXT_STAT_DVFS_POWER))
+			sysfs_notify(&occ->bus_dev->kobj, NULL,
+				     occ->status_attrs[3].dev_attr.attr.name);
+
+		if ((header->ext_status & OCC_EXT_STAT_MEM_THROTTLE) != 
+		    (ext_status & OCC_EXT_STAT_MEM_THROTTLE))
+			sysfs_notify(&occ->bus_dev->kobj, NULL,
+				     occ->status_attrs[4].dev_attr.attr.name);
 	}
 
 done:
-- 
1.8.3.1
