Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x243.google.com (mail-oi0-x243.google.com
 [IPv6:2607:f8b0:4003:c06::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s0g4n3QszzDqR4
 for <openbmc@lists.ozlabs.org>; Fri, 29 Jul 2016 04:15:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=SS0qveSO; 
 dkim-atps=neutral
Received: by mail-oi0-x243.google.com with SMTP id c199so5260648oig.1
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jul 2016 11:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=smbHYzTvDMVfzsR217PCHv7w7wLMS0GSMTmk8/yyAoQ=;
 b=SS0qveSO57cKEJ6PU53YfFSydgCwXADSGvOKAQo4zwHk371zBudSeXEGLJSNTLAdzm
 rpr7ZAFEfjywXQl1Ij4uiuEg7HWa8k4xYTowwSaECu8SoUUBWRKSgKakKjcnrtIyxq10
 gpOMYuBH40cIUow3rUpiM71aTNC7saTGRbc0tikEJYShT6gwFYnUtIjSHmjxn3pkLkWt
 nKs15x1CjSiKpZnSbwnvY8UDjz8q7C+ErfVwGqj6kGtBg9iCkVUJhDAXBpDN3KjN5fEV
 N7c4bSre8GcdvAeNMhIJbarFMEnXESPdiX+uPcozMZf930SocdOPAuu8e/fRC5skj0b8
 UDMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=smbHYzTvDMVfzsR217PCHv7w7wLMS0GSMTmk8/yyAoQ=;
 b=f36E4WCXmygEwL5dBp2u7gF3AFM+Fqwyjwk7/fSv6AhUg6w2u5+8TWVYR/rd4hbrE1
 e3d3QIcK0po2lS2Bxg0lqsjW2c0ob+8LMk4uyA+PQE/iO/HYJNXbEmrrzke0uUZGUpzq
 p37usg5tTBIleAALwmCESTFv3N8SzdRy3IAD+gG0mMFf+uHvpTYdG5P0GRV1IBq2uyBS
 1bt+ubHRDtsG5J260g2sinFHGl6kEGVdDutGXawfdjQRo6cTXLJvvr+uffeZdvAYqpV0
 8lGoZmBeS/1mA801DKdbV8b9HVHBDhNyO/A+xYWobcoz7IFkYggc52dk+68a4JCc1XV0
 qZIQ==
X-Gm-Message-State: AEkoousrkJmcaHk/FdNtJFrGn+u0QLncFEXB26f6yqLxTBe0lOY4CmEMs6UKPBcL1/Qe5Q==
X-Received: by 10.157.19.39 with SMTP id f36mr20594969ote.53.1469729702743;
 Thu, 28 Jul 2016 11:15:02 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id u8sm5088273otb.5.2016.07.28.11.15.01
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Thu, 28 Jul 2016 11:15:02 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux 2/4] drivers/fsi: FSI master initialization
Date: Thu, 28 Jul 2016 13:14:56 -0500
Message-Id: <1469729698-37246-2-git-send-email-christopher.lee.bostic@gmail.com>
X-Mailer: git-send-email 2.7.4 (Apple Git-66)
In-Reply-To: <1469729698-37246-1-git-send-email-christopher.lee.bostic@gmail.com>
References: <1469729698-37246-1-git-send-email-christopher.lee.bostic@gmail.com>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Jul 2016 18:15:06 -0000

From: Chris Bostic <cbostic@us.ibm.com>

Kick off the primary FSI master and initialize all fields.  Prep for
initial CFAM scans.

Signed-off-by: Chris Bostic <cbostic@us.ibm.com>
---
 drivers/fsi/Makefile     |   2 +-
 drivers/fsi/fsi.h        |  24 ++
 drivers/fsi/fsicfam.h    |  45 ++++
 drivers/fsi/fsidefines.h | 130 ++++++++++
 drivers/fsi/fsiinit.c    |  23 ++
 drivers/fsi/fsiinit.h    |   4 +-
 drivers/fsi/fsimaster.c  | 272 ++++++++++++++++++++
 drivers/fsi/fsimaster.h  | 657 +++++++++++++++++++++++++++++++++++++++++++++++
 8 files changed, 1155 insertions(+), 2 deletions(-)
 create mode 100644 drivers/fsi/fsi.h
 create mode 100644 drivers/fsi/fsicfam.h
 create mode 100644 drivers/fsi/fsidefines.h
 create mode 100644 drivers/fsi/fsimaster.c
 create mode 100644 drivers/fsi/fsimaster.h

diff --git a/drivers/fsi/Makefile b/drivers/fsi/Makefile
index f547c08..9800c15 100644
--- a/drivers/fsi/Makefile
+++ b/drivers/fsi/Makefile
@@ -2,4 +2,4 @@
 # Makefile for the FSI bus specific drivers.
 #
 
-obj-y		+= fsiinit.o
+obj-y		+= fsiinit.o fsimaster.o
diff --git a/drivers/fsi/fsi.h b/drivers/fsi/fsi.h
new file mode 100644
index 0000000..e17a419
--- /dev/null
+++ b/drivers/fsi/fsi.h
@@ -0,0 +1,24 @@
+/*
+ * FSI device driver structure definitions and defines
+ *
+ * Copyright 2016 IBM Corp.
+ *
+ * Christopher Bostic <cbostic@us.ibm.com>
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version
+ * 2 of the License, or (at your option) any later version.
+ */
+#ifndef DRIVERS_FSI_H
+#define DRIVERS_FSI_H
+
+#include <linux/device.h>
+
+struct fsidevice {
+	unsigned long irq_start;	/* IRQ Number */
+	struct fsidevice *parent;	/* Parent of this device */
+	struct device dev;		/* LDM entry for bus */
+};
+
+#endif /* DRIVERS_FSI_H */
diff --git a/drivers/fsi/fsicfam.h b/drivers/fsi/fsicfam.h
new file mode 100644
index 0000000..de0e43b
--- /dev/null
+++ b/drivers/fsi/fsicfam.h
@@ -0,0 +1,45 @@
+/*
+ * FSI CFAM structure definitions and defines
+ *
+ * Copyright 2016 IBM Corp.
+ *
+ * Christopher Bostic <cbostic@us.ibm.com>
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version
+ * 2 of the License, or (at your option) any later version.
+ */
+#ifndef DRIVERS_FSICFAM_H
+#define DRIVERS_FSICFAM_H
+
+#include "fsi.h"
+#include "fsidefines.h"
+
+struct fsicfam {			/* CFAM internal structure */
+	unsigned long magic;		/* Magic number */
+	unsigned long strno;		/* Structure version number */
+	unsigned long cfgtab[FSI_MAX_ENGINES];	/* Configuration word */
+	unsigned short chipid;		/* CFAM chip type (IOU, CFAM-S, etc) */
+	unsigned char id;		/* CFAM Id */
+	unsigned char has_submaster;	/* CFAM with cascaded or hub masters */
+	unsigned char has_mux;		/* CFAM with multiplexer */
+	unsigned char ec_maj;		/* Major EC Level */
+	unsigned char ec_min;		/* Minor EC Level or version number */
+	unsigned short pages;		/* # Mapped pages */
+	unsigned char no_eng;		/* Number of engines[] */
+	struct fsidevice fsidev;	/* LDM entry */
+	struct fsidevice hpdone;	/* Dummy engine to signal completion */
+	unsigned long eng_build;	/* True during engine activate */
+	struct fsimaster *master;	/* pointer to parent master */
+};
+
+#define to_fsicfam(x)	container_of((x), struct fsicfam, fsidev)
+
+/*
+ * CFAM specific function prototypes.
+ */
+int fsi_cfamirq_request(int, struct fsicfam *);
+void fsi_cfamirq_free(struct fsicfam *);
+
+#endif /* DRIVERS_FSICFAM_H */
diff --git a/drivers/fsi/fsidefines.h b/drivers/fsi/fsidefines.h
new file mode 100644
index 0000000..bf72ec438
--- /dev/null
+++ b/drivers/fsi/fsidefines.h
@@ -0,0 +1,130 @@
+/*
+ * FSI device driver structure definitions and defines
+ *
+ * Copyright 2016 IBM Corp.
+ *
+ * Christopher Bostic <cbostic@us.ibm.com>
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version
+ * 2 of the License, or (at your option) any later version.
+ */
+#ifndef DRIVERS_FSIDEFINES_H
+#define DRIVERS_FSIDEFINES_H
+
+#define FSIDD_NAME		"fsi"		/* FSI device driver name */
+
+/* Generic FSI defines */
+#define	FSI_MAX_LINKS		64		/* FSI Master # of links */
+#define	FSI_MAX_CASCADE		4		/* # of CFAMS in cascade */
+#define	FSI_MAX_ENGINES		32		/* # of engines per CFAM */
+#define	FSI_MAX_MASTERS		1		/* # of masters in system */
+#define	FSI_MAX_OPB		1		/* # of FSI OPB masters */
+#define	FSI_IO_START		0x80000000	/* FSI IO Space start addr */
+#define	FSI_LINK_ENG_MASK	0xE0007FFF	/* Used for minor num calcs */
+#define	FSI_MINOR_OFFSET	1024		/* Where FSI minor nums start */
+#define	FSI_MAX_DEPTH		3		/* Max number of links in path */
+#define	FSI_IO_SIZE		0x20000000	/* 512 MB */
+#define	FSI_IO_END		(FSI_IO_START + FSI_IO_SIZE)
+#define	FSI_LINK_SHIFT		23			/* Bits to shift */
+#define	FSI_LINK_SIZE		(1 << FSI_LINK_SHIFT)	/* 8 MB */
+#define	FSI_CFAM_SHIFT		21			/* Bits to shift */
+#define	FSI_CFAM_SIZE		(1 << FSI_CFAM_SHIFT)	/* 2 MB */
+#define	FSI_ENGINE_SHIFT	10			/* Bits to shift */
+#define	FSI_ENGINE_SIZE		(1 << FSI_ENGINE_SHIFT)	/* 1 KB */
+#define	FSI_LINK_MASK		0x1f800000		/* Bits for link */
+#define	FSI_CFAM_MASK		0x00600000		/* Bits for cfam */
+#define	FSI_ENGINE_MASK		0x000ffc00		/* Bits for engine */
+#define	FSI_PEEK_OFFSET		FSI_ENGINE_SIZE
+#define	FSI_SLAVE0_OFFSET	(2 * FSI_ENGINE_SIZE)
+#define	FSI_IRQ_OFFSET		1024		/* Offset for FSI engine IRQ numbers */
+#define	FSI_SLV_NO_ERROR	100		/* Slave has no error data */
+#define	FSI_BREAK		0xc0de0000	/* BREAK command */
+#define	FSI_TERM		0xecc00000	/* TERM command */
+#define	FSI_BREAK_TIME		180		/* Time in seconds to allow BREAKs */
+#define	FSI_BREAK_CNT		3		/* Count limit to allow BREAKs */
+#define	FSI_PRIM		0		/* Generic Primary FSI master */
+#define	FSI_MBIT_MASK		0x3		/* FSI master  bits in pa */
+#define	FSI_ENG_MASK		0x00007FFF	/* The engine portion of the MATRB */
+#define	FSI_PA16_SHIFT		16		/* For 16 bit pa conversions */
+
+/* FSI Events */
+#define FSI_EVT_PLUG		5		/* Link hot plug add detected */
+#define FSIDD_BUILD		9		/* In build up phase */
+#define FSIDD_PROBE		10		/* In probe phase */
+
+/*
+ * Return FSI physical address without type information (last 2 bits)
+ */
+static inline phys_addr_t fsi_panot(phys_addr_t pa)
+{
+	return pa & ~FSI_MBIT_MASK;
+}
+
+/*
+ * Return type of FSI master this physical address belongs to
+ */
+static inline int fsi_pa2mtype(phys_addr_t pa)
+{
+	return pa & FSI_MBIT_MASK;
+}
+
+/*
+ * Add type of FSI master to physical address
+ */
+static inline phys_addr_t fsi_mtype2pa(phys_addr_t pa, unsigned char type)
+{
+	return fsi_panot(pa) | (type & FSI_MBIT_MASK);
+}
+
+/*
+ * Extract link number from physical address
+ */
+static inline int fsi_pa2link(phys_addr_t addr)
+{
+	return (addr >> FSI_LINK_SHIFT) & (FSI_LINK_MASK >> FSI_LINK_SHIFT);
+}
+
+/*
+ * Extract cfam number from physical address
+ */
+static inline int fsi_pa2cfam(phys_addr_t addr)
+{
+	 /* Stub */
+	return 0;
+}
+
+/*
+ * Determine the link address to send the break command to
+ * This is master dependent
+ */
+static inline int fsi_mtype_2break_id(unsigned char mtype)
+{
+	return FSI_MAX_CASCADE - 1;
+}
+
+/*
+ * Build a mask where bit index 'x' is set (numbering from left to right.
+ * Bit 0 is MSB and bit 31 is LSM.
+ */
+static inline unsigned long mask32(int x)
+{
+	return 1 << (BITS_PER_LONG - x - 1);
+}
+
+struct fsidd;
+
+/*
+ * Various function prototypes
+ */
+int slv_install(void);
+void slv_uninstall(void);
+
+int fsi_init_fileio(struct fsidd *);
+void fsi_exit_fileio(dev_t);
+
+int fsibus_init(void);
+void fsibus_exit(void);
+
+#endif /* DRIVERS_FSIDEFINES_H */
diff --git a/drivers/fsi/fsiinit.c b/drivers/fsi/fsiinit.c
index a9e3381..3330d8b 100644
--- a/drivers/fsi/fsiinit.c
+++ b/drivers/fsi/fsiinit.c
@@ -13,7 +13,9 @@
 
 #include <linux/init.h>
 #include <linux/module.h>
+#include <linux/kdev_t.h>
 #include "fsiinit.h"
+#include "fsimaster.h"
 
 MODULE_AUTHOR("Christopher Bostic cbostic@us.ibm.com");
 MODULE_DESCRIPTION("FSI master device driver");
@@ -23,9 +25,13 @@ MODULE_DESCRIPTION("FSI master device driver");
 #define	FSIDD_VERNO	4000
 #define	FSIDD_VER(x)	FSIDD_TOSTR(x)
 
+struct primaster prim;
+EXPORT_SYMBOL(prim);
+
 struct fsidd fsidd = {		/* FSI device driver structure definition */
 	.magic = FSI_DD_MAGIC,
 	.strno = FSI_DD_STRNO,
+	.major = MKDEV(FSIDD_MAJOR, 0),
 };
 
 static int fsi_start(void)
@@ -33,6 +39,23 @@ static int fsi_start(void)
 	int rc = 0;
 
 	printk("FSI DD v:%d installation ok\n", FSIDD_VERNO);
+
+	init_waitqueue_head(&fsidd.error_wq);
+	init_waitqueue_head(&fsidd.lbus_wq);
+	init_waitqueue_head(&fsidd.irq_wq);
+	init_waitqueue_head(&fsidd.link_wq);
+
+	if (!fsimaster_build_init(&fsidd.pri_master, FSI_PRIM, 0)) {
+		rc = PTR_ERR(0);
+		goto out1;
+	}
+	fsimaster_start(&fsidd.pri_master);
+	printk("FSI DD v%d installation ok\n", FSIDD_VERNO);
+	goto good;
+
+out1:
+	printk("FSI DD v:%d installation failed\n", FSIDD_VERNO);
+good:
 	return rc;
 }
 
