Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yGpQt6DQnzDrFy
 for <openbmc@lists.ozlabs.org>; Wed, 18 Oct 2017 08:36:06 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v9HLTI1Z134431
 for <openbmc@lists.ozlabs.org>; Tue, 17 Oct 2017 17:36:04 -0400
Received: from e31.co.us.ibm.com (e31.co.us.ibm.com [32.97.110.149])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2dnppg0h7e-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 17 Oct 2017 17:36:03 -0400
Received: from localhost
 by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Tue, 17 Oct 2017 15:36:03 -0600
Received: from b03cxnp08027.gho.boulder.ibm.com (9.17.130.19)
 by e31.co.us.ibm.com (192.168.1.131) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 17 Oct 2017 15:36:00 -0600
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v9HLZxHS65536176; Tue, 17 Oct 2017 14:35:59 -0700
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 04DAF6A042;
 Tue, 17 Oct 2017 15:36:00 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.41.174.252])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP id B0D606A045;
 Tue, 17 Oct 2017 15:35:59 -0600 (MDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, andrew@aj.id.au, bradleyb@fuzziesquirrel.com,
 "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 2/3] drivers: fsi: sbefifo: Fix memory leak
Date: Tue, 17 Oct 2017 16:35:52 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1508276153-3779-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1508276153-3779-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17101721-8235-0000-0000-00000C6D0E7A
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007908; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000237; SDB=6.00932594; UDB=6.00469652; IPR=6.00712885; 
 BA=6.00005643; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017581; XFM=3.00000015;
 UTC=2017-10-17 21:36:02
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17101721-8236-0000-0000-00003E147CC0
Message-Id: <1508276153-3779-3-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-10-17_14:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1710170300
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
X-List-Received-Date: Tue, 17 Oct 2017 21:36:07 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Transfers weren't being cleaned up if they were complete but the user
never finished reading. This is very common.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/fsi/fsi-sbefifo.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/fsi/fsi-sbefifo.c b/drivers/fsi/fsi-sbefifo.c
index c914eaf..764d8f3 100644
--- a/drivers/fsi/fsi-sbefifo.c
+++ b/drivers/fsi/fsi-sbefifo.c
@@ -321,6 +321,11 @@ static void sbefifo_client_release(struct kref *kref)
 
 	if (!READ_ONCE(sbefifo->rc)) {
 		list_for_each_entry(xfr, &client->xfrs, client) {
+			if (test_bit(SBEFIFO_XFR_COMPLETE, &xfr->flags)) {
+				kfree(xfr);
+				continue;
+			}
+
 			/*
 			 * The client left with pending or running xfrs.
 			 * Cancel them.
-- 
1.8.3.1
