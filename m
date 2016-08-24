Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-qk0-x242.google.com (mail-qk0-x242.google.com
 [IPv6:2607:f8b0:400d:c09::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sKJ0x6BcnzDrck
 for <openbmc@lists.ozlabs.org>; Thu, 25 Aug 2016 05:54:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=dkym72+0; 
 dkim-atps=neutral
Received: by mail-qk0-x242.google.com with SMTP id o1so2012499qkd.2
 for <openbmc@lists.ozlabs.org>; Wed, 24 Aug 2016 12:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=PJ8RuCsd59VuqpyxxJxi0iM0yDlKfXN+NVLyELnxYeU=;
 b=dkym72+0s3zZX5dfaM20tLotc2m7M9pguIoq3NqJYlHh205Hsagf2Uiuq2l9OG0DNP
 wp/J+75DR54TzpzY7Y3uwuqj+9zI4JPYZ4OKmpp/Vo2qQRGAJiiDfNeJJDZ5qGrA0h50
 7pcSU0X0bJakzbCoGtYntA8WCz9zPFC+/DAS0OiVHzyaCpv1JUrGtPLO7rGc91lnAPbB
 m+izjXiPYn875/+FfhvSC887K0IZLntal76DOaWEX/XgkzjidPm7cki0zhCz9tV9Bc/D
 y6KZW7WiwMwl56klJqCjVvRsfM4eOAlXKM4/OVu6q3jPHGP+T4LZRBXdfrErQikPIcJn
 DOHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=PJ8RuCsd59VuqpyxxJxi0iM0yDlKfXN+NVLyELnxYeU=;
 b=nMzpyROwe5jdDtx1/cn8Q+BpoqoZXgkJH5zOUVqh0EsBtR3EtNJhVf5e03o8L3UTux
 4w01t0DHtbqsamOKynb4Y8OU6hNLNRdgmm/kqAKNJQVpRrQiKzeoqsLbIdNZch5H4jhn
 mns2Mo4w3D6UeT8SzXY+6a57iTW0CYxrKbnCXb690zk+541ogpr9cWQeF6VfFFZ4WK5p
 U49x9BXfu+mGLzEIKiF7oKZAhRK03bTqNCus1zbd9AVw5PXxr+MljBvqo9tt9cpbNRGY
 W0Q5y+eu+wFFxxbv8F1aO/ZTxQKoNflO4qFPJ9xLRKr69EsuUSw+0fIdNhExoOZfGGds
 5LUw==
X-Gm-Message-State: AE9vXwMVtBUlxV9CympQTHUsyVTPv9bYU2e5GvU1qTGqEpZP4UqIzeZGjSPjhZgkGdPdEQ==
X-Received: by 10.55.126.195 with SMTP id z186mr6052427qkc.76.1472068463679;
 Wed, 24 Aug 2016 12:54:23 -0700 (PDT)
Received: from christophersmbp.austin.ibm.com ([32.97.110.51])
 by smtp.gmail.com with ESMTPSA id n6sm3544238qkf.36.2016.08.24.12.54.22
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Wed, 24 Aug 2016 12:54:23 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux v5 3/7] drivers/fsi: Add FSI master target device
 scanning function
Date: Wed, 24 Aug 2016 14:54:08 -0500
Message-Id: <1472068452-32048-4-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Wed, 24 Aug 2016 19:54:26 -0000

From: Chris Bostic <cbostic@us.ibm.com>

Initialize and start the periodic target device presence detect function.
Add FSI master control register accessors to allow check of physical target
device plug state.  Any target devices will show as present with a '1' in
the FSI master control MLEVP register.

Signed-off-by: Chris Bostic <cbostic@us.ibm.com>
---
 drivers/fsi/fsimaster.c | 119 ++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/fsi/fsimaster.h |  21 +++++++++
 2 files changed, 140 insertions(+)

diff --git a/drivers/fsi/fsimaster.c b/drivers/fsi/fsimaster.c
index b5d16db..8054051 100644
--- a/drivers/fsi/fsimaster.c
+++ b/drivers/fsi/fsimaster.c
@@ -15,6 +15,7 @@
 #include <linux/delay.h>
 #include <linux/ktime.h>
 #include <linux/io.h>
+#include <linux/bitops.h>
 #include "fsi.h"
 #include "fsiinit.h"
 #include "fsimaster.h"
@@ -161,6 +162,20 @@ struct fsimaster *fsimaster_get_top_master(struct fsimaster *master)
 	return parent;
 }
 
