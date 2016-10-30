Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x243.google.com (mail-oi0-x243.google.com
 [IPv6:2607:f8b0:4003:c06::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t6Wrr5B8JzDvWw
 for <openbmc@lists.ozlabs.org>; Mon, 31 Oct 2016 09:10:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=p/aQRn1G; 
 dkim-atps=neutral
Received: by mail-oi0-x243.google.com with SMTP id 128so1108456oih.3
 for <openbmc@lists.ozlabs.org>; Sun, 30 Oct 2016 15:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Ygi5TsbirL4LnCmPFZgpzprNlNLOY1EnRj4y1VKW2Kc=;
 b=p/aQRn1Gof7/wdg3ImESohTk6H3HolFRhbJWIzBIN8kPtNHL7xJ70CZiwfarDEnSBo
 9aojjS6sMRIkIWQNaLIymeB5Aqxh1tLI7E/4zs+IPR/D28VZGvUJXYHDpdGODssGCFE5
 ADvZk/UeiN5B0r8ORuXAjh2bSxXuK2R5b6FtIPyirWMmgv+xBU2Qdmxa3LKsCay/JaAF
 bR9d2XAGonRUsTi5Y78TMZE0cZ9xD8o6TCFheDMC/8PA7DxF+hoazeLHgW34R6Qoji/P
 5TTXCEnhLiU2sW7i9En/N0xLBR9Q9sc8k+pTAtFPHYEauF/Ng37fzcnDj1fyqD9Q1T0w
 hR4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Ygi5TsbirL4LnCmPFZgpzprNlNLOY1EnRj4y1VKW2Kc=;
 b=DgjCsJyl9vaWSTuFAtnaFzUR0qTadvzhIYtVYYYzqfhUnudAptTuZD70zXm+8nrr5d
 /OLeToz3YNI4s8UNL0CWKv5KbkUYxSAp+7QcJqM2CnqdsSy1AC1zdUOWrr1YuFd7Fw4N
 YPW3zgxa2UVU5u6toIzeQIozRO+b3buzarqEWrGPK6XjSveaFkFfuI6dWc38JsqIuRs5
 uDGqHDfT33apb3yUDtqIqWI8709wjszbCy0jzxr5sjFHDvbFDo5M1JH/3xRuWfg0eT2R
 fc65nID/7K8ayqiGnexypvAxJHCBok4bCinizo560ClbrcrWBl4Vb1UIeN47JQSTwaQ8
 rhnw==
X-Gm-Message-State: ABUngvdchqoLe4AI2gvC+R0UNHhmdgQTtOv31yeFZlQahevu/xChe42JHxNIuxOySDkxSA==
X-Received: by 10.202.61.2 with SMTP id k2mr12136075oia.44.1477865418704;
 Sun, 30 Oct 2016 15:10:18 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id q59sm7585484ota.20.2016.10.30.15.10.17
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Sun, 30 Oct 2016 15:10:18 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Jeremy Kerr <jk@ozlabs.org>
Subject: [PATCH linux v6 09/18] fsi: Add crc4 helpers
Date: Sun, 30 Oct 2016 17:09:30 -0500
Message-Id: <1477865379-11566-29-git-send-email-christopher.lee.bostic@gmail.com>
X-Mailer: git-send-email 2.7.4 (Apple Git-66)
In-Reply-To: <1477865379-11566-1-git-send-email-christopher.lee.bostic@gmail.com>
References: <1477865379-11566-1-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Sun, 30 Oct 2016 22:10:21 -0000

From: Jeremy Kerr <jk@ozlabs.org>

Add some helpers for the crc checks for the slave configuration table.
This works 4-bits-at-a-time, using a simple table approach.

We will need this in the FSI core code, as well as any master
implementations that need to calculate CRCs in software.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
---
 drivers/fsi/fsi-core.c   | 25 +++++++++++++++++++++++++
 drivers/fsi/fsi-master.h | 21 +++++++++++++++++++++
 2 files changed, 46 insertions(+)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 9744a55..2d22320 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -34,6 +34,31 @@ struct fsi_slave {
 
 #define to_fsi_slave(d) container_of(d, struct fsi_slave, dev)
 
+/* crc helpers */
+static const uint8_t crc4_tab[] = {
+	0x0, 0x7, 0xe, 0x9, 0xb, 0xc, 0x5, 0x2,
+	0x1, 0x6, 0xf, 0x8, 0xa, 0xd, 0x4, 0x3,
+};
+
+uint8_t fsi_crc4(uint8_t c, uint64_t x, int bits)
+{
+	int i;
+
+	/* Align to 4-bits */
+	bits = (bits + 3) & ~0x3;
+
+	/* Calculate crc4 over four-bit nibbles, starting at the MSbit */
+	for (i = bits; i >= 0; i -= 4)
+		c = crc4_tab[c ^ ((x >> i) & 0xf)];
+
+	return c;
+}
+
+static bool check_crc4_u32(uint32_t x)
+{
+	return fsi_crc4(0, x, 32) == 0;
+}
+
 /* FSI slave support */
 static int fsi_slave_init(struct fsi_master *master,
 		int link, uint8_t slave_id)
diff --git a/drivers/fsi/fsi-master.h b/drivers/fsi/fsi-master.h
index e75a810..cafb433 100644
--- a/drivers/fsi/fsi-master.h
+++ b/drivers/fsi/fsi-master.h
@@ -34,4 +34,25 @@ struct fsi_master {
 extern int fsi_master_register(struct fsi_master *master);
 extern void fsi_master_unregister(struct fsi_master *master);
 
+/**
+ * crc4 helper: Given a starting crc4 state @c, calculate the crc4 vaue of @x,
+ * which is @bits in length. This may be required by master implementations
+ * that do not provide their own hardware checksums.
+ *
+ * The crc4 is performed on 4-bit chunks (which is all we need for FSI
+ * calculations). Typically, we'll want a starting state of 0:
+ *
+ *  c = fsi_crc4(0, msg, len);
+ *
+ * To crc4 a message that includes a single start bit, initialise crc4 state
+ * with:
+ *
+ *  c = fsi_crc4(0, 1, 1);
+ *
+ * Then update with message data:
+ *
+ *  c = fsi_crc4(c, msg, len);
+ */
+uint8_t fsi_crc4(uint8_t c, uint64_t x, int bits);
+
 #endif /* DRIVERS_FSI_MASTER_H */
-- 
1.8.2.2
