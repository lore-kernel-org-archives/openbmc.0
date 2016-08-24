Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-qk0-x244.google.com (mail-qk0-x244.google.com
 [IPv6:2607:f8b0:400d:c09::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sKJ1616gvzDrcb
 for <openbmc@lists.ozlabs.org>; Thu, 25 Aug 2016 05:54:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=MUZPdCWV; 
 dkim-atps=neutral
Received: by mail-qk0-x244.google.com with SMTP id o1so2012829qkd.2
 for <openbmc@lists.ozlabs.org>; Wed, 24 Aug 2016 12:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=kDRgE3dlpSZoLRoZr2VyhaUTKl9ob1M9zZi4+1OYABc=;
 b=MUZPdCWVAPReVVbAXTFytbMpbGyq5YcGBuzi8/rZdUJNbr7FPE7rxVmv5NRBkMCi3l
 EYQ3ZIYnNNa43aePzqzmEB8aAvxtErpIr/Z/iBPhNH/h5OnpCxJ/KLeWKrq23z3QWEVJ
 mfLlrjTj7yW8wZdoFBaW4lDl9DNKJ690w+MlF6oDPFOp6mY3UKuWiZOOUzB59nmgdfhD
 VIOrIdlxZAJjZsZhT6Ibeaeva4cFSZIu2yxDzBG0gcFxz4cGyJ9bUGNsb+kSsnw/8n5o
 CUEDoASAU0Bil5zW45VTveal8ix1pVJndP/RotDOk9+cVwUNcnDJfdmAoBBC/McNf9fN
 53Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=kDRgE3dlpSZoLRoZr2VyhaUTKl9ob1M9zZi4+1OYABc=;
 b=Ohe6PZrr78GnBWKU4XDXzZENuMC+I0i0YDlDOcZZDmwpQagw8JasN+WzAmoCI5uIJ5
 X4ejaDK8xWreTp8Fp8yBsKZVFpf5mXphoASSlu69uabqKBYguLcIFExMG0x5To2v1qZp
 n0PoT4XBPe2iVUfK+WyPwKYYYcW6chKSG4MB2YkxtdpS7hcqfTInOPEScvK3cJlngJLt
 dogPsqu37ZK0fnySHTkSlRsy6wiGrfRzKjgnlPPgYCyjU6YC4LaBF1+TewMUTBARwSob
 rhdYfuVV/eZcr16QTKkBJVzu+uRTbNLx7wgFI7SaogjepJUUTeOk3t0uCXyJIz2Mcopw
 3i4A==
X-Gm-Message-State: AE9vXwMhmOMOV5Ub17IlsjapbXDsX0pOEXcCeN7LSeUq4GCnKcqShu+1kBktJr7f6KkiGw==
X-Received: by 10.55.169.13 with SMTP id s13mr5846659qke.257.1472068471506;
 Wed, 24 Aug 2016 12:54:31 -0700 (PDT)
Received: from christophersmbp.austin.ibm.com ([32.97.110.51])
 by smtp.gmail.com with ESMTPSA id n6sm3544238qkf.36.2016.08.24.12.54.30
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Wed, 24 Aug 2016 12:54:31 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux v5 7/7] drivers/fsi: Add CFAM scanning function
Date: Wed, 24 Aug 2016 14:54:12 -0500
Message-Id: <1472068452-32048-8-git-send-email-christopher.lee.bostic@gmail.com>
X-Mailer: git-send-email 2.7.4 (Apple Git-66)
In-Reply-To: <1472068452-32048-1-git-send-email-christopher.lee.bostic@gmail.com>
References: <1472068452-32048-1-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Wed, 24 Aug 2016 19:54:35 -0000

From: Chris Bostic <cbostic@us.ibm.com>

Scan a CFAM's configuration table for basic information on its ID and
capabilities.  A 'Common Field replaceable unit Access Macro' (CFAM) is
a target device an FSI master can communicate with.  Each CFAM contains
at its base address offset 0 a configuration table.  This table contains
data on what type of CFAM it is, what its address range is as well as
what types of engines it contains.  An I2C master, for example, is a type
of engine that can be found on various CFAMs.

Signed-off-by: Chris Bostic <cbostic@us.ibm.com>
---
 drivers/fsi/build.c       | 774 +++++++++++++++++++++++++++++++++++++++++++++-
 drivers/fsi/fsi.h         |  25 ++
 drivers/fsi/fsi_private.h |   5 +
 drivers/fsi/fsicfam.h     | 113 +++++++
 drivers/fsi/fsimaster.c   |  40 +++
 drivers/fsi/fsimaster.h   |   1 +
 drivers/fsi/fsislave.h    |  11 +
 drivers/fsi/ldm.c         |  25 ++
 drivers/fsi/readwrite.c   |  91 +++++-
 9 files changed, 1076 insertions(+), 9 deletions(-)

diff --git a/drivers/fsi/build.c b/drivers/fsi/build.c
index c9a31c0..ccb82b3 100644
--- a/drivers/fsi/build.c
+++ b/drivers/fsi/build.c
@@ -14,11 +14,13 @@
 #include <linux/delay.h>
 #include <linux/slab.h>
 #include <linux/io.h>
+#include <linux/mm.h>
 #include "fsi.h"
 #include "fsi_private.h"
 #include "fsimaster.h"
 #include "fsicfam.h"
 #include "fsilink.h"
+#include "fsislave.h"
 
 static void link_release(struct device *devp)
 {
@@ -60,8 +62,761 @@ static struct fsilink *link_add(struct fsimaster *master, int no)
 	return link ? : ERR_PTR(rc);
 }
 
+/*
+ * When a CFAM is gone delete the assigned resources. Called when a CFAM
+ * fsidevice is unregistered _and_ its refcount drops to zero (meaning all
+ * child devices are gone too).
+ */
+static void cfam_release(struct device *dev)
+{
+	struct fsidevice *fsidev = to_fsidevice(dev);
+	struct fsicfam *cfam = to_fsicfam(fsidev);
+
+	dev_dbg(&cfam->fsidev.dev, "cfam_release: base:%08X\n",
+		cfam->fsidev.map.addr);
+
+	kfree(cfam);
+}
+
+/*
+ * Allocate memory for and initialize a CFAM structure
+ */
+static struct fsicfam *cfam_init(struct fsilink *link, int id)
+{
+	struct fsimaster *master = link->master;
+	struct fsicfam *cfam = NULL;
+	u32 addr = fsimaster_cfam2pa(master, link->linkno, id);
+
+	dev_dbg(&link->fsidev.dev, "cfam_init >> link:%d addr:%08X id:%d\n",
+		link->linkno, addr, id);
+
+	cfam = kmalloc(sizeof(struct fsicfam), GFP_KERNEL);
+	if (cfam == NULL)
+		return NULL;
+
+
+	cfam->fsidev.map.addr = addr;
+	cfam->fsidev.map.va = link->id3_addr;
+	cfam->fsidev.map.kb = fsimaster_cfamsz(master) / FSI_ENGINE_SIZE;
+	cfam->fsidev.id.engine_type = FSI_ENGID_CFAM;
+	cfam->id = id;
+	dev_set_name(&cfam->fsidev.dev, "cfam-%d.%d", link->linkno, cfam->id);
+	cfam->fsidev.dev.bus = NULL;	/* CFAMs not on fsibus */
+	cfam->fsidev.dev.parent = &link->fsidev.dev;
+	cfam->fsidev.parent = &link->fsidev;
+	cfam->fsidev.dev.release = cfam_release;
+	cfam->fsidev.irq_start = 0;
+	cfam->fsidev.irq_range = 0;
+
+	return cfam;
+}
+
+/*
+ * Calculate a CRC of type x^4+x^2+x^1+1 from the provided source
+ */
+u8 fsi_crc4_gen(u8 *source, int length)
+{
+	u8 result[4] = {0, };
+	u8 feedback = 0;
+	u8 bb = length / 8;
+	u8 rem = length % 8;
+	u8 act;
+	u8 crc4 = 0;
+	int b, i;
+
+	for (b = 0; b < bb; b++) {
+		for (i = 7; i >= 0; i--) {
+			act = *(source + b);
+			feedback = result[3] ^ ((act >> i) & 1);
+			result[3] = result[2];
+			result[2] = result[1] ^ feedback;
+			result[1] = result[0] ^ feedback;
+			result[0] = feedback;
+		}
+	}
+	act = *(source + bb);
+	for (i = 0; i < rem; i++) {
+		feedback = result[3] ^ ((act >> (7 - i)) & 1);
+		result[3] = result[2];
+		result[2] = result[1] ^ feedback;
+		result[1] = result[0] ^ feedback;
+		result[0] = feedback;
+	}
+	if (result[3])
+		crc4 |= 8;
+	if (result[2])
+		crc4 |= 4;
+	if (result[1])
+		crc4 |= 2;
+	if (result[0])
+		crc4 |= 1;
+
+	return crc4;
+}
+
+void fsi_check_crc4(struct fsicfam *cfam, u32 config_entry)
+{
+	u8 crc = config_entry & 0xf, my_crc, frame[4];
+
+	frame[0] = (config_entry >> 24) & 0xff;
+	frame[1] = (config_entry >> 16) & 0xff;
+	frame[2] = (config_entry >> 8) & 0xff;
+	frame[3] = config_entry & 0xf0;		/* Zero out CRC bits */
+	my_crc = fsi_crc4_gen(frame, 28);
+	if (crc != my_crc)
+		dev_dbg(&cfam->fsidev.dev,
+			"crc mismatch! entry:%08X crc:%02X calculated:%02X\n",
+			config_entry, crc, my_crc);
+}
+
+/*
+ * Return true if this engine is recognized
+ */
+static int valid_engine(int type, int version)
+{
+	return ((type >= FSI_ENGID_FIRST && type <= FSI_ENGID_LAST) ||
+		type == FSI_ENGID_PS_CLOCK);
+}
+
+/* Is this configuration word for a port ? */
+static int fsi_is_port_slot(u32 config_word)
+{
+	int type = fsi_cfg_type(config_word);
+
+	return (type == FSI_ENGID_CMFSI_PORT || type == FSI_ENGID_HMFSI_PORT);
+}
+
+/*
+ * Read the configuration table and return the number of engines and total
+ * address space needed.  Unknown engine version causes the CFAM to be ignored.
+ */
+static int cfam_scan(struct fsicfam *cfam)
+{
+	int kb, more, type, version, idx = 0;
+	u32 addr = cfam->fsidev.map.addr;
+	u32 *config_entry = cfam->cfgtab;
+	u16 *to_map = &cfam->pages;
+	bool valid = false;
+
+	*to_map = 0;
+	do {
+		if (fsi_readw_int(cfam->master, addr, config_entry)) {
+			idx = -EIO;
+			goto bad;
+		}
+		if (!idx)
+			dev_dbg(&cfam->fsidev.dev, "addr:%08X idx:%d word:%08X\n",
+				addr, idx, *config_entry);
+		fsi_check_crc4(cfam, *config_entry);
+		type = fsi_cfg_type(*config_entry);
+		version = fsi_cfg_version(*config_entry);
+		if (idx)
+			kb = fsi_cfg_slot(*config_entry);
+		else
+			kb = 1;		/* Configuration space always 1 slot */
+		*to_map += kb;
+		dev_dbg(&cfam->fsidev.dev,
+			"scan: type:%02X v:%02X kb:%d tomap:%d word:%08X\n",
+			type, version, kb, *to_map, *config_entry);
+
+		/* 1. Word is CFAM identifier, type == 0 is empty slot */
+		valid = valid_engine(type, version);
+		if (idx && (type != FSI_ENGID_NONE) && !valid) {
+			idx = -ENODEV;
+			dev_dbg(&cfam->fsidev.dev, "scan: unknown type:%02X\n",
+				type);
+			goto bad;
+		}
+		more = fsi_cfg_next(*config_entry);
+		addr += sizeof(u32);
+		++config_entry;
+
+	} while (++idx < FSI_MAX_ENGINES && more);
+
+	dev_dbg(&cfam->fsidev.dev, "scan: idx prior empty slots:%d\n", idx);
+
+	/*
+	 * TODO: Check for assumptions on no empty engine slots on this CFAM.
+	 * Adjust the amount of memory to map to account for those engines
+	 * Not requiring any space of their own.
+	 *
+	 * TODO: Instead of taking away, add this check above where we're adding
+	 * up amount of memory space needed.
+	 */
+	while (fsi_cfg_type(*--config_entry) == FSI_ENGID_NONE ||
+		fsi_is_port_slot(*config_entry)) {
+		--idx;
+		kb = fsi_cfg_slot(*config_entry);
+		*to_map -= kb;
+	}
+	*to_map = PAGE_ALIGN(*to_map * FSI_ENGINE_SIZE) / PAGE_SIZE;
+bad:
+	dev_dbg(&cfam->fsidev.dev, "scan: return:%d to_map:%d\n", idx, *to_map);
+	return idx;
+}
+
+/*
+ * Set CFAM to a given ID and initialize slave mode to general defaults
+ */
+static int setid(struct fsicfam *cfam, u32 addr, int id)
+{
+	u32 smode = FSI_SMODE_ECRC | fsi_smode_echodly(0xf)
+		| fsi_smode_senddly(0xf)
+		| fsi_smode_lbcrr(1)
+		| fsi_smode_sid(id);
+
+	return fsi_writew_int(cfam->master, addr + FSI_SMODE, smode);
+}
+
+/*
+ * Set CFAM id to the target value.
+ * Send a reset commant to a slave, also clear mail delivered status.
+ * Enable/Disable auxiliary port to allow clocks on successor CFAM in chain -
+ * necessary to give the next CFAM (if one exists) a chance to get into a known
+ * state.  Note that as of now there is minimal support for extra CFAMs on a
+ * link.
+ */
+static int cfam_setup(struct fsilink *link, u32 id3_addr, struct fsicfam *cfam)
+{
+	u32 slave_addr = id3_addr + FSI_SLAVE0_OFFSET;
+	u32 smode;
+	int rc;
+	int id = cfam->id;
+
+	/*
+	 * CFAM will now appear at different address if we change its link ID
+	 * here
+	 */
+	rc = setid(cfam, slave_addr, id);
+	if (rc) {
+		dev_dbg(&link->fsidev.dev, "cfam_setup setid fail rc:%d\n", rc);
+		goto out;
+	}
+
+	dev_dbg(&link->fsidev.dev, "cfam_setup slave addr:%08X\n", slave_addr);
+	rc = fsi_readw_int(cfam->master, slave_addr + FSI_SMODE, &smode);
+	if (rc)
+		goto out;
+
+	rc = fsi_writew_int(cfam->master, slave_addr + FSI_SMODE,
+			    smode | FSI_SMODE_EAP);
+	if (rc)
+		goto out;
+	udelay(100);
+	rc = fsi_writew_int(cfam->master, slave_addr + FSI_SMODE, smode);
+	if (rc)
+		goto out;
+
+	rc = fsi_writew_int(cfam->master, slave_addr + FSI_SRES, FSI_SRES_RFS);
+	if (rc)
+		goto out;
+
+	rc = fsi_writew_int(cfam->master, slave_addr + FSI_SCISC,
+			    FSI_SSI_HPE | FSI_SSI_MDL | FSI_SSI_MDR);
+out:
+	dev_dbg(&link->fsidev.dev, "cfam_setup << rc:%d\n", rc);
+
+	return rc;
+}
+
+
+/*
+ * Allocate space to cover all engine address range on a CFAM
+ */
+static int cfam_iomem(struct fsimaster *master, int link, struct fsicfam *cfam)
+{
+	/*
+	 * TODO: For now the address space is virtualized since there is no
+	 * fsimaster defined in hardware.  Will require ioremap once one is
+	 * available.
+	 */
+
+	return 0;
+}
+
+/*
+ * Create a single CFAM, read its config space, allocate memory and set id
+ */
+static struct fsicfam *cfam_create(struct fsilink *link, int id)
+{
+	int rc = 0;
+	struct fsicfam *cfam;
+
+	dev_dbg(&link->fsidev.dev, "cfam_create >> link:%d cfam:%d\n",
+		link->linkno, id);
+
+	cfam = cfam_init(link, id);
+	if (cfam == NULL) {
+		rc = -ENOMEM;
+		goto out;
+	}
+
+	rc = cfam_scan(cfam);
+	if (rc < 0) {
+		kfree(cfam);
+		goto out;
+	}
+
+	rc = cfam_iomem(link->master, link->linkno, cfam);
+	if (rc) {
+		kfree(cfam);
+		goto out;
+	}
+
+	if (cfam_setup(link, link->id3_addr, cfam)) {
+		cfam_release(&cfam->fsidev.dev);
+		rc = -EIO;
+		goto out;
+	}
+	link->cfams[id] = cfam;
+out:
+	if (rc)
+		cfam = ERR_PTR(rc);
+	dev_dbg(&link->fsidev.dev, "cfam_create << link:%d cfam:%d rc:%d\n",
+		link->linkno, id, rc);
+
+	return cfam;
+}
+
+/*
+ * Switch on or off the auxiliary port control
+ */
+static int auxport(struct fsicfam *cfam, u32 addr, int onoff)
+{
+	u32 smode;
+	int rc;
+
+	addr += FSI_SLAVE0_OFFSET;
+	rc = fsi_readw_int(cfam->master, addr + FSI_SMODE, &smode);
+	if (rc)
+		return rc;
+	if (onoff)
+		smode |= FSI_SMODE_EAP;
+	else
+		smode &= ~FSI_SMODE_EAP;
+	rc = fsi_writew_int(cfam->master, addr + FSI_SMODE, smode);
+
+	return rc;
+}
+
+/*
+ * Disable predecessor AUX port in case of error building cascade
+ * Remove all CFAMs when auxport cannot be turned off.
+ */
+static void oomcfam(int i, struct fsilink *link)
+{
+	struct fsicfam *cfam = NULL;
+	struct fsimap *map = NULL;
+
+	if (i == 0)
+		return;
+
+	cfam = link->cfams[i-1];
+	map = &cfam->fsidev.map;
+	if (i > 0 && auxport(cfam, map->addr, 0)) {
+		while (--i >= 0) {
+			cfam_release(&link->cfams[i]->fsidev.dev);
+			link->cfams[i] = NULL;
+		}
+		link->cascade = 0;
+	} else
+		link->cascade = i;
+}
+
+/*
+ * Check if another CFAM is present on this link
+ */
+static int morecfam(u32 addr)
+{
+	/*
+	 * TODO: Phase in multi CFAM per link support.
+	 */
+	return 0;
+}
+
+/*
+ * Scan the slots of a new link and find any attached CFAMs.
+ * Return number found.
+ */
+static int findcfams(struct fsimaster *master, struct fsilink *link)
+{
+	int i, more, done = 0;
+	struct fsicfam *cfam;
+	u32 base = 0;
+
+	dev_dbg(&master->fsidev->dev, "findcfams >> link:%d\n", link->linkno);
+	link->top_cfam = 1;
+
+	for (i = 0; i < FSI_MAX_CASCADE && !done; ++i) {
+		cfam = cfam_create(link, i);
+		if (IS_ERR(cfam)) {
+			oomcfam(i, link);
+			break;
+		}
+		base = cfam->fsidev.map.addr;
+		if (i == FSI_MAX_CASCADE - 1)
+			more = 0;
+		else
+			more = morecfam(base);
+
+		if (more > 0) {
+			++link->top_cfam;
+			dev_dbg(&master->fsidev->dev, "more:%d id:%d top:%d\n",
+				more, i, link->top_cfam);
+			if (auxport(cfam, base, 1)) {
+				done = i + 1;
+				link->cascade = done; /* Done scanning */
+			}
+		} else {
+			done = i + 1;
+			link->cascade = done;
+		}
+	}
+	dev_dbg(&master->fsidev->dev, "findcfams << found:%d top:%d link:%d\n",
+		link->cascade, link->top_cfam, link->linkno);
+
+	return link->cascade;
+}
+
+/*
+ * Register one CFAM with the LDM
+ */
+static int cfam_register(int id, struct fsicfam *cfam, int link)
+{
+	int rc;
+
+	dev_dbg(&cfam->fsidev.dev, "cfam_register >> id:%d link:%d\n",
+		id, link);
+
+	rc = fsidev_register_nolock(&cfam->fsidev, NULL);
+	if (rc)
+		cfam_release(&cfam->fsidev.dev);
+
+	return rc;
+}
+
+/*
+ * Register all newly disovered CFAMs with the LDM
+ */
+static int cfam_export(struct fsimaster *master, struct fsilink *link)
+{
+	int rc, i, j;
+
+	dev_dbg(&master->fsidev->dev, "cfam_export >>\n");
+
+	for (i = 0; i < link->cascade; ++i) {
+		struct fsicfam *cfam = link->cfams[i];
+
+		rc = cfam_register(master->myid, cfam, link->linkno);
+		if (rc) {
+			/* Delete allocated CFAMs not yet exported */
+			for (j = i + 1; j < link->cascade; ++j)
+				cfam_release(&link->cfams[j]->fsidev.dev);
+			link->cascade = i;
+			break;
+		}
+	}
+
+	dev_dbg(&master->fsidev->dev, "cfam_export << link:%d cascade:%d\n",
+		link->linkno, link->cascade);
+
+	return link->cascade;
+}
+
+/*
+ * Read in the configuration table header of this CFAM
+ */
+static void cfam_read_header(struct fsicfam *cfam)
+{
+	u32 header = cfam->cfgtab[FSI_CFAM_CFGIDX];
+
+	if (fsi_cfg_vpd(header)) {
+		cfam->ec_maj = fsi_cfg_ecmaj(header);
+		cfam->ec_min = fsi_cfg_ecmin(header);
+	} else {
+		cfam->ec_maj = 0;
+		cfam->ec_min = fsi_cfg_version(header);
+	}
+	cfam->chipid = fsi_cfg_type(header);
+}
+
+/*
+ * Called when fsidev_unregister() is performed on slave device and no users.
+ */
+static void slave_release(struct device *dev)
+{
+	struct fsidevice *fsidev = to_fsidevice(dev);
+	struct fsislave *slave = to_fsislave(fsidev);
+	struct fsicfam *cfam = to_fsicfam(fsidev->parent);
+
+	cfam->engines[fsidev->map.eng] = 0;
+	kfree(slave);
+}
+
+static void fsidev_release(struct device *dev)
+{
+	struct fsidevice *fsidev = to_fsidevice(dev);
+
+	dev_dbg(&fsidev->dev, "fsidev_release >> fsidev:%p\n", fsidev);
+	if (fsidev->parent &&
+	    fsidev->parent->id.engine_type == FSI_ENGID_CFAM) {
+		/* If parent ic CFAM handle engines */
+		struct fsicfam *cfam = to_fsicfam(fsidev->parent);
+
+		cfam->engines[fsidev->map.eng] = NULL;
+	}
+}
+
+static struct fsidevice *fsidev_alloc(void)
+{
+	struct fsidevice *fsidev = kmalloc(sizeof(struct fsidevice),
+					   GFP_KERNEL);
+
+	if (fsidev)
+		fsidev->dev.release = fsidev_release;
+
+	return fsidev;
+}
+
+static struct fsidevice *fsislave_alloc(void)
+{
+	struct fsislave *slave = kmalloc(sizeof(struct fsislave),
+					 GFP_KERNEL);
+
+	if (!slave)
+		return NULL;
+	slave->fsidev.dev.release = slave_release;
+
+	return &slave->fsidev;
+}
+
+/*
+ * Find the offset in kilobytes from the start of the CFAM address space
+ * for a given engine.
+ */
+u32 fsi_get_eng_offset(struct fsicfam *cfam, int engine)
+{
+	u32 add = 1;
+	int i;
+
+	for (i = 1; i < engine; ++i)
+		add += fsi_cfg_slot(cfam->cfgtab[i]);
+
+	return add * FSI_ENGINE_SIZE;
+}
+
+static struct fsidevice *mkengine(int engine, struct fsicfam *cfam)
+{
+	struct fsidevice *fsidev = NULL;
+	u32 slot = cfam->cfgtab[engine];
+
+	switch (fsi_cfg_type(slot)) {
+	case FSI_ENGID_SLAVE_3P:
+	case FSI_ENGID_SLAVE_2P:
+		fsidev = fsislave_alloc();
+		break;
+	default:
+		fsidev = fsidev_alloc();
+		break;
+	}
+	if (fsidev)
+		fsidev_fill(fsidev, engine, slot, cfam);
+
+	return fsidev;
+}
+
+/*
+ * Create, initialize and fill in the properties of a CFAM engine
+ */
+static int setup_engine(int engine, struct fsicfam *cfam)
+{
+	int rc = 0;
+	struct fsidevice *fsidev = NULL;
+
+	fsidev = mkengine(engine, cfam);
+	if (fsidev == NULL) {
+		rc = -ENOMEM;
+		goto done;
+	}
+
+	rc = fsidev_register_nolock(fsidev, fsidev->attr);
+done:
+	dev_dbg(&cfam->fsidev.dev, "setup_engine << engine:%d rc:%d\n",
+		engine, rc);
+
+	return rc;
+}
+
+/*
+ * Scan through the configruation table and install fsidevices for each
+ * new engine found.
+ */
+static int cfg_scan(struct fsicfam *cfam, u32 new, u32 *done)
+{
+	u32 type = 0;
+	int rc = 0, i;
+
+	dev_dbg(&cfam->fsidev.dev, "cfg_scan >> new:%08X\n", new);
+
+	*done = 0;
+
+	for (i = FSI_CFAM_PEEKIDX; i < cfam->no_eng; ++i) {
+		if ((mask32(i) & new) == 0)	/* Not in mask */
+			continue;
+		if (cfam->cfgtab[i])
+			type = fsi_cfg_type(cfam->cfgtab[i]);
+		else
+			continue;
+
+		if (!cfam->engines[i])
+			rc = setup_engine(i, cfam);
+
+		clear_bit(i, &cfam->eng_build);
+		if (rc)
+			break;
+		*done |= mask32(i);
+	}
+	dev_dbg(&cfam->fsidev.dev, "cfg_scan << rc:%d done:%08X\n", rc, *done);
+
+	return rc;
+}
+
+/*
+ * Build up the list of CFAM engines
+ */
+static int cfg_find_engines(struct fsicfam *cfam, u32 new)
+{
+	u32 done = 0;
+	int rc = cfg_scan(cfam, new, &done);
+
+	dev_dbg(&cfam->fsidev.dev, "cfg_find_eng << new:%d done:%d rc:%d\n",
+		new, done, rc);
+
+	return new != done;
+}
+
+/*
+ * Identify engines that should be exported first.  This is any engine whos
+ * presence is available by default without any external MUX configuration
+ * required to make them visible.
+ */
+static u32 firstlist(void)
+{
+	/*
+	 * As of now there is no first/second export phase, all are same.
+	 * Once support for muxed in engines is added this will need to
+	 * make sure those aren't done in first round.  Muxed devices will
+	 * show up once the MUX is switched in for them (after first phase).
+	 */
+	u32 eng_mask = ~0;
+
+	return eng_mask;
+}
+
+/*
+ * Unregister CFAM engines if something bad happens during the engine discovery
+ * process.  Bad path only.
+ */
+static void cfg_undo(struct fsicfam *cfam)
+{
+	int i = cfam->no_eng;
+
+	dev_dbg(&cfam->fsidev.dev, "cfg_undo >> engines:%d\n", i);
+
+	while (--i >= FSI_CFAM_PEEKIDX) {
+		if (cfam->engines[i])
+			fsidev_unregister_nolock(cfam->engines[i]);
+	}
+}
+
+/*
+ * Walk the CFAM configuration table to discover all engines present
+ */
+static int cfg_build(struct fsilink *link, int linkno)
+{
+	int rc;
+	struct fsicfam *cfam = link->cfams[linkno];
+
+	dev_dbg(&cfam->fsidev.dev, "cfg_build >> link:%d cfamid:%d\n",
+		linkno, cfam->id);
+	cfam_read_header(cfam);
+	rc = cfg_find_engines(cfam, firstlist());
+	if (rc)
+		cfg_undo(cfam);
+
+	dev_dbg(&cfam->fsidev.dev, "cfg_build << rc:%d\n", rc);
+
+	return rc;
+}
+
+/*
+ * Buildup and export all CFAM engines to the LDM
+ */
+static int cfam_final(struct fsilink *link)
+{
+	int i, rc = 0;
+
+	for (i = 0; i < link->cascade; ++i) {
+		rc = cfg_build(link, i);
+		if (rc)
+			break;
+	}
+
+	return rc;
+}
+
+static void cfam_remove(struct fsicfam *cfam)
+{
+	cfg_undo(cfam);
+	fsidev_unregister_nolock(&cfam->fsidev);
+}
+
+static void cfam_remove_all(struct fsilink *link)
+{
+	int i;
+
+	for (i = 0; i < link->cascade; ++i)
+		cfam_remove(link->cfams[i]);
+	link->cascade = 0;
+}
+
+/*
+ * Send a BREAK command and build up all discovered CFAMs
+ */
 static void linkbuild2(struct fsimaster *master, struct fsilink *link)
 {
+	int rc = 0;
+
+	dev_dbg(&master->fsidev->dev, "linkbuild2 >> mid:%d link:%d\n",
+		master->myid, link->linkno);
+
+	rc = fsi_sendbreak(master, link->id3_addr, link->linkno);
+	if (rc)
+		goto out;
+
+	/*
+	 * Setting all links for maximum speed.  Note that some CFAM types
+	 * may require slower speeds
+	 */
+	fsimaster_setspeed(master, link->linkno, 0);
+	if (master->myid == 0 && rc < 0)
+		goto out;
+
+	rc = findcfams(master, link);
+	if (rc)
+		goto out;
+
+	rc = cfam_export(master, link);
+	if (rc <= 0)
+		goto out;
+
+	rc = cfam_final(link);
+	if (rc)
+		cfam_remove_all(link);
+
+out:
+	dev_dbg(&master->fsidev->dev, "linkbuild2 << link:%d len:%d rc:%d\n",
+		link->linkno, link->cascade, rc);
 }
 
 /*
@@ -76,19 +831,20 @@ static int linkbuild1(struct fsimaster *master, int no)
 	if (IS_ERR(link))
 		return PTR_ERR(link);
 
-	/* stub */
+	master->link[link->linkno] = link;
 
 	linkbuild2(master, link);
 	i = link->cascade;
 	if (i == 0) {
-
-		/* stub */
-
+		master->link[link->linkno] = NULL;
+		fsidev_unregister_nolock(&link->fsidev);
 		rc = -EIO;
 	} else {
-
-		/* stub */
+		rc = link->top_cfam;
 	}
+	dev_dbg(&master->fsidev->dev,
+		"linkbuild1 << link:%d #cfams:%d top:%d rc:%d\n",
+		no, i, link->top_cfam, rc);
 
 	return rc;
 }
