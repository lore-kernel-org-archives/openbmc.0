Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vDx2m423fzDqBh
 for <openbmc@lists.ozlabs.org>; Fri,  3 Feb 2017 10:26:24 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v12NIeZS126835
 for <openbmc@lists.ozlabs.org>; Thu, 2 Feb 2017 18:26:22 -0500
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153])
 by mx0a-001b2d01.pphosted.com with ESMTP id 28cchf3na4-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 02 Feb 2017 18:26:22 -0500
Received: from localhost
 by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 2 Feb 2017 16:26:21 -0700
Received: from d03dlp01.boulder.ibm.com (9.17.202.177)
 by e35.co.us.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 2 Feb 2017 16:26:20 -0700
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by d03dlp01.boulder.ibm.com (Postfix) with ESMTP id 8D73C1FF0021;
 Thu,  2 Feb 2017 16:25:57 -0700 (MST)
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v12NQJ6e12583406; Thu, 2 Feb 2017 16:26:19 -0700
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5941F78043;
 Thu,  2 Feb 2017 16:26:19 -0700 (MST)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP id D39BC7803F;
 Thu,  2 Feb 2017 16:26:18 -0700 (MST)
From: eajames@linux.vnet.ibm.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, alistair@popple.id.au, benh@kernel.crashing.org,
 "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux v1 8/8] drivers: fsi: i2c: boe engine
Date: Thu,  2 Feb 2017 17:26:01 -0600
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1486077964-11346-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1486077964-11346-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17020223-0012-0000-0000-0000138A6464
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006545; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000201; SDB=6.00816379; UDB=6.00398660; IPR=6.00593813; 
 BA=6.00005112; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014159; XFM=3.00000011;
 UTC=2017-02-02 23:26:21
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17020223-0013-0000-0000-00004B154576
Message-Id: <1486077964-11346-6-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-02-02_15:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=3
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1702020219
X-Mailman-Approved-At: Fri, 03 Feb 2017 11:12:45 +1100
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
X-List-Received-Date: Thu, 02 Feb 2017 23:26:25 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/fsi/i2c/Makefile  |    2 +-
 drivers/fsi/i2c/iic-boe.c | 1597 +++++++++++++++++++++++++++++++++++++++++++++
 drivers/fsi/i2c/iic-boe.h |  180 +++++
 3 files changed, 1778 insertions(+), 1 deletion(-)
 create mode 100644 drivers/fsi/i2c/iic-boe.c
 create mode 100644 drivers/fsi/i2c/iic-boe.h

