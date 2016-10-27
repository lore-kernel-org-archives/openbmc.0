Return-Path: <alastair@au1.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t49lv5w7pzDvJD
 for <openbmc@lists.ozlabs.org>; Thu, 27 Oct 2016 13:27:55 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 u9R2PpeE096448
 for <openbmc@lists.ozlabs.org>; Wed, 26 Oct 2016 22:27:53 -0400
Received: from e23smtp06.au.ibm.com (e23smtp06.au.ibm.com [202.81.31.148])
 by mx0a-001b2d01.pphosted.com with ESMTP id 26b7t9202m-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 26 Oct 2016 22:27:52 -0400
Received: from localhost
 by e23smtp06.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <alastair@au1.ibm.com>;
 Thu, 27 Oct 2016 12:27:49 +1000
Received: from d23dlp02.au.ibm.com (202.81.31.213)
 by e23smtp06.au.ibm.com (202.81.31.212) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Thu, 27 Oct 2016 12:27:42 +1000
Received: from d23relay06.au.ibm.com (d23relay06.au.ibm.com [9.185.63.219])
 by d23dlp02.au.ibm.com (Postfix) with ESMTP id CF3362BB005D
 for <openbmc@lists.ozlabs.org>; Thu, 27 Oct 2016 13:27:40 +1100 (EST)
Received: from d23av03.au.ibm.com (d23av03.au.ibm.com [9.190.234.97])
 by d23relay06.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u9R2Re8T19333372
 for <openbmc@lists.ozlabs.org>; Thu, 27 Oct 2016 13:27:40 +1100
Received: from d23av03.au.ibm.com (localhost [127.0.0.1])
 by d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u9R2Rdjt018927
 for <openbmc@lists.ozlabs.org>; Thu, 27 Oct 2016 13:27:40 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u9R2RdPl018910; Thu, 27 Oct 2016 13:27:39 +1100
Received: from adsilva.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id A8F85A021A;
 Thu, 27 Oct 2016 13:27:39 +1100 (AEDT)
From: alastair@au1.ibm.com
To: openbmc@lists.ozlabs.org
Cc: clg@koad.org, andrew@aj.id.au, "Alastair D'Silva" <alastair@d-silva.org>
Subject: [PATCH 3/3] Add a unit test for RX8900 RTC (time functionality only)
Date: Thu, 27 Oct 2016 13:27:13 +1100
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1477535233-7760-1-git-send-email-alastair@au1.ibm.com>
References: <1477535233-7760-1-git-send-email-alastair@au1.ibm.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16102702-0040-0000-0000-000001F1B8F5
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16102702-0041-0000-0000-00000AC2BE2E
Message-Id: <1477535233-7760-4-git-send-email-alastair@au1.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-10-27_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=4
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1609300000
 definitions=main-1610270039
X-Mailman-Approved-At: Thu, 27 Oct 2016 14:33:06 +1100
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
X-List-Received-Date: Thu, 27 Oct 2016 02:27:56 -0000

From: Alastair D'Silva <alastair@d-silva.org>

Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 hw/arm/imx25_pdk.c     |  9 +++---
 tests/Makefile.include |  2 ++
 tests/rx8900-test.c    | 82 ++++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 89 insertions(+), 4 deletions(-)
 create mode 100644 tests/rx8900-test.c

diff --git a/hw/arm/imx25_pdk.c b/hw/arm/imx25_pdk.c
index 025b608..99a819f 100644
--- a/hw/arm/imx25_pdk.c
+++ b/hw/arm/imx25_pdk.c
@@ -134,13 +134,14 @@ static void imx25_pdk_init(MachineState *machine)
         arm_load_kernel(&s->soc.cpu, &imx25_pdk_binfo);
     } else {
         /*
-         * This I2C device doesn't exist on the real board.
+         * These I2C devices doesn't exist on the real board.
          * We add it here (only on qtest usage) to be able to do a bit
          * of simple qtest. See "make check" for details.
          */
-        i2c_create_slave((I2CBus *)qdev_get_child_bus(DEVICE(&s->soc.i2c[0]),
-                                                      "i2c"),
-                         "ds1338", 0x68);
+        I2CBus *i2c = (I2CBus *)qdev_get_child_bus(DEVICE(&s->soc.i2c[0]),
+                "i2c");
+        i2c_create_slave(i2c, "ds1338", 0x68);
+        i2c_create_slave(i2c, "rx8900", 0x32);
     }
 }
 