@@ -101,6 +857,9 @@ int fsi_linkbuild(struct fsimaster *master, int no)
 	int rc;
 	u64 menp;
 
+	dev_dbg(&master->fsidev->dev, "fsi_linkbuild >> mid:%d link:%d\n",
+		master->myid, no);
+
 	menp = fsimaster_read_menp(master);
 	if (menp & mask64(no))
 		return -EEXIST;  /* Already running */
@@ -110,5 +869,8 @@ int fsi_linkbuild(struct fsimaster *master, int no)
 	if (rc < 0)
 		fsimaster_disable_link(master, no);
 
+	dev_dbg(&master->fsidev->dev, "fsi_linkbuild << mid: %d link:%d rc:%d\n",
+		master->myid, no, rc);
+
 	return rc;
 }
diff --git a/drivers/fsi/fsi.h b/drivers/fsi/fsi.h
index f0ed5b7..2227c71 100644
--- a/drivers/fsi/fsi.h
+++ b/drivers/fsi/fsi.h
@@ -42,6 +42,28 @@ struct fsi_engine_id {
 #define FSI_ENGINE_ID_MATCH_VERSION	2	/* Match the version */
 #define FSI_ENGINE_ID_MATCH_VENDOR	4	/* Match the vendor */
 
+/*
+ * Known engine types and versions
+ */
+#define	FSI_ENGID_PS_CLOCK	0xfd		/* Pseudo clock */
+#define	FSI_ENGID_CFAM		0xfe		/* CFAM type */
+#define	FSI_ENGID_LINK		0xff		/* Link type */
+#define	FSI_ENGID_NONE		0x00		/* Empty slot */
+#define	FSI_ENGID_PEEK_B	0x02		/* Peek engine 1 byte per eng */
+/* ... */
+#define	FSI_ENGID_SLAVE_3P	0x03		/* 3 Port slave */
+/* ... */
+#define FSI_ENGID_SLAVE_2P	0x11		/* 2 Port slave */
+/* ... */
+#define	FSI_ENGID_CMFSI		0x1a		/* Cascaded FSI Master engine */
+#define	FSI_ENGID_CMFSI_PORT	0x1b		/* Cascaded FSI Master link */
+#define	FSI_ENGID_HMFSI		0x1c		/* Hub FSI Master engine */
+#define	FSI_ENGID_HMFSI_PORT	0x1d		/* Hub FSI Master link */
+/* ... */
+#define	FSI_ENGID_SFC		0x21		/* System Flash Controller */
+#define	FSI_ENGID_FIRST		FSI_ENGID_PEEK_B     /* First number */
+#define	FSI_ENGID_LAST		FSI_ENGID_SFC	/* Last number */
+
 /* Location information for a FSI device */
 struct fsimap {
 	u8 link;			/* Master link # */
@@ -49,9 +71,11 @@ struct fsimap {
 	u8 eng;				/* Engine # on CFAM */
 	u8 cmtype;			/* Type of master upstream */
 	u32 offset;			/* Address offset into CFAM */
+	u32 addr;			/* Physical address */
 	u32 va;				/* Virtual address */
 	u16 kb;				/* Size of dev engine space */
 	u16 kb_off;			/* CFAM config table offset data */
+	u8 depth;			/* How many links in path to target */
 };
 
 #define FSI_DEV_MEMRES		1	/* Physical address of device */
@@ -78,6 +102,7 @@ struct fsidevice {
 	struct device dev;		/* LDM entry for bus */
 	struct fsimap map;		/* Address & location info */
 	unsigned long state;		/* flags for state */
+	struct device_attribute **attr; /* Default attributes */
 };
 
 #define to_fsidevice(x)	container_of((x), struct fsidevice, dev)
diff --git a/drivers/fsi/fsi_private.h b/drivers/fsi/fsi_private.h
index afa2553..db3e192 100644
--- a/drivers/fsi/fsi_private.h
+++ b/drivers/fsi/fsi_private.h
@@ -14,6 +14,7 @@
 #define DRIVERS_FSI_PRIVATE_H
 
 #include "fsi.h"
+#include "fsicfam.h"
 
 #define FSIDD_NAME		"fsi"		/* FSI device driver name */
 
@@ -115,4 +116,8 @@ void fsi_exit_fileio(dev_t);
 int fsibus_init(void);
 void fsibus_exit(void);
 
+int fsidev_register_nolock(struct fsidevice *, struct device_attribute **);
+void fsidev_unregister_nolock(struct fsidevice *);
+void fsidev_fill(struct fsidevice *, int, u32, struct fsicfam *);
+
 #endif /* DRIVERS_FSI_PRIVATE_H */
diff --git a/drivers/fsi/fsicfam.h b/drivers/fsi/fsicfam.h
index 8ccff5c..59f3a58 100644
--- a/drivers/fsi/fsicfam.h
+++ b/drivers/fsi/fsicfam.h
@@ -43,6 +43,119 @@ struct fsicfam {			/* CFAM internal structure */
 int fsi_cfamirq_request(int, struct fsicfam *);
 void fsi_cfamirq_free(struct fsicfam *);
 
+/* Config space entry encoding */
+#define	FSI_CFG_NEXT		0x80000000	/* Next entry is valid */
+#define	FSI_CFG_VPD		0x40000000	/* VPD data available */
+#define	FSI_CFG_SLOT_SHIFT	16		/* # bits to shift for slot */
+#define	FSI_CFG_SLOT_MASK	0xff
+#define	FSI_CFG_VERS_SHIFT	12		/* # bits to shift for vers */
+#define	FSI_CFG_VERS_MASK	0xf
+#define	FSI_CFG_TYPE_SHIFT	4		/* # bits to shift for type */
+#define	FSI_CFG_TYPE_MASK	0xff
+#define	FSI_CFG_CRC_SHIFT	0		/* # bits to shift for crc */
+#define	FSI_CFG_CRC_MASK	0xf
+#define	FSI_CFG_ECMAJ_SHIFT	16		/* # bits to shift major ec */
+#define	FSI_CFG_ECMAJ_MASK	0xff
+#define	FSI_CFG_ECMIN_SHIFT	12		/* # bits to shift minor ec */
+#define	FSI_CFG_ECMIN_MASK	0xf
+#define	FSI_CFG_CHIPID_SHIFT	4		/* # bits to shift for ID */
+#define	FSI_CFG_CHIPID_MASK	0xf
+
+/* These engines are in the same location in all CFAMs */
+#define FSI_CFAM_CFGIDX		0		/* Config space "engine" */
+#define FSI_CFAM_PEEKIDX	1		/* Peek engine */
 #define FSI_CFAM_SLAVEIDX	2		/* Slave engine */
+#define FSI_CFAM_CMFSIIDX	12		/* Cascaded master engine */
+#define FSI_CFAM_HMFSIIDX	13		/* Hub master engine */
+
+/*
+ * Return next field in the configuration space entry.
+ */
+static inline int fsi_cfg_next(u32 x)
+{
+	return x & FSI_CFG_NEXT;
+}
+
+/*
+ * Return VPD field in the configuration space entry.
+ */
+static inline int fsi_cfg_vpd(u32 x)
+{
+	return x & FSI_CFG_VPD;
+}
+
+/*
+ * Set slot field
+ */
+static inline u32 fsi_cfg_mkslot(u32 x)
+{
+	return (x & FSI_CFG_SLOT_MASK) << FSI_CFG_SLOT_SHIFT;
+}
+
+/*
+ * Return slot field in the configuration space entry.
+ */
+static inline int fsi_cfg_slot(u32 x)
+{
+	return x >> FSI_CFG_SLOT_SHIFT & FSI_CFG_SLOT_MASK;
+}
+
+/*
+ * Return version field in the configuration space entry.
+ */
+static inline int fsi_cfg_version(u32 x)
+{
+	return x >> FSI_CFG_VERS_SHIFT & FSI_CFG_VERS_MASK;
+}
+
+/*
+ * Set type field.
+ */
+static inline u32 fsi_cfg_mktype(u32 x)
+{
+	return (x & FSI_CFG_TYPE_MASK) << FSI_CFG_TYPE_SHIFT;
+}
+
+/*
+ * Return type field in the configuration space.
+ */
+static inline int fsi_cfg_type(u32 x)
+{
+	return x >> FSI_CFG_TYPE_SHIFT & FSI_CFG_TYPE_MASK;
+}
+
+/*
+ * Return CRC field in the configuration field.
+ */
+static inline int fsi_cfg_crc(u32 x)
+{
+	return x >> FSI_CFG_CRC_SHIFT & FSI_CFG_CRC_MASK;
+}
+
+/*
+ * Return Major EC field in configuration space word 0.
+ */
+static inline int fsi_cfg_ecmaj(u32 x)
+{
+	return x >> FSI_CFG_ECMAJ_SHIFT & FSI_CFG_ECMAJ_MASK;
+}
+
+/*
+ * Return Minor EC field in configuration space word 0.
+ */
+static inline int fsi_cfg_ecmin(u32 x)
+{
+	return x >> FSI_CFG_ECMIN_SHIFT & FSI_CFG_ECMIN_MASK;
+}
+
+/*
+ * Return Chip ID field in configuration space word 0.
+ */
+static inline int fsi_cfg_chipid(u32 x)
+{
+	return x >> FSI_CFG_CHIPID_SHIFT & FSI_CFG_CHIPID_MASK;
+}
+
+u32 fsi_get_eng_offset(struct fsicfam *, int);
 
 #endif /* DRIVERS_FSICFAM_H */
diff --git a/drivers/fsi/fsimaster.c b/drivers/fsi/fsimaster.c
index 427231f..5889bb1 100644
--- a/drivers/fsi/fsimaster.c
+++ b/drivers/fsi/fsimaster.c
@@ -248,14 +248,54 @@ u64 fsimaster_read_menp(struct fsimaster *master)
 
 void fsimaster_write_menp(struct fsimaster *master, u64 *menp, int on_off)
 {
+	int regnm = on_off ? FSI_N_MSENP0 : FSI_N_MCENP0;
+
+	master->write_reg2(master->base, regnm, menp);
+}
+
+void fsimaster_read_mcrsp(struct fsimaster *master, u64 *mcrsp)
+{
+	return master->read_reg2(master->base, FSI_N_MCRSP0, mcrsp);
+}
+
+void fsimaster_write_mcrsp(struct fsimaster *master, u64 *mcrsp)
+{
+	master->write_reg2(master->base, FSI_N_MCRSP0, mcrsp);
+}
+
+u32 fsimaster_read_maeb(struct fsimaster *master)
+{
+	return master->read_reg(master->base, FSI_N_MAEB);
 }
 
 void fsimaster_disable_link(struct fsimaster *master, int link)
 {
+	u64 menp = 0;
+
+	menp = mask64(link);
+	fsimaster_write_menp(master, &menp, 0);
 }
 
 void fsimaster_enable_link(struct fsimaster *master, int link)
 {
+	u64 menp = 0;
+
+	menp = mask64(link);
+	fsimaster_write_menp(master, &menp, 1);
+}
+
+void fsimaster_setspeed(struct fsimaster *master, int linkno, int set)
+{
+	u64 mcrsp, mask;
+
+	mask = mask64(linkno);
+
+	fsimaster_read_mcrsp(master, &mcrsp);
+	mcrsp &= ~mask;
+	if (set)
+		mcrsp |= mask;
+
+	fsimaster_write_mcrsp(master, &mcrsp);
 }
 
 /*
diff --git a/drivers/fsi/fsimaster.h b/drivers/fsi/fsimaster.h
index 0d47dc6..e70621c 100644
--- a/drivers/fsi/fsimaster.h
+++ b/drivers/fsi/fsimaster.h
@@ -634,6 +634,7 @@ int fsimaster_read_msiep(struct fsimaster *);
 int fsimaster_read_msiep_nl(struct fsimaster *);
 int fsimaster_write_msiep(struct fsimaster *, u32 *);
 int fsimaster_write_msiep_nl(struct fsimaster *, u32 *);
+u32 fsimaster_read_maeb(struct fsimaster *);
 int setup_me(struct fsimaster *, int);
 
 /*
diff --git a/drivers/fsi/fsislave.h b/drivers/fsi/fsislave.h
index f2095d3..98c602a 100644
--- a/drivers/fsi/fsislave.h
+++ b/drivers/fsi/fsislave.h
@@ -401,4 +401,15 @@ int slave_irqclear(struct fsimaster *, void *, u32, u32);
 int p8_cfam_fixup(struct fsicfam *, int);
 u32 xmp8_srsim_mask(int);
 
+struct fsislave {			/* FSI slave (always engine 2) */
+	struct fsidevice fsidev;	/* LDM entry */
+	u8 myside;			/* FSI slave port side */
+	u8 lbusspeed;			/* FSI slave local bus clock ratio */
+	u8 buddyclk;			/* FSI slave with buddy clock line */
+	u8 nextirq;			/* FSI slave last IRQ handled */
+	u32 smode;			/* FSI slave copy of smode register */
+};
+
+#define to_fsislave(x)	container_of((x), struct fsislave, fsidev)
+
 #endif /* DRIVERS_FSISLAVE_H */
diff --git a/drivers/fsi/ldm.c b/drivers/fsi/ldm.c
index cb6679f..5c2855f 100644
--- a/drivers/fsi/ldm.c
+++ b/drivers/fsi/ldm.c
@@ -285,6 +285,31 @@ struct bus_type fsi_bus_type = {
 EXPORT_SYMBOL(fsi_bus_type);
 
 /*
+ * Fill in the details for a given CFAM engine
+ */
+void fsidev_fill(struct fsidevice *fsidev, int engine, u32 slot,
+		 struct fsicfam *cfam)
+{
+	u32 offset = fsi_get_eng_offset(cfam, engine);
+	u32 addr = cfam->fsidev.map.addr;
+
+	if (fsi_cfg_type(slot) == FSI_ENGID_PS_CLOCK)
+		offset = fsi_get_eng_offset(cfam, 4);
+
+	addr += offset;
+	offset = (addr & FSI_ENGINE_MASK) >> FSI_ENGINE_SHIFT;
+	fsidev->id.engine_type = fsi_cfg_type(slot);
+	fsidev->id.engine_version = fsi_cfg_version(slot);
+	fsidev->map.kb_off = offset;
+	fsidev->map.eng = engine;
+	fsidev->map.addr = addr;
+	fsidev->map.kb = fsi_cfg_slot(slot);
+	fsidev->dev.bus = &fsi_bus_type;
+	fsidev->dev.parent = &cfam->fsidev.dev;
+	fsidev->parent = &cfam->fsidev;
+}
+
+/*
  * Create and install the FSI bus
  */
 int fsibus_init(void)
diff --git a/drivers/fsi/readwrite.c b/drivers/fsi/readwrite.c
index 3427e52..ba839c1 100644
--- a/drivers/fsi/readwrite.c
+++ b/drivers/fsi/readwrite.c
@@ -10,22 +10,75 @@
  * as published by the Free Software Foundation; either version
  * 2 of the License, or (at your option) any later version.
  */
+#include <linux/io.h>
+#include <linux/delay.h>
 #include "fsi.h"
 #include "fsi_private.h"
 #include "fsimaster.h"
+#include "fsislave.h"
+
+/* Clean up master errors */
+static int fspme(int master_nr)
+{
+	return 0;
+}
 
 /*
  * Read/write functions to be used only by the FSI driver itself.  FSI clients
  * will use separate interfaces
  */
+
+/* Check if the master has logged any bus errors */
+static int fsi_check_errors(struct fsimaster *master)
+{
+	u32 maeb = fsimaster_read_maeb(master);
+	int rc = 0;
+
+	if (maeb & FSI_MASTER0)
+		rc = fspme(0);
+
+	return rc;
+};
+
 int fsi_readw_int(struct fsimaster *master, u32 pa, u32 *value)
 {
-	return 0;
+	/*
+	 * How we access hardware will be dependent on various factors.
+	 * Could be an actual readl( ) MMIO operation or an emulated
+	 * fsi master bit bang operation.  g_host will be initialized
+	 * with the proper value at init time.
+	 */
+	/* *value = g_host->fops->in_be32(g_host, address); */
+	return fsi_check_errors(master);
 }
 
 int fsi_writew_int(struct fsimaster *master, u32 pa, u32 value)
 {
-	return 0;
+	/*
+	 * How we access hardware will be dependent on various factors.
+	 * Could be an actual readl( ) MMIO operation or an emulated
+	 * fsi master bit bang operation.  g_host will be initialized
+	 * with the proper value at init time.
+	 */
+	/* g_host->fops->out_be32(g_host, address, value); */
+	return fsi_check_errors(master);
+}
+
+/* Encode CFAM ID and basic setup for SMODE */
+static u32 cfam_id_to_smode(int id)
+{
+	u32 smode = FSI_SMODE_WSC | FSI_SMODE_ECRC
+		| fsi_smode_echodly(0xf) | fsi_smode_senddly(0xf)
+		| fsi_smode_lbcrr(1) | fsi_smode_sid(id);
+
+	return smode;
+}
+
+static int setcfam_id(struct fsimaster *master, u32 address, int id)
+{
+	u32 smode = cfam_id_to_smode(id);
+
+	return fsi_writew_int(master, address + FSI_SMODE, smode);
 }
 
 /*
@@ -34,5 +87,37 @@ int fsi_writew_int(struct fsimaster *master, u32 pa, u32 value)
  */
 int fsi_sendbreak(struct fsimaster *master, u32 cfam_base, int linkno)
 {
-	return 0;
+	int rc = 0;
+	u32 smode;
+
+	dev_dbg(&master->fsidev->dev, "fsi_sendbreak >> mid:%d base:%d, link:%d\n",
+		master->myid, cfam_base, linkno);
+
+	rc = fsi_writew_int(master, cfam_base, FSI_BREAK);
+	if (rc)
+		goto done;
+
+	/* Wait for any CFAMs present to initialize */
+	udelay(200);
+	rc = fsi_readw_int(master, cfam_base + FSI_SLAVE0_OFFSET + FSI_SMODE,
+			   &smode);
+	if (rc)
+		goto done;
+
+	dev_dbg(&master->fsidev->dev, "fsi_sendbreak: SMODE after break:%08X\n",
+		smode);
+
+	/* For now only one CFAM allowed per link so must have an ID of 0 */
+	setcfam_id(master, cfam_base + FSI_SLAVE0_OFFSET, 0);
+
+	rc = fsi_readw_int(master, cfam_base + FSI_SLAVE0_OFFSET + FSI_SMODE,
+			   &smode);
+	dev_dbg(&master->fsidev->dev, "fsi_sendbreak: SMODE post SID set:%08X\n",
+		smode);
+
+	/* Wait for AUX port disable */
+	udelay(10);
+done:
+	dev_dbg(&master->fsidev->dev, "fsi_sendbreak << rc:%d\n", rc);
+	return rc;
 }
-- 
1.8.2.2