diff --git a/drivers/fsi/i2c/Makefile b/drivers/fsi/i2c/Makefile
index 4d04026..59ecf36 100644
--- a/drivers/fsi/i2c/Makefile
+++ b/drivers/fsi/i2c/Makefile
@@ -1 +1 @@
-obj-$(CONFIG_FSI_I2C) += iic-fsi.o iic-mstr.o iic-lock.o
+obj-$(CONFIG_FSI_I2C) += iic-fsi.o iic-mstr.o iic-lock.o iic-boe.o
diff --git a/drivers/fsi/i2c/iic-boe.c b/drivers/fsi/i2c/iic-boe.c
new file mode 100644
index 0000000..27dc8c1
--- /dev/null
+++ b/drivers/fsi/i2c/iic-boe.c
@@ -0,0 +1,1597 @@
+/*
+ *   Copyright (c) International Business Machines Corp., 2006, 2010
+ *
+ *   This program is free software;  you can redistribute it and/or modify
+ *   it under the terms of the GNU General Public License as published by
+ *   the Free Software Foundation; either version 2 of the License, or
+ *   (at your option) any later version.
+ *
+ *   This program is distributed in the hope that it will be useful,
+ *   but WITHOUT ANY WARRANTY;  without even the implied warranty of
+ *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
+ *   the GNU General Public License for more details.
+ *
+ *   You should have received a copy of the GNU General Public License
+ *   along with this program;  if not, write to the Free Software
+ *   Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+ */
+
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/interrupt.h>
+#include <linux/delay.h>
+#include <asm/io.h>
+#include <asm/bitops.h>
+#include <linux/mm.h>
+#include <linux/highmem.h>
+#include "iic-int.h"
+#include "iic-boe.h"
+#include <linux/fsi.h>
+#include <asm/unaligned.h>
+
+/* Wrappers around the register access functions allow for access
+ * over different types of busses (i.e. FSI or OPB).
+ */
+#define iic_readb(eng, reg, val, ffdc)\
+	(eng->ra->bus_readb(eng, reg * 4, val, ffdc))
+#define iic_readh(eng, reg, val, ffdc)\
+	(eng->ra->bus_readh(eng, reg * 4, val, ffdc))
+#define iic_readw(eng, reg, val, ffdc)\
+	(eng->ra->bus_readw(eng, reg * 4, val, ffdc))
+
+#define iic_writeb(eng, reg, val, ffdc)\
+	(eng->ra->bus_writeb(eng, reg * 4, val, ffdc))
+#define iic_writeh(eng, reg, val, ffdc)\
+	(eng->ra->bus_writeh(eng, reg * 4, val, ffdc))
+#define iic_writew(eng, reg, val, ffdc)\
+	(eng->ra->bus_writew(eng, reg * 4, val, ffdc))
+
+/* Actual equation for the clock divider is
+ * (((lb_hz / (iic_hz)) - 1) / 4) - 1), but 1 is added in
+ * order to compensate for truncation errors --  It's better to be a little
+ * slow than to be a little too fast.
+ */
+#define IIC_BOE_HZ2DIV(lb_hz, iic_hz) _clock_divider
+#define IIC_BOE_DIV2HZ(lb_hz, d) \
+	((lb_hz) / ((4 * ((d) + 1)) + 1))
+
+/* Bus address calc for larger SEEPROM devices
+ */
+#define IIC_BOE_CALC_BUS_ADDR(opts, xfr) 					\
+	opts->dev_addr + (((opts->offset + xfr->bytes_xfrd) & opts->inc_addr) 	\
+	>> ((opts->dev_width * 8) - 1));
+
+/* Externalized Master Functions */
+int iic_boe_use_dma(iic_xfr_t* xfr);
+int iic_boe_start(iic_xfr_t* xfr);
+int iic_boe_start_abort(iic_eng_t* eng, iic_ffdc_t**);
+int iic_boe_finish_abort(iic_eng_t* eng, iic_ffdc_t**);
+int iic_boe_rescue_timeout(iic_eng_t* eng, iic_xfr_t* xfr);
+int iic_boe_reset_bus(iic_bus_t* bus, iic_ffdc_t**);
+int iic_boe_reset_eng(iic_eng_t* eng, iic_ffdc_t**);
+int iic_boe_run_bat(iic_eng_t* eng, iic_ffdc_t**);
+int iic_boe_eng_init(iic_eng_t* eng, iic_ffdc_t**);
+int iic_boe_enable_int(iic_eng_t* eng, iic_ffdc_t**);
+int iic_boe_disable_int(iic_eng_t* eng, iic_ffdc_t**);
+int iic_boe_cleanup_eng(iic_eng_t* eng, iic_ffdc_t**);
+int iic_boe_int_handler(int, void*);
+int iic_boe_wait_for_idle(iic_eng_t* eng, int timeout, iic_ffdc_t**);
+void iic_boe_display_regs(iic_eng_t* eng, iic_ffdc_t**);
+int iic_boe_get_bus_state(iic_bus_t* bus, unsigned long* state, iic_ffdc_t**);
+int iic_boe_set_speed(iic_bus_t* bus, int speed);
+int iic_boe_get_speed(iic_bus_t* bus);
+
+#define IIC_BOE_BUS_RESET 1
+#define IIC_BOE_ENG_RESET 0
+int iic_boe_reset(iic_eng_t* eng, int type, iic_ffdc_t** ffdc);
+void iic_boe_dma_callback(int dma_rc, void* ffdc, void* data);
+int iic_boe_check_ddr4_nack(iic_xfr_t *xfr);
+
+static const char iic_boe_version[] = "3.0";
+static unsigned int _clock_divider = 6;
+
+static iic_eng_ops_t eng_ops = {
+	.use_dma = &iic_boe_use_dma,
+	.start = &iic_boe_start,
+	.start_abort = &iic_boe_start_abort,
+	.finish_abort = &iic_boe_finish_abort,
+	.start_rescue_timeout = &iic_boe_rescue_timeout,
+	.finish_rescue_timeout = &iic_boe_rescue_timeout,
+	.reset_bus = &iic_boe_reset_bus,
+	.reset_eng = &iic_boe_reset_eng,
+	.run_bat = &iic_boe_run_bat,
+	.init = &iic_boe_eng_init,
+	.enable_int = &iic_boe_enable_int,
+	.disable_int = &iic_boe_disable_int,
+	.int_handler = &iic_boe_int_handler,
+	.wait_for_idle = &iic_boe_wait_for_idle,
+	.cleanup_eng = 0,
+	.display_regs = iic_boe_display_regs,
+	.slv_on = 0,
+	.slv_off = 0,
+	.slv_recv = 0,
+	.slv_cont = 0,
+	.slv_set_addr = 0,
+	.slv_get_addr = 0,
+	.get_bus_state = iic_boe_get_bus_state,
+	.set_speed = iic_boe_set_speed,
+	.get_speed = iic_boe_get_speed,
+	.send = 0,
+};
+
+#define IIC_BOE_MAX_CLKDIV 0x0FFF
+int iic_boe_set_speed(iic_bus_t* bus, int i2c_hz)
+{
+	_clock_divider = i2c_hz;
+}
+
+int iic_boe_get_speed(iic_bus_t* bus)
+{
+	return _clock_divider;
+}
+
+void iic_boe_display_regs(iic_eng_t* eng, iic_ffdc_t** ffdc)
+{
+	int i;
+	unsigned long reg;
+	IENTER();
+	for(i = 1; i < IIC_BOE_MAX_OFFSET; i++)
+	{
+		if(eng->ra->bus_readw(eng, i * 4, &reg, 0))
+			break;
+		printk("%02x: %08lx\n", i, reg);
+	}
+	IEXIT(0);
+}
+
+/* rc > 0 means use dma
+ * rc = 0 means don't use dma
+ * rc < 0 means dma setup failed
+ */
+#define IIC_BOE_MIN_DMA_SIZE 129
+int iic_boe_use_dma(iic_xfr_t* xfr)
+{
+	int rc = 0;
+	IEXIT(rc);
+	return rc;
+}
+
+#define IIC_BOE_SCL_SHIFT 11
+#define IIC_BOE_SDA_SHIFT 9
+/* Returns the logical state of the clock and data lines */
+int iic_boe_get_bus_state(iic_bus_t* bus, unsigned long* state, iic_ffdc_t** ffdc)
+{
+	unsigned long stat = 0;
+	unsigned long mode;
+        int rc = 0;
+
+	IENTER();
+	*state = 0;
+	rc = iic_readw(bus->eng, IIC_BOE_MODE, &mode, ffdc);
+	if(rc)
+		goto exit;
+
+	if(test_bit(IIC_ENG_Z7PLUS, &bus->eng->flags) ||
+	   test_bit(IIC_ENG_P8_Z8_CENTAUR, &bus->eng->flags))
+	{
+		IFLDi(0, "iic_boe_get_bus_state: P8/Z7PLUS mode\n");
+		mode = (mode & ~IIC_BOE_Z7_PORT) | IIC_BOE_Z7_MK_PORT(bus->port);
+	}
+	else
+	{
+		IFLDi(0, "iic_boe_get_bus_state: Normal mode\n");
+		mode = (mode & ~IIC_BOE_PORT) | IIC_BOE_MK_PORT(bus->port);
+	}
+	rc = iic_writew(bus->eng, IIC_BOE_MODE, mode, ffdc);
+	if(rc)
+		goto exit;
+	rc = iic_readw(bus->eng, IIC_BOE_STAT, &stat, ffdc);
+	if(rc)
+		goto exit;
+
+	*state = ((stat & IIC_BOE_SCL_IN) >> IIC_BOE_SCL_SHIFT) | 
+	     	 ((stat & IIC_BOE_SDA_IN) >> IIC_BOE_SDA_SHIFT);
+	IDBGd(1, "bus state = %08lx\n", *state);
+exit:
+	IEXIT(rc);
+        return rc; 
+}
+
+/* Translate BOE status bits into our standardized error codes.
+ */
+int iic_boe_get_error(iic_eng_t* eng, unsigned long stat, iic_ffdc_t** ffdc)
+{
+	int ret;
+	IENTER();
+	/* Use priority scheme in case multiple bits are enabled */
+	if(stat & IIC_BOE_S_BE_ERRS)
+	{
+		ret = -EIO;
+	}
+	else if(stat & IIC_BOE_S_NACK)
+	{
+		unsigned long cmd_len;
+		unsigned long fe_len;
+		/* compare cmd length and front end len to determine
+		 * if we were sending the address or data.  If the cmd
+		 * len is the same as the front end len, then no data
+		 * has been transfered and we must have been in the
+		 * address phase, otherwise, we're in the data phase.
+		 */
+		ret = iic_readw(eng, IIC_BOE_CMD, &cmd_len, ffdc);
+		if(ret)
+			goto exit;
+		ret = iic_readw(eng, IIC_BOE_RESID_LEN, &fe_len, ffdc);
+		if(ret)
+			goto exit;
+		cmd_len &= IIC_BOE_XFR_LEN;
+		fe_len = IIC_BOE_GET_FE(fe_len);
+		if(cmd_len == fe_len)
+		{
+			ret = -ENXIO;
+		}
+		else
+		{
+			if (!iic_boe_check_ddr4_nack(eng->cur_xfr))
+				ret = -ENODATA;
+		}
+	}
+	else if((stat & IIC_BOE_S_LOST_ARB) || (stat & IIC_BOE_PORT_BUSY))
+	{
+		ret = -EALREADY;
+	}
+	else
+	{
+		ret = -EIO;
+	}
+exit:
+	IEXIT(ret);
+	return ret;
+}
+
+int iic_boe_fifo_to_usr(iic_eng_t* eng, iic_xfr_t* xfr, unsigned long bytes)
+{
+	int rc = 0;
+	char* uptr;
+	unsigned long bytes_left;
+	unsigned long end = xfr->bytes_xfrd + bytes;
+	char dummy[4];
+
+	IENTER();
+	while((xfr->bytes_xfrd < end) && !rc)
+	{
+		uptr = &xfr->buf[xfr->bytes_xfrd];
+
+		bytes_left = end - xfr->bytes_xfrd;
+		if (xfr->bytes_xfrd >= xfr->size) {
+			IFLDe(2, "buffer is full, but fifo still has data\n");
+			uptr = dummy;
+		}
+		if(bytes_left >= 4) {
+			rc = iic_readw(eng, IIC_BOE_FIFO, (long *)dummy, &xfr->ffdc);
+			uptr[0] = dummy[3];
+			uptr[1] = dummy[2];
+			uptr[2] = dummy[1];
+			uptr[3] = dummy[0];
+			xfr->bytes_xfrd += 4;
+		} else if(bytes_left >= 2) {
+			iic_readh(eng, IIC_BOE_FIFO, (short *)dummy, &xfr->ffdc);
+			uptr[0] = dummy[1];
+			uptr[1] = dummy[0];
+			xfr->bytes_xfrd += 2;
+		} else {
+			iic_readb(eng, IIC_BOE_FIFO, uptr, &xfr->ffdc);
+			xfr->bytes_xfrd++;
+		}
+	}
+	if (xfr->bytes_xfrd > xfr->size)
+		xfr->bytes_xfrd = xfr->size;
+
+	IEXIT(rc);
+	return rc;
+}
+
+int iic_boe_usr_to_fifo(iic_eng_t* eng, iic_xfr_t* xfr, unsigned long bytes)
+{
+	int rc = 0;
+	u16 half;
+	u32 word;
+	char* uptr;
+	unsigned long bytes_left;
+	unsigned long end = xfr->bytes_xfrd + bytes;
+
+	IENTER();
+	while((xfr->bytes_xfrd < end) && !rc)
+	{
+		uptr = &xfr->buf[xfr->bytes_xfrd];
+
+		bytes_left = end - xfr->bytes_xfrd;
+		if(bytes_left >= 4) {
+			word = cpu_to_be32(get_unaligned((long *)uptr));
+			rc = iic_writew(eng, IIC_BOE_FIFO, word, &xfr->ffdc);
+			xfr->bytes_xfrd += 4;
+		} else if(bytes_left >= 2) {
+			half = cpu_to_be16(get_unaligned((short *)uptr));
+			iic_writeh(eng, IIC_BOE_FIFO, half, &xfr->ffdc);
+			xfr->bytes_xfrd += 2;
+		} else {
+			iic_writeb(eng, IIC_BOE_FIFO, *uptr, &xfr->ffdc);
+			xfr->bytes_xfrd++;
+		}
+	}
+
+	IEXIT(rc);
+	return rc;
+}
+
+/* Interrupt Handler 
+ *
+ * Handles the following general cases:
+ *
+ *	DATA REQUEST - This services the fifo
+ *	CMD COMPLETE - Determines the next command to run for a transfer
+ *	               or notifies base code that transfer completed
+ *	               successfully.
+ *	ERRORS - Gathers FFDC, cleans up bus, and notifies base code that 
+ *	         transfer completed with errors.
+ */ 	
+int iic_boe_int_handler(int irq,
+			void* device_data)
+{
+	int rc;
+	iic_ffdc_t* ffdc = 0;
+	unsigned long stat;
+	unsigned long cur_dev_addr;
+	struct device *dev = device_data;
+	iic_eng_t* eng = dev_get_drvdata(dev);
+	iic_xfr_t* xfr = eng->cur_xfr;
+	iic_xfr_opts_t* opts;  
+	unsigned long cmd_left = 0;
+	unsigned long fifo_left = 0;
+	
+	IENTER();
+
+	/* Mask all IIC interrupts for this engine */
+	rc = iic_writew(eng, IIC_BOE_INT_MASK, 0, &ffdc);
+	if(rc)
+	{
+		if(xfr)
+		{
+			goto xfr_err;
+		}
+		goto exit;
+	}
+	
+	/* If the engine is locked and we get an interrupt,
+	 * then we are in the process of aborting the transfer.
+	 * Access of the xfr from the interrupt handler is forbidden
+	 * as long as this flag is set.
+	 * Wake up blocked threads waiting for the abort to complete
+	 */
+	if(test_bit(IIC_ENG_ABORT, &eng->flags))
+	{
+		IDBGd(1, "xfr[%p] abort!\n", eng->cur_xfr);
+		wake_up_interruptible(&eng->waitq);
+		goto exit;
+	}
+
+	if(!xfr)
+	{
+		goto exit;
+	}
+
+	rc = iic_readw(eng, IIC_BOE_STAT, &stat, &ffdc);
+	if(rc)
+		goto xfr_err;
+
+	IDBGl(2, "eng[%08x]: status[%08lx]\n", eng->id, stat);
+
+	opts = &xfr->opts.xfr_opts;
+	cur_dev_addr = opts->dev_addr;
+
+	/* Check for errors
+	 */
+	if(stat & IIC_BOE_S_ANY_ERR)
+	{
+		IDBGd(0, "error\n");
+
+		/* If status hasn't been set yet, Gather FFDC, & set status */
+		if(!xfr->status)
+		{
+			xfr->status = iic_boe_get_error(eng, stat, &xfr->ffdc);
+//			iic_fill_xfr_ffdc(xfr, &xfr->ffdc);
+//			iic_ffdc_loc(&xfr->ffdc);
+		}
+
+		/* clears error conditions and causes a stop 
+		 * command to be issued, which causes
+		 * an interrupt when it completes.
+		 * Also initiates cleanup of DMA transfer if
+		 * one is submitted.
+		 */
+		iic_abort_xfr(xfr); 
+
+		set_bit(IIC_XFR_ENG_COMPLETED, &xfr->flags);
+		/* call xfr complete immediately if non-dma or completed
+		 * dma xfr
+		 */
+		iic_xfr_complete(xfr); // q ffdc
+		goto exit;
+	}
+
+	/* Check for cmd complete */
+	if(stat & IIC_BOE_S_CMD_COMP)
+	{
+		unsigned long cmd = 0;
+		unsigned long next_xfr;
+		unsigned long enable_ints = 0;
+
+		IDBGd(0, "cmd complete\n");
+
+		/* Special read handling in the offset phase for PLL/CRC chips*/
+		if(test_bit(IIC_XFR_SPECIAL_PHASE, &xfr->flags))
+		{
+			/* exit the special phase and enter the offset phase */
+			clear_bit(IIC_XFR_SPECIAL_PHASE, &xfr->flags);
+
+			/* Start a "write with no stop" command which will
+			 * result in a data request interrupt.
+			 */
+			cmd = opts->dev_width;
+			IFLDd(1, "cmd[%08lx]\n", cmd);
+			rc = iic_writew(eng, IIC_BOE_CMD, cmd, &xfr->ffdc);
+			if(rc)
+				goto xfr_err;
+
+			/* unmask interrupts and exit handler*/
+			rc = iic_writew(eng, IIC_BOE_INT_MASK,
+					IIC_BOE_ANY_ERR | IIC_BOE_CMD_COMP |
+					IIC_BOE_DAT_REQ, &xfr->ffdc);
+			if(rc)
+				goto xfr_err;
+			goto exit;
+		}
+
+		/* Check for xfr completion */
+		if((xfr->bytes_xfrd >= xfr->size) || xfr->status)
+		{
+			/* If this was a retry, the retry completed. 
+			 * clear flag so that
+			 * iic_xfr_complete can do its work.
+			 */
+			clear_bit(IIC_XFR_RETRY_IN_PROGRESS, &xfr->flags);
+
+			set_bit(IIC_XFR_ENG_COMPLETED, &xfr->flags);
+			iic_xfr_complete(xfr); // q ffdc
+			goto exit;
+		}
+
+		/* If there are bytes left to transfer and the last
+		 * transfer sucessfully ended (with a stop), then
+		 * this must be a split transfer, unless we are still
+		 * in offset phase, in which case self_busy is inaccurate
+		 */
+		if(!(stat & IIC_BOE_SELF_BUSY) &&
+		   !test_bit(IIC_XFR_OFFSET_PHASE, &xfr->flags))
+		{
+			if(opts->rdelay)
+			{
+				iic_delay_xfr(xfr, opts->rdelay);
+			}
+			else
+			{
+				/* bus access errors are only possible 
+				 * failure 
+				 */
+				rc = iic_boe_start(xfr);
+				if(rc)
+					goto xfr_err;
+			}
+			goto exit;
+		}
+
+		/* Otherwise, we just need to issue a command to continue
+		 * the current read or write transfer.
+		 */
+		next_xfr = xfr->size - xfr->bytes_xfrd;
+
+		/* Calculate bytes left in this 'page' if xfr splits are
+		 * enabled
+		 */
+		if(opts->rsplit)
+		{
+			unsigned long pg_offset = (xfr->bytes_xfrd + 
+					           opts->offset) & opts->rsplit;
+			unsigned long page_bytes = opts->rsplit + 1;
+			if(pg_offset)
+			{
+				page_bytes -= pg_offset;
+			}
+			if(page_bytes < next_xfr)
+			{
+				next_xfr = page_bytes;
+			}
+		}
+		/* If the transfer is longer than supported by a single
+		 * command (64k), set the 'read continue' bit so that
+		 * the last byte in the command will get acked.  Also,
+		 * don't issue a stop.
+		 */
+		if(next_xfr & ~IIC_BOE_XFR_LEN)
+		{
+			next_xfr = IIC_BOE_XFR_LEN;
+			cmd |= IIC_BOE_RD_CONT;
+		}
+		/* otherwise, issue a stop after the command completes */
+		else
+		{
+			if (!test_bit(IIC_REPEATED_START, &opts->flags))
+			{
+			  cmd |= IIC_BOE_WITH_STOP;
+			}
+			else // Issue NO STOP
+			{
+			  cmd |= IIC_BOE_RD_CONT;
+			}
+		}
+		cmd |= next_xfr;
+
+		/* set the read/!write bit */
+		if(test_bit(IIC_XFR_RD, &xfr->flags))
+		{
+			cmd |= IIC_BOE_READ;
+		}
+
+		/* special handling if the previous command was for
+		 * setting a device offset pointer
+		 */
+		if(test_bit(IIC_XFR_OFFSET_PHASE, &xfr->flags))
+		{
+			if(opts->dev_width && opts->inc_addr)
+			{
+				cur_dev_addr = IIC_BOE_CALC_BUS_ADDR(opts, xfr);
+			}	
+
+			clear_bit(IIC_XFR_OFFSET_PHASE, &xfr->flags);
+			if(test_bit(IIC_XFR_RD, &xfr->flags) &&
+			   !(opts->flags & IIC_SPECIAL_RD))
+			{
+				cmd |= IIC_BOE_WITH_START;
+				cmd |= IIC_BOE_WITH_ADDR;
+				cmd |= IIC_BOE_MK_ADDR(cur_dev_addr);
+			}
+		}
+
+		/* Issue cmd to iic engine prior to submitting dma */
+		IFLDd(1, "cmd[%08lx]\n", cmd);
+		rc = iic_writew(eng, IIC_BOE_CMD, cmd, &xfr->ffdc);
+		if(rc)
+			goto xfr_err;
+
+		enable_ints =  IIC_BOE_DAT_REQ;
+		enable_ints |= IIC_BOE_CMD_COMP | IIC_BOE_ANY_ERR;
+
+
+		/* unmask interrupts */
+		IDBGd(1, "unmask ints[%08lx]\n", enable_ints);
+		rc = iic_writew(eng, IIC_BOE_INT_MASK, enable_ints, &xfr->ffdc);
+		if(rc)
+			goto xfr_err;
+
+		goto exit;
+	}
+
+	/* Check for data request, (this bit is masked for DMA transfers) */
+	if(stat & IIC_BOE_S_DAT_REQ)
+	{
+		unsigned long fifo_cnt = stat & IIC_BOE_FIFO_COUNT;
+
+		IDBGl(0, "data request\n");
+
+		/* Data request during the offset phase means we need to
+		 * write the fifo with the offset address.
+		 */
+		if(test_bit(IIC_XFR_OFFSET_PHASE, &xfr->flags))
+		{
+			unsigned long cur_offset = opts->offset + 
+				                   xfr->bytes_xfrd;
+			IDBGl(1, "offset: %d\n", cur_offset);
+			fifo_cnt += opts->dev_width;
+
+			if(opts->dev_width == sizeof(long))
+			{
+				rc = iic_writew(eng, IIC_BOE_FIFO,
+						cur_offset, &xfr->ffdc);
+			}
+			else if(opts->dev_width == sizeof(short))
+			{
+				rc = iic_writeh(eng, IIC_BOE_FIFO,
+						cur_offset, &xfr->ffdc);
+			}
+			else
+			{
+				int i;
+				for(i = 0; !rc && (i < opts->dev_width); i++)
+				{
+					rc = iic_writeb(eng, IIC_BOE_FIFO,
+							cur_offset, &xfr->ffdc);
+				}
+			}
+			if(rc)
+				goto xfr_err;
+
+			/* also write data to fifo if this is a write */
+			if (test_bit(IIC_XFR_RD, &xfr->flags))
+				goto enable_interrupts;
+			else
+				clear_bit(IIC_XFR_OFFSET_PHASE, &xfr->flags);
+		}
+		else if(test_bit(IIC_XFR_RD, &xfr->flags)) /*read from fifo */
+		{
+			rc = iic_boe_fifo_to_usr(eng, xfr, fifo_cnt);
+			if(rc)
+				goto xfr_err;
+			goto enable_interrupts;
+		}
+
+		/* write to fifo */
+		fifo_left = eng->fifo_size - fifo_cnt;
+
+		/* 1st, determine how many bytes to write to the fifo,
+		 * which is a minimum of the space left in the fifo
+		 * and a maximum of the bytes left in the command.
+		 */
+		rc = iic_readw(eng, IIC_BOE_RESID_LEN, &cmd_left, &xfr->ffdc);
+		if(rc)
+			goto xfr_err;
+		cmd_left = IIC_BOE_GET_BE(cmd_left);
+
+		if(cmd_left < fifo_left)
+			fifo_left = cmd_left;
+		rc = iic_boe_usr_to_fifo(eng, xfr, fifo_left);
+		if(rc)
+			goto xfr_err;
+
+enable_interrupts:
+		/* enable interrupts */
+		rc = iic_writew(eng, IIC_BOE_INT_MASK, IIC_BOE_ANY_ERR |
+						       IIC_BOE_CMD_COMP |
+						       IIC_BOE_DAT_REQ, &xfr->ffdc);
+		if(rc)
+			goto xfr_err;
+	}
+	goto exit;
+xfr_err:
+	IFLDe(2, "xfr[%p] rc=%d\n", xfr, rc);
+	xfr->status = rc;
+	set_bit(IIC_XFR_ENG_COMPLETED, &xfr->flags);
+
+	iic_xfr_complete(xfr);
+
+exit:
+	IEXIT(IRQ_HANDLED);
+	return IRQ_HANDLED;
+}
+
+/* Initialize the engine.  This should only be called after the engine has
+ * been reset */
+#define IIC_BOE_LO_LVL 4
+#define IIC_BOE_HI_LVL 4
+#define IIC_BOE_DFLT_SPEED 100000
+#define IIC_BOE_CFAM_FIFO_SZ 8
+int iic_boe_eng_init(iic_eng_t* eng, iic_ffdc_t** ffdc)
+{
+	int rc = 0;
+	unsigned long clk_div = 0;
+	unsigned long water_mark = 0;
+	unsigned long mode;
+
+	IENTER();	
+	/* Set up the clock divider, set port to 0, disable enhanced,
+	 * diagnostic, pacing allow, and wrap modes 
+	 * Set to default speed of 400khz.
+	 */
+	clk_div = IIC_BOE_HZ2DIV(eng->bus_speed, IIC_BOE_DFLT_SPEED);
+	if(!clk_div)
+	{
+		IFLDi(2, "eng[%08x], max speed = %ld\n", 
+				eng->id, eng->bus_speed / 5);
+	}
+	if(clk_div & ~IIC_BOE_MAX_CLKDIV)
+		clk_div = IIC_BOE_MAX_CLKDIV;
+	IFLDd(3, "eng[%08x] speed[%ld] divisor[%ld]\n", eng->id,
+			IIC_BOE_DIV2HZ(eng->bus_speed, clk_div), clk_div);
+
+	if(test_bit(IIC_ENG_Z7PLUS, &eng->flags) ||
+	   test_bit(IIC_ENG_P8_Z8_CENTAUR, &eng->flags))
+	{
+		IFLDi(0, "iic_boe_eng_init: P8/Z7PLUS mode\n");
+		mode = IIC_BOE_Z7_MK_CLKDIV(clk_div);
+	}
+	else
+	{
+		IFLDi(0, "iic_boe_eng_init: Normal mode\n");
+		mode = IIC_BOE_MK_CLKDIV(clk_div);
+	}
+
+	/* Set up the Water Mark register according to the fifo size */
+	rc = iic_readw(eng, IIC_BOE_ESTAT, &eng->fifo_size, ffdc);
+	if(rc)
+		goto exit;
+	eng->fifo_size = eng->fifo_size >> IIC_BOE_FIFO_SZ_SHIFT;
+
+	/* workaround for bad fifo size reported on CFAM dd1.0 */
+	if(eng->fifo_size == 16)
+		eng->fifo_size = IIC_BOE_CFAM_FIFO_SZ;
+
+	water_mark = IIC_BOE_MK_WATER_MRK(eng->fifo_size - IIC_BOE_HI_LVL,
+			IIC_BOE_LO_LVL);
+
+	/* handle differences between IOU and CFAM engines */
+	if(eng->fifo_size == IIC_BOE_CFAM_FIFO_SZ)
+	{
+		/* workaround for watermark mismatch between IOU and CFAM
+		 * register layout
+		 */
+		water_mark = water_mark << 4;
+
+		/* workaround for enhanced mode bit having opposite
+		 * meaning in CFAM engines. (bug 37245)
+		 */
+		mode |= IIC_BOE_ENHANCED;
+	}
+
+	rc = iic_writew(eng, IIC_BOE_MODE, mode, ffdc);
+	if(rc)
+		goto exit;
+
+	rc = iic_writew(eng, IIC_BOE_WATER_MARK, water_mark, ffdc);
+
+	/* all interrupts are masked coming out of a reset (which is what
+	 * we want)
+	 */
+exit:
+	IEXIT(rc);
+	return rc;
+}
+
+
+/* if dma_rc is -ECONNRESET then we notified DMA of an error.
+ * if dma_rc is -EIO then DMA discovered an error.
+ *
+ * It's assumed that this function will ALWAYS get called before
+ * the IIC_BOE_CMD_COMP interrupt.  If an IIC error occurs in the
+ * middle of a transfer, the IIC interrupt handler will disable interrupts,
+ * collect ffdc, set xfr status, and then call dma_notify.  Error recovery
+ * is started from here.
+ *
+ * In the good path case, this function is called prior to the
+ * IIC_BOE_CMD_COMP bit getting set.  In this case this function
+ * does nothing but set the IIC_XFR_DMA_COMPLETED bit.  iic_xfr_complete
+ * is still called from the IIC interrupt handler when the IIC_BOE_CMD_COMP
+ * bit gets set.
+ *
+ * Handles the following FFDC cases:
+ *
+ * 1) DMA ffdc, no IIC ffdc
+ * 	Create IIC ffdc element, add to existing ffdc chain
+ * 2) IIC ffdc, no DMA ffdc
+ * 	do nothing
+ * 3) both DMA and IIC ffdc
+ * 	combine both chains
+ */
+void iic_boe_dma_callback(int dma_rc, void* ffdc, void* data)
+{
+	iic_xfr_t* xfr = (iic_xfr_t*)data;
+
+	IENTER();
+	set_bit(IIC_XFR_DMA_COMPLETED, &xfr->flags);
+
+	/* Check for DMA/IIC failure */
+	if(dma_rc < 0 || dma_rc != xfr->size) 
+	{
+		IFLDe(2, "dma_callback xfr[%p] dma_rc = %d\n", xfr, dma_rc);
+		if(!xfr->status)
+		{
+			xfr->status = -EIO;
+		}
+
+		iic_abort_xfr(xfr);
+	}
+	/* don't complete the xfr until both DMA and IIC operations have
+	 * stopped, otherwise, xfr structure could still be in use.
+	 */
+	if(test_bit(IIC_XFR_ENG_COMPLETED, &xfr->flags))
+	{
+		/* If this was a retry, the retry completed.  
+		 * clear flag so that
+		 * iic_xfr_complete can do its work.
+		 */
+		clear_bit(IIC_XFR_RETRY_IN_PROGRESS, &xfr->flags);
+
+		iic_xfr_complete(xfr);
+	}
+
+	IEXIT(0);
+	return;
+}
+
+/* Start a transfer from the beginning or from where it left off.
+ *
+ * xfr->bytes_xfrd is updated with each interrupt.
+ *
+ */
+int iic_boe_start(iic_xfr_t* xfr)
+{
+	int rc = -ENODEV;
+	iic_eng_t* eng = 0;
+	iic_xfr_opts_t* opts;
+	unsigned long cur_dev_addr;
+	unsigned long cmd = 0;
+	unsigned long enable_ints = 0;
+	unsigned long next_xfr = 0;
+	unsigned long mode;
+	unsigned long new_port = xfr->client->bus->port;
+	unsigned long new_clkdiv = 0;
+	unsigned long port = 0;
+	unsigned long clkdiv_hi = 0;
+	unsigned long clkdiv_lo = 0;
+	unsigned long port_mask = 0;
+	unsigned long port_encode = 0;
+	unsigned long clkdiv_encode = 0;
+	unsigned long clkdiv = 0;
+
+	IENTER();
+	opts = &xfr->opts.xfr_opts;
+	eng = xfr->client->bus->eng;
+	cur_dev_addr = opts->dev_addr;
+	new_clkdiv = IIC_BOE_HZ2DIV(eng->bus_speed, xfr->client->bus->i2c_hz);
+	if(new_clkdiv & ~IIC_BOE_MAX_CLKDIV)
+		new_clkdiv = IIC_BOE_MAX_CLKDIV;
+
+	/* update the target address if requested by user */
+	if(opts->dev_width && opts->inc_addr)
+	{
+		cur_dev_addr = IIC_BOE_CALC_BUS_ADDR(opts, xfr);
+	}
+
+	/* adjust the clock divider and set the port if necessary */
+	rc = iic_readw(eng, IIC_BOE_MODE, &mode, &xfr->ffdc);
+	if(rc)
+		goto error1;
+
+	if(test_bit(IIC_ENG_Z7PLUS, &eng->flags) ||
+	   test_bit(IIC_ENG_P8_Z8_CENTAUR, &eng->flags))
+	{
+		IFLDi(0, "iic_boe_start: P8/Z7PLUS mode\n");
+		port = IIC_BOE_Z7_GET_PORT(mode);
+		clkdiv = IIC_BOE_Z7_GET_CLKDIV(mode);
+		clkdiv_hi = IIC_BOE_Z7_CLKDIV;
+		clkdiv_lo = 0;
+		port_mask = IIC_BOE_Z7_PORT;
+		port_encode = IIC_BOE_Z7_MK_PORT(new_port);
+		clkdiv_encode = IIC_BOE_Z7_MK_CLKDIV(new_clkdiv);
+	}
+	else
+	{
+		IFLDi(0, "iic_boe_start: Normal mode\n");
+		port = IIC_BOE_GET_PORT(mode);
+		clkdiv = IIC_BOE_GET_CLKDIV(mode);
+		clkdiv_hi = IIC_BOE_CLKDIV_HI;
+		clkdiv_lo = IIC_BOE_CLKDIV_LO;
+		port_mask = IIC_BOE_PORT;
+		port_encode = IIC_BOE_MK_PORT(new_port);
+		clkdiv_encode = IIC_BOE_MK_CLKDIV(new_clkdiv);
+	}
+
+	if((port != new_port) || (clkdiv != new_clkdiv))
+	{
+		/* clear out old clkdiv and port values */
+		mode &= ~(port_mask | clkdiv_hi | clkdiv_lo);
+
+		IDBGd(2, "new_port = %08lx, new_clkdiv = %08lx\n", new_port,
+								new_clkdiv);
+		/* set new values */
+		mode |= port_encode | clkdiv_encode;
+		rc = iic_writew(eng, IIC_BOE_MODE, mode, &xfr->ffdc);
+		if(rc)
+			goto error1;
+
+		/* reset the engine whenever the port is changed */
+		rc = iic_writew(eng, IIC_BOE_RESET_ERR, 0, &xfr->ffdc);
+		if(rc)
+			goto error1;
+	}
+
+	/* regardless of read or write, if offset is required, always
+	 * start the xfr with a write of 1-4 bytes.  Read transfers require
+	 * a repeated start.
+	 */
+	if(opts->dev_width)
+	{
+		/* This tells the interrupt handler that the last
+		 * command was for setting the device offset
+		 * (don't count the bytes as part of the actual
+		 * transfer and reads require special handling)
+		 */
+		IDBGd(0, "offset phase\n");
+		set_bit(IIC_XFR_OFFSET_PHASE, &xfr->flags);
+
+		/* writes must combine the dev_width xfr with real xfr */
+		if (test_bit(IIC_XFR_RD, &xfr->flags)) {
+			/* do a write command with no stop */
+			cmd |= IIC_BOE_WITH_START | IIC_BOE_WITH_ADDR |
+			       IIC_BOE_MK_ADDR(cur_dev_addr) |
+			       opts->dev_width;
+			if(test_bit(IIC_REPEATED_START, &opts->flags))
+			{
+				// Repeated start sent by the ioctl
+				cmd |= IIC_BOE_RD_CONT;
+			}
+
+			/* PLL/CRC chip workaround */
+			if (opts->flags & IIC_SPECIAL_RD)
+			{
+				set_bit(IIC_XFR_SPECIAL_PHASE, &xfr->flags);
+				cmd |= IIC_BOE_READ;
+				cmd &= ~IIC_BOE_XFR_LEN;
+			}
+
+			IFLDd(1, "cmd[%08lx]\n", cmd);
+			rc = iic_writew(eng, IIC_BOE_CMD, cmd, &xfr->ffdc);
+			if(rc)
+				goto error1;
+
+			/* Enable interrupts */
+			enable_ints |= IIC_BOE_CMD_COMP | IIC_BOE_ANY_ERR |
+				       IIC_BOE_DAT_REQ;
+			IDBGd(1, "enable ints[%08lx]\n", enable_ints);
+			rc = iic_writew(eng, IIC_BOE_INT_MASK, enable_ints,
+					&xfr->ffdc);
+			if(rc)
+				goto error1;
+
+			goto exit;
+		}
+
+	}
+
+	/* otherwise, do a normal transfer */
+	cmd |= IIC_BOE_WITH_START | IIC_BOE_WITH_ADDR |
+	       IIC_BOE_MK_ADDR(cur_dev_addr);
+	if(test_bit(IIC_XFR_RD, &xfr->flags))
+	{
+		cmd |= IIC_BOE_READ;
+	}
+	if(test_bit(IIC_REPEATED_START, &opts->flags))
+	{
+		// Repeated start sent by the ioctl
+		cmd |= IIC_BOE_RD_CONT;
+	}
+	next_xfr = xfr->size - xfr->bytes_xfrd;
+
+	/* Calculate bytes left in this 'page' if xfr splits are
+	 * enabled
+	 */
+	if(opts->rsplit)
+	{
+		unsigned long pg_offset = (xfr->bytes_xfrd +
+				           opts->offset) & opts->rsplit;
+		unsigned long page_bytes = opts->rsplit + 1;
+		if(pg_offset)
+		{
+			page_bytes -= pg_offset;
+		}
+		if(page_bytes < next_xfr)
+		{
+			next_xfr = page_bytes;
+		}
+	}
+
+	next_xfr += opts->dev_width;
+
+	if(next_xfr & ~IIC_BOE_XFR_LEN)
+	{
+		next_xfr = IIC_BOE_XFR_LEN;
+		cmd |= IIC_BOE_RD_CONT;
+	}
+	else
+	{
+		if (!test_bit(IIC_REPEATED_START, &opts->flags))
+		{
+		  cmd |= IIC_BOE_WITH_STOP;
+		}
+	}
+	cmd |= next_xfr;
+
+	/* Start the command prior to submitting dma */
+	IFLDd(1, "cmd[%08lx]\n", cmd);
+	rc = iic_writew(eng, IIC_BOE_CMD, cmd, &xfr->ffdc);
+	if(rc)
+		goto error1;
+
+	enable_ints =  IIC_BOE_DAT_REQ;
+	enable_ints |= IIC_BOE_CMD_COMP | IIC_BOE_ANY_ERR;
+
+	/* unmask interrupts */
+	IDBGd(1, "enable ints[%08lx]\n", enable_ints);
+	rc = iic_writew(eng, IIC_BOE_INT_MASK, enable_ints, &xfr->ffdc);
+	if(rc)
+		goto error1;
+
+	goto exit;
+error1:
+	xfr->status = rc;
+
+exit:
+	IEXIT(rc);
+	return rc;
+}
+
+/* This function starts the process of aborting a xfr.  It must be
+ * interrupt safe in case it gets called from a timer interrupt for a
+ * timeout.
+ */
+int iic_boe_start_abort(iic_eng_t* eng, iic_ffdc_t** ffdc)
+{
+	int rc;
+	unsigned long stat;
+	unsigned long cmd = IIC_BOE_WITH_STOP;
+	unsigned long additional_check = 0;
+
+	IENTER();
+
+	/* mask interrupts so that we don't get spurious interrupts.
+	 * If we don't mask interrupts, the following 'reset errors'
+	 * command can cause a 'CMD_COMPLETE' interrupt to be raised
+	 * but then we issue the abort command which clears the 
+	 * CMD_COMPLETE interrupt bit before it can be
+	 * handled.*/
+	rc = iic_writew(eng, IIC_BOE_INT_MASK, 0, ffdc);
+	if(rc)
+		goto exit;
+
+	rc = iic_readw(eng, IIC_BOE_STAT, &stat, ffdc);
+	if(rc)
+		goto exit;
+
+	IFLDi(1, "pre-abort status[%08lx]\n", stat);
+
+        if(test_bit(IIC_ENG_P8_Z8_CENTAUR, &eng->flags)) {
+		additional_check = IIC_BOE_S_LOST_ARB;
+
+		if (eng->cur_xfr && eng->cur_xfr->client && eng->cur_xfr->client->bus)
+			rc = iic_boe_reset_bus(eng->cur_xfr->client->bus, ffdc);
+		else
+			rc = iic_boe_reset_eng(eng, ffdc);
+
+		if(rc)
+			goto exit;
+
+		/* In order to find the potential defect in new IIC engiene,
+		 * track stat for sure. */
+		{
+			unsigned long stat_tmp;
+			rc = iic_readw(eng, IIC_BOE_STAT, &stat_tmp, ffdc);
+			if(rc)
+				goto exit;
+			IFLDi(1, "after reset (P8,Z8,Centaur) status[%08lx]\n",
+			      stat_tmp);
+		}
+	} else {
+		if (eng->cur_xfr && eng->cur_xfr->client && eng->cur_xfr->client->bus &&
+			((eng->cur_xfr->retry_count % 4) == 0) &&
+			((eng->cur_xfr->status != -ENODATA) ||
+			 (eng->cur_xfr->retry_count > 0))) {
+				rc = iic_boe_reset_bus(eng->cur_xfr->client->bus, ffdc);
+		} else {
+			cmd |= IIC_BOE_FORCE_LAUNCH;
+
+			/* reset the engine (forces CMD_COMPLETE condition) */
+			rc = iic_boe_reset_eng(eng, ffdc);
+		}
+		if(rc)
+			goto exit;
+	}
+
+	/* don't bother issuing a stop command if we're recovering from
+	 * a stop error, a parity error or arbitration lost.  Otherwise,
+	 * we can end up in a loop.
+	 */
+	if(stat & (IIC_BOE_S_STOP_ERR | IIC_BOE_S_PARITY | additional_check))
+	{
+		IFLDi(1, "don't bother issuing a stop\n");
+		rc = -EIO;
+		goto exit;
+	}
+
+	/* issue a stop only command (clears CMD_COMPLETE condtion)*/
+	IFLDd(1, "cmd[%08x]\n", cmd);
+	rc = iic_writew(eng, IIC_BOE_CMD, cmd, ffdc);
+	if(rc)
+		goto exit;
+	
+	/* unmask interrupts while stop command runs */
+	IDBGd(1, "enable ints[%08x]\n", IIC_BOE_CMD_COMP | IIC_BOE_ANY_ERR);
+	rc = iic_writew(eng, IIC_BOE_INT_MASK, IIC_BOE_CMD_COMP |
+					       IIC_BOE_ANY_ERR, ffdc);
+exit:
+	IEXIT(rc);
+	return rc;
+}
+
+/* returns true if no transfer is pending on the specified engine.
+ */
+int iic_boe_xfr_not_pending(iic_eng_t* eng, iic_ffdc_t** ffdc)
+{
+	int rc;
+	unsigned long stat;
+	IENTER();
+	/* Note: if engine access fails, this function will indicate
+	 * that no transfer is pending and wake up the waiter.
+	 */
+	rc  = iic_readw(eng, IIC_BOE_STAT, &stat, ffdc);
+	if(!rc)
+		rc = stat & IIC_BOE_S_CMD_COMP;
+	IDBGd(1, "status[%08lx]\n", stat);
+	IEXIT(rc);
+	return rc;
+}
+
+/* This function is not interrupt safe, it may require long delays!
+ *
+ * When we enter this function the engine is in a locked state and xfr_complete
+ * has already been called on the current xfr object.  Any state information
+ * we need must be obtained from the engine object or the engine registers.
+ * If the transfer was a write operation, the halt command has been issued.
+ * Nothing has been done yet for read operations.  Any master 
+ * interrupts that occur after xfr_complete was called will not get handled
+ * except to clear the interrupt bit (i.e., status bits will not get cleared).
+ */
+#define IIC_BOE_ABORT_TIMEOUT ( msecs_to_jiffies(200) ) /* 200ms */
+int iic_boe_finish_abort(iic_eng_t* eng, iic_ffdc_t** ffdc)
+{
+	int rc = 0;
+	int rc2 = 0;
+
+	IENTER();
+	rc = wait_event_interruptible_timeout(eng->waitq,
+			(rc2 = iic_boe_xfr_not_pending(eng, ffdc)),
+			IIC_BOE_ABORT_TIMEOUT);
+	if(rc2 < 0)
+	{
+		rc = rc2;
+		goto exit;
+	}
+
+	if(rc <= 0)
+	{
+		if(!rc)
+		{
+			IFLDi(0, "abort timed out\n");
+		}
+		else
+			IFLDi(0, "abort interrupted?\n");
+
+		/* We were unable to abort an operation.  Try
+		 * Resetting the engine as a last attempt to leave
+		 * the engine in a good state.
+		 */
+		IFLDi(1, "Resetting eng[%08x]\n", eng->id);
+		rc = iic_boe_reset_eng(eng, ffdc);
+	}
+exit:
+	/* wake up threads waiting for engine to be available */
+	wake_up_interruptible(&eng->waitq);
+	IEXIT(rc);
+	return rc;
+	
+}
+
+/* This function rescue the timeout event when the xfr is not really timeout
+ * Return "0" when this event is not really timeout event
+ * Return negative value when this event is really timeout event, or it
+ * is DMA transfer.
+ */
+int iic_boe_rescue_timeout(iic_eng_t *eng, iic_xfr_t* xfr)
+{
+	int retval = -1;
+	unsigned long stat;
+	unsigned long fifo_cnt;
+	int rc;
+
+	IENTER();
+
+	rc = iic_readw(eng, IIC_BOE_WATER_MARK, &stat, 0);
+	if(rc)
+		goto exit;
+	IDBGl(2, "eng[%08x]: Water mark status[%08lx]\n", eng->id, stat);
+
+	rc = iic_readw(eng, IIC_BOE_STAT, &stat, 0);
+	if(rc)
+		goto exit;
+	IFLDi(2, "eng[%08x]: status[%08lx]\n", eng->id, stat);
+
+	if(stat & IIC_BOE_S_ANY_ERR) {
+		IFLDd(0, "IIC_BOE_S_ANY_ERR\n");
+		goto exit;
+	}
+
+
+	if((fifo_cnt = stat & IIC_BOE_FIFO_COUNT) > 0) {
+		IFLDi(1, "fifo_cnt[%d]\n", fifo_cnt);
+
+		if(test_bit(IIC_XFR_RD, &xfr->flags))
+		{	/* read operation */
+			unsigned long to_user = fifo_cnt;
+			if (xfr->size < to_user)
+				to_user = xfr->size;
+			rc = iic_boe_fifo_to_usr(eng, xfr, to_user);
+			if(rc)
+				goto exit;
+			retval = xfr->bytes_xfrd;
+		} else { /* write operation */
+			retval = xfr->bytes_xfrd;
+		}
+	}
+
+exit:
+	IEXIT(retval);
+	return retval;
+}
+
+/* Wait for pending transfers and abort operations to complete on
+ * the engine.
+ * 
+ * NOTE: timeout must be in jiffies
+ */
+int iic_boe_wait_for_idle(iic_eng_t* eng, int timeout, iic_ffdc_t** ffdc)
+{
+	int rc;
+	int rc2 = 0;
+	IENTER();
+	rc = wait_event_interruptible_timeout(eng->waitq,
+			((rc2 = iic_boe_xfr_not_pending(eng, ffdc)) &&
+			 (!test_bit(IIC_ENG_ABORT, &eng->flags) || (rc2 < 0)) &&
+			 !eng->cur_xfr),
+			timeout);
+	if(rc2 < 0)
+	{
+		rc = rc2;
+		goto exit;
+	}
+	if(!rc)
+	{
+		rc = -ETIME;
+	}
+	else if(rc < 0)
+	{
+		rc = -EINTR;
+	}
+	else if(rc > 0)
+	{
+		rc = 0;
+	}
+exit:
+	IEXIT(rc);
+	return rc;
+}
+
+/* This function is only called when SCL is still alive.
+ * it is a low level bus reset mechanism */
+int iic_boe_ll_bus_reset(iic_eng_t* eng, iic_ffdc_t** ffdc)
+{
+	int i, rc = 0;
+	iic_bus_t* bus = eng->cur_bus;
+	unsigned long stat = 0, mode = 0;
+
+	if (!bus) {
+		rc = -EINVAL;
+		goto exit;
+	}
+
+	/* Enter diagnostic mode to enable the manual control of SDL & SCL */
+	rc = iic_readw(eng, IIC_BOE_MODE, &mode, ffdc);
+	if(rc)
+		goto exit;
+
+	mode |= IIC_BOE_DIAG;
+	rc = iic_writew(eng, IIC_BOE_MODE, mode, ffdc);
+	if(rc)
+		goto exit;
+ 	IFLDi(1, "iic_boe_ll_bus_reset: current mode[%08lx]\n", mode);
+
+	/* Send 9 clock cycle */
+	for (i = 0; i < 9; i++) {
+		/* SCL = 0 */
+		rc = iic_writew(eng, IIC_BOE_RESET_SCL, 0, ffdc);
+		if(rc)
+			goto exit;
+		/* SCL = 1 */
+		rc = iic_writew(eng, IIC_BOE_SET_SCL, 0, ffdc);
+		if(rc)
+			goto exit;
+	}
+	/* Send stop */
+	/* SCL = 0 */
+	rc = iic_writew(eng, IIC_BOE_RESET_SCL, 0, ffdc);
+	if(rc)
+		goto exit;
+	/* SDL = 0 */
+	rc = iic_writew(eng, IIC_BOE_RESET_SDA, 0, ffdc);
+	if(rc)
+		goto exit;
+	/* SCL = 1 */
+	rc = iic_writew(eng, IIC_BOE_SET_SCL, 0, ffdc);
+	if(rc)
+		goto exit;
+	/* SDL = 1 */
+	rc = iic_writew(eng, IIC_BOE_SET_SDA, 0, ffdc);
+	if(rc)
+		goto exit;
+
+	/* disable diagnostic mode */
+	mode &= ~IIC_BOE_DIAG;
+	rc = iic_writew(eng, IIC_BOE_MODE, mode, ffdc);
+	if(rc)
+		goto exit;
+
+	if((rc = iic_readw(eng, IIC_BOE_STAT, &stat, ffdc)))
+		goto exit;
+
+	IFLDi(1, "iic_boe_ll_bus_reset: current stat[%08lx]\n", stat);
+exit:
+	return rc;
+}
+
+/* Reset the engine and restore to a known state.  Also attempts to free
+ * the bus if requested.
+ */
+#define IIC_BOE_BOTH_HI (IIC_BOE_SCL_IN | IIC_BOE_SDA_IN)
+int iic_boe_reset(iic_eng_t* eng, int type, iic_ffdc_t** ffdc)
+{
+	int rc = 0;
+	int i;
+	unsigned long stat;
+	int sample_count = 10; //0.1ms sample time
+	unsigned long bus_state = 0;
+	unsigned long mode = 0;
+
+	IENTER();
+	/* issue an immediate reset i2c command */
+	IFLDi(0, "iic_boe_reset\n");
+	rc = iic_writew(eng, IIC_BOE_RESET_I2C, 0, ffdc);
+	if(rc)
+		goto exit;
+
+	/* reinit the engine */
+	rc = iic_boe_eng_init(eng, ffdc);
+	if(rc)
+		goto exit;
+
+	/* write the bus port */
+	if (eng->cur_bus) {
+		rc = iic_readw(eng, IIC_BOE_MODE, &mode, ffdc);
+		if(rc)
+			goto exit;
+
+		/* encode the port number */
+		if (test_bit(IIC_ENG_Z7PLUS, &eng->flags) ||
+	    	    test_bit(IIC_ENG_P8_Z8_CENTAUR, &eng->flags)) {
+			mode = (mode & ~IIC_BOE_Z7_PORT) |
+				IIC_BOE_Z7_MK_PORT(eng->cur_bus->port);
+		}
+		else {
+			mode = (mode & ~IIC_BOE_PORT) |
+				IIC_BOE_MK_PORT(eng->cur_bus->port);
+		}
+
+		rc = iic_writew(eng, IIC_BOE_MODE, mode, ffdc);
+		if(rc)
+			goto exit;
+	}
+
+	/* Workaround for HW237041 and SW243504 */
+        if(test_bit(IIC_ENG_P8_Z8_CENTAUR, &eng->flags)) {
+		unsigned long port_busy;
+
+		rc = iic_readw(eng, IIC_BOE_PORTBUSY, &port_busy, ffdc);
+		if(rc)
+			goto exit;
+		/* A start by anyone will assert i2c_busy.
+		 * A start by itself will also asseret i2c_self_busy.
+		 * A stop will deassert i2c_busy.
+		 * A stop by itself will deassert i2c_self_busy.
+		 * if self_busy is not 1 and i2c_busy is 1 then we cannot
+		 * send STOP also.
+		 * that's why we clear the I2C_busy from the PORT_BUSY_REGISTER.
+		 * */
+		rc = iic_writew(eng, IIC_BOE_PORTBUSY, IIC_BOE_PORT_BUSY_REST,
+				ffdc);
+		if (rc)
+			goto exit;
+		IFLDi(1, "clean port busy port_busy[%08lx]\n", port_busy);
+	}
+
+	/* Test for stuck lines */
+	for(i = 0; ((i < sample_count) && (bus_state != IIC_BOE_BOTH_HI)); i++)
+	{
+		if((rc = iic_readw(eng, IIC_BOE_STAT, &stat, ffdc)))
+			goto exit;
+		bus_state |= stat & IIC_BOE_BOTH_HI;
+		udelay(100);
+	}
+
+	/* if both lines went high at least once during the sample time
+	 * then the bus isn't stuck but we still can do bus reset.
+	 * The reason is:
+	 * In some case/iic mult-master case, the iic transfer is
+	 * interrupted in mid of some operation, it will cause the
+	 * iic salve in bad state machine/state. For example, the
+	 * iic slave will keep SDA HIGH(wait ACK) or will keep SDA LOW
+	 * (stuck BUS). So in order to recover iic slave back to normal,
+	 * it is also make sense to send "STOP" on this bus.
+	 */
+	if( bus_state != IIC_BOE_BOTH_HI)
+	{
+		IFLDi(1, "bus stuck, state[%08lx]\n", bus_state);
+	}
+
+	/* issue a stop command to reset the bus if requested and the
+	 * clock line was sampled to be high.
+	 */
+	if(type == IIC_BOE_BUS_RESET)
+	{
+		if(!(bus_state & IIC_BOE_SCL_IN) &&
+			(!eng->cur_xfr || eng->cur_xfr->retry_count))
+		{
+			IFLDi(0, "Clock stuck low.  recovery not possible.\n");
+			goto exit;
+		}
+
+		IFLDi(0, "attempting bus reset\n");
+		rc = iic_boe_ll_bus_reset(eng, ffdc);
+		if(rc)
+			goto exit;
+
+		/* reset errors after low level bus reset */
+		rc = iic_writew(eng, IIC_BOE_RESET_ERR, 0, ffdc);
+		if (rc)
+			goto exit;
+
+		/* allow 1ms for the cmd to complete */
+		udelay(1000);
+
+		rc = iic_readw(eng, IIC_BOE_STAT, &stat, ffdc);
+		if(rc)
+			goto exit;
+		if((stat & IIC_BOE_S_CMD_COMP) && (stat & IIC_BOE_BOTH_HI))
+		{
+			IFLDi(0, "Bus Freed!\n");
+			goto exit;
+		}
+
+		/* if the stop didn't happen after 1ms,
+		 * reset the engine
+		 */
+		IFLDi(0, "Bus still stuck!\n");
+		rc = iic_writew(eng, IIC_BOE_RESET_I2C, 0, ffdc);
+		if(rc)
+			goto exit;
+		udelay(1);
+		rc = iic_boe_eng_init(eng, ffdc);
+	}
+exit:
+	IEXIT(rc);
+	return rc;
+}
+
+int iic_boe_reset_bus(iic_bus_t* bus, iic_ffdc_t** ffdc)
+{
+	int ret;
+	iic_eng_t* eng = bus->eng;
+
+	IENTER();
+	eng->cur_bus = bus;
+	ret = iic_boe_reset(eng, IIC_BOE_BUS_RESET, ffdc);
+	eng->cur_bus = NULL;
+	IEXIT(ret);
+	return ret;
+}
+
+int iic_boe_reset_eng(iic_eng_t* eng, iic_ffdc_t** ffdc)
+{
+	int ret;
+	IENTER();
+	ret = iic_boe_reset(eng, IIC_BOE_ENG_RESET, ffdc);
+	IEXIT(ret);
+	return ret;
+}
+
+/* This should be called when the engine is resumed */
+int iic_boe_run_bat(iic_eng_t* eng, iic_ffdc_t** ffdc)
+{
+	int rc = 0;
+
+	IENTER();	
+	/* check DATA REQUEST bit is set properly after water mark
+	 * register is set
+	 */
+	
+	/* check the 'and' and 'or' register functionality against the
+	 * 'invalid command' bit.
+	 */
+
+	/* force an invalid command and check the invalid command bit */
+	
+	/* Verify that the 'reset err' command clears the invalid command
+	 * bit.
+	 */
+	IEXIT(rc);
+	return rc;
+}
+
+int iic_boe_enable_int(iic_eng_t* eng, iic_ffdc_t** ffdc)
+{
+	int rc = 0;
+	IENTER();
+	/* only enable interrupts when a command is in progress */
+
+	IEXIT(rc);
+	return rc;
+}
+
+int iic_boe_disable_int(iic_eng_t* eng, iic_ffdc_t** ffdc)
+{
+	int rc = 0;
+
+	IENTER();	
+	rc = iic_writew(eng, IIC_BOE_INT_MASK, 0, ffdc);
+	IEXIT(rc);
+	return rc;
+}
+
+#define DDR4_NACK_DEV_ADDR 0x6C
+#define DDR4_NACK_REDO_POL 0x0002DD40
+int iic_boe_check_ddr4_nack(iic_xfr_t *xfr) {
+	int rc = 0;
+
+	if (xfr->opts.xfr_opts.dev_addr == DDR4_NACK_DEV_ADDR &&
+	    xfr->opts.recovery.redo_pol == DDR4_NACK_REDO_POL &&
+	    !test_bit(IIC_XFR_RD, &xfr->flags))
+		rc = 1;
+
+	return rc;
+}
+
+int __init iic_boe_init(void)
+{
+	int rc = 0;
+
+	IENTER();	
+	/* Register the boe functions with the base driver */
+	iic_register_eng_ops(&eng_ops, FSI_ENGID_I2C);
+	iic_register_eng_ops(&eng_ops, FSI_ENGID_I2C_BB);
+
+	printk("IIC BOE engine support loaded. ver. %s\n", iic_boe_version);
+	IEXIT(rc);
+	return rc;
+}
+
+void __exit iic_boe_exit(void)
+{
+	IENTER();
+	iic_unregister_eng_ops(FSI_ENGID_I2C);
+	iic_unregister_eng_ops(FSI_ENGID_I2C_BB);
+	printk("IIC BOE engine support unloaded.\n");
+	IEXIT(0);
+}
+
+module_init(iic_boe_init);
+module_exit(iic_boe_exit);
+
+MODULE_AUTHOR("Eddie James <eajames@us.ibm.com>");
+MODULE_DESCRIPTION("FSP BOE IIC Driver");
+MODULE_LICENSE("GPL");
+
diff --git a/drivers/fsi/i2c/iic-boe.h b/drivers/fsi/i2c/iic-boe.h
new file mode 100644
index 0000000..81b7783
--- /dev/null
+++ b/drivers/fsi/i2c/iic-boe.h
@@ -0,0 +1,180 @@
+/*
+ *   Copyright (c) International Business Machines Corp., 2006
+ *
+ *   This program is free software;  you can redistribute it and/or modify
+ *   it under the terms of the GNU General Public License as published by
+ *   the Free Software Foundation; either version 2 of the License, or
+ *   (at your option) any later version.
+ *
+ *   This program is distributed in the hope that it will be useful,
+ *   but WITHOUT ANY WARRANTY;  without even the implied warranty of
+ *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
+ *   the GNU General Public License for more details.
+ *
+ *   You should have received a copy of the GNU General Public License
+ *   along with this program;  if not, write to the Free Software
+ *   Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+ */
+
+/************************ BOE Engine offsets *********************************/
+#define IIC_BOE_FIFO 		0x00
+#define IIC_BOE_CMD		0x01
+#define IIC_BOE_MODE		0x02
+#define IIC_BOE_WATER_MARK	0x03
+#define IIC_BOE_INT_MASK	0x04
+#define IIC_BOE_INT_COND	0x05
+#define IIC_BOE_OR_INT_MASK	0x05
+#define IIC_BOE_INTS		0x06
+#define IIC_BOE_AND_INT_MASK	0x06
+#define IIC_BOE_STAT		0x07
+#define IIC_BOE_RESET_I2C	0x07
+#define IIC_BOE_ESTAT		0x08
+#define IIC_BOE_RESET_ERR	0x08
+#define IIC_BOE_RESID_LEN	0x09
+#define IIC_BOE_SET_SCL		0x09
+#define IIC_BOE_RESERVED        0x0a
+#define IIC_BOE_PORTBUSY        0x0a
+#define IIC_BOE_RESET_SCL	0x0b
+#define IIC_BOE_SET_SDA		0x0c
+#define IIC_BOE_RESET_SDA	0x0d
+#define IIC_BOE_MAX_OFFSET	IIC_BOE_RESET_SDA
+
+/************************ BOE Bit Definitions ********************************/
+
+#define IIC_BOE_MAX_BUSES	16
+#define IIC_BOE_MAX_FIFO_SIZE	32
+#define IIC_BOE_DFLT_FIFO_SIZE	8
+
+/* cmd register bits */
+#define IIC_BOE_WITH_START	0x80000000
+#define IIC_BOE_WITH_ADDR	0x40000000
+#define IIC_BOE_RD_CONT		0x20000000
+#define IIC_BOE_WITH_STOP	0x10000000
+#define IIC_BOE_FORCE_LAUNCH	0x08000000
+#define IIC_BOE_ADDR		0x00fe0000
+#define IIC_BOE_ADDR_SHIFT	16
+#define IIC_BOE_READ		0x00010000
+#define IIC_BOE_XFR_LEN		0x0000ffff
+
+#define IIC_BOE_MK_ADDR(addr) ((addr << IIC_BOE_ADDR_SHIFT) & IIC_BOE_ADDR)
+#define IIC_BOE_GET_ADDR(r) ((r & IIC_BOE_ADDR) >> IIC_BOE_ADDR_SHIFT)
+
+/* mode register bits */
+#define IIC_BOE_CLKDIV_LO	0xff000000
+#define IIC_BOE_CLKDIV_LO_SHIFT 24
+#define IIC_BOE_PORT		0x00ff0000
+#define IIC_BOE_PORT_SHIFT	16
+#define IIC_BOE_MODE_RSVD	0x0000ff00
+#define IIC_BOE_CLKDIV_HI	0x000000f0
+#define IIC_BOE_CLKDIV_HI_SHIFT 4
+#define IIC_BOE_ENHANCED	0x00000008
+#define IIC_BOE_DIAG		0x00000004
+#define IIC_BOE_PACE_ALLOW	0x00000002
+#define IIC_BOE_WRAP		0x00000001
+
+#define IIC_BOE_GET_PORT(r) ((r & IIC_BOE_PORT) >> IIC_BOE_PORT_SHIFT)
+#define IIC_BOE_MK_PORT(p) ((p << IIC_BOE_PORT_SHIFT) & IIC_BOE_PORT)
+
+#define IIC_BOE_MK_CLKDIV(val) \
+((val << IIC_BOE_CLKDIV_LO_SHIFT) | \
+((val >> IIC_BOE_CLKDIV_HI_SHIFT) & IIC_BOE_CLKDIV_HI))
+
+#define IIC_BOE_GET_CLKDIV(r) \
+(((r & IIC_BOE_CLKDIV_LO) >> IIC_BOE_CLKDIV_LO_SHIFT) | \
+((r & IIC_BOE_CLKDIV_HI) << IIC_BOE_CLKDIV_HI_SHIFT))
+
+/* Z7 plus mode register */
+#define IIC_BOE_Z7_CLKDIV	0xffff0000
+#define IIC_BOE_Z7_CLKDIV_SHIFT	16
+#define IIC_BOE_Z7_PORT		0x0000fc00
+#define IIC_BOE_Z7_PORT_SHIFT	10
+
+#define IIC_BOE_Z7_GET_PORT(r) ((r & IIC_BOE_Z7_PORT) >> IIC_BOE_Z7_PORT_SHIFT)
+#define IIC_BOE_Z7_MK_PORT(p) ((p << IIC_BOE_Z7_PORT_SHIFT) & IIC_BOE_Z7_PORT)
+
+#define IIC_BOE_Z7_MK_CLKDIV(val) ((val << IIC_BOE_Z7_CLKDIV_SHIFT))
+#define IIC_BOE_Z7_GET_CLKDIV(r) ((r & IIC_BOE_Z7_CLKDIV) >> IIC_BOE_Z7_CLKDIV_SHIFT)
+
+/* water mark register bits */
+#define IIC_BOE_HI_MRK		0x0000ff00
+#define IIC_BOE_HI_MRK_SHIFT	8
+#define IIC_BOE_LO_MRK		0x000000ff
+#define IIC_BOE_LO_MRK_SHIFT	0
+#define IIC_BOE_GET_LO_MRK(e) ((e->regs[IIC_BOE_WATER_MARK] & \
+			        IIC_BOE_LO_MRK) >> \
+                               IIC_BOE_LO_MRK_SHIFT)
+#define IIC_BOE_MK_WATER_MRK(hi, lo)\
+			((((hi) << IIC_BOE_HI_MRK_SHIFT) & IIC_BOE_HI_MRK) |\
+			(((lo) << IIC_BOE_LO_MRK_SHIFT) & IIC_BOE_LO_MRK))
+#define IIC_BOE_GET_HI_MRK(e) ((e->regs[IIC_BOE_WATER_MARK] & \
+			        IIC_BOE_HI_MRK) >> \
+                               IIC_BOE_HI_MRK_SHIFT)
+
+/* interrupt, interrupt mask, interrupt condition bits */
+#define IIC_BOE_INVALID_CMD	0x00008000
+#define IIC_BOE_PARITY		0x00004000
+#define IIC_BOE_BE_OVERRUN	0x00002000
+#define IIC_BOE_BE_ACCESS	0x00001000
+#define IIC_BOE_LOST_ARB	0x00000800
+#define IIC_BOE_NACK		0x00000400
+#define IIC_BOE_DAT_REQ		0x00000200
+#define IIC_BOE_CMD_COMP	0x00000100
+#define IIC_BOE_STOP_ERR	0x00000080
+#define IIC_BOE_BUSY		0x00000040
+#define IIC_BOE_IDLE		0x00000020
+#define IIC_BOE_ALL_INTS	0x0000ffff
+#define IIC_BOE_FE_ERRS		(IIC_BOE_LOST_ARB | IIC_BOE_NACK | \
+				 IIC_BOE_STOP_ERR)
+#define IIC_BOE_BE_ERRS		(IIC_BOE_INVALID_CMD | IIC_BOE_PARITY | \
+				 IIC_BOE_BE_OVERRUN | IIC_BOE_BE_ACCESS)
+#define IIC_BOE_ANY_ERR (IIC_BOE_BE_ERRS | IIC_BOE_FE_ERRS)
+
+/* status register bits */
+#define IIC_BOE_S_INVALID_CMD     0x80000000
+#define IIC_BOE_S_PARITY          0x40000000
+#define IIC_BOE_S_BE_OVERRUN      0x20000000
+#define IIC_BOE_S_BE_ACCESS       0x10000000
+#define IIC_BOE_S_LOST_ARB        0x08000000
+#define IIC_BOE_S_NACK            0x04000000
+#define IIC_BOE_S_DAT_REQ         0x02000000
+#define IIC_BOE_S_CMD_COMP        0x01000000
+#define IIC_BOE_S_STOP_ERR        0x00800000
+#define IIC_BOE_STAT_SHIFT	  16
+#define IIC_BOE_MAX_PORT	  0x000f0000
+#define IIC_BOE_MAX_PORT_SHIFT	  16
+#define IIC_BOE_ANY_INT		  0x00008000
+#define IIC_BOE_SCL_IN		  0x00000800
+#define IIC_BOE_SDA_IN		  0x00000400
+#define IIC_BOE_PORT_BUSY	  0x00000200
+#define IIC_BOE_SELF_BUSY	  0x00000100
+#define IIC_BOE_FIFO_COUNT	  0x000000ff
+
+#define IIC_BOE_S_BE_ERRS (IIC_BOE_BE_ERRS << IIC_BOE_STAT_SHIFT)
+#define IIC_BOE_S_FE_ERRS (IIC_BOE_FE_ERRS << IIC_BOE_STAT_SHIFT)
+#define IIC_BOE_S_ANY_ERR (IIC_BOE_ANY_ERR << IIC_BOE_STAT_SHIFT)
+
+/* extended status register bits */
+#define IIC_BOE_FIFO_SZ		0xff000000
+#define IIC_BOE_FIFO_SZ_SHIFT	24
+#define IIC_BOE_SCL_IN_SYN	0x00008000
+#define IIC_BOE_SDA_IN_SYN	0x00004000
+#define IIC_BOE_S_SCL		0x00002000
+#define IIC_BOE_S_SDA		0x00001000
+#define IIC_BOE_M_SCL		0x00000800
+#define IIC_BOE_M_SDA		0x00000400
+#define IIC_BOE_HI_WATER	0x00000200
+#define IIC_BOE_LO_WATER	0x00000100
+#define IIC_BOE_ES_PORT_BUSY	0x00000080
+#define IIC_BOE_ES_SELF_BUSY	0x00000040
+#define IIC_BOE_VERSION		0x0000001f
+
+/* residual length register bits */
+#define IIC_BOE_FE_LEN		0xffff0000
+#define IIC_BOE_FE_LEN_SHIFT	16
+#define IIC_BOE_BE_LEN		0x0000ffff
+#define IIC_BOE_GET_BE(r)	(r & IIC_BOE_BE_LEN)
+#define IIC_BOE_GET_FE(r) (r >> IIC_BOE_FE_LEN_SHIFT)
+
+/* Murano/Centaur port busy register */
+#define IIC_BOE_PORT_BUSY_REST  0x80000000
+
-- 
1.8.3.1