diff --git a/tests/Makefile.include b/tests/Makefile.include
index cbe38ad..3f08ba9 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -297,6 +297,7 @@ check-qtest-sparc64-y = tests/endianness-test$(EXESUF)
 
 check-qtest-arm-y = tests/tmp105-test$(EXESUF)
 check-qtest-arm-y += tests/ds1338-test$(EXESUF)
+check-qtest-arm-y += tests/rx8900-test$(EXESUF)
 check-qtest-arm-y += tests/m25p80-test$(EXESUF)
 gcov-files-arm-y += hw/misc/tmp105.c
 check-qtest-arm-y += tests/virtio-blk-test$(EXESUF)
@@ -629,6 +630,7 @@ tests/bios-tables-test$(EXESUF): tests/bios-tables-test.o \
 tests/pxe-test$(EXESUF): tests/pxe-test.o tests/boot-sector.o $(libqos-obj-y)
 tests/tmp105-test$(EXESUF): tests/tmp105-test.o $(libqos-omap-obj-y)
 tests/ds1338-test$(EXESUF): tests/ds1338-test.o $(libqos-imx-obj-y)
+tests/rx8900-test$(EXESUF): tests/rx8900-test.o $(libqos-imx-obj-y)
 tests/m25p80-test$(EXESUF): tests/m25p80-test.o
 tests/i440fx-test$(EXESUF): tests/i440fx-test.o $(libqos-pc-obj-y)
 tests/q35-test$(EXESUF): tests/q35-test.o $(libqos-pc-obj-y)
diff --git a/tests/rx8900-test.c b/tests/rx8900-test.c
new file mode 100644
index 0000000..8d3ecd8
--- /dev/null
+++ b/tests/rx8900-test.c
@@ -0,0 +1,82 @@
+/*
+ * QTest testcase for the DS1338 RTC
+ *
+ * Copyright (c) 2013 Jean-Christophe Dubois
+ *
+ *  This program is free software; you can redistribute it and/or modify it
+ *  under the terms of the GNU General Public License as published by the
+ *  Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful, but WITHOUT
+ *  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ *  FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
+ *  for more details.
+ *
+ *  You should have received a copy of the GNU General Public License along
+ *  with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "libqtest.h"
+#include "libqos/i2c.h"
+
+#define IMX25_I2C_0_BASE 0x43F80000
+
+#define RX8900_ADDR 0x32
+
+static I2CAdapter *i2c;
+static uint8_t addr;
+
+static inline uint8_t bcd2bin(uint8_t x)
+{
+    return ((x) & 0x0f) + ((x) >> 4) * 10;
+}
+
+static void send_and_receive(void)
+{
+    uint8_t cmd[1];
+    uint8_t resp[7];
+    time_t now = time(NULL);
+    struct tm *tm_ptr;
+
+    /* reset the index in the RTC memory */
+    cmd[0] = 0;
+    i2c_send(i2c, addr, cmd, 1);
+
+    tm_ptr = gmtime(&now);
+    /* retrieve the date */
+    i2c_recv(i2c, addr, resp, 7);
+
+    /* check retrieved time against local time */
+    g_assert_cmpuint(bcd2bin(resp[0]), == , tm_ptr->tm_sec);
+    g_assert_cmpuint(bcd2bin(resp[1]), == , tm_ptr->tm_min);
+    g_assert_cmpuint(bcd2bin(resp[2]), == , tm_ptr->tm_hour);
+    g_assert_cmpuint(bcd2bin(resp[4]), == , tm_ptr->tm_mday);
+    g_assert_cmpuint(bcd2bin(resp[5]), == , 1 + tm_ptr->tm_mon);
+    g_assert_cmpuint(2000 + bcd2bin(resp[6]), == , 1900 + tm_ptr->tm_year);
+}
+
+int main(int argc, char **argv)
+{
+    QTestState *s = NULL;
+    int ret;
+
+    g_test_init(&argc, &argv, NULL);
+
+    /* Address must match RX8900_ADDR */
+    s = qtest_start("-display none -machine imx25-pdk");
+    i2c = imx_i2c_create(IMX25_I2C_0_BASE);
+    addr = RX8900_ADDR;
+
+    qtest_add_func("/rx8900/tx-rx", send_and_receive);
+
+    ret = g_test_run();
+
+    if (s) {
+        qtest_quit(s);
+    }
+    g_free(i2c);
+
+    return ret;
+}
-- 
2.7.4
