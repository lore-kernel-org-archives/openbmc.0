Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x242.google.com (mail-oi0-x242.google.com
 [IPv6:2607:f8b0:4003:c06::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s0g4n4zWmzDqR8
 for <openbmc@lists.ozlabs.org>; Fri, 29 Jul 2016 04:15:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=kdofeM44; 
 dkim-atps=neutral
Received: by mail-oi0-x242.google.com with SMTP id l9so5242354oih.0
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jul 2016 11:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=HZwzpGd7gBFFmGRuX7/YvmzshnoIbPhXB2qcVZ3/P7Y=;
 b=kdofeM44UnMQ0n8Bt1TLncxnKmbAvBF4Tg0do3EsE7jcleKuf+QvBYr8NwTy16HXrp
 qZR+75HimybiVTK4tfgjWL6RY0JhbdE+/hJ7feCuV8+AKAW2zAOQOVCrXW7r5uPIHq8j
 0Sy1A0EoUX6xiDJQl5pArn7BFNbP6tBPa8apq98B4EtHaGsNP+oQgAp66tJRR8XvUnqZ
 FFy+Fzk9AnOchjZAi7+fBwaiu2hPpgNAORQgfnraQdEO+3EXOVHazxOLHSCahNLBz7Z9
 SflZS4j76ZTl8oXwigyNQMP8mXmSFF3HFa4Nw8wkTqcnOULOs6wlvCymXKA5UP5mQXgq
 1wYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=HZwzpGd7gBFFmGRuX7/YvmzshnoIbPhXB2qcVZ3/P7Y=;
 b=Tpu6NGIZVBHjnMCUU4M7Nzw5dxI9R/+5uwDXoa2bEmJhvUR+WaUN3AFxmlxZ/MLd4K
 AvXRaFJDrUTQfL4OwoCqlVT9ERtxA8LbvyjtyJgA33dV5/FRH7I23ak+EGB5wPXv0tuT
 q1C+WDz+86ClwC5PNQl+i0EpZ1KOkx5NvtR35D2jWzBXgeEt44MLxLtL8FiQgD41Oim/
 /tBq+6lv2oBw2bdqB3Gh9ASK2FKLar8D7rSJUaT3Pe7iQ3Tm2A/xaGJyTXaTZAziBmJL
 1J08NarJct+rUSPqAJE/Fe6miXez6T4tsW7hCsUlUt+5Kwui79BVYSy+4Y2iwPm/knhv
 Oc3A==
X-Gm-Message-State: AEkooutfmLyTVxYV//urnlHZ+TfYs9bujjpvTtJdkHfwSUsJCuUCbKoGc4uvcg75b4MX7Q==
X-Received: by 10.202.117.22 with SMTP id q22mr18888728oic.63.1469729703622;
 Thu, 28 Jul 2016 11:15:03 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id u8sm5088273otb.5.2016.07.28.11.15.02
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Thu, 28 Jul 2016 11:15:03 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux 3/4] drivers/fsi: Add link presence detect functionality
Date: Thu, 28 Jul 2016 13:14:57 -0500
Message-Id: <1469729698-37246-3-git-send-email-christopher.lee.bostic@gmail.com>
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

Start scanning for CFAM presence on available links.

Signed-off-by: Chris Bostic <cbostic@us.ibm.com>
---
 drivers/fsi/fsimaster.c | 154 +++++++++++++++++++++++++++++++++++++++++++++++-
 drivers/fsi/fsimaster.h |  33 ++++++++++-
 2 files changed, 185 insertions(+), 2 deletions(-)

diff --git a/drivers/fsi/fsimaster.c b/drivers/fsi/fsimaster.c
index 96f6f60..0827f0b 100644
--- a/drivers/fsi/fsimaster.c
+++ b/drivers/fsi/fsimaster.c
@@ -22,9 +22,28 @@
 
 extern struct primaster prim;
 
+static int fsi_nextbit(u32 *new, int words)
+{
+	int bit, i;
+	u32 mask;
+
+	for (i = 0; i < words; i++) {
+		mask = 0x80000000;
+		for (bit = 0; bit < BITS_PER_LONG; bit++) {
+			if( new[bit] & mask )
+				return bit + i * BITS_PER_LONG;
+		}
+	}
+	return -1;
+}
+
+u32 fsim_cfam2pa(struct fsimaster *p, int link, int cfam)
+{
+	return 0;
+}
+
 static int hpinfo_alloc(struct fsimaster *p)
 {
-	/* Stub */
 	return 0;
 }
 
@@ -179,6 +198,20 @@ struct fsimaster * fsim_get_top_master(struct fsimaster *p)
 	return parent;
 }
 