+/*
+ * Work queue function to probe links
+ */
+static void probe_wq(struct work_struct *work)
+{
+}
+
+/*
+ * Work queue function to build up links
+ */
+static void build_wq(struct work_struct *work)
+{
+}
+
 static int fsimaster_reset(struct fsimaster *master)
 {
 	u32 reg = 0;
@@ -221,6 +236,10 @@ struct fsimaster *fsimaster_build_init(struct fsimaster *master, int type,
 	}
 	master->type = type;
 	master->fsidev = parent;
+	init_timer(&master->hotp.mytimer);
+	init_completion(&master->hotp.link_dead);
+	INIT_WORK(&master->hotp.probework, probe_wq);
+	INIT_WORK(&master->hotp.buildwork, build_wq);
 	if (fsimaster_init(master)) {
 		master = NULL;
 		goto out;
@@ -234,9 +253,109 @@ out:
 	return master ? : ERR_PTR(rc);
 }
 
+static void plugadd_link(struct fsimaster *master, struct fsi_hotplug *hp)
+{
+	hp->error_code = 0;
+	atomic_set(&hp->state, FSI_LINK_PROBE);
+	set_bit(hp->linkno, &master->hotp.probing);
+}
+
+static void plugadd(struct fsimaster *master, u64 *now_avail)
+{
+	int linkno;
+	struct fsidd *dd = to_fsidd_prim(fsimaster_get_top_master(master));
+
+	set_bit(FSI_LINK_PROBE, &dd->state);
+	while ((linkno = ffs(*now_avail)) >= 0) {
+		if (linkno >= master->maxlinks)
+			break;
+		plugadd_link(master, master->hotp.plug[linkno]);
+	}
+}
+
+static void plugdel(struct fsimaster *master, u64 *missing)
+{
+}
+
+/*
+ * Read in data on CFAM plug states
+ * nl: Not wrapped in a spin lock for those situations that don't require it
+ */
+void fsimaster_staticplug_nl(struct fsimaster *master, u64 *menp, u64 *mlevp)
+{
+	master->read_reg2(master->base, FSI_N_MENP, menp);
+	master->read_reg2(master->base, FSI_N_MLEVP, mlevp);
+}
+
+void fsimaster_staticplug(struct fsimaster *master, u64 *menp, u64 *mlevp)
+{
+	unsigned long msr = 0;
+
+	spin_lock_irqsave(&master->lock, msr);
+	fsimaster_staticplug_nl(master, menp, mlevp);
+	spin_unlock_irqrestore(&master->lock, msr);
+}
+
+/*
+ * Periodically called to check for static plug changes
+ */
+static void plugmgr(unsigned long para)
+{
+	struct fsimaster *master = (struct fsimaster *)para;
+	struct fsidd *dd;
+	u64 curr_plug_state, curr_enable_state, changed, now_avail, missing;
+
+	fsimaster_staticplug(master, &curr_enable_state, &curr_plug_state);
+	dd = to_fsidd_prim(fsimaster_get_top_master(master));
+
+	/* What is currently plugged and in use */
+	curr_plug_state |= curr_enable_state;
+
+	/* What plug states have changed since last checked */
+	changed = master->hotp.mlevp_last ^ curr_plug_state;
+
+	/* Slots where something has shown up since last checked */
+	now_avail = changed & curr_plug_state;
+
+	/* Slots where something disappeared since last checked */
+	missing = changed & master->hotp.mlevp_last;
+
+	/* Save off current plug state for next pass */
+	master->hotp.mlevp_last = curr_plug_state;
+
+	if (missing)
+		plugdel(master, &missing);
+	if (now_avail)
+		plugadd(master, &now_avail);
+
+	/* We have links to probe based on newest plug state data */
+	queue_work(dd->hotp_wq, &master->hotp.probework);
+	if (master->hotp.building == 0)
+		clear_bit(FSI_LINK_PROBE, &dd->state);
+
+	/* Probe has finished so can now proceed with link scan, aka 'build' */
+	if (master->hotp.building)
+		queue_work(dd->hotp_wq, &master->hotp.buildwork);
+
+	mod_timer(&master->hotp.mytimer,
+		  jiffies + msecs_to_jiffies(FSI_PLUG_CHECK_TIME));
+}
+
 /*
  * Kick off the master so it can start probing for attached CFAMs
  */
 void fsimaster_start(struct fsimaster *master)
 {
+	/*
+	 * TODO: Implement presence detect via I/O
+	 * For now we'll define the default as only link 0 present
+	 */
+	master->base->mlevp = 0x8000000000000000ULL;
+
+	/* Kick off the presence detect polling routine */
+	master->hotp.mytimer.function = plugmgr;
+	master->hotp.mytimer.data = (unsigned long)master;
+	master->hotp.mytimer.expires = jiffies +
+					msecs_to_jiffies(FSI_PLUG_CHECK_TIME);
+	add_timer(&master->hotp.mytimer);
 }
diff --git a/drivers/fsi/fsimaster.h b/drivers/fsi/fsimaster.h
index 4df2caf..61e8c8a 100644
--- a/drivers/fsi/fsimaster.h
+++ b/drivers/fsi/fsimaster.h
@@ -520,6 +520,26 @@ static inline unsigned long get_termpa(unsigned long slv_pa)
 	return slv_pa & ~0xfff;
 }
 
+struct fsi_hotplug {			/* Hot plug information */
+	struct completion done;		/* Link build done */
+	u16 tries;			/* # of tries before probing */
+	u8 linkno;			/* Link # */
+	atomic_t state;			/* State of this entry */
+	int error_code;			/* Error code */
+	unsigned long wait_state;	/* Wait state */
+};
+
+struct hotplug {			/* Hot Plug work */
+	u64 mlevp_last;			/* Last known plug state */
+	unsigned long building;		/* Bit mask of links to build up */
+	unsigned long probing;		/* Bit mask of links to probe */
+	struct timer_list mytimer;	/* For plug check period */
+	struct work_struct probework;	/* Probe worker */
+	struct work_struct buildwork;	/* Build worker */
+	struct completion link_dead;	/* Wait for workw to finish */
+	struct fsi_hotplug *plug[FSI_MAX_LINKS];	/* Data to work on */
+};
+
 struct master_quirks {
 	int break_cfam_id;
 	void (*port_reset)(struct fsidevice *, struct fsidevice *, int);
@@ -544,6 +564,7 @@ struct fsimaster {			/* FSI master definition */
 	unsigned char hw_version;	/* FSI master hardware version */
 	unsigned char maxlinks;		/* FSI master links */
 	struct fsilink *link[FSI_MAX_LINKS];
+	struct hotplug hotp;		/* CFAM plug status information */
 	void (*write_reg)(struct fsi_mreg *, int, u32);	/* Write 32 bit word */
 	u32 (*read_reg)(struct fsi_mreg *, int);	/* Read 32 bit word */
 	void (*write_reg2)(struct fsi_mreg *, int, u64 *);	/* 64 bit */
-- 
1.8.2.2
