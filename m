Return-Path: <eajames@linux.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44jjn674bwzDqGv
 for <openbmc@lists.ozlabs.org>; Tue, 16 Apr 2019 08:27:54 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x3FMEVgZ049373
 for <openbmc@lists.ozlabs.org>; Mon, 15 Apr 2019 18:27:48 -0400
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2rw2cr8srb-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 15 Apr 2019 18:27:48 -0400
Received: from localhost
 by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.ibm.com>;
 Mon, 15 Apr 2019 23:27:47 +0100
Received: from b03cxnp08026.gho.boulder.ibm.com (9.17.130.18)
 by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 15 Apr 2019 23:27:46 +0100
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x3FMRiuI62062802
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Apr 2019 22:27:44 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C9589BE051;
 Mon, 15 Apr 2019 22:27:44 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 93D93BE04F;
 Mon, 15 Apr 2019 22:27:44 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.3.116.186])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 15 Apr 2019 22:27:44 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, Eddie James <eajames@linux.ibm.com>
Subject: [PATCH dev-5.0 1/2] hwmon (occ): Store error condition for
 rate-limited polls
Date: Mon, 15 Apr 2019 22:27:40 +0000
X-Mailer: git-send-email 2.7.4
X-TM-AS-GCONF: 00
x-cbid: 19041522-0036-0000-0000-00000AA90CC3
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010934; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000284; SDB=6.01189621; UDB=6.00623314; IPR=6.00970407; 
 MB=3.00026458; MTD=3.00000008; XFM=3.00000015; UTC=2019-04-15 22:27:47
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19041522-0037-0000-0000-00004B670AE9
Message-Id: <1555367261-4299-1-git-send-email-eajames@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-15_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1904150151
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 15 Apr 2019 22:27:55 -0000

The OCC driver limits the rate of sending poll commands to the OCC. If a
user reads a hwmon entry after a poll response resulted in an error and
is rate-limited, the error is invisible to the user. Fix this by storing
the last error and returning that in the rate-limited case.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/hwmon/occ/common.c | 4 ++++
 drivers/hwmon/occ/common.h | 3 ++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
index c888f4a..0e812ef 100644
--- a/drivers/hwmon/occ/common.c
+++ b/drivers/hwmon/occ/common.c
@@ -138,6 +138,7 @@ static int occ_poll(struct occ *occ)
 	/* mutex should already be locked if necessary */
 	rc = occ->send_cmd(occ, cmd);
 	if (rc) {
+		occ->last_error = rc;
 		if (occ->error_count++ > OCC_ERROR_COUNT_THRESHOLD)
 			occ->error = rc;
 
@@ -146,6 +147,7 @@ static int occ_poll(struct occ *occ)
 
 	/* clear error since communication was successful */
 	occ->error_count = 0;
+	occ->last_error = 0;
 	occ->error = 0;
 
 	/* check for safe state */
@@ -207,6 +209,8 @@ int occ_update_response(struct occ *occ)
 	if (time_after(jiffies, occ->last_update + OCC_UPDATE_FREQUENCY)) {
 		rc = occ_poll(occ);
 		occ->last_update = jiffies;
+	} else {
+		rc = occ->last_error;
 	}
 
 	mutex_unlock(&occ->lock);
diff --git a/drivers/hwmon/occ/common.h b/drivers/hwmon/occ/common.h
index 7c44df3..c676e48 100644
--- a/drivers/hwmon/occ/common.h
+++ b/drivers/hwmon/occ/common.h
@@ -105,7 +105,8 @@ struct occ {
 	struct attribute_group group;
 	const struct attribute_group *groups[2];
 
-	int error;                      /* latest transfer error */
+	int error;                      /* final transfer error after retry */
+	int last_error;			/* latest transfer error */
 	unsigned int error_count;       /* number of xfr errors observed */
 	unsigned long last_safe;        /* time OCC entered "safe" state */
 
-- 
2.7.4
