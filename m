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
 by lists.ozlabs.org (Postfix) with ESMTPS id 44P54L0r7gzDqGX
 for <openbmc@lists.ozlabs.org>; Wed, 20 Mar 2019 07:58:25 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x2JKnXbD124525
 for <openbmc@lists.ozlabs.org>; Tue, 19 Mar 2019 16:58:22 -0400
Received: from e31.co.us.ibm.com (e31.co.us.ibm.com [32.97.110.149])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2rb6qhk9tc-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 19 Mar 2019 16:58:22 -0400
Received: from localhost
 by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.ibm.com>;
 Tue, 19 Mar 2019 20:58:21 -0000
Received: from b03cxnp08025.gho.boulder.ibm.com (9.17.130.17)
 by e31.co.us.ibm.com (192.168.1.131) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 19 Mar 2019 20:58:18 -0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x2JKwFRY21299284
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Mar 2019 20:58:16 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D47266A04F;
 Tue, 19 Mar 2019 20:58:15 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 890276A054;
 Tue, 19 Mar 2019 20:58:15 +0000 (GMT)
Received: from talon7.ibm.com (unknown [9.41.179.222])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 19 Mar 2019 20:58:15 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, Eddie James <eajames@linux.ibm.com>
Subject: [PATCH dev-5.0] hwmon: occ: Fix power sensor indexing
Date: Tue, 19 Mar 2019 15:58:13 -0500
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
x-cbid: 19031920-8235-0000-0000-00000E6FBD2A
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010787; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000281; SDB=6.01176765; UDB=6.00615533; IPR=6.00957452; 
 MB=3.00026060; MTD=3.00000008; XFM=3.00000015; UTC=2019-03-19 20:58:19
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19031920-8236-0000-0000-000044D60850
Message-Id: <1553029093-31016-1-git-send-email-eajames@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-03-19_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=928 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1903190146
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
X-List-Received-Date: Tue, 19 Mar 2019 20:58:27 -0000

In the case of power sensor version 0xA0, the sensor indexing overlapped
with the "caps" power sensors, resulting in probe failure and kernel
warnings. Fix this by specifying the next index for each power sensor
version.

Fixes: 54076cb ("hwmon (occ): Add sensor attributes and register ...")
Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/hwmon/occ/common.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
index 391118c..c888f4a 100644
--- a/drivers/hwmon/occ/common.c
+++ b/drivers/hwmon/occ/common.c
@@ -889,6 +889,8 @@ static int occ_setup_sensor_attrs(struct occ *occ)
 				s++;
 			}
 		}
+
+		s = (sensors->power.num_sensors * 4) + 1;
 	} else {
 		for (i = 0; i < sensors->power.num_sensors; ++i) {
 			s = i + 1;
@@ -917,11 +919,11 @@ static int occ_setup_sensor_attrs(struct occ *occ)
 						     show_power, NULL, 3, i);
 			attr++;
 		}
-	}
 
-	if (sensors->caps.num_sensors >= 1) {
 		s = sensors->power.num_sensors + 1;
+	}
 
+	if (sensors->caps.num_sensors >= 1) {
 		snprintf(attr->name, sizeof(attr->name), "power%d_label", s);
 		attr->sensor = OCC_INIT_ATTR(attr->name, 0444, show_caps, NULL,
 					     0, 0);
-- 
1.8.3.1
