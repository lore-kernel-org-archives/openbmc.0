Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vMc71223YzDqBQ
 for <openbmc@lists.ozlabs.org>; Tue, 14 Feb 2017 07:08:13 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v1DK3NtZ130899
 for <openbmc@lists.ozlabs.org>; Mon, 13 Feb 2017 15:08:10 -0500
Received: from e38.co.us.ibm.com (e38.co.us.ibm.com [32.97.110.159])
 by mx0a-001b2d01.pphosted.com with ESMTP id 28kk8mrpp3-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 13 Feb 2017 15:08:10 -0500
Received: from localhost
 by e38.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Mon, 13 Feb 2017 13:08:10 -0700
Received: from d03dlp01.boulder.ibm.com (9.17.202.177)
 by e38.co.us.ibm.com (192.168.1.138) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 13 Feb 2017 13:08:07 -0700
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by d03dlp01.boulder.ibm.com (Postfix) with ESMTP id 346FF1FF0026;
 Mon, 13 Feb 2017 13:07:44 -0700 (MST)
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v1DK86Rb4260310; Mon, 13 Feb 2017 13:08:06 -0700
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 69F70C6053;
 Mon, 13 Feb 2017 13:08:06 -0700 (MST)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP id 14AADC605B;
 Mon, 13 Feb 2017 13:08:06 -0700 (MST)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, cbostic@linux.vnet.ibm.com,
 "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.7 2/2] drivers: fsi: scom: Add remove function
Date: Mon, 13 Feb 2017 14:08:00 -0600
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1487016480-17700-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1487016480-17700-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17021320-0028-0000-0000-000007080E55
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006610; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000203; SDB=6.00821471; UDB=6.00401769; IPR=6.00598924; 
 BA=6.00005133; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014270; XFM=3.00000011;
 UTC=2017-02-13 20:08:08
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17021320-0029-0000-0000-000033893056
Message-Id: <1487016480-17700-3-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-02-13_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1702130191
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
X-List-Received-Date: Mon, 13 Feb 2017 20:08:13 -0000

From: "Edward A. James" <eajames@us.ibm.com>

driver wasn't cleaning up miscdevice

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/fsi/fsi-scom.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/fsi/fsi-scom.c b/drivers/fsi/fsi-scom.c
index 22d280a..a439a5e 100644
--- a/drivers/fsi/fsi-scom.c
+++ b/drivers/fsi/fsi-scom.c
@@ -199,6 +199,21 @@ static int scom_probe(struct device *dev)
 	return misc_register(&scom->mdev);
 }
 
+static int scom_remove(struct device *dev)
+{
+	struct scom_device *scom, *scom_tmp;
+	struct fsi_device *fsi_dev = to_fsi_dev(dev);
+	
+	list_for_each_entry_safe(scom, scom_tmp, &scom_devices, link) {
+		if (scom->fsi_dev == fsi_dev) {
+			list_del(&scom->link);
+			misc_deregister(&scom->mdev);
+		}
+	}
+
+	return 0;
+}
+
 static struct fsi_device_id scom_ids[] = {
 	{
 		.engine_type = FSI_ENGID_SCOM,
@@ -213,6 +228,7 @@ static struct fsi_driver scom_drv = {
 		.name = "scom",
 		.bus = &fsi_bus_type,
 		.probe = scom_probe,
+		.remove = scom_remove,
 	}
 };
 
-- 
1.8.3.1
