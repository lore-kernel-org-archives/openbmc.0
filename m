Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yG3hB2Dc4zDrG1
 for <openbmc@lists.ozlabs.org>; Tue, 17 Oct 2017 03:30:02 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v9GGTZV3131024
 for <openbmc@lists.ozlabs.org>; Mon, 16 Oct 2017 12:29:59 -0400
Received: from e38.co.us.ibm.com (e38.co.us.ibm.com [32.97.110.159])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2dmxyu4hd3-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 16 Oct 2017 12:29:59 -0400
Received: from localhost
 by e38.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Mon, 16 Oct 2017 10:29:59 -0600
Received: from b03cxnp08026.gho.boulder.ibm.com (9.17.130.18)
 by e38.co.us.ibm.com (192.168.1.138) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 16 Oct 2017 10:29:56 -0600
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v9GGTtvf65863892; Mon, 16 Oct 2017 09:29:55 -0700
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A58F1136043;
 Mon, 16 Oct 2017 10:29:55 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.41.174.252])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP id 67F33136046;
 Mon, 16 Oct 2017 10:29:55 -0600 (MDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: andrew@aj.id.au, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 v2 2/2] drivers: hwmon: occ: Add sysfs_notify
 to throttling attributes
Date: Mon, 16 Oct 2017 11:29:49 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1508171389-30728-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1508171389-30728-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17101616-0028-0000-0000-000008825C49
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007899; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000236; SDB=6.00932012; UDB=6.00469302; IPR=6.00712302; 
 BA=6.00005641; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017560; XFM=3.00000015;
 UTC=2017-10-16 16:29:57
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17101616-0029-0000-0000-000037F568BD
Message-Id: <1508171389-30728-3-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-10-16_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1710160230
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
X-List-Received-Date: Mon, 16 Oct 2017 16:30:03 -0000

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
