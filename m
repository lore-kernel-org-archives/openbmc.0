Return-Path: <cyril.bur@au1.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wyd896s7XzDr4J
 for <openbmc@lists.ozlabs.org>; Thu, 29 Jun 2017 08:42:01 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v5SMcowN069297
 for <openbmc@lists.ozlabs.org>; Wed, 28 Jun 2017 18:41:58 -0400
Received: from e23smtp03.au.ibm.com (e23smtp03.au.ibm.com [202.81.31.145])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2bcmrbsatp-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 28 Jun 2017 18:41:58 -0400
Received: from localhost
 by e23smtp03.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cyril.bur@au1.ibm.com>;
 Thu, 29 Jun 2017 08:41:55 +1000
Received: from d23relay08.au.ibm.com (202.81.31.227)
 by e23smtp03.au.ibm.com (202.81.31.209) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Thu, 29 Jun 2017 08:41:54 +1000
Received: from d23av05.au.ibm.com (d23av05.au.ibm.com [9.190.234.119])
 by d23relay08.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v5SMfjBa8389058
 for <openbmc@lists.ozlabs.org>; Thu, 29 Jun 2017 08:41:53 +1000
Received: from d23av05.au.ibm.com (localhost [127.0.0.1])
 by d23av05.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 v5SMfLMb010995
 for <openbmc@lists.ozlabs.org>; Thu, 29 Jun 2017 08:41:21 +1000
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av05.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 v5SMfLJF010569; Thu, 29 Jun 2017 08:41:21 +1000
Received: from camb691.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher DHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 01C8AA01B5;
 Thu, 29 Jun 2017 08:40:57 +1000 (AEST)
From: Cyril Bur <cyril.bur@au1.ibm.com>
To: joel@jms.id.au, openbmc@lists.ozlabs.org
Subject: [PATCH skiboot/pflash] libflash/libffs: Detect first byte flash
 corruption
Date: Thu, 29 Jun 2017 08:40:41 +1000
X-Mailer: git-send-email 2.13.2
X-TM-AS-MML: disable
x-cbid: 17062822-0008-0000-0000-00000148DA38
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17062822-0009-0000-0000-00000978B456
Message-Id: <20170628224041.14315-1-cyril.bur@au1.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-06-28_14:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1706280363
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
X-List-Received-Date: Wed, 28 Jun 2017 22:42:02 -0000

This patch is not for upstream but currently this unknown corruption is
making life difficult.

Perhaps it can be useful at least temporarily.

Feel free to remove the option to continue and leave just the
information message.

Signed-off-by: Cyril Bur <cyril.bur@au1.ibm.com>
---
 libflash/libffs.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/libflash/libffs.c b/libflash/libffs.c
index 7ae9050e..dce6237e 100644
--- a/libflash/libffs.c
+++ b/libflash/libffs.c
@@ -260,6 +260,35 @@ int ffs_init(uint32_t offset, uint32_t max_size, struct blocklevel_device *bl,
 
 	/* Convert and check flash header */
 	rc = ffs_check_convert_header(&f->hdr, &raw_hdr);
+	/*
+	 * A bug on witherspoon of currently unknown origin causes
+	 * corruption of the first byte of flash. This is by no means
+	 * a fix and should never go upstream but may prove helpful.
+	 */
+	if (rc == FFS_ERR_BAD_MAGIC) {
+		/*
+		 * We can set the first byte to what we know it should be
+		 * and try to check and convert header again. If it
+		 * succeeds there is a very high chance this is the
+		 * problem.
+		 */
+		*(char *)&raw_hdr = 'P';
+		rc = ffs_check_convert_header(&f->hdr, &raw_hdr);
+		if (rc) {
+			/*
+			 * Turn it back into BAD_MAGIC, the flash obviously
+			 * has bigger problems.
+			 */
+			rc = FFS_ERR_BAD_MAGIC;
+		} else {
+			FL_ERR("FFS: Detected corruption of the first byte of flash.\n");
+			FL_ERR("     Recommend hard power cycling the entire machine\n");
+			FL_ERR("     Continuing is dangerous!\n");
+			FL_ERR("     Continuing in 10 seconds\n");
+			sleep(10);
+			rc = 0;
+		}
+	}
 	if (rc) {
 		FL_INF("FFS: Flash header not found. Code: %d\n", rc);
 		goto out;
-- 
2.13.2
