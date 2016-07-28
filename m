Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x244.google.com (mail-oi0-x244.google.com
 [IPv6:2607:f8b0:4003:c06::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s0g4q1VQdzDqR4
 for <openbmc@lists.ozlabs.org>; Fri, 29 Jul 2016 04:15:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=HKw7PHes; 
 dkim-atps=neutral
Received: by mail-oi0-x244.google.com with SMTP id l9so5242406oih.0
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jul 2016 11:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ATNYMgdezL4QevZ+xk+O8YsQf1kcE5ZzjbgNlvSKwo8=;
 b=HKw7PHesp6OHz+e0NTdC9ETRsCqreuIcAlF7rS5N23rHXFSy3u0zAacQ+eV7Kz+8K4
 o8Lk+U9kci7jtygAXr97bBFf5tcDwFoXV26lBywVMvsSh90LE8S99p2xuok8qEfmbdXi
 SRFHITzdv9dtADsEip9GRUfiEEBHGr4TM9gAMYn5Hj9TEEgCjw5cwRfxskeJzK99Wq2j
 fGvQPxA0IxZWT7fMucHPlhyTLIeZZYBrOa/pvOBI49tZnkkXV/ZhLXVgVJ0ESRPJz2ev
 S2wba/MRDD3BNK3YEbC/MXxUGExUh4Dn3QNfD6CHv9qgfEBxyl1KPNG0fUXcG426MUlq
 lYtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ATNYMgdezL4QevZ+xk+O8YsQf1kcE5ZzjbgNlvSKwo8=;
 b=ZQuQNrIng6O/igWqm3ijF/W1Ar406BmuCS9yi4y0nQBxBwKSs2iD7KfcRnJ+/18UCZ
 uq2CJStXB0YM0kCh/0AlVYlST6kN6k8g87DCNvUT3egyfKoyF/o/U9xbDX6+s5g+uC2X
 LFIxOaszAujXaH2uS3x6NrdYQaxRNoA4JXO8gBW+8p6bzvY9yxnLOTHA9ialyredTP0j
 10XOXDFHtJwoVSJX1lfGrLNH75jKFFK2xXZTJuEStARKpBzt2/9RxDtVttYzdNk7eHIg
 V9j4kqWshglBg4yQLHGg03jtZwVIqYjEAutZoHXaMOsczE91S7Dq8rEeeJygojpfSi7W
 34mg==
X-Gm-Message-State: AEkoousfD2rDIfhzZZZoKsdXESblmznm4W56NjgT1A1NJDcrKvSXZSidzDeRKQ7lxQPOAg==
X-Received: by 10.202.227.137 with SMTP id a131mr20235989oih.132.1469729704737; 
 Thu, 28 Jul 2016 11:15:04 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id u8sm5088273otb.5.2016.07.28.11.15.03
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Thu, 28 Jul 2016 11:15:04 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux 4/4] drivers/fsi: Add FSI link buildup function
Date: Thu, 28 Jul 2016 13:14:58 -0500
Message-Id: <1469729698-37246-4-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Thu, 28 Jul 2016 18:15:08 -0000

From: Chris Bostic <cbostic@us.ibm.com>

Start the link buildup.  This begins the process of creating data structures
that represent the physical connections on FSI links - part of scan process.

Signed-off-by: Chris Bostic <cbostic@us.ibm.com>
---
 drivers/fsi/Makefile     |   2 +-
 drivers/fsi/build.c      | 124 +++++++++++++++
 drivers/fsi/fsi.h        |  28 ++++
 drivers/fsi/fsidefines.h |  43 +++--
 drivers/fsi/fsiinit.c    |  34 ++++
 drivers/fsi/fsiinit.h    |  12 ++
 drivers/fsi/fsilink.h    | 102 ++++++++++++
 drivers/fsi/fsimaster.c  | 223 +++++++++++++++++++++++++-
 drivers/fsi/fsimaster.h  |   8 +-
 drivers/fsi/fsislave.h   | 403 +++++++++++++++++++++++++++++++++++++++++++++++
 drivers/fsi/ldm.c        |  28 ++++
 drivers/fsi/readwrite.c  |  48 ++++++
 12 files changed, 1037 insertions(+), 18 deletions(-)
 create mode 100644 drivers/fsi/build.c
 create mode 100644 drivers/fsi/fsilink.h
 create mode 100644 drivers/fsi/fsislave.h
 create mode 100644 drivers/fsi/ldm.c
 create mode 100644 drivers/fsi/readwrite.c

diff --git a/drivers/fsi/Makefile b/drivers/fsi/Makefile
index 9800c15..2445cee 100644
--- a/drivers/fsi/Makefile
+++ b/drivers/fsi/Makefile
@@ -2,4 +2,4 @@
 # Makefile for the FSI bus specific drivers.
 #
 
-obj-y		+= fsiinit.o fsimaster.o
+obj-y		+= fsiinit.o fsimaster.o build.o readwrite.o ldm.o
diff --git a/drivers/fsi/build.c b/drivers/fsi/build.c
new file mode 100644
index 0000000..0045222
--- /dev/null
+++ b/drivers/fsi/build.c
@@ -0,0 +1,124 @@
+/*
+ * FSI Link Build up
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
+#include <linux/err.h>
+#include <linux/delay.h>
+#include <asm/io.h>
+#include "fsi.h"
+#include "fsidefines.h"
+#include "fsimaster.h"
+#include "fsicfam.h"
+#include "fsilink.h"
+
+static void link_release(struct device *devp)
+{
+}
+
+/*
+ * Allocate an FSI link structure and initialize it
+ */
+static struct fsilink *link_alloc(void)
+{
+	struct fsilink *link = fsi_calloc(sizeof * link, GFP_KERNEL);
+
+	return link;
+}
+
+/*
+ * Create a FSI link struct and assign it to the FSI tree
+ */
+static struct fsilink *link_add(struct fsimaster *p, int no)
+{
+	int rc = -ENOMEM;
+	struct fsilink *lp;
+	int id = 0;
+
+	id = fsi_mtype_2break_id(p->type);
+
+	if (!(lp = link_alloc()))
+		goto bad;
+
+	dev_set_name(&lp->fsidev.dev, "link-%d", no);
+	lp->id3_addr = fsim_cfam2pa(p, no, id);
+	lp->master = p;
+	lp->linkno = no;
+	lp->fsidev.map.paddr = fsim_cfam2pa(p, no, 0);
+	lp->fsidev.map.addr = lp->id3_addr;
+	lp->fsidev.map.cmtype = p->type;
+	lp->fsidev.id.engine_type = FSI_ENGID_LINK;
+	lp->fsidev.map.kb = fsim_linksz(p) / FSI_ENGINE_SIZE;
+	lp->fsidev.irq_start = FSI_IRQ_OFFSET + no
+				* (FSI_MAX_CASCADE * FSI_MAX_ENGINES);
+	lp->fsidev.irq_range = FSI_MAX_CASCADE * FSI_MAX_ENGINES;
+	if (!p->fsidev)
+		lp->fsidev.dev.parent = 0;
+	else
+		lp->fsidev.dev.parent = &p->fsidev->dev;
+	lp->fsidev.dev.release = link_release;
+
+	/* stub */
+bad:
+	return lp ? : ERR_PTR(rc);
+}
+
+static void linkbuild2(struct fsimaster *p, struct fsilink *lp)
+{
+}
+
+/*
+ * Return number of CFAMs discovered. If something fails during the build up
+ * process return error reason
+ */
+static int linkbuild1(struct fsimaster *p, int no)
+{
+	int i, rc = 0;
+	struct fsilink *lp = link_add(p, no);
+
+	if (IS_ERR(lp))
+		return PTR_ERR(lp);
+
+	/* stub */
+
+	linkbuild2(p, lp);
+	if ((i = lp->cascade) == 0) {
+
+		/* stub */
+
+		rc = -EIO;
+	} else {
+
+		/* stub */
+	}
+
+	return rc;
+}
+
+/*
+ * Build up a link.  Returns number of CFAMs discovered.
+ */
+int fsi_linkbuild(struct fsimaster *p, int no)
+{
+	int rc;
+	u32 menp[2];
+
+	if ((rc = fsim_r_menp(p, menp)))
+		goto bad;
+	if ((menp[no / BITS_PER_LONG] & mask32(no % BITS_PER_LONG))) {
+		return -EEXIST;  /* Already running */
+	}
+	if ((rc = fsim_enable_link(p, no)))
+		goto bad;
+	if ((rc = linkbuild1(p, no)) < 0)
+		fsim_disable_link(p, no);
+bad:
+	return rc;
+}
diff --git a/drivers/fsi/fsi.h b/drivers/fsi/fsi.h
index e17a419..26420da 100644
--- a/drivers/fsi/fsi.h
+++ b/drivers/fsi/fsi.h
@@ -15,10 +15,38 @@
 
 #include <linux/device.h>
 
+/*
+ * Engine ID's
+ */
+#define FSI_ENGID_LINK		0xff	/* Link Identifier */
+
+/* Engine ID as it appears in the CFAM configuration table */
+struct fsi_engine_id {
+	unsigned char match_flags;
+	unsigned char engine_type;
+	unsigned char engine_version;
+	unsigned char engine_vendor;
+};
+
+struct fsi_iaddr {
+	u32 addr;			/* Virtual address */
+	u32 paddr;			/* Physical address */
+	unsigned char cmtype;		/* Master type */
+	unsigned char eng;		/* Engine # on CFAM */
+	unsigned short kb;		/* # kb device uses */
+	unsigned short kb_off;		/* offset from beginning of CFAM */
+};
+
 struct fsidevice {
+	struct fsi_iaddr map;		/* Address info */
+	struct fsi_engine_id id;	/* Engine type/version */
 	unsigned long irq_start;	/* IRQ Number */
+	unsigned short irq_range;	/* Number of IRQs */
 	struct fsidevice *parent;	/* Parent of this device */
 	struct device dev;		/* LDM entry for bus */
 };
 
+int fsidev_register(struct fsidevice *, struct device_attribute **);
+int fsidev_register_nolock(struct fsidevice *, struct device_attribute **);
+
 #endif /* DRIVERS_FSI_H */
diff --git a/drivers/fsi/fsidefines.h b/drivers/fsi/fsidefines.h
index bf72ec438..da6c268 100644
--- a/drivers/fsi/fsidefines.h
+++ b/drivers/fsi/fsidefines.h
@@ -50,14 +50,22 @@
 #define	FSI_PA16_SHIFT		16		/* For 16 bit pa conversions */
 
 /* FSI Events */
-#define FSI_EVT_PLUG		5		/* Link hot plug add detected */
-#define FSIDD_BUILD		9		/* In build up phase */
-#define FSIDD_PROBE		10		/* In probe phase */
+#define FSI_EVT_LBUSLOST	1		/* Local bus loss detected */
+#define FSI_EVT_LBUSRECV	2		/* Local bus gain detected */
+#define FSI_EVT_IRQLOOP		3		/* IRQ loop detected */
+#define FSI_EVT_LINKCHG		4		/* Link state change */
+#define FSI_EVT_UNPLUG		5		/* Hot plug IRQ unplug */
+#define FSI_EVT_PLUG		6		/* Hot plug IRQ plug */
+#define FSI_EVT_CFAMADD		7		/* CFAM buildup via sysfs */
+#define FSI_EVT_CFAMDELETE	8		/* CFAM removal via sysfs */
+#define FSI_EVT_CFAMDEAD	9		/* CFAM init failed */
+#define FSIDD_BUILD		10		/* In build up phase */
+#define FSIDD_PROBE		11		/* In probe phase */
 
 /*
  * Return FSI physical address without type information (last 2 bits)
  */
-static inline phys_addr_t fsi_panot(phys_addr_t pa)
+static inline u32 fsi_panot(u32 pa)
 {
 	return pa & ~FSI_MBIT_MASK;
 }
@@ -65,7 +73,7 @@ static inline phys_addr_t fsi_panot(phys_addr_t pa)
 /*
  * Return type of FSI master this physical address belongs to
  */
-static inline int fsi_pa2mtype(phys_addr_t pa)
+static inline int fsi_pa2mtype(u32 pa)
 {
 	return pa & FSI_MBIT_MASK;
 }
@@ -73,7 +81,7 @@ static inline int fsi_pa2mtype(phys_addr_t pa)
 /*
  * Add type of FSI master to physical address
  */
-static inline phys_addr_t fsi_mtype2pa(phys_addr_t pa, unsigned char type)
+static inline u32 fsi_mtype2pa(u32 pa, unsigned char type)
 {
 	return fsi_panot(pa) | (type & FSI_MBIT_MASK);
 }
@@ -81,15 +89,15 @@ static inline phys_addr_t fsi_mtype2pa(phys_addr_t pa, unsigned char type)
 /*
  * Extract link number from physical address
  */
-static inline int fsi_pa2link(phys_addr_t addr)
+static inline int fsi_pa2link(u32 pa)
 {
-	return (addr >> FSI_LINK_SHIFT) & (FSI_LINK_MASK >> FSI_LINK_SHIFT);
+	return (pa >> FSI_LINK_SHIFT) & (FSI_LINK_MASK >> FSI_LINK_SHIFT);
 }
 
 /*
  * Extract cfam number from physical address
  */
-static inline int fsi_pa2cfam(phys_addr_t addr)
+static inline int fsi_pa2cfam(u32 pa)
 {
 	 /* Stub */
 	return 0;
@@ -127,4 +135,21 @@ void fsi_exit_fileio(dev_t);
 int fsibus_init(void);
 void fsibus_exit(void);
 
+/*
+ * I/O access and wrappers
+ */
+int fsi_readw_int2(u32, u32 *);
+int fsi_writew_int2(u32, u32);
+int fsi_writew_int(u32, u32);
+int fsi_readw_int(u32, u32 *);
+int fsi_writew_int(u32, u32);
+
+/*
+ * Memory allocation
+ */
+void fsi_cfree(void *, size_t);
+void *fsi_calloc(size_t, int);
+void fsi_showmemstat(void);
+void fsi_ioused(void);
+
 #endif /* DRIVERS_FSIDEFINES_H */
diff --git a/drivers/fsi/fsiinit.c b/drivers/fsi/fsiinit.c
index 3330d8b..4b17837 100644
--- a/drivers/fsi/fsiinit.c
+++ b/drivers/fsi/fsiinit.c
@@ -14,8 +14,11 @@
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/kdev_t.h>
+#include <linux/io.h>
+#include <linux/slab.h>
 #include "fsiinit.h"
 #include "fsimaster.h"
+#include "fsidefines.h"
 
 MODULE_AUTHOR("Christopher Bostic cbostic@us.ibm.com");
 MODULE_DESCRIPTION("FSI master device driver");
@@ -26,6 +29,8 @@ MODULE_DESCRIPTION("FSI master device driver");
 #define	FSIDD_VER(x)	FSIDD_TOSTR(x)
 
 struct primaster prim;
+static unsigned long malloc_cnt, free_cnt;
+
 EXPORT_SYMBOL(prim);
 
 struct fsidd fsidd = {		/* FSI device driver structure definition */
@@ -34,6 +39,35 @@ struct fsidd fsidd = {		/* FSI device driver structure definition */
 	.major = MKDEV(FSIDD_MAJOR, 0),
 };
 
+void *fsi_calloc(size_t size, int flags)
+{
+	void *p;
+
+	malloc_cnt += size;
+	p = kzalloc(size, flags);
+
+	return p;
+}
+EXPORT_SYMBOL(fsi_calloc);
+
+void fsi_cfree(void *p, size_t size)
+{
+	free_cnt += size;
+	kfree(p);
+}
+
+void fsi_showmemstat(void)
+{
+}
+
+void fsi_ioused(void)
+{
+}
+
+void fsi_lock_mutex(enum fsi_mutex_fkt fkt)
+{
+}
+
 static int fsi_start(void)
 {
 	int rc = 0;
diff --git a/drivers/fsi/fsiinit.h b/drivers/fsi/fsiinit.h
index 059187f..a63d443 100644
--- a/drivers/fsi/fsiinit.h
+++ b/drivers/fsi/fsiinit.h
@@ -40,4 +40,16 @@ struct fsidd {				/* FSI Main structure */
 
 #define to_fsidd_prim(a)	container_of(a, struct fsidd, pri_master)
 
+enum fsi_mutex_fkt {
+	LOCK_BUILD = 1,
+	LOCK_ACTIVATE = 2,
+	LOCK_DEACTIVATE = 3,
+	LOCK_MUXCHANGE = 4,
+	LOCK_FSIUNREG = 5,
+	LOCK_FSIREG = 6
+};
+
+void fsi_lock_mutex(enum fsi_mutex_fkt);
+void fsi_unlock_mutex(enum fsi_mutex_fkt);
+
 #endif /* DRIVERS_FSIINIT_H */
diff --git a/drivers/fsi/fsilink.h b/drivers/fsi/fsilink.h
new file mode 100644
index 0000000..9c575c7
--- /dev/null
+++ b/drivers/fsi/fsilink.h
@@ -0,0 +1,102 @@
+/*
+ * FSI link structure definitions and defines
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
+#ifndef DRIVERS_FSILINK_H
+#define DRIVERS_FSILINK_H
+
+#include <linux/types.h>
+#include <linux/kobject.h>
+#include <linux/device.h>
+
+#include "fsi.h"
+#include "fsidefines.h"
+
+/*
+ * Extended FSI error counting and thresholding. Count the FSI errors with
+ * time they occured.
+ */
+#define	FSI_MAX_PE	6		/* Max # of FSI port errors */
+#define	FSI_MAX_ME	11		/* Max # of FSI master errors */
+#define	FSI_MAX_SE	10		/* Max # of FSI slave V3 errors */
+#define	FSI_MAX_SEV2	6		/* Max # of FSI slave V2 errors */
+
+struct fsi_ecnt {			/* Structure for counting errors */
+	unsigned short cnt;		/* Counter */
+	struct timeval seen_1st;	/* First occurance */
+	struct timeval seen_last;	/* Last occurance */
+};
+
+struct fsi_eport {			/* Port error statistics */
+	unsigned short pec[FSI_MAX_PE];	/* Port errors counter per type */
+	unsigned short pcrc_cnt;	/* Recovered CRC counter port */
+};
+
+struct fsi_eslv {			/* Slave error statistics */
+	unsigned short sec[FSI_MAX_SE];	/* Slave errors counter per type  */
+	unsigned short scrc_cnt;	/* Recovered CRC counter slave */
+};
+
+struct fsi_emaster {			/* Master error statistics */
+	unsigned short mec[FSI_MAX_ME];	/* Master errors counter per type */
+	unsigned short mcrc_cnt;	/* Recovered CRC counter master */
+};
+
+struct fsi_elink {			/* Link error statistics */
+	struct fsi_emaster master;	/* Master errors */
+	struct fsi_eport port;		/* Port errors */
+	struct fsi_eslv slv[FSI_MAX_CASCADE];	/* Slave errors */
+	struct fsi_ecnt breaked;	/* BREAK command sent */
+};
+
+enum fsilink_state {			/* Bit mask for error states */
+	fsilink_lost = 1,		/* Link already schedule for removal */
+	fsilink_up = 2,			/* Link up & running */
+	fsilink_going = 3		/* Link removal in progress */
+};
+
+struct fsilink {			/* Information per link */
+	unsigned long magic;		/* Magic number */
+	unsigned long strno;		/* Structure version number */
+	unsigned char speedset;		/* Link speed set (0 or 1) */
+	unsigned char cascade;		/* Length of cascade */
+	unsigned char top_cfam;		/* # CFAM found on initial scan */
+	unsigned char linkno;		/* Number of this link */
+	unsigned long state;		/* Bit mask for error states */
+	struct fsicfam *cfams[FSI_MAX_CASCADE];	/* CFAMs per link */
+	struct fsidevice fsidev;
+	u32 id3_addr;			/* CFAM id3 page */
+	struct fsimaster *master;	/* Ptr to controlling fsi master */
+	struct fsi_elink error;		/* Errors on this link */
+};
+
+#define FSILINK_ATTR(_name, _mode, _show, _store)	\
+struct device_attribute fsilink_attr_##_name = {	\
+	.attr = {					\
+		.name = __stringify(_name),		\
+		.mode = _mode,				\
+	},						\
+	.show	= _show,				\
+	.store	= _store				\
+}
+
+/*
+ * Pointer conversion from fsidevice member to fsilink.
+ */
+#define	to_fsilink(x)	container_of((x), struct fsilink, fsidev)
+
+unsigned char fsilink_get_top_cfam(struct fsilink *);
+unsigned char fsilink_get_linkno(struct fsilink *);
+unsigned long fsilink_get_state(struct fsilink *);
+struct fsicfam * fsilink_get_cfam(struct fsilink *, int);
+struct device * fsilink_get_device(struct fsilink *);
+
+#endif /* DRIVERS_FSILINK_H */
diff --git a/drivers/fsi/fsimaster.c b/drivers/fsi/fsimaster.c
index 0827f0b..59af679 100644
--- a/drivers/fsi/fsimaster.c
+++ b/drivers/fsi/fsimaster.c
@@ -19,6 +19,7 @@
 #include "fsiinit.h"
 #include "fsimaster.h"
 #include "fsicfam.h"
+#include "fsislave.h"
 
 extern struct primaster prim;
 
@@ -37,11 +38,6 @@ static int fsi_nextbit(u32 *new, int words)
 	return -1;
 }
 
-u32 fsim_cfam2pa(struct fsimaster *p, int link, int cfam)
-{
-	return 0;
-}
-
 static int hpinfo_alloc(struct fsimaster *p)
 {
 	return 0;
@@ -186,6 +182,9 @@ static int fsimaster_init(struct fsimaster *p)
 	return rc;
 }
 
+/*
+ * Retrieve the first master in the chain
+ */
 struct fsimaster * fsim_get_top_master(struct fsimaster *p)
 {
 	struct fsimaster *parent = NULL;
@@ -199,10 +198,194 @@ struct fsimaster * fsim_get_top_master(struct fsimaster *p)
 }
 
 /*
+ * Get the address window of a link/CFAM
+ */
+unsigned long fsim_cfamsz(struct fsimaster *p)
+{
+	return p->cfam_size;
+}
+
+unsigned long fsim_linksz(struct fsimaster *p)
+{
+	return FSI_MAX_CASCADE * fsim_cfamsz(p);
+}
+
+/*
+ * Convert link number to a physical address
+ */
+u32 fsim_link2pa(struct fsimaster *p, int link)
+{
+	unsigned long offset;
+
+	offset = link * fsim_linksz(p);
+	return p->membase + offset;
+}
+
+/*
+ * Convert a link and CFAM number to a physical address
+ */
+u32 fsim_cfam2pa(struct fsimaster *p, int link, int cfam)
+{
+	unsigned long offset;
+
+	offset = link * fsim_linksz(p) + cfam * fsim_cfamsz(p);
+	return p->membase + offset;
+}
+
+int fsim_pa2irq(struct fsimaster *p, u32 pa)
+{
+	return 0;
+}
+
+int fsi_pa2irq(u32 pa)
+{
+	return 0;
+}
+
+/*
+ * FSI master register access utilities
+ */
+int fsim_r_mmode_nl(struct fsimaster *p, u32 *value)
+{
+	return (*p->read_f)(p->mp, FSI_N_MMODE, value);
+}
+
+int fsim_r_mmode(struct fsimaster *p, u32 *value)
+{
+	return 0;
+}
+
+int fsim_w_mmode(struct fsimaster *p, u32 value)
+{
+	return 0;
+}
+
+int fsim_r_menp_nl(struct fsimaster *p, u32 *menp)
+{
+	return 0;
+}
+
+int fsim_r_menp(struct fsimaster *p, u32 *menp)
+{
+	return 0;
+}
+
+int fsim_w_menp(struct fsimaster *p, u32 *menp, int on_off)
+{
+	return 0;
+}
+
+int fsim_disable_link(struct fsimaster *p, int link)
+{
+	return 0;
+}
+
+int fsim_enable_link(struct fsimaster *p, int link)
+{
+	return 0;
+}
+
+/*
+ * Send out a BREAK command and see if anything responds.  Part of the
+ * FSI device scan process.
+ */
+static int ping_cfam(struct fsimaster *p, struct hp_info *hp, const int count)
+{
+	int i = 0, rc = -EIO;
+	u32 value, pa;
+	int id = fsi_mtype_2break_id(p->type);
+
+	pa = fsim_cfam2pa(p, hp->linkno, id);
+
+	if (fsim_enable_link(p, hp->linkno)) {
+		goto out;
+	}
+	if (fsi_sendbreak(p, pa, hp->linkno)) {
+		goto out;
+	}
+	while (i++ < count) {
+		if ((rc = fsi_readw_int(pa + FSI_SLAVE0_OFFSET + FSI_SMODE,
+					&value)) == 0) {
+			break;
+		}
+		udelay(FSI_CFAM_PING_DELAY);
+	}
+out:
+	if (fsim_disable_link(p, hp->linkno) && rc == 0) {
+		rc = -EIO;
+	}
+
+	return rc;
+}
+
+/*
+ * Probe for CFAMs
+ */
+static int probe_link(struct fsimaster *p, struct hp_info *hp)
+{
+	int rc = 0;
+	struct fsidd *dd = to_fsidd_prim(fsim_get_top_master(p));
+
+	hp->tries++;
+	rc = ping_cfam(p, hp, FSI_MAX_CASCADE - 1);
+	if (rc == 0) {
+		atomic_set(&hp->state, FSI_LINK_INBUILD);
+		set_bit(FSIDD_BUILD, &dd->state);
+		set_bit(hp->linkno, p->hotp.building);
+		clear_bit(hp->linkno, p->hotp.probing);
+		rc = 1;
+	} else if (hp->tries > FSI_MAX_PING_ATTEMPTS) {
+		atomic_set(&hp->state, FSI_LINK_DEAD);
+		clear_bit(hp->linkno, p->hotp.probing);
+	}
+
+	return rc;
+}
+
+/*
  * Work queue function to probe for links
  */
 static void probe_wq(struct work_struct *nix)
 {
+	struct fsimaster *p = to_fsimaster_probe(nix);
+	struct fsidd *dd = to_fsidd_prim(fsim_get_top_master(p));
+	int i, cnt = 0;
+
+	for (i = 0; i < p->maxlinks; ++i) {
+		if (test_bit(i, p->hotp.probing)) {
+			cnt += probe_link(p, p->hotp.plug[i]);
+		}
+	}
+	if (cnt)
+		queue_work(dd->hotp_wq, &p->hotp.buildwrk);
+}
+
+/*
+ * Called from worker in process/task context.
+ */
+static int build(struct fsimaster *p, struct hp_info *hp)
+{
+	int rc;
+
+	rc = fsi_linkbuild(p, hp->linkno);
+	atomic_set(&hp->state, rc ? FSI_LINK_RUNNING : FSI_LINK_DEAD);
+	if( test_and_clear_bit(FSI_LINK_WAITFOR, &hp->state_w))
+		complete_all(&hp->done);
+
+	return rc;
+}
+
+static int remove(struct fsimaster *p, struct hp_info *hp)
+{
+	return 0;
+}
+
+/*
+ * Actual link build function.  Called in process context.
+ */
+static void build_link(struct fsimaster *p, struct hp_info *hp)
+{
+	hp->ec = (hp->cmd == FSI_EVT_CFAMADD) ? build(p, hp) : remove(p, hp);
 }
 
 /*
@@ -210,6 +393,36 @@ static void probe_wq(struct work_struct *nix)
  */
 static void build_wq(struct work_struct *nix)
 {
+	struct fsimaster *p = to_fsimaster_build(nix);
+	struct fsidd *dd = to_fsidd_prim(fsim_get_top_master(p));
+	int i;
+
+	set_bit(FSIDD_BUILD, &dd->state);
+again:
+	fsi_lock_mutex(LOCK_BUILD);
+	for (i = 0; i < p->maxlinks; ++i) {
+		if (test_and_clear_bit(i % BITS_PER_LONG,
+					&p->hotp.building[i / BITS_PER_LONG]))
+			build_link(p, p->hotp.plug[i]);
+	}
+
+	/* stub */
+
+	/*
+	 * Make sure all bits are cleared before leaving.
+	 * This worker runs in process context.  While running, an FSI error
+	 * interrupt can occur and schedule a link for removal.
+	 * If we are past this new bit in our loop above, the link is not
+	 * removed.  iterate on non zero.
+	 */
+	if (p->hotp.building[0] || p->hotp.building[1])
+		goto again;
+
+	/*
+	 * If the same described above happens here, we are toast again.
+	 * So another periodic check is done on plugmgr()
+	 */
+	clear_bit(FSIDD_BUILD, &dd->state);
 }
 
 static int fsimaster_reset(struct fsimaster *p)
diff --git a/drivers/fsi/fsimaster.h b/drivers/fsi/fsimaster.h
index 40f4f4c..5474a72 100644
--- a/drivers/fsi/fsimaster.h
+++ b/drivers/fsi/fsimaster.h
@@ -20,6 +20,7 @@
 #define FSI_MAX_PING_ATTEMPTS	12
 #define	FSI_DFLT_PLUG_CHECK	100
 #define FSI_DFLT_IPOLL_CHECK	800
+#define FSI_CFAM_PING_DELAY	20	/* in uS */
 
 /* Link states */
 #define FSI_LINK_FREE		1	/* Nothing plugged */
@@ -536,6 +537,7 @@ struct hp_info {			/* Hot plug information */
 	struct completion done;		/* Link build done */
 	unsigned short tries;		/* # of tries before probing */
 	unsigned char linkno;		/* Link # */
+	unsigned char cmd;		/* State add/delete */
 	atomic_t state;			/* State of this entry */
 	int ec;				/* Error code */
 	unsigned long state_w;		/* Wait state */
@@ -616,7 +618,7 @@ void fsi_linklost(struct fsimaster *, int);
 /*
  * Master commands
  */
-int fsi_sendbreak(struct fsimaster *, void *, int, int);
+int fsi_sendbreak(struct fsimaster *, u32, int);
 struct fsimaster * fsim_get_top_master(struct fsimaster *);
 #define FSI_TRACE_ERRORS 1
 
@@ -662,8 +664,8 @@ unsigned long fsim_cfamsz(struct fsimaster *);
 /*
  * Helper utilities for IRQ number calculations.
  */
-int fsim_pa2irq(struct fsimaster *, phys_addr_t);
-int fsi_pa2irq(phys_addr_t);
+int fsim_pa2irq(struct fsimaster *, u32);
+int fsi_pa2irq(u32);
 
 /*
  * Functions for link reference
diff --git a/drivers/fsi/fsislave.h b/drivers/fsi/fsislave.h
new file mode 100644
index 0000000..d39384b
--- /dev/null
+++ b/drivers/fsi/fsislave.h
@@ -0,0 +1,403 @@
+/*
+ * FSI slave structure definitions and defines
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
+#ifndef	DRIVERS_FSISLAVE_H
+#define	DRIVERS_FSISLAVE_H
+
+/*
+ * Define read address for peek engine refering to side/series/node-id/frame-id
+ */
+#define FSI_PEEK_IDADDR	0xc
+
+#define FSI_SLV_CFAM_OFFSET 0x800
+
+/*
+ * Defines for address locations of certain register in FSI Slave. All register
+ * names start with FSI_S for slave register. Some registers have the
+ * same address but different meanings for read and write access.
+ */
+#define	FSI_SMODE	0x0	/* R/W: Slave mode register */
+#define	FSI_SDMA	0x4	/* R/W: DMA control register */
+#define	FSI_SISC	0x8	/* Read: read Interrupt condition register */
+#define	FSI_SCISC	0x8	/* Write: Clear Interrupt condition register */
+#define	FSI_SISM	0xC	/* R/W: Interrupt mask register */
+#define	FSI_SISS	0x10	/* Read: Interrupt status register */
+#define	FSI_SSISM	0x10	/* Write: Set interrupt mask */
+#define	FSI_SSTAT	0x14	/* Read: Read slave status register */
+#define	FSI_SCISM	0x14	/* Write: Clear interrupt mask */
+#define	FSI_SI1M	0x18	/* R/W: Interrupt 1 mask register */
+#define	FSI_SI1S	0x1C	/* Read: Read Interrupt 1 status register */
+#define	FSI_SSI1M	0x1C	/* Write: Set Interrupt 1 mask register */
+#define	FSI_SIC		0x20	/* Read: Read engine interrupt condition reg */
+#define	FSI_SCI1M	0x20	/* Write: Clear Interrupt 1 mask register */
+#define	FSI_SI2M	0x24	/* R/W: Interrupt 2 mask register */
+#define	FSI_SI2S	0x28	/* Read: Read Interrupt 2 status register */
+#define	FSI_SSI2M	0x28	/* Write: Set Interrupt 2 mask register */
+#define	FSI_SCMDT	0x2C	/* Read: Command trace register */
+#define	FSI_SCI2M	0x2C	/* Write: Clear Interrupt 2 mask register */
+#define	FSI_SDATAT	0x30	/* Read: Data trace register */
+#define	FSI_SLBUS	0x30	/* Write: local bus address commands */
+#define	FSI_SLASTD	0x34	/* Read: Last data send register */
+#define	FSI_SRES	0x34	/* Write: Reset command register */
+#define	FSI_SMBL	0x38	/* R/W: Mailbox register left port */
+#define	FSI_SOML	0x3C	/* Read: Mailbox old data register left port */
+#define	FSI_SSMBL	0x3C	/* Write: Set Mailbox bits register left port */
+#define	FSI_SNML	0x40	/* Read: Mailbox new data register left port */
+#define	FSI_SCMBL	0x40	/* Write: Clear mailbox bits left port */
+#define FSI_SMBR	0x44	/* R/W: Mailbox register right port */
+#define FSI_SOMR	0x48	/* Read: Mailbox old data register right port */
+#define FSI_SSMBR	0x48	/* Write: Set Mailbox bits register right port*/
+#define FSI_SNMR	0x4c	/* Read: Mailbox new data register right port */
+#define FSI_SCMBR	0x4c	/* Write: Clear mailbox bits right port */
+
+/* Same as above except Word offsets into the FSI slave engine */
+#define FSI_N_SISC	0x2	/* Read: read Interrupt condition register */
+#define FSI_N_SSTAT	0x5	/* Read: Slave Status register */
+#define FSI_N_SCMDT	0xB	/* Read: Command trace register */
+#define FSI_N_SDATAT	0xC	/* Read: Data trace register */
+#define FSI_N_SLASTD	0xD	/* Read: Last data send register */
+
+/* Next registers are only valid for FSI slave version 3 */
+#define FSI_SRSIC	0x50	/* Read slave remote slave IRQ condition */
+#define FSI_SCRSIC	0x50	/* Write: Clear Slave remote slave IRQ cond */
+#define FSI_SRSIM	0x54	/* R/W: Slave remote slave IRQ mask */
+#define FSI_SRSIS	0x58	/* Read: Slave remote slave IRQ status */
+
+/* Next registers are only valid for FSI slave version 4 */
+/* cmFSI */
+#define FSI_ScRSIC0	0x50	/* Read / Write: to clear cmFSI remote */
+/* slave IRQ condition ports 0-3 */
+#define FSI_ScRSIC4	0x54	/* Read / Write: to clear cmFSI remote */
+/* slave IRQ condition ports 4-7 */
+#define FSI_ScRSIM0	0x58	/* R/W: cmFSI remote slave IRQ mask */
+/* ports 0-3 */
+#define FSI_ScRSIM4	0x5C	/* R/W: cmFSI remote slave IRQ mask */
+/* ports 4-7 */
+#define FSI_ScRSIS0	0x60	/* Read: cmFSI remote slave IRQ status */
+/* ports 0-3 */
+#define FSI_ScRSIS4	0x64	/* Read: cMFSI remote slave IRQ status */
+/* ports 4-7 */
+/* hFSI */
+#define FSI_SRSIC0	0x68	/* Read / Write: to clear hFSI remote */
+/* slave IRQ condition ports 0-3 */
+#define FSI_SRSIC4	0x6C	/* Read / Write: to clear hFSI remote */
+/* slave IRQ condition ports 4-7 */
+#define FSI_SRSIM0	0x70	/* R/W: hFSI remote slave IRQ mask */
+/* ports 0-3 */
+#define FSI_SRSIM4	0x74	/* R/W: hFSI remote slave IRQ mask */
+/* ports 4-7 */
+#define FSI_SRSIS0	0x78	/* Read: hFSI remote slave IRQ status */
+/* ports 0-3 */
+#define FSI_SRSIS4	0x7C	/* Read: hFSI remote slave IRQ status */
+/* ports 4-7 */
+
+#define FSI_SRSIM_SID3_SHIFT	6
+
+/* Slave ID 3 on interrupt level 1 for all sub/hub links */
+#define SRSIM_ID3_IRPT1_MASK	0x02020202
+#define SRSIM_MAGIC  		SRSIM_ID3_IRPT1_MASK
+
+struct fsi_sreg {		/* FSI slave register definition */
+	u32 smode;		/* 0x0: Mode register */
+	u32 sdma;		/* 0x4: DMA control register */
+	u32 sisc;		/* 0x8: Slave interrupt condition register */
+	u32 sism;		/* 0xc: Slave interrupt mask register */
+	u32 siss;		/* 0x10: Slave interrupt status register */
+	u32 sstat;		/* 0x14: Slave status register */
+	u32 si1m;		/* 0x18: interrupt 1 mask register */
+	u32 si1s;		/* 0x1c: interrupt 1 status register */
+	u32 sic;		/* 0x20: engine interrupt condition register */
+	u32 si2m;		/* 0x24: interrupt 2 mask register */
+	u32 si2s;		/* 0x28: interrupt 2 status register */
+	u32 scmdt;		/* 0x2c: read command trace register */
+	u32 sdatat;		/* 0x30: read data trace register */
+	u32 slastd;		/* 0x34: read last FSI data register */
+	u32 smbl;		/* 0x38: mail box to left port register */
+	u32 soml;		/* 0x3c: old mail left port register */
+	u32 snml;		/* 0x40: new mail left port register */
+	u32 smbr;		/* 0x44: mail box to right port register */
+	u32 somr;		/* 0x48: old mail right port register */
+	u32 snmr;		/* 0x4c: new mail right port register */
+	u32 srsic0;		/* 0x50: slave remote slave IRQ cond. 0-3 */
+	u32 srsic4;		/* 0x54: slave remote slave IRQ cond. 4-7 */
+	u32 srsim0;		/* 0x58: slave remote slave IRQ mask 0-3 */
+	u32 srsim4;		/* 0x5C: slave remote slave IRQ mask 4-7 */
+	u32 srsis0;		/* 0x60: slave remote slave IRQ stat 0-3 */
+	u32 srsis4;		/* 0x64: slave remote slave IRQ stat 4-7 */
+};
+
+/*
+ * FSI slave mode register
+ */
+#define	FSI_SMODE_WSC		0x80000000	/* Warm start completed */
+#define	FSI_SMODE_EAP		0x40000000	/* Enable auxiliary port */
+#define	FSI_SMODE_ECRC		0x20000000	/* Enable CRC checking by hw */
+#define	FSI_SMODE_SID_SHIFT	24		/* Slave identifier shift */
+#define	FSI_SMODE_SID_MASK	3		/* Slave identifier mask */
+#define	FSI_SMODE_ED_SHIFT	20		/* Echo delay cycles shift */
+#define	FSI_SMODE_ED_MASK	0xf		/* Echo delay cycles mask */
+#define	FSI_SMODE_SD_SHIFT	16		/* Send delay cycles shift */
+#define	FSI_SMODE_SD_MASK	0xf		/* Send delay cycles mask */
+#define	FSI_SMODE_LBCRR_SHIFT	8		/* Local bus clk rate shift */
+#define	FSI_SMODE_LBCRR_MASK	0xf		/* Local bus clk rate mask */
+#define	FSI_SMODE_BDL_SHIFT	4		/* Briefing data left shift */
+#define	FSI_SMODE_BDL_MASK	0xf		/* Briefing data mask */
+#define	FSI_SMODE_BDR_SHIFT	0		/* Briefing data right shift */
+#define	FSI_SMODE_BDR_MASK	0xf		/* Briefing data mask */
+#define	FSI_SMODE_RSV_MASK	0xe3ff0fff	/* Mask for used bit clr rsvd */
+
+/* FSI slave local bus echo delay */
+static inline u32 fsi_smode_echodly(int x)
+{
+	return (x & FSI_SMODE_ED_MASK) << FSI_SMODE_ED_SHIFT;
+}
+
+/* FSI slave local bus send delay */
+static inline u32 fsi_smode_senddly(int x)
+{
+	return (x & FSI_SMODE_SD_MASK) << FSI_SMODE_SD_SHIFT;
+}
+
+/* FSI slave local bus clock rate ratio */
+static inline int fsi_smode_extlbcrr(u32 x)
+{
+	return (x >> FSI_SMODE_LBCRR_SHIFT) & FSI_SMODE_LBCRR_MASK;
+}
+
+/* FSI slave local bus clock rate ratio */
+static inline u32 fsi_smode_lbcrr(int x)
+{
+	return (x & FSI_SMODE_LBCRR_MASK) << FSI_SMODE_LBCRR_SHIFT;
+}
+
+/* FSI slave identifier setting */
+static inline u32 fsi_smode_sid(int x)
+{
+	return (x & FSI_SMODE_SID_MASK) << FSI_SMODE_SID_SHIFT;
+}
+
+/* FSI slave briefing data right port */
+static inline u32 fsi_smode_bdr(int x)
+{
+	return (x & FSI_SMODE_BDR_MASK) << FSI_SMODE_BDR_SHIFT;
+}
+
+static inline int fsi_smode_extbdr(u32 x)
+{
+	return (x >> FSI_SMODE_BDR_SHIFT) & FSI_SMODE_BDR_MASK;
+}
+
+/* FSI slave briefing data left port */
+static inline u32 fsi_smode_bdl(int x)
+{
+	return (x & FSI_SMODE_BDL_MASK) << FSI_SMODE_BDL_SHIFT;
+}
+
+static inline int fsi_smode_extbdl(u32 x)
+{
+	return (x >> FSI_SMODE_BDL_SHIFT) & FSI_SMODE_BDL_MASK;
+}
+
+/* FSI slave echo delay */
+static inline u32 fsi_smode_ed(int x)
+{
+	return (x & FSI_SMODE_ED_MASK) << FSI_SMODE_ED_SHIFT;
+}
+
+static inline int fsi_smode_exted(u32 x)
+{
+	return (x >> FSI_SMODE_ED_SHIFT) & FSI_SMODE_ED_MASK;
+}
+
+/* FSI slave send delay */
+static inline u32 fsi_smode_sd(int x)
+{
+	return (x & FSI_SMODE_SD_MASK) << FSI_SMODE_SD_SHIFT;
+}
+
+static inline int fsi_smode_extsd(u32 x)
+{
+	return (x >> FSI_SMODE_SD_SHIFT) & FSI_SMODE_SD_MASK;
+}
+
+/*
+ * FSI slave interrupt register: interrupt conditions, status and mask
+ */
+#define	FSI_SSI_CRCE		0x80000000	/* FSI CRC error */
+#define	FSI_SSI_PROTE		0x40000000	/* FSI protocol error */
+#define	FSI_SSI_LBPE		0x20000000	/* FSI local bus parity error */
+#define	FSI_SSI_LBPROTE		0x10000000	/* FSI local bus protocol err */
+#define	FSI_SSI_LBAE		0x08000000	/* FSI local bus access error */
+#define	FSI_SSI_LBOE		0x04000000	/* FSI local bus owner error */
+#define	FSI_SSI_LBOC		0x02000000	/* FSI local bus owner change */
+#define	FSI_SSI_HPE		0x01000000	/* Hot plug event */
+#define	FSI_SSI_MRL		0x00800000	/* Mail received left port */
+#define	FSI_SSI_MDL		0x00400000	/* Mail send left port */
+#define	FSI_SSI_WSL		0x00200000	/* Warm start flag left port */
+#define	FSI_SSI_LBRL		0x00100000	/* Local bus requ left port */
+#define	FSI_SSI_MRR		0x00080000	/* Mail received right port */
+#define	FSI_SSI_MDR		0x00040000	/* Mail delivered right port */
+#define	FSI_SSI_WSR		0x00020000	/* Warm start flag right port */
+#define	FSI_SSI_LBRR		0x00010000	/* Local bus req right port */
+#define	FSI_SSI_CMEL		0x00008000	/* Clocks monitor event left */
+#define	FSI_SSI_CMER		0x00004000	/* Clocks monitor event right */
+#define	FSI_SSI_OPB_FNC		0x00001000	/* OPB Fenced (cMFSI & hMFSI) */
+#define	FSI_SSI_OBP_PA		0x00000800	/* OPB Parity (cMFSI) */
+#define	FSI_SSI_OBP_PR		0x00000400	/* OPB Protocol (cMFSI) */
+#define	FSI_SSI_OBP_TO		0x00000200	/* OPB Timeout (cMFSI) */
+#define	FSI_SSI_OBP_EA		0x00000100	/* OPB ErrorAck (cMFSI) */
+#define	FSI_SSI_OBP_IA		0x00002000	/* OPB Invalid Address (cMFSI)*/
+#define	FSI_SSI_CMFSI_AME	0x00000080	/* CMFSI any-master-error */
+#define	FSI_SSI_CMFSI_APE	0x00000040	/* CMFSI any-port-error */
+#define	FSI_SSI_CMFSI_HPE	0x00000020	/* CMFSI Hot plug event */
+#define	FSI_SSI_CMFSI_CRPA	0x00000010	/* CMFSI Contr reg parity err */
+#define	FSI_SSI_ANY_IRQ		0xffffc000	/* Valid bits */
+#define	FSI_SSI_ANY_IRQ3	(FSI_SSI_CMFSI_AME | FSI_SSI_CMFSI_APE \
+				| FSI_SSI_CMFSI_HPE | FSI_SSI_CMFSI_CRPA)
+						/* Valid bits (cMFSI) */
+#define	FSI_SSI_ANY_ERROR	0xfc000000	/* Valid error bits */
+#define	FSI_SSI_ANY_ERROR3	(FSI_SSI_OBP_PA \
+				| FSI_SSI_OBP_PR | FSI_SSI_OBP_TO \
+				| FSI_SSI_OBP_EA | FSI_SSI_OBP_IA)
+						/* Valid error bits (cMFSI) */
+#define	FSI_SSI_ERR_MASK	0x3f		/* Any error bits mask */
+#define	FSI_SSI_ERR_SHFT	26		/* Any error bits shift */
+#define	FSI_SISC_CRCE		0		/* Slave CRC error bit */
+#define	FSI_SISC_PE		1		/* Slave protocol error bit */
+#define	FSI_SISC_LBPE		2		/* Slave lcl bus parity err */
+#define	FSI_SISC_LBPROTOE	3		/* Slave lcl bus prot err */
+#define	FSI_SISC_LBAE		4		/* Slave access error bit */
+#define	FSI_SISC_LBOE		5		/* Slave lcl bus owner err */
+#define	FSI_SISC_OPBPA		20		/* Slave OPB parity error */
+#define	FSI_SISC_OPBPR		21		/* Slave OPB protocol error */
+#define	FSI_SISC_OPBTO		22		/* Slave OPB timeout error */
+#define	FSI_SISC_OPBEA		23		/* Slave OPB ack error */
+#define	FSI_SISC_CM_ERRS	0x000000f0	/* CMP8 sourced errors */
+#define	FSI_SISC_HM_ERRS	0x0000000f	/* HMP8 sourced errors */
+
+/* FSI slave error interrupt */
+static inline int fsi_sisc_iserror(u32 x)
+{
+	return x & (FSI_SSI_ANY_ERROR3 | FSI_SSI_ANY_ERROR);
+}
+
+/*
+ * FSI slave interrupt mask register: interrupt conditions, status and mask
+ */
+#define	FSI_SSI_ENG0		0x80000000	/* FSI slave */
+#define	FSI_SSI_ENG_MBX		0x400		/* FSI IOU Mailbox */
+#define	FSI_SSI_ENG_ANY		0x7fffffff	/* FSI engine 1..31 */
+#define	FSI_SSI_ENG_NOLBUS	(FSI_SSI_ENG0 | FSI_SSI_ENG_MBX)
+						/* Engines without local bus */
+/*
+ * FSI slave status register SSTAT
+ */
+#define	FSI_SSTAT_AE		0x80000000	/* Any error bit */
+#define	FSI_SSTAT_IDD		0x40000000	/* CFAM ID dirty at PON lvl) */
+#define	FSI_SSTAT_LSW		0x40000000	/* Left side warm start flag */
+#define	FSI_SSTAT_RSW		0x10000000	/* Rt side warm start flag */
+#define	FSI_SSTAT_MDL		0x08000000	/* Mail delivered left side */
+#define	FSI_SSTAT_MDR		0x04000000	/* Mail delivered right side */
+#define	FSI_SSTAT_MRL		0x02000000	/* Mail received left side */
+#define	FSI_SSTAT_MRR		0x01000000	/* Mail received right side */
+#define	FSI_SSTAT_BDL_SHIFT	20		/* Brief data left side shft */
+#define	FSI_SSTAT_BDL_MASK	0xf		/* Brief data left side mask */
+#define	FSI_SSTAT_BDR_SHIFT	16		/* Brief data rt side shift */
+#define	FSI_SSTAT_BDR_MASK	0xf		/* Brief data rt side mask */
+#define	FSI_SSTAT_LSLBR		0x8000		/* Left side local bus req */
+#define	FSI_SSTAT_RSLBR		0x4000		/* Right side local bus req */
+#define	FSI_SSTAT_TSLBR		0x2000		/* This side local bus req */
+#define	FSI_SSTAT_BLBA		0x1000		/* Block C-side lcl bus acc */
+#define	FSI_SSTAT_LBO_SHIFT	10		/* Local bus owner shift */
+#define	FSI_SSTAT_LBO_MASK	3		/* Local bus owner mask */
+#define	FSI_SSTAT_TSF_SHIFT	8		/* This side A=01 B=10 C=11 */
+#define	FSI_SSTAT_TSF_MASK	3		/* This side flag mask */
+#define	FSI_SSTAT_CAL		0x00000080	/* Clocks active left port */
+#define	FSI_SSTAT_CAR		0x00000040	/* Clocks active right port */
+#define	FSI_SSTAT_APIL		0x00000020	/* Aux port input level */
+#define	FSI_SSTAT_APRL		0x00000010	/* Aux port reference level */
+#define	FSI_SSTAT_CRC_SHIFT	0		/* CRC error counter */
+#define	FSI_SSTAT_CRC_MASK	0xf		/* CRC mask */
+#define	FSI_SSTAT_SIDE_NONE	0		/* Unknown Side */
+#define	FSI_SSTAT_SIDE_A	1		/* A-Side */
+#define	FSI_SSTAT_SIDE_B	2		/* B-Side */
+#define	FSI_SSTAT_SIDE_C	3		/* C-Side */
+
+/* FSI status local bus request */
+static inline int fsi_sstat_tsf(u32 x)
+{
+	return (x >> FSI_SSTAT_TSF_SHIFT) & FSI_SSTAT_TSF_MASK;
+}
+
+/* FSI status get local bus owner */
+static inline int fsi_sstat_lbo(u32 x)
+{
+	return (x >> FSI_SSTAT_LBO_SHIFT) & FSI_SSTAT_LBO_MASK;
+}
+
+/* FSI status get right side briefing data */
+static inline int fsi_sstat_bdr(u32 x)
+{
+	return (x >> FSI_SSTAT_BDR_SHIFT) & FSI_SSTAT_BDR_MASK;
+}
+
+/* FSI status get left side briefing data */
+static inline int fsi_sstat_bdl(u32 x)
+{
+	return (x >> FSI_SSTAT_BDL_SHIFT) & FSI_SSTAT_BDL_MASK;
+}
+
+/* FSI status get CRC counter */
+static inline int fsi_sstat_crc(u32 x)
+{
+	return (x >> FSI_SSTAT_CRC_SHIFT) & FSI_SSTAT_CRC_MASK;
+}
+
+/*
+ * FSI slave local bus access register SLBUS
+ */
+#define	FSI_SLBUS_FLBO		0x80000000	/* Force local bus ownership */
+#define	FSI_SLBUS_RLBA		0x40000000	/* Request local bus access */
+#define	FSI_SLBUS_RLBO_SHIFT	28		/* Release local bus shift */
+#define	FSI_SLBUS_RLBO_MASK	3		/* Release local bus mask */
+#define	FSI_SLBUS_RLBR		0x08000000	/* Reset local bus req */
+#define	FSI_SLBUS_BLBA_SHIFT	16		/* Block local bus acc shift */
+#define	FSI_SLBUS_BLBA_MASK	0xff		/* Block local bus acc mask */
+#define	FSI_SLBUS_BLBA		0xff		/* Block local bus acc */
+#define	FSI_SLBUS_UBLBA		0xec		/* Unblock local bus access */
+#define	FSI_SLBUS_RESERVE_MASK	0xf8ff0000	/* Mask off reserved bits */
+
+/* Release local bus */
+static inline u32 fsi_slbus_rlbo(int side)
+{
+	return (side & FSI_SLBUS_RLBO_MASK) << FSI_SLBUS_RLBO_SHIFT;
+}
+
+/* Block local bus access */
+static inline u32 fsi_slbus_blba(int side)
+{
+	return (side & FSI_SLBUS_BLBA_MASK) << FSI_SLBUS_BLBA_SHIFT;
+}
+
+/* FSI Slave Error Reset Register SRES */
+#define	FSI_SRES_RFS		0x80000000	/* Reset FSI slave */
+#define	FSI_SRES_REFS		0x40000000	/* Reset Errors FSI slave */
+#define	FSI_SRES_RLBE		0x20000000	/* Reset Local bus engs slave */
+#define	FSI_SRES_RESERVE_MASK	0x1fffffff	/* Mask off reserved bits */
+
+int slave_readreg(struct fsimaster *, void *, u32 *, u32);
+int slave_writereg(struct fsimaster *, void *, u32, u32);
+int slave_irqclear(struct fsimaster *, void *, u32, u32);
+int p8_cfam_fixup(struct fsicfam *, int);
+unsigned long xmp8_srsim_mask(int);
+
+#endif /* DRIVERS_FSISLAVE_H */
diff --git a/drivers/fsi/ldm.c b/drivers/fsi/ldm.c
new file mode 100644
index 0000000..254a95ea
--- /dev/null
+++ b/drivers/fsi/ldm.c
@@ -0,0 +1,28 @@
+/*
+ * FSI interface to the LDM
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
+#include "fsi.h"
+#include "fsidefines.h"
+
+/*
+ * Register a FSI device with the Linux device model
+ */
+int fsidev_register_nolock(struct fsidevice *p, struct device_attribute **ap)
+{
+	return 0;
+}
+
+int fsidev_register(struct fsidevice *p, struct device_attribute **ap)
+{
+	return 0;
+}
+EXPORT_SYMBOL(fsidev_register);
diff --git a/drivers/fsi/readwrite.c b/drivers/fsi/readwrite.c
new file mode 100644
index 0000000..3c7f0c5
--- /dev/null
+++ b/drivers/fsi/readwrite.c
@@ -0,0 +1,48 @@
+/*
+ * FSI I/O accesses
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
+#include "fsi.h"
+#include "fsidefines.h"
+#include "fsimaster.h"
+
+/*
+ * Send out a BREAK command on a given link - Resets the logic of any slaves
+ * present
+ */
+int fsi_sendbreak(struct fsimaster *p, u32 pa, int linkno)
+{
+	return 0;
+}
+
+/*
+ * Read/write functions to be used only by the FSI driver itself.  FSI clients
+ * will use separate interfaces
+ */
+int fsi_readw_int2(u32 pa, u32 *value)
+{
+	return 0;
+}
+
+int fsi_writew_int2(u32 pa, u32 value)
+{
+	return 0;
+}
+
+int fsi_readw_int(u32 pa, u32 *value)
+{
+	return 0;
+}
+
+int fsi_writew_int(u32 pa, u32 value)
+{
+	return 0;
+}
-- 
1.8.2.2