+/*
+ * Work queue function to probe for links
+ */
+static void probe_wq(struct work_struct *nix)
+{
+}
+
+/*
+ * Work queue function to build up links
+ */
+static void build_wq(struct work_struct *nix)
+{
+}
+
 static int fsimaster_reset(struct fsimaster *p)
 {
 	u32 mresp, maeb, mver, mectrl, mmode, menp[2];
@@ -251,6 +284,10 @@ struct fsimaster *fsimaster_build_init(struct fsimaster *p, int type,
 	}
 	p->type = type;
 	p->fsidev = parent;
+	init_timer(&p->hotp.mytimer);
+	init_completion(&p->hotp.i_am_dead);
+	INIT_WORK(&p->hotp.probewrk, probe_wq);
+	INIT_WORK(&p->hotp.buildwrk, build_wq);
 	if( fsimaster_init(p)) {
 		p = 0;
 		goto out;
@@ -264,9 +301,124 @@ out:
 	return p ? : ERR_PTR(rc);
 }
 
+static void plugadd_link(struct fsimaster *p, struct hp_info *hp)
+{
+	u32 addr;
+
+	hp->ec = 0;
+	atomic_set(&hp->state, FSI_LINK_INPROBE);
+	set_bit(hp->linkno, p->hotp.probing);
+	addr = fsi_mtype2pa(fsim_cfam2pa(p, hp->linkno, 0), p->type);
+}
+
+static void plugadd(struct fsimaster *p, u32 *diff)
+{
+	int linkno;
+	struct fsidd *dd = to_fsidd_prim(fsim_get_top_master(p));
+
+	set_bit(FSIDD_PROBE, &dd->state);
+	while ((linkno = fsi_nextbit(diff, 2)) >= 0) {
+		if (linkno >= p->maxlinks)
+			break;
+		plugadd_link(p, p->hotp.plug[linkno]);
+	}
+}
+
+static void plugdel(struct fsimaster *p, u32 *diff)
+{
+}
+
+/*
+ * Look for CFAMs plugged into any of the available link slots
+ */
+int fsim_staticplug_nl(struct fsimaster *p, u32 *menp, u32 *mlevp)
+{
+	int rc = 0;
+
+	rc = (*p->read_f2)(p->mp, FSI_N_MENP0, menp);
+	if (rc)
+		goto done;
+	rc = (*p->read_f2)(p->mp, FSI_N_MLEVP0, mlevp);
+
+done:
+	return rc;
+}
+
+int fsim_staticplug(struct fsimaster *p, u32 *menp, u32 *mlevp)
+{
+	int rc = 0;
+	unsigned long msr = 0;
+
+	spin_lock_irqsave(&p->lock, msr);
+	rc = fsim_staticplug_nl(p, menp, mlevp);
+	spin_unlock_irqrestore(&p->lock, msr);
+
+	return rc;
+}
+
+/*
+ * Periodically called function to check for static plug changes
+ */
+static void plugmgr(unsigned long para)
+{
+	struct fsimaster *p = (struct fsimaster *)para;
+	struct fsidd *dd;
+	int rc;
+	u32 mlevp[2], menp[2], delta[2], new[2], gone[2];
+
+	rc = fsim_staticplug(p, menp, mlevp);
+	if (rc)
+		goto done;
+
+	dd = to_fsidd_prim(fsim_get_top_master(p));
+
+	mlevp[0] |= menp[0];
+	mlevp[1] |= menp[1];
+	delta[0] = p->hotp.mlevp_last[0] ^ mlevp[0];
+	delta[1] = p->hotp.mlevp_last[1] ^ mlevp[1];
+	new[0] = delta[0] & mlevp[0];
+	new[1] = delta[1] & mlevp[1];
+	gone[0] = delta[0] & p->hotp.mlevp_last[0];
+	gone[1] = delta[1] & p->hotp.mlevp_last[1];
+	p->hotp.mlevp_last[0] = mlevp[0];
+	p->hotp.mlevp_last[1] = mlevp[1];
+
+	if (gone[0] || gone[1])
+		plugdel(p, gone);
+	if (new[0] || new[1])
+		plugadd(p, new);
+
+	queue_work(dd->hotp_wq, &p->hotp.probewrk);
+	if (p->hotp.building[0] == 0 && p->hotp.building[1] == 0)
+		clear_bit(FSIDD_PROBE, &dd->state);
+	if (p->hotp.building[0] || p->hotp.building[1])
+		queue_work(dd->hotp_wq, &p->hotp.buildwrk);
+
+	mod_timer(&p->hotp.mytimer,
+		  jiffies + msecs_to_jiffies(FSI_DFLT_PLUG_CHECK));
+done:
+	return;
+}
+
 /*
  * Kick off the master so it can start probing for attached CFAMs
  */
 void fsimaster_start(struct fsimaster *p)
 {
+	struct fsi_mreg *regs = &(prim.regs);
+
+	memset(regs, 0, sizeof(struct fsi_mreg));
+	p->mp = (u32 *)regs;
+
+	/*
+	 * TODO: Implement presence detect via I/O
+	 * For now we'll define the default as link 0 as present
+	 */
+	regs->mlevp0[0] = 0x80000000;
+
+	/* Kick off the presence detect polling routine */
+	p->hotp.mytimer.function = plugmgr;
+	p->hotp.mytimer.data = (unsigned long)p;
+	p->hotp.mytimer.expires = jiffies + msecs_to_jiffies(FSI_DFLT_PLUG_CHECK);
+	add_timer(&p->hotp.mytimer);
 }
diff --git a/drivers/fsi/fsimaster.h b/drivers/fsi/fsimaster.h
index b07934e..40f4f4c 100644
--- a/drivers/fsi/fsimaster.h
+++ b/drivers/fsi/fsimaster.h
@@ -21,6 +21,16 @@
 #define	FSI_DFLT_PLUG_CHECK	100
 #define FSI_DFLT_IPOLL_CHECK	800
 
+/* Link states */
+#define FSI_LINK_FREE		1	/* Nothing plugged */
+#define FSI_LINK_INPROBE	2	/* Link probed */
+#define FSI_LINK_INPOLL		3	/* I-Poll test */
+#define FSI_LINK_INBUILD	4	/* Building */
+#define FSI_LINK_RUNNING	5	/* Up and functional */
+#define FSI_LINK_INLOST		6	/* Link dropped */
+#define FSI_LINK_DEAD		7	/* No longer useable */
+#define FSI_LINK_WAITFOR	8	/* Notify on completion */
+
 /* FSI master register numbers */
 #define	FSI_N_MMODE	0	/* 0x0   R/W: mode register */
 #define	FSI_N_MDLYR	1	/* 0x4   R/W: delay register */
@@ -522,6 +532,26 @@ static inline unsigned long get_termpa(unsigned long slv_pa)
 	return slv_pa & ~0xfff;
 }
 