diff --git a/drivers/fsi/fsiinit.h b/drivers/fsi/fsiinit.h
index 70c3e13..059187f 100644
--- a/drivers/fsi/fsiinit.h
+++ b/drivers/fsi/fsiinit.h
@@ -19,6 +19,7 @@
 #include <linux/device.h>
 #include <linux/workqueue.h>
 #include <linux/hrtimer.h>
+#include "fsimaster.h"
 
 #define FSI_DD_MAGIC	0x64644632	/* ddF2 */
 #define FSI_DD_STRNO	0x1		/* Structure version number */
@@ -34,8 +35,9 @@ struct fsidd {				/* FSI Main structure */
 	wait_queue_head_t link_wq;	/* Wait queue for link changes */
 	unsigned long state;		/* State driver is in */
 	struct device dev;		/* Anchor point in /sys/kernel */
+	struct fsimaster pri_master;	/* Primary FSI master */
 };
 
-#define	to_fsidd(a)		container_of(a, struct fsidd, kobj)
+#define to_fsidd_prim(a)	container_of(a, struct fsidd, pri_master)
 
 #endif /* DRIVERS_FSIINIT_H */
diff --git a/drivers/fsi/fsimaster.c b/drivers/fsi/fsimaster.c
new file mode 100644
index 0000000..96f6f60
--- /dev/null
+++ b/drivers/fsi/fsimaster.c
@@ -0,0 +1,272 @@
+/*
+ * FSI Master Control
+ *
+ * Copyright 2016 IBM Corp.
+ *
+ * Christopher Bostic <cbostic@us.ibm.com>
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version
+ * 2 of the License, or (at your option) any later version.
+ */
+
+#include <linux/err.h>
+#include <linux/delay.h>
+#include <linux/ktime.h>
+#include <asm/io.h>
+#include "fsi.h"
+#include "fsiinit.h"
+#include "fsimaster.h"
+#include "fsicfam.h"
+
+extern struct primaster prim;
+
+static int hpinfo_alloc(struct fsimaster *p)
+{
+	/* Stub */
+	return 0;
+}
+
+static inline unsigned int fsimid(struct fsimaster *p)
+{
+	return p->myid;
+}
+
+static void primaster_exit(struct fsimaster *p)
+{
+	if (p->dcr_alloc) {
+		p->mp = 0;
+		p->dcr_alloc = 0;
+	}
+}
+
+/*
+ * Read/write functions to access primary FSI master registers
+ */
+static int local_readreg(volatile u32 *base, int regnm, u32 *value)
+{
+	*value = *(base + regnm);
+	rmb();
+
+	return 0;
+}
+
+static int local_writereg(volatile u32 *base, int regnm, u32 value)
+{
+	u32 new_value = value, r_value;
+
+	if (regnm == FSI_N_MRESB0)
+		new_value = 0;
+	else if (FSI_N_IS_CU_REG(regnm)) {
+		local_readreg(base, regnm, &r_value);
+		new_value = r_value &= ~value;
+	} else if (FSI_N_IS_SU_REG(regnm)) {
+		local_readreg(base, regnm, &r_value);
+		new_value = r_value |= value;
+	}
+	*(base + regnm) = new_value;
+	wmb();
+
+	return 0;
+}
+
+static int local_readreg2(volatile u32 *base, int regnm, u32 *value)
+{
+	*value++ = *(base + regnm);
+	*value = *(base + regnm + 1);
+	rmb();
+
+	return 0;
+}
+
+static int local_writereg2(volatile u32 *base, int regnm, u32 *value)
+{
+	u32 new_value[] = {*value, *(value + 1) };
+	u32 r_value[2];
+
+	if (FSI_N_IS_CU_REG(regnm)) {
+		local_readreg2(base, regnm, r_value);
+		new_value[0] = r_value[0] &= ~(*value);
+		new_value[1] = r_value[1] &= ~(*(value + 1));
+	} else if (FSI_N_IS_SU_REG(regnm)) {
+		local_readreg2(base, regnm, r_value);
+		new_value[0] = r_value[0] |= *value;
+		new_value[1] = r_value[1] |= *(value + 1);
+	}
+	*(base + regnm) = new_value[0];
+	*(base + regnm + 1) = new_value[1];
+	wmb();
+	return 0;
+}
+
+static int local_readreg4(volatile u32 *base, int regnm, u32 *value)
+{
+	int i;
+
+	for (i = 0, base += regnm; i < 4; ++i)
+		*value++ = *base++;
+	rmb();
+	return 0;
+}
+
+static int local_writereg8(volatile u32 *base, int regnm, u32 *value)
+{
+	int i;
+	u32 r_value, new_value[8];
+
+	for (i = 0, base += regnm; i < 8; ++i) {
+		new_value[i] = *(value + i);
+
+		if (FSI_N_IS_CU_REG(regnm)) {
+			local_readreg(base, regnm, &r_value);
+			new_value[i] = r_value &= ~(*(value + i));
+		} else if (FSI_N_IS_SU_REG(regnm)) {
+			local_readreg(base, regnm, &r_value);
+			new_value[i] = r_value |= *(value + i);
+		}
+		*base++ = new_value[i];
+	}
+	wmb();
+	return 0;
+}
+
+static int primaster_init(struct fsimaster *p)
+{
+	p->read_f = local_readreg;
+	p->read_f2 = local_readreg2;
+	p->read_f4 = local_readreg4;
+	p->write_f = local_writereg;
+	p->write_f2 = local_writereg2;
+	p->write_f8 = local_writereg8;
+	p->maxlinks = PRI_MAX_LINKS;
+	p->have_peek = 1;
+	p->irqbase = FSI_IRQ_OFFSET;
+	p->membase = FSI_IO_START;
+	p->mp = (u32 *)&prim.regs;
+	p->dcr_alloc = 1;
+	if (hpinfo_alloc(p))
+		primaster_exit(p);
+
+	return p->mp ? 0 : 1;
+}
+
+static int fsimaster_init(struct fsimaster *p)
+{
+	int rc = 0;
+
+	memset(&p->quirks, 0, sizeof(struct master_quirks));
+	p->quirks.break_cfam_id = fsi_mtype_2break_id(p->type);
+	p->cfam_size = 0;
+	p->m_get = 0;
+	p->m_pa2irq = 0;
+	p->m_exit = 0;
+
+	rc = primaster_init(p);
+
+	return rc;
+}
+
+struct fsimaster * fsim_get_top_master(struct fsimaster *p)
+{
+	struct fsimaster *parent = NULL;
+
+	while (p) {
+		parent = p;
+		p = p->parent;
+	}
+
+	return parent;
+}
+
+static int fsimaster_reset(struct fsimaster *p)
+{
+	u32 mresp, maeb, mver, mectrl, mmode, menp[2];
+	int rc = 0;
+	struct fsidd *dd;
+
+	dd = to_fsidd_prim(fsim_get_top_master(p));
+
+	rc = (p->read_f)(p->mp, FSI_N_MVER, &mver);
+	if (rc)
+		goto out;
+	if (fsi_mver_extlink(mver) != p->maxlinks) {
+		rc = -EINVAL;
+		goto out;
+	}
+	/* Reset all bridges and ports */
+	mresp = FSI_MRESP_RST_ALL_MSTR | FSI_MRESP_RST_ALL_LINK
+		| FSI_MRESP_RST_MCR | FSI_MRESP_RST_PYE;
+	rc = (p->write_f)(p->mp, FSI_N_MRESP0, mresp);
+	if (rc)
+		goto out;
+
+	/* Set up control */
+	mectrl = (p->type == FSI_PRIM) ? FSI_MECTRL_FPME : FSI_MECTRL_EOAE;
+	rc = (p->write_f)(p->mp, FSI_N_MECTRL, mectrl);
+	if (rc)
+		goto out;
+
+	/* Set up mode */
+	mmode = fsi_mmode_crs0(1) | fsi_mmode_crs1(1);
+	rc = (p->write_f)(p->mp, FSI_N_MMODE, mmode);
+	if (rc)
+		goto out;
+
+	/* Set up delay characteristics */
+	rc = (p->write_f)(p->mp, FSI_N_MDLYR, FSI_MDLYR_DFLT);
+	if (rc)
+		goto out;
+
+	/* Enable all links for a short time */
+	menp[0] = menp[1] = ~0;
+	rc = (p->write_f2)(p->mp, FSI_N_MSENP0, menp);
+	if (rc)
+		goto out;
+
+	mdelay(1);
+	rc = (p->write_f2)(p->mp, FSI_N_MCENP0, menp);
+	if (rc)
+		goto out;
+
+	maeb = FSI_MRESP_RST_ALL_MSTR | FSI_MRESP_RST_ALL_LINK;
+	rc = (p->write_f)(p->mp, FSI_N_MRESP0, maeb);
+out:
+	return rc;
+}
+
+struct fsimaster *fsimaster_build_init(struct fsimaster *p, int type,
+				       struct fsidevice *parent)
+{
+	int rc = 0;
+	struct fsidd *dd;
+
+	if (!p)
+		goto out;
+	if (!parent)
+		dd = to_fsidd_prim(p);
+	else {
+		struct fsicfam *cp = to_fsicfam(parent->parent);
+		dd = to_fsidd_prim(fsim_get_top_master(cp->master));
+	}
+	p->type = type;
+	p->fsidev = parent;
+	if( fsimaster_init(p)) {
+		p = 0;
+		goto out;
+	}
+	if (fsimaster_reset(p)) {
+		rc = -EIO;
+		p = 0;
+		goto out;
+	}
+out:
+	return p ? : ERR_PTR(rc);
+}
+
+/*
+ * Kick off the master so it can start probing for attached CFAMs
+ */
+void fsimaster_start(struct fsimaster *p)
+{
+}
diff --git a/drivers/fsi/fsimaster.h b/drivers/fsi/fsimaster.h
new file mode 100644
index 0000000..b07934e
--- /dev/null
+++ b/drivers/fsi/fsimaster.h
@@ -0,0 +1,657 @@
+/*
+ * FSI Master device driver structure definitions and defines
+ *
+ * Copyright 2016 IBM Corp.
+ *
+ * Christopher Bostic <cbostic@us.ibm.com>
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version
+ * 2 of the License, or (at your option) any later version.
+ */
+#ifndef DRIVERS_FSIMASTER_H
+#define DRIVERS_FSIMASTER_H
+
+#include "fsidefines.h"
+#include "fsi.h"
+#include "fsicfam.h"
+
+#define FSI_MAX_PING_ATTEMPTS	12
+#define	FSI_DFLT_PLUG_CHECK	100
+#define FSI_DFLT_IPOLL_CHECK	800
+
+/* FSI master register numbers */
+#define	FSI_N_MMODE	0	/* 0x0   R/W: mode register */
+#define	FSI_N_MDLYR	1	/* 0x4   R/W: delay register */
+#define	FSI_N_MCRSP0	2	/* 0x8   R/W: clock rate selector register 0 */
+#define	FSI_N_MCRSP32	3	/* 0xC	 R/W: clock rate selector register 1 */
+#define	FSI_N_MENP0	4	/* 0x10  R/W: enable clock register 0 */
+#define	FSI_N_MENP32	5	/* 0x14  R/W: enable clock register 1 */
+#define	FSI_N_MLEVP0	6	/* 0x18  R: static level register 0 */
+#define	FSI_N_MLEVP32	7	/* 0x1C  R: static level register 1 */
+#define	FSI_N_MSENP0	6	/* 0x18  S: set enable clock register 0 */
+#define	FSI_N_MREFP0	8	/* 0x20  R: link reference register 0 */
+#define	FSI_N_MCENP0	8	/* 0x20  W: clear enable port register 0 */
+#define	FSI_N_MHPMP0	10	/* 0x28  R: hot plug reference register 0 */
+#define	FSI_N_MCHPMP0	10	/* 0x28  W: clear hot plug reference reg 0 */
+#define	FSI_N_MSIEP0	12	/* 0x30  R/W: Ipoll register 0 */
+#define	FSI_N_MSIEP32	16	/* 0x40  R/W: Ipoll register 4 */
+#define	FSI_N_MAESP0	20	/* 0x50  R: any error port register 0 */
+#define	FSI_N_MAESP32	24	/* 0x60  R: any error port register 4 */
+#define	FSI_N_MSSIEP0	20	/* 0x50  W: set Ipoll register 0 */
+#define	FSI_N_MAEB	28	/* 0x70  R: any error bridge */
+#define	FSI_N_MVER	29	/* 0x74  R: version register */
+#define	FSI_N_MBSYP0	30	/* 0x78  R: port busy register 0 */
+#define	FSI_N_MCSIEP0	28	/* 0x70  W: clear Ipoll register 0 */
+#define	FSI_N_MDRSB1	36	/* 0x90  R/W: DMA select register master 1 */
+#define	FSI_N_MSTAP0	52	/* 0xd0  R: port status reg 0-63 (0xd0-0x1cc) */
+#define	FSI_N_MRESP0	52	/* 0xd0  W: port reset regr 0-63 (0xd0-0x1cc) */
+#define	FSI_N_MESRB0	116	/* 0x1d0 R: error syndrome register 0-16 */
+#define	FSI_N_MRESB0	116	/* 0x1d0 W: reset reg master 0-16 (x1d0-x210) */
+#define	FSI_N_MSCSB0	117	/* 0x1d4 R: master sub cmd stack register 0 */
+#define	FSI_N_MATRB0	118	/* 0x1d8 R: master address trace register 0 */
+#define	FSI_N_MDTRB0	119 	/* 0x1dc R: master data trace register 0 */
+#define	FSI_N_MECTRL	184	/* 0x2e0 R/W: error control register master 0 */
+#define	FSI_N_MAESP_SZ	8	/* # of error port register 0-7 */
+
+#define FSI_MSIEP_REG_COUNT	8
+#define PRI_MAX_LINKS		FSI_MAX_LINKS
+
+/*
+ * Model clear under mask (CU) and set under mask (SU) Read only (RO)
+ * and Write only (WO) behavior for virtual Primary FSI Master
+ */
+#define FSI_N_IS_CU_REG(x)  ((x) == FSI_N_MCENP0 || ((x) == FSI_N_MCENP0 + 1) \
+			 ||  (x) == FSI_N_MCHPMP0 || ((x) == FSI_N_MCHPMP0 + 1)\
+			 ||  (x) == FSI_N_MCSIEP0      \
+			 || ((x) == FSI_N_MCSIEP0 + 1) \
+			 || ((x) == FSI_N_MCSIEP0 + 2) \
+			 || ((x) == FSI_N_MCSIEP0 + 3) \
+			 || ((x) == FSI_N_MCSIEP0 + 4) \
+			 || ((x) == FSI_N_MCSIEP0 + 5) \
+			 || ((x) == FSI_N_MCSIEP0 + 6) \
+			 || ((x) == FSI_N_MCSIEP0 + 7))
+#define FSI_N_IS_SU_REG(x)  ((x) == FSI_N_MSENP0 || ((x) == FSI_N_MSENP0 + 1)\
+			 ||  (x) == FSI_N_MSSIEP0      \
+			 || ((x) == FSI_N_MSSIEP0 + 1) \
+			 || ((x) == FSI_N_MSSIEP0 + 2) \
+			 || ((x) == FSI_N_MSSIEP0 + 3) \
+			 || ((x) == FSI_N_MSSIEP0 + 4) \
+			 || ((x) == FSI_N_MSSIEP0 + 5) \
+			 || ((x) == FSI_N_MSSIEP0 + 6) \
+			 || ((x) == FSI_N_MSSIEP0 + 7))
+
+/*
+ * Return FSI master error information register number for master x
+ */
+static inline int fsi_mesrb_nr(int master)
+{
+	return (FSI_N_MESRB0 + master * 4);
+}
+
+/*
+ * Return FSI master reset register number for master x
+ */
+static inline int fsi_mresb_nr(int master)
+{
+	return FSI_N_MRESB0 + master;
+}
+
+/*
+ * Return FSI master port status register number for link x
+ */
+static inline int fsi_mstap_nr(int link)
+{
+	return FSI_N_MSTAP0 + link;
+}
+
+/*
+ * Return FSI master port error reset register number for link x
+ */
+static inline int fsi_mresp_nr(int link)
+{
+	return FSI_N_MRESP0 + link;
+}
+
+/*
+ * Return FSI master ipoll register number for index x
+ */
+static inline int fsi_msiep_nr(int idx)
+{
+	return FSI_N_MSIEP0 + idx;
+}
+
+/*
+ * Return FSI master error information register number for master x
+ */
+static inline int fsi_maesp_nr(int portreg)
+{
+	return FSI_N_MAESP0 + portreg;
+}
+
+struct fsi_mei {		/* FSI master error information */
+	u32 mesrb;		/* Master error status register */
+	u32 mscsb;		/* Subcommand stack register */
+	u32 matrb;		/* Address trace register */
+	u32 mdtrb;		/* Data trace register */
+};
+
+/* FSI Master register set */
+struct fsi_mreg {
+	u32 mmode;			/* 0x0 */
+	u32 mdlyr;			/* 0x4 */
+	u32 mcrsp0[2];			/* 0x8 - 0xc */
+	u32 menp0[2];			/* 0x10 - 0x14 */
+	u32 mlevp0[2];			/* 0x18 - 0x1c */
+	u32 mrefp0[2];			/* 0x20 - 0x24 */
+	u32 mhpmp0[2];			/* 0x28 - 0x2c */
+	u32 msiep0[8];			/* 0x30 - 0x4c */
+	u32 maesp0[8];			/* 0x50 - 0x6c */
+	u32 maeb0[8];			/* 0x70 - 0x8c */
+	u32 mdrsb0[16];			/* 0x90 - 0xcc */
+	u32 mstap0[FSI_MAX_LINKS];	/* 0xd0 - 0x1cc */
+	struct fsi_mei mresb0[FSI_MAX_MASTERS];	/* 0x1d0 - 0x2dc */
+	u32 mectrl;			/* 0x2e0 */
+	u32 mver;			/* Master version ID, read only */
+};
+
+/* Virtual primary FSI master */
+struct primaster {
+	struct fsi_mreg	regs;		/* Registers */
+	unsigned long flags;
+};
+
+#define PORT_BUSY_CHECKS_MAX	10
+
+/* FSI Port controller reset types */
+#define	FSI_PORT_GENERAL_RESET		0x80000000
+#define	FSI_PORT_ERROR_RESET		0x40000000
+#define	FSI_PORT_GENERAL_RESET_BRIDGE	0x20000000
+#define	FSI_PORT_GENERAL_RESET_PORT	0x10000000
+#define	FSI_PORT_RESET_CNTRL_REGS	0x08000000
+#define	FSI_PORT_RESET_PA_ERROR		0x04000000
+
+/* FSI Port controller error masks */
+#define	FSI_PORT_EMASK_ID0	0xf0000000
+#define	FSI_PORT_EMASK_ID1	0x0f000000
+#define	FSI_PORT_EMASK_ID2	0x00f00000
+#define	FSI_PORT_EMASK_ID3	0x000f0000
+#define	FSI_PORT_CRCMASK	0x0000f000
+#define	FSI_PORT_HOTPLUG	0x00000800
+
+/*
+ * FSI Slave interrupt enable/disable bit setting. Return the bit setting
+ * given a link and cfam number. The result of this function can be input
+ * to the mssiepX and mcsiepX registers or or'ed in to msiepX.
+ * The formula is 1 << 31 - (link % 8 * 4 + cfam).
+ *
+ * Not in FSI Spec (0..30):
+ * MSIEPx register bit 0 is port 0 and cfam 0.
+ * MSIEPx register bit 1 is port 0 and cfam 1.
+ * MSIEPx register bit 31 is port 7 and cfam 3.
+ */
+static inline u32 fsi_mk_msiep(int link, int cfam)
+{
+	return mask32((link % (BITS_PER_LONG / FSI_MAX_CASCADE))
+		      * FSI_MAX_CASCADE + cfam);
+}
+
+/*
+ * Return mask for all CFAMs id x to 3 (end of cascade) on a specific link.
+ */
+static inline u32 fsi_mk_msiep_plus(int link, int cfam)
+{
+	u32 bits = (0xf >> cfam) << 28;
+	return bits >> (link % (BITS_PER_LONG / FSI_MAX_CASCADE)
+			* FSI_MAX_CASCADE);
+}
+
+/*
+ * Return mask for all CFAMs on a specific link.
+ */
+static inline u32 fsi_mk_msiep_all(int link)
+{
+	return 0xf0000000 >> (link % (BITS_PER_LONG / FSI_MAX_CASCADE)
+			      * FSI_MAX_CASCADE);
+}
+
+/*
+ * Return index for msiepX register
+ */
+static inline int fsi_mk_msiep_idx(int link)
+{
+	return link / (BITS_PER_LONG / FSI_MAX_CASCADE);
+}
+
+/*
+ * FSI Master Mode register setting
+ */
+#define	FSI_MMODE_EIP		0x80000000	/* Enable interrupt polling */
+#define	FSI_MMODE_ECRC		0x40000000	/* Enable hardware error recovery */
+#define	FSI_MMODE_ERAC		0x20000000	/* Enable relative address commands */
+#define	FSI_MMODE_EPC		0x10000000	/* Enable parity checking */
+#define	FSI_MMODE_CRS0SHFT	18		/* Clock rate selection 0 mask shift */
+#define	FSI_MMODE_CRS0MASK	0x3ff		/* Clock rate selection 0 mask */
+#define	FSI_MMODE_CRS1SHFT	8		/* Clock rate selection 1 mask shift */
+#define	FSI_MMODE_CRS1MASK	0x3ff		/* Clock rate selection 1 mask */
+#define	FSI_MMODE_P63		0x80		/* Route link 63 to IOU slave C */
+#define	FSI_MMODE_DIV4		0x00000040	/* Divide by 4 (legacy mode) */
+
+/*
+ * Rolf Fritz Nov 20, 2013:
+ * 	MSB=1, LSB=0 is 0.8 ms
+ *	MSB=0, LSB=1 is 0.9 ms
+ */
+#define	FSI_MMODE_P8_TO_MSB	0x00000020	/* Timeout value most sig bit */
+#define	FSI_MMODE_P8_TO_LSB	0x00000010	/* Timeout value least sig bit */
+
+static inline u32 fsi_mmode_crs0(u32 x)
+{
+	return (x & FSI_MMODE_CRS0MASK) << FSI_MMODE_CRS0SHFT;
+}
+
+static inline u32 fsi_mmode_crs1(u32 x)
+{
+	return (x & FSI_MMODE_CRS1MASK) << FSI_MMODE_CRS1SHFT;
+}
+
+static inline u32 fsi_mmode_extcrs0(u32 x)
+{
+	return (x >> FSI_MMODE_CRS0SHFT) & FSI_MMODE_CRS0MASK;
+}
+
+static inline u32 fsi_mmode_extcrs1(u32 x)
+{
+	return (x >> FSI_MMODE_CRS1SHFT) & FSI_MMODE_CRS1MASK;
+}
+
+/*
+ * FSI master delay register
+ */
+#define	FSI_MDLYR_ECHO0_SHFT	28	/* Selection 0 echo delay cycles */
+#define	FSI_MDLYR_ECHO0_MASK	0xf	/* Selection 0 echo delay cycles */
+#define	FSI_MDLYR_SEND0_SHFT	24	/* Selection 0 send delay cycles */
+#define	FSI_MDLYR_SEND0_MASK	0xf	/* Selection 0 send delay cycles */
+#define	FSI_MDLYR_ECHO1_SHFT	20	/* Selection 1 echo delay cycles */
+#define	FSI_MDLYR_ECHO1_MASK	0xf	/* Selection 1 echo delay cycles */
+#define	FSI_MDLYR_SEND1_SHFT	16	/* Selection 1 send delay cycles */
+#define	FSI_MDLYR_SEND1_MASK	0xf	/* Selection 1 send delay cycles */
+#define	FSI_MDLYR_DFLT		0xffff0000 /* Default setting */
+
+static inline int fsi_mdlyr_echo0(int x)
+{
+	return (x & FSI_MDLYR_ECHO0_MASK) << FSI_MDLYR_ECHO0_SHFT;
+}
+
+static inline int fsi_mdlyr_echo1(int x)
+{
+	return (x & FSI_MDLYR_ECHO1_MASK) << FSI_MDLYR_ECHO1_SHFT;
+}
+
+static inline int fsi_mdlyr_send0(int x)
+{
+	return (x & FSI_MDLYR_SEND0_MASK) << FSI_MDLYR_SEND0_SHFT;
+}
+
+static inline int fsi_mdlyr_send1(int x)
+{
+	return (x & FSI_MDLYR_SEND1_MASK) << FSI_MDLYR_SEND1_SHFT;
+}
+
+static inline int fsi_mdlyr_extecho0(u32 x)
+{
+	return (x >> FSI_MDLYR_ECHO0_SHFT) & FSI_MDLYR_ECHO0_MASK;
+}
+
+static inline int fsi_mdlyr_extecho1(u32 x)
+{
+	return (x >> FSI_MDLYR_ECHO1_SHFT) & FSI_MDLYR_ECHO1_MASK;
+}
+
+static inline int fsi_mdlyr_extsend0(u32 x)
+{
+	return (x >> FSI_MDLYR_SEND0_SHFT) & FSI_MDLYR_SEND0_MASK;
+}
+
+static inline int fsi_mdlyr_extsend1(u32 x)
+{
+	return (x >> FSI_MDLYR_SEND1_SHFT) & FSI_MDLYR_SEND1_MASK;
+}
+
+/*
+ * MAEB Register
+ */
+#define	FSI_MASTER0		0x80000000	/* Primary Master */
+
+/*
+ * MVER Register
+ */
+#define	FSI_MVER_VER_MASK	0xff	/* FSI master version mask */
+#define	FSI_MVER_VER_SHFT	24	/* FSI master version shift */
+#define	FSI_MVER_BRG_MASK	0xff	/* FSI master FSI bridges mask */
+#define	FSI_MVER_BRG_SHFT	16	/* FSI master FSI bridges shift */
+#define	FSI_MVER_LINK_MASK	0xff	/* FSI master links mask */
+#define	FSI_MVER_LINK_SHFT	8	/* FSI master links shift */
+
+static inline int fsi_mver_extversion(u32 x)
+{
+	return (x >> FSI_MVER_VER_SHFT) & FSI_MVER_VER_MASK;
+}
+
+static inline int fsi_mver_extport(u32 x)
+{
+	return (x >> FSI_MVER_BRG_SHFT) & FSI_MVER_BRG_MASK;
+}
+
+static inline int fsi_mver_extlink(u32 x)
+{
+	return (x >> FSI_MVER_LINK_SHFT) & FSI_MVER_LINK_MASK;
+}
+
+/*
+ * Master reset types
+ */
+#define	FSI_MRESB_RST_GEN	0x80000000	/* General reset */
+#define	FSI_MRESB_RST_ERR	0x40000000	/* Error Reset, don't use */
+#define	FSI_MRESB_DELAY		0x01000000	/* do delay settings */
+
+/*
+ * Port reset types
+ */
+#define	FSI_MRESP_RST_GEN	0x80000000	/* General reset */
+#define	FSI_MRESP_RST_ERR	0x40000000	/* Error Reset, don't use */
+#define	FSI_MRESP_RST_ALL_MSTR	0x20000000	/* Reset all FSI masters */
+#define	FSI_MRESP_RST_ALL_LINK	0x10000000	/* Reset all FSI port contr. */
+#define	FSI_MRESP_RST_MCR	0x08000000	/* Reset FSI master reg. */
+#define	FSI_MRESP_RST_PYE	0x04000000	/* Reset FSI parity error */
+#define	FSI_MRESP_RST_ALL	0xfc000000	/* Reset any error */
+
+/*
+ * MESRB Register
+ */
+#define	FSI_MESRB_EC_MASK	0xf		/* Error code mask */
+#define	FSI_MESRB_EC_SHFT	28		/* Error code shift */
+#define	FSI_MESRB_PARITY_MASK	0xff		/* Parity bits shift */
+#define	FSI_MESRB_PARITY_SHFT	16		/* Parity bits Mask */
+#define	FSI_MESRB_CRC_MASK	0xf		/* CRC mask */
+#define	FSI_MESRB_CRC_SHFT	24		/* CRC shift */
+#define	FSI_MESRB_RESERVED_MASK	0xffff		/* Reserved mask */
+#define	FSI_MESRB_OPB_PYE	0x0001000	/* OPB Parity Error */
+#define	FSI_MESRB_NE		0		/* No error */
+#define	FSI_MESRB_OPBE		1		/* OPB Error */
+#define	FSI_MESRB_IOPBS		2		/* Illegal OPB state */
+#define	FSI_MESRB_PAE		3		/* Port access error */
+#define	FSI_MESRB_IDM		4		/* ID mismatch */
+#define	FSI_MESRB_DMASE		5		/* DMA select error */
+#define	FSI_MESRB_PTOE		6		/* Port time out error */
+#define	FSI_MESRB_MTOE		7		/* Master time out error */
+#define	FSI_MESRB_MCRCE		8		/* Master CRC error */
+#define	FSI_MESRB_ERRA		9		/* Any error response */
+#define	FSI_MESRB_ERRC		10		/* CRC error response */
+#define	FSI_MESRB_PE		11		/* Protocol error */
+#define	FSI_MESRB_PYE		12		/* Parity err/Reg access err */
+#define	FSI_MESRB_LAST		(FSI_MESRB_PYE + 1)	/* Last entry */
+
+/* Extract error conditon */
+static inline u32 fsi_mesrb_extec(u32 x)
+{
+	return (x >> FSI_MESRB_EC_SHFT) & FSI_MESRB_EC_MASK;
+}
+
+/* Extract CRC error counter */
+static inline u32 fsi_mesrb_extcrc(u32 x)
+{
+	return (x >> FSI_MESRB_CRC_SHFT) & FSI_MESRB_CRC_MASK;
+}
+
+/* Extract parity error bits */
+static inline u32 fsi_mesrb_extparity(u32 x)
+{
+	return (x >> FSI_MESRB_PARITY_SHFT) & FSI_MESRB_PARITY_MASK;
+}
+
+/*
+ * MATRB Register
+ */
+#define	FSI_MATRB_LPA_MASK		0x3f	/* Last port/link address mask */
+#define	FSI_MATRB_LPA_SHFT		26	/* Last port/link address shift */
+#define	FSI_MATRB_LSID_MASK		3	/* Last slave id mask */
+#define	FSI_MATRB_LSID_SHFT		24	/* Last slave id shift */
+#define	FSI_MATRB_P8_ADDR_HI_MASK	3	/* Upper two bits of address */
+#define	FSI_MATRB_P8_ADDR_HI_SHFT 	24	/* Upper two bits of address shift */
+#define	FSI_MATRB_SLPA_MASK		3	/* Last sublink address mask */
+#define	FSI_MATRB_SLPA_SHFT		19	/* Last sublink address shift */
+#define	FSI_MATRB_SLSID_SHFT		17	/* Last subslave id shift */
+#define	FSI_MATRB_READ_MASK		0x00400000	/* Last command was Read */
+#define	FSI_MATRB_ADDR_MASK		0x1fffff	/* Last address mask */
+#define	FSI_MATRB_ADDR_SHFT		1	/* Last address shift */
+#define	FSI_MATRB_P8_ADDR_SHFT		3	/* Account for the upper 2 bits */
+#define	FSI_MATRB_DATAS_MASK		1	/* Last address data size mask */
+#define	FSI_MATRB_CM_MASK		0x00200000	/* Cascaded FSI mask */
+
+/* Extract link number */
+static inline int fsi_matrb_lpa(u32 x)
+{
+	return (x >> FSI_MATRB_LPA_SHFT) & FSI_MATRB_LPA_MASK;
+}
+
+/* Extract data size of last command */
+static inline int fsi_matrb_datasize(u32 x)
+{
+	return x & FSI_MATRB_DATAS_MASK;
+}
+
+/* Extract read/write command */
+static inline int fsi_matrb_isread(u32 x)
+{
+	return x & FSI_MATRB_READ_MASK;
+}
+
+/*
+ * MSTAP Register
+ */
+#define	FSI_MSTAP_MASK		0xf		/* Error mask ID 0..3 */
+#define	FSI_MSTAP_ID0_SHFT	28		/* CFAM 0 error shift */
+#define	FSI_MSTAP_ID1_SHFT	24		/* CFAM 1 error shift */
+#define	FSI_MSTAP_ID2_SHFT	20		/* CFAM 2 error shift */
+#define	FSI_MSTAP_ID3_SHFT	16		/* CFAM 3 error shift */
+#define	FSI_MSTAP_CRC_MASK	0xf		/* CRC mask */
+#define	FSI_MSTAP_CRC_SHFT	12		/* CRC error counter */
+#define	FSI_MSTAP_HOTPLUG	0x800		/* Hotplug indicator */
+#define	FSI_MSTAP_NE		0		/* No error */
+#define	FSI_MSTAP_ERRA		1		/* Any error response */
+#define	FSI_MSTAP_ERRC		2		/* CRC error response */
+#define	FSI_MSTAP_UCRCE		3		/* Port detected CRC error */
+#define	FSI_MSTAP_IDM		4		/* ID mismatch */
+#define	FSI_MSTAP_PTOE		5		/* Port time out error */
+#define	FSI_MSTAP_IIPSE		6		/* Invalid I-Poll state error */
+#define	FSI_MSTAP_LAST		(FSI_MSTAP_IIPSE + 1)	/* Last entry */
+
+/* Extract error reason for slave id 0..3 */
+static inline u32 fsi_mstap_extec(u32 x, int id)
+{
+	return (x >> (FSI_MSTAP_ID0_SHFT - id * FSI_MAX_CASCADE))
+	       & FSI_MSTAP_MASK;
+}
+
+/* Extract crc counter */
+static inline u32 fsi_mstap_extcrc(u32 x)
+{
+	return (x >> FSI_MSTAP_CRC_SHFT) & FSI_MSTAP_CRC_MASK;
+}
+
+/*
+ * MECTRL Register
+ */
+#define	FSI_MECTRL_TP_SHFT		24	/* Shift for parity error generation */
+#define	FSI_MECTRL_TP_MASK		0xff	/* Mask for parity error generation */
+#define	FSI_MECTRL_IPE_SHFT		16	/* Shift for inhibit parity error */
+#define	FSI_MECTRL_IPE_MASK		0xff	/* Mask for inhibit parity error */
+#define	FSI_MECTRL_EOAE			0x8000	/* Enable machine check when master */
+#define	FSI_MECTRL_P8_AUTO_TERM		0x4000	/* Auto terminate */
+#define	FSI_MECTRL_FPME			0x2000	/* Freeze port on master error */
+#define	FSI_MECTRL_P8_SID_TO_3		0x0800	/* Force slave ID to 3 */
+
+/* Force parity error events */
+static inline u32 fsi_mectrl_fpe(int id)
+{
+	return (id & FSI_MECTRL_TP_MASK) << FSI_MECTRL_TP_SHFT;
+}
+
+/* Inhibit parity errors */
+static inline u32 fsi_mectrl_ipe(int id)
+{
+	return (id & FSI_MECTRL_IPE_MASK) << FSI_MECTRL_IPE_SHFT;
+}
+
+/*
+ * Returns the virtual address of the FSI slave configuration word 0 given
+ * the FSI slave engine 0 virtual address.
+ *
+ * NOTE: Assumes address space is mapped without holes. This is ok as both
+ * engines 2 2KB apart and Linux uses 4KB pages.
+ */
+static inline void *get_termva(void *slv_va)
+{
+	return (void *)((unsigned long)slv_va & ~0xfff);
+}
+
+static inline unsigned long get_termpa(unsigned long slv_pa)
+{
+	return slv_pa & ~0xfff;
+}
+
+struct master_quirks {
+	int break_cfam_id;
+	void (*port_reset)(struct fsidevice *, struct fsidevice *, int);
+	int (*send_break)(struct fsimaster *, void *, int, struct fsicfam *);
+	int (*break_set_cfam_id)(void *, int);
+};
+
+struct fsimaster {			/* FSI master definition */
+	struct fsimaster *parent;	/* Parent of this master */
+	char name[8];			/* Name for /sysfs */
+	unsigned long peek40c;		/* Peek engine identifications */
+	phys_addr_t membase;		/* Base MMIO address */
+	int irqbase;			/* Base IRQ number */
+	struct fsidevice *fsidev;	/* Pointer to fsi cascaded engine */
+	struct fsidevice *fsislv;	/* Pointer to fsi slave engine */
+	volatile u32 *mp;		/* Ptr to register space */
+	spinlock_t lock;		/* Lock */
+	unsigned int dcr_alloc: 1;	/* True if ioremap for dcr reg space */
+	unsigned int have_peek: 1;	/* True if peek engine read needed */
+	unsigned char myid;		/* FSI master identifier for traces */
+	unsigned char type;		/* Type FSI master */
+	unsigned char hw_version;	/* FSI master hardware version */
+	unsigned char maxlinks;		/* FSI master links */
+	struct fsilink *link[FSI_MAX_LINKS];
+	int (*write_f)(volatile u32 *, int, u32);	/* Write function */
+	int (*read_f)(volatile u32 *, int, u32 *);	/* Read function */
+	int (*write_f2)(volatile u32 *, int, u32 *);	/* Write function */
+	int (*read_f2)(volatile u32 *, int, u32 *);	/* Read function */
+	int (*read_f4)(volatile u32 *, int, u32 *);	/* Read function */
+	int (*write_f8)(volatile u32 *, int, u32 *);	/* Write function */
+	struct fsidevice * (*m_get)(struct fsimaster *, int, int);
+	int (*m_pa2irq)(struct fsimaster *, phys_addr_t);
+	void (*m_exit)(struct fsimaster *);
+	struct master_quirks quirks;	/* hardware quirks functions/data */
+	unsigned char srsic;		/* master specific register offset */
+	unsigned char srsim;		/* master specific register offset */
+	unsigned long cfam_size;	/* master specific cfam size */
+};
+#define to_fsimaster(a) container_of(a, struct fsimaster, kobj)
+#define to_fsimaster_probe(a)	container_of(a, struct fsimaster, hotp.probewrk)
+#define to_fsimaster_build(a)	container_of(a, struct fsimaster, hotp.buildwrk)
+
+/*
+ * Functions to create/delete an FSI Master
+ */
+struct fsimaster *fsimaster_build_init(struct fsimaster *, int,
+				       struct fsidevice *);
+struct fsimaster *fsimaster_build(int, struct fsidevice *);
+void fsimaster_free(struct fsimaster *);
+void fsimaster_put(struct fsimaster *);
+struct fsimaster *fsimaster_get(struct fsimaster *);
+struct fsimaster *fsimaster_find(phys_addr_t);
+int fsimaster_plugcheck(phys_addr_t);
+void fsimaster_start(struct fsimaster *);
+int fsimaster_stop(struct fsimaster *);
+void fsimaster_stopsync(struct fsimaster *);
+int fsi_linkbuild(struct fsimaster *, int);
+int fsi_linkdown(struct fsimaster *, int);
+void fsi_linklost(struct fsimaster *, int);
+
+/*
+ * Master commands
+ */
+int fsi_sendbreak(struct fsimaster *, void *, int, int);
+struct fsimaster * fsim_get_top_master(struct fsimaster *);
+#define FSI_TRACE_ERRORS 1
+
+/*
+ * FSI master register access functions (without locking)
+ */
+int fsim_reseterror_nl(struct fsimaster *, int);
+int fsim_resetgeneral_nl(struct fsimaster *, int);
+
+/*
+ * Helper utilities for register access
+ */
+int fsim_setspeed(struct fsimaster *, int, int);
+int fsim_ipoll_off_link_mask(struct fsimaster *, int, u32 *);
+int fsim_ipoll_off_link(struct fsimaster *, int);
+int fsim_ipoll_on_link(struct fsimaster *, int, u32);
+int fsim_disable_link(struct fsimaster *, int);
+int fsim_enable_link(struct fsimaster *, int);
+int fsim_r_menp(struct fsimaster *, u32 *);
+int fsim_r_menp_nl(struct fsimaster *, u32 *);
+int fsim_r_mmode(struct fsimaster *, u32 *);
+int fsim_r_mmode_nl(struct fsimaster *, u32 *);
+int fsim_r_mcrsp(struct fsimaster *, u32 *);
+int fsim_r_msiep(struct fsimaster *, u32 *);
+int fsim_r_msiep_nl(struct fsimaster *, u32 *);
+int fsim_w_msiep(struct fsimaster *, u32 *);
+int fsim_w_msiep_nl(struct fsimaster *, u32 *);
+int setup_me(struct fsimaster *, int);
+
+/*
+ * Utilities to decode master error registers
+ */
+int fsi_matrb_lsid(u32);
+unsigned long fsi_matrb_addr(unsigned long);
+
+/*
+ * Helper utilities for link/cfam calculations.
+ */
+phys_addr_t fsim_cfam2pa(struct fsimaster *, int, int);
+unsigned long fsim_linksz(struct fsimaster *);
+unsigned long fsim_cfamsz(struct fsimaster *);
+
+/*
+ * Helper utilities for IRQ number calculations.
+ */
+int fsim_pa2irq(struct fsimaster *, phys_addr_t);
+int fsi_pa2irq(phys_addr_t);
+
+/*
+ * Functions for link reference
+ */
+void fsim_linkref_add(struct fsimaster *, struct fsilink *);
+struct fsilink *fsim_linkref_del(struct fsimaster *, int);
+struct fsilink *fsim_linkref_markdel(struct fsimaster *, int);
+struct fsilink *fsim_linkget(struct fsimaster *, int);
+struct fsilink *fsim_linkget_inirq(struct fsimaster *, int);
+struct fsicfam *fsim_cfamget(struct fsimaster *, int, int);
+struct fsidevice *fsim_slvget(struct fsimaster *, int, int);
+struct fsidevice *fsim_slvget_inirq(struct fsimaster *, int, int);
+struct fsidevice *fsim_engget(struct fsimaster *, int, int, int);
+struct fsidevice *fsim_engget_inirq(struct fsimaster *, int, int, int);
+void fsim_linkput(struct fsilink *);
+void fsim_cfamput(struct fsicfam *);
+void fsim_slvput(struct fsidevice *);
+void fsim_engput(struct fsidevice *);
+void fsi_rst_error2(struct fsimaster *, struct fsidevice *, int, int, int, int);
+int port_reset(struct fsimaster *, int);
+
+#endif /* DRIVERS_FSIMASTER_H */
-- 
1.8.2.2
