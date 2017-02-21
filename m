Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vSZ1h3K2bzDqGn
 for <openbmc@lists.ozlabs.org>; Wed, 22 Feb 2017 08:50:48 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v1LLnEmu119262
 for <openbmc@lists.ozlabs.org>; Tue, 21 Feb 2017 16:50:46 -0500
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153])
 by mx0b-001b2d01.pphosted.com with ESMTP id 28rshfu9q4-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 21 Feb 2017 16:50:46 -0500
Received: from localhost
 by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Tue, 21 Feb 2017 14:50:45 -0700
Received: from d03dlp03.boulder.ibm.com (9.17.202.179)
 by e35.co.us.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 21 Feb 2017 14:50:44 -0700
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id AEFEE19D803F;
 Tue, 21 Feb 2017 14:49:55 -0700 (MST)
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v1LLohSW17301854; Tue, 21 Feb 2017 14:50:43 -0700
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7B2686A03C;
 Tue, 21 Feb 2017 14:50:43 -0700 (MST)
Received: from christophersmbp.austin.ibm.com (unknown [9.41.174.103])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP id 4ADA06A03F;
 Tue, 21 Feb 2017 14:50:43 -0700 (MST)
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
To: joel@jms.id.au
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.7 v2 7/7] tools/testing/selftests: Add fsi command
 line tool
Date: Tue, 21 Feb 2017 15:50:32 -0600
X-Mailer: git-send-email 2.10.1 (Apple Git-78)
In-Reply-To: <20170221215032.79282-1-cbostic@linux.vnet.ibm.com>
References: <20170221215032.79282-1-cbostic@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17022121-0012-0000-0000-000013B98744
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006659; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000204; SDB=6.00825191; UDB=6.00404016; IPR=6.00602646; 
 BA=6.00005161; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014381; XFM=3.00000011;
 UTC=2017-02-21 21:50:45
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17022121-0013-0000-0000-00004B9E6357
Message-Id: <20170221215032.79282-8-cbostic@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-02-21_19:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1702210201
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
X-List-Received-Date: Tue, 21 Feb 2017 21:50:48 -0000

Add command line tool to read/write CFAMs via the slave 'raw'
sysfs file.

Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
---
 tools/testing/selftests/fsi/fsitest.c | 163 ++++++++++++++++++++++++++++++++++
 1 file changed, 163 insertions(+)
 create mode 100644 tools/testing/selftests/fsi/fsitest.c

diff --git a/tools/testing/selftests/fsi/fsitest.c b/tools/testing/selftests/fsi/fsitest.c
new file mode 100644
index 0000000..7aa3e7f
--- /dev/null
+++ b/tools/testing/selftests/fsi/fsitest.c
@@ -0,0 +1,163 @@
+#include <stdio.h>
+#include <sys/types.h>
+#include <sys/stat.h>
+#include <sys/ioctl.h>
+#include <fcntl.h>
+#include <unistd.h>
+#include <err.h>
+#include <errno.h>
+#include <stdlib.h>
+#include <stdint.h>
+#include <getopt.h>
+#include <string.h>
+
+int testread(int fd, uint32_t addr, uint32_t *value)
+{
+	int rc;
+
+	lseek(fd, addr, SEEK_SET);
+	rc = read(fd, value, 4);
+	if (rc >= 0)
+		rc = 0;
+
+	return rc;
+}
+
+int testwrite(int fd, uint32_t addr, uint32_t value)
+{
+	int rc;
+
+	lseek(fd, addr, SEEK_SET);
+	rc = write(fd, &value, 4);
+	if (rc >= 0)
+		rc = 0;
+
+	return rc;
+}
+
+#define NUM_WRITES	6
+#define NUM_READS	9
+#define NUM_HUB_READS	9
+
+int main(int argc, char **argv)
+{
+	int rc = 0;
+	int i, fd, option;
+	int skip_write = 0;
+	int verbose = 0;
+	int hub = 0;
+	char path[64] = "/sys/bus/platform/devices/fsi-master/slave@00:00/raw";
+	uint32_t value;
+	const uint32_t write_addresses[NUM_WRITES] = {
+		0x800,
+		0x818,
+		0x35D0,
+		0x100800,
+		0x100818,
+		0x1035D0,
+	};
+	const uint32_t addresses[NUM_READS] = {
+		0x800,	/* smode */
+		0x818,	/* si1m */
+		0x81C,	/* si1s */
+		0x101C,	/* scom status */
+		0x1028,	/* scom chipid */
+		0x1808,	/* i2c mode */
+		0x181C,	/* i2c status */
+		0x3400,	/* hub mmode */
+		0x35D0,	/* hub status */
+	};
+	const uint32_t hub_addresses[NUM_HUB_READS] = {
+		0x100800,	/* smode */
+		0x100818,	/* si1m */
+		0x10081C,	/* si1s */
+		0x10101C,	/* scom status */
+		0x101028,	/* scom chipid */
+		0x101808,	/* i2c mode */
+		0x10181C,	/* i2c status */
+		0x103400,	/* hub mmode */
+		0x1035D0,	/* hub status */
+	};
+
+	while ((option = getopt(argc, argv, "vsb:x")) != -1) {
+		switch (option) {
+		case 'v':
+			verbose = 1;
+			break;
+		case 's':
+			skip_write = 1;
+			break;
+		case 'b':
+			strncpy(path, optarg, 64);
+			break;
+		case 'x':
+			hub = 1;
+			break;
+		default:
+			printf("unknown option\n");
+		}
+	}
+
+	fd = open(path, O_RDWR);
+	if (fd < 0) {
+		printf("FAILED - failed to open %s\n", path);
+		return -ENODEV;
+	}
+
+	for (i = 0; i < NUM_READS; ++i) {
+		rc = testread(fd, addresses[i], &value);
+		if (rc) {
+			printf("FAILED - failed to read %08x\n", addresses[i]);
+			goto exit;
+		}
+
+		if (verbose)
+			printf("read %08x: %08x\n", addresses[i], value);
+	}
+
+	if (!skip_write) {
+		for (i = 0; i < NUM_WRITES; ++i) {
+			value = 0;
+			rc = testread(fd, write_addresses[i], &value);
+			if (rc) {
+				printf("FAILED - failed to read %08x\n",
+				       write_addresses[i]);
+				goto exit;
+			}
+
+			rc = testwrite(fd, write_addresses[i], value);
+			if (rc) {
+				printf("FAILED - failed to write %08x\n",
+				       write_addresses[i]);
+				goto exit;
+			}
+
+			if (verbose)
+				printf("wrote %08x: %08x\n",
+				       write_addresses[i], value);
+		}
+	} else if (verbose)
+		printf("skipping write\n");
+
+	if (hub) {
+		for (i = 0; i < NUM_HUB_READS; ++i) {
+			rc = testread(fd, hub_addresses[i], &value);
+			if (rc) {
+				printf("FAILED - failed to read hub %08x\n",
+				       hub_addresses[i]);
+				goto exit;
+			}
+
+			if (verbose)
+				printf("read %08x: %08x\n", hub_addresses[i],
+				       value);
+		}
+	}
+
+	printf("SUCCESS\n");
+
+exit:
+	close(fd);
+
+	return rc;
+}
-- 
1.8.2.2
