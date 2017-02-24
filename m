Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vTzQR20kDzDqHm
 for <openbmc@lists.ozlabs.org>; Fri, 24 Feb 2017 15:58:39 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v1O4s9MD001113
 for <openbmc@lists.ozlabs.org>; Thu, 23 Feb 2017 23:58:37 -0500
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154])
 by mx0a-001b2d01.pphosted.com with ESMTP id 28t0avujn2-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 23 Feb 2017 23:58:37 -0500
Received: from localhost
 by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Thu, 23 Feb 2017 21:58:36 -0700
Received: from d03dlp03.boulder.ibm.com (9.17.202.179)
 by e36.co.us.ibm.com (192.168.1.136) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 23 Feb 2017 21:58:33 -0700
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id 16F4D19D8041;
 Thu, 23 Feb 2017 21:57:45 -0700 (MST)
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v1O4wX559437660; Thu, 23 Feb 2017 21:58:33 -0700
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2342F136046;
 Thu, 23 Feb 2017 21:58:33 -0700 (MST)
Received: from Christophers-MacBook-Pro.local.com (unknown [9.81.209.80])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP id 5909713603C;
 Thu, 23 Feb 2017 21:58:30 -0700 (MST)
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
To: joel@jms.id.au
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.7 v4 2/2] drivers/fsi: Cleanup and retry op on
 error
Date: Thu, 23 Feb 2017 22:58:20 -0600
X-Mailer: git-send-email 2.10.1 (Apple Git-78)
In-Reply-To: <20170224045820.1961-1-cbostic@linux.vnet.ibm.com>
References: <20170224045820.1961-1-cbostic@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17022404-0020-0000-0000-00000B7743CE
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006672; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000204; SDB=6.00826291; UDB=6.00404677; IPR=6.00603743; 
 BA=6.00005168; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014420; XFM=3.00000011;
 UTC=2017-02-24 04:58:35
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17022404-0021-0000-0000-00005A625DFD
Message-Id: <20170224045820.1961-3-cbostic@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-02-24_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1702240050
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
X-List-Received-Date: Fri, 24 Feb 2017 04:58:39 -0000

On detect of FSI bus error clean up the bus and then retry
the original operation.

Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>

---
v4 - Move atomic_t from global to scope of fsi_master_handle_error

v3 - Move comon read/write code into a retry utility

   - Add comment on why trying again

   - Change nested error check from atomic bit type to atomic_t

   - loop on retry instead of duplicating the same code
---
 drivers/fsi/fsi-core.c        | 30 ++++++++++++++++++++++++++++++
 drivers/fsi/fsi-master-gpio.c | 28 ++++++++++++++++++++++++++--
 drivers/fsi/fsi-master.h      |  1 +
 3 files changed, 57 insertions(+), 2 deletions(-)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 8409c00..1114e53 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -42,6 +42,9 @@
 
 #define FSI_PEEK_BASE			0x410
 #define	FSI_SLAVE_BASE			0x800
+#define	FSI_HUB_CONTROL			0x3400
+
+#define	FSI_SLAVE_SMODE_DFLT		0xa0ff0100
 
 #define FSI_IPOLL_PERIOD		msecs_to_jiffies(fsi_ipoll_period_ms)
 
@@ -663,6 +666,33 @@ static int fsi_master_break(struct fsi_master *master, int link)
 	return 0;
 }
 
+void fsi_master_handle_error(struct fsi_master *master, uint32_t addr)
+{
+	uint32_t smode = FSI_SLAVE_SMODE_DFLT;
+	static atomic_t in_err_cleanup = ATOMIC_INIT(-1);
+
+	if (!atomic_inc_and_test(&in_err_cleanup))
+		return;
+
+	fsi_master_break(master, 0);
+	udelay(200);
+	master->write(master, 0, 0, FSI_SLAVE_BASE + FSI_SMODE, &smode,
+			sizeof(smode));
+	smode = FSI_MRESB_RST_GEN | FSI_MRESB_RST_ERR;
+	master->write(master, 0, 0, FSI_HUB_CONTROL + FSI_MRESB0, &smode,
+			sizeof(smode));
+
+	if (addr > FSI_HUB_LINK_OFFSET) {
+		smode = FSI_BREAK;
+		master->write(master, 0, 0, 0x100004, &smode, sizeof(smode));
+		smode = FSI_SLAVE_SMODE_DFLT;
+		master->write(master, 0, 0, 0x100800, &smode, sizeof(smode));
+	}
+
+	atomic_set(&in_err_cleanup, -1);
+}
+EXPORT_SYMBOL(fsi_master_handle_error);
+
 static int fsi_master_scan(struct fsi_master *master)
 {
 	int link, slave_id, rc;
diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
index b6feec1..c5f4f9c 100644
--- a/drivers/fsi/fsi-master-gpio.c
+++ b/drivers/fsi/fsi-master-gpio.c
@@ -370,6 +370,28 @@ static int send_command(struct fsi_master_gpio *master,
 	return rc;
 }
 
+static int fsi_master_gpio_send(struct fsi_master_gpio *master,
+				struct fsi_gpio_msg *cmd, uint8_t expected,
+				uint32_t addr, size_t size, void *val)
+{
+	static const int master_retries = 2;
+	uint8_t retries;
+	int rc;
+
+	/*
+	 * In case the FSI bus is in a bad state a retry may help
+	 * the operation to complete successfully
+	 */
+	for (retries = 0; retries < master_retries; retries++) {
+		rc = send_command(master, cmd, expected, size, val);
+		if (!rc)
+			break;
+		fsi_master_handle_error(&master->master, addr);
+	}
+
+	return rc;
+}
+
 static int fsi_master_gpio_read(struct fsi_master *_master, int link,
 		uint8_t slave, uint32_t addr, void *val, size_t size)
 {
@@ -380,7 +402,8 @@ static int fsi_master_gpio_read(struct fsi_master *_master, int link,
 		return -ENODEV;
 
 	build_abs_ar_command(&cmd, FSI_GPIO_CMD_READ, slave, addr, size, NULL);
-	return send_command(master, &cmd, FSI_GPIO_RESP_ACKD, size, val);
+	return fsi_master_gpio_send(master, &cmd, FSI_GPIO_RESP_ACKD, addr,
+				size, val);
 }
 
 static int fsi_master_gpio_write(struct fsi_master *_master, int link,
@@ -393,7 +416,8 @@ static int fsi_master_gpio_write(struct fsi_master *_master, int link,
 		return -ENODEV;
 
 	build_abs_ar_command(&cmd, FSI_GPIO_CMD_WRITE, slave, addr, size, val);
-	return send_command(master, &cmd, FSI_GPIO_RESP_ACK, size, NULL);
+	return fsi_master_gpio_send(master, &cmd, FSI_GPIO_RESP_ACK, addr,
+				size, NULL);
 }
 
 /*
diff --git a/drivers/fsi/fsi-master.h b/drivers/fsi/fsi-master.h
index 4a3176b..54723a7 100644
--- a/drivers/fsi/fsi-master.h
+++ b/drivers/fsi/fsi-master.h
@@ -85,6 +85,7 @@ struct fsi_master {
 extern int fsi_master_register(struct fsi_master *master);
 extern void fsi_master_unregister(struct fsi_master *master);
 extern int fsi_master_start_ipoll(struct fsi_master *master);
+extern void fsi_master_handle_error(struct fsi_master *master, uint32_t addr);
 
 /**
  * crc4 helper: Given a starting crc4 state @c, calculate the crc4 vaue of @x,
-- 
1.8.2.2