+struct hp_info {			/* Hot plug information */
+	struct completion done;		/* Link build done */
+	unsigned short tries;		/* # of tries before probing */
+	unsigned char linkno;		/* Link # */
+	atomic_t state;			/* State of this entry */
+	int ec;				/* Error code */
+	unsigned long state_w;		/* Wait state */
+};
+
+struct hotplug {			/* Hot Plug work structure */
+	u32 mlevp_last[2];		/* Last known plug state */
+	unsigned long building[2];	/* Bit mask of links to build up */
+	unsigned long probing[2];	/* Bit mask of links to  probe */
+	struct timer_list mytimer;	/* For periodic plug check */
+	struct work_struct probewrk;	/* Probe worker */
+	struct work_struct buildwrk;	/* Build worker */
+	struct completion i_am_dead;	/* Wait for workw to finish */
+	struct hp_info *plug[FSI_MAX_LINKS];	/* Data to work on */
+};
+
 struct master_quirks {
 	int break_cfam_id;
 	void (*port_reset)(struct fsidevice *, struct fsidevice *, int);
@@ -546,6 +576,7 @@ struct fsimaster {			/* FSI master definition */
 	unsigned char hw_version;	/* FSI master hardware version */
 	unsigned char maxlinks;		/* FSI master links */
 	struct fsilink *link[FSI_MAX_LINKS];
+	struct hotplug hotp;		/* Hot plug link information */
 	int (*write_f)(volatile u32 *, int, u32);	/* Write function */
 	int (*read_f)(volatile u32 *, int, u32 *);	/* Read function */
 	int (*write_f2)(volatile u32 *, int, u32 *);	/* Write function */
@@ -624,7 +655,7 @@ unsigned long fsi_matrb_addr(unsigned long);
 /*
  * Helper utilities for link/cfam calculations.
  */
-phys_addr_t fsim_cfam2pa(struct fsimaster *, int, int);
+u32 fsim_cfam2pa(struct fsimaster *, int, int);
 unsigned long fsim_linksz(struct fsimaster *);
 unsigned long fsim_cfamsz(struct fsimaster *);
 
-- 
1.8.2.2
