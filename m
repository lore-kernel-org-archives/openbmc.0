Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yNJCg100xzDqyM
 for <openbmc@lists.ozlabs.org>; Fri, 27 Oct 2017 07:15:26 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v9QK8QXb121080
 for <openbmc@lists.ozlabs.org>; Thu, 26 Oct 2017 16:15:23 -0400
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2dukm48grf-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 26 Oct 2017 16:15:23 -0400
Received: from localhost
 by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 26 Oct 2017 16:15:23 -0400
Received: from b01cxnp22036.gho.pok.ibm.com (9.57.198.26)
 by e16.ny.us.ibm.com (146.89.104.203) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 26 Oct 2017 16:15:20 -0400
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v9QKFKvv49938552; Thu, 26 Oct 2017 20:15:20 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8A77D112040;
 Thu, 26 Oct 2017 16:14:50 -0400 (EDT)
Received: from oc3016140333.ibm.com (unknown [9.41.174.252])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP id 33705112051;
 Thu, 26 Oct 2017 16:14:50 -0400 (EDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: andrew@aj.id.au, cbostic@linux.vnet.ibm.com,
 "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 2/2] drivers (hwmon): occ: Fix memory
 allocation for extended sensors
Date: Thu, 26 Oct 2017 15:15:13 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1509048913-30936-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1509048913-30936-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17102620-0024-0000-0000-000002E8CE28
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007956; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000239; SDB=6.00936876; UDB=6.00472150; IPR=6.00717139; 
 BA=6.00005660; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017729; XFM=3.00000015;
 UTC=2017-10-26 20:15:22
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17102620-0025-0000-0000-000045D9B505
Message-Id: <1509048913-30936-3-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-10-26_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1710260253
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
X-List-Received-Date: Thu, 26 Oct 2017 20:15:27 -0000

From: "Edward A. James" <eajames@us.ibm.com>

If extended sensors are present, the driver is doing bad memory access
since we weren't allocating enough memory for the extended sensors. Fix
this with proper allocation for extended sensor attributes.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/hwmon/occ/common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
index 3b9adf4..3175e7b 100644
--- a/drivers/hwmon/occ/common.c
+++ b/drivers/hwmon/occ/common.c
@@ -872,7 +872,7 @@ int occ_setup_sensor_attrs(struct occ *occ)
 
 	switch (sensors->extended.version) {
 	case 1:
-		occ->num_attrs += sensors->extended.num_sensors;
+		occ->num_attrs += (sensors->extended.num_sensors * 3);
 		break;
 	default:
 		sensors->extended.num_sensors = 0;
-- 
1.8.3.1
