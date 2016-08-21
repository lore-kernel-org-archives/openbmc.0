Return-Path: <brendanhiggins@google.com>
Received: from mail-pa0-x22d.google.com (mail-pa0-x22d.google.com
 [IPv6:2607:f8b0:400e:c03::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sGzlC3gCPzDr7q
 for <openbmc@lists.ozlabs.org>; Sun, 21 Aug 2016 11:34:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=nQ1iURrD; 
 dkim-atps=neutral
Received: by mail-pa0-x22d.google.com with SMTP id fi15so26825187pac.1
 for <openbmc@lists.ozlabs.org>; Sat, 20 Aug 2016 18:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=YJPAAqjy9LfDu3DS4mPbuJLPBxaRCFv0RtjdmBroDgM=;
 b=nQ1iURrDVIQwJb7YDzZAxFAH73K+g+xymF8ESzo/0ZEQpVMwrpIlBGMVlBNfoSe5nv
 XSjyOUhTl72P4NU9YuzhLFqNvvBxm6ZEgMn3uDTEWhDS6MYrrG1nkSCFhpg/MLb887ED
 XQJVQQa+Imf8dqMqHtc2WiVoRrp42sURERb5ihb1GDwqM2eEGBH8kVxuDS1tzy8axWZb
 eXF66CZIIqPPCwAqelcapOoiP03Rxyv937FCNebGq+FwJFQeHAjG0DBn2Q8l0yPdWzKB
 WpGGrLLbO7eQ/jQgapoxxIA0aM/CU/eWJ4aCnH/bpG3GEAXHh/pgjVeZh+d7QhQDsPzv
 BXaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=YJPAAqjy9LfDu3DS4mPbuJLPBxaRCFv0RtjdmBroDgM=;
 b=Kzs63MLrOsa13y0jDe8RamUhnp5UC2CRq+W/L+pI11JxabeJ1QIP8BOu2AkLEDdo7H
 Bt7itXOp0Jsh/N6GtjYajTK3wR3cXB1G5snwusicf8eVkuOzcbt5HWi+wPvuT6jPRD2U
 IMPg3yBlo1hlO0E2HO9ZAQ5GwslSZgNUjj/jXHFKBLLR7xNp79MOIImEiwT8k80PXDXv
 tyJAXEiHqXRUoJujlM4ZG6s+EbxPy5xF1IFjiZA51LJHIctr3ogGFER7vO5WVrY1+BAr
 7Nv00xPQVZeCRRjlJCOssPN8Tyt9lKrMAkE62G2uK7r7PreHhahcZGsJK1VCVzdkjFwq
 WqGQ==
X-Gm-Message-State: AEkoouvaGt968gs1SWXx1IG2Mx2//2kPvEjcKv+gchsPe5cij2xvOJvawlkoLZGoYGdHq4FN
X-Received: by 10.66.164.227 with SMTP id yt3mr28722080pab.117.1471743269223; 
 Sat, 20 Aug 2016 18:34:29 -0700 (PDT)
Received: from mactruck.mtv.corp.google.com ([172.18.64.18])
 by smtp.gmail.com with ESMTPSA id bw10sm21772578pac.27.2016.08.20.18.34.27
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sat, 20 Aug 2016 18:34:28 -0700 (PDT)
From: Brendan Higgins <brendanhiggins@google.com>
To: openbmc@lists.ozlabs.org
Cc: Brendan Higgins <brendanhiggins@google.com>
Subject: [PATCH 1/2] eeprom: at24: added quirk for 24c08 devices
Date: Sat, 20 Aug 2016 18:34:17 -0700
Message-Id: <1471743258-7179-2-git-send-email-brendanhiggins@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
In-Reply-To: <1471743258-7179-1-git-send-email-brendanhiggins@google.com>
References: <1471743258-7179-1-git-send-email-brendanhiggins@google.com>
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
X-List-Received-Date: Sun, 21 Aug 2016 01:34:31 -0000

Some 24c08 devices exhibits a quirk where they will not NACK durring an
acknowledge poll. Added a STOP after the dummy write to address problem.
---
 drivers/misc/eeprom/at24.c         | 12 +++++++++++-
 include/linux/platform_data/at24.h |  1 +
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
index 9ceb63b..c647efb 100644
--- a/drivers/misc/eeprom/at24.c
+++ b/drivers/misc/eeprom/at24.c
@@ -120,7 +120,11 @@ static const struct i2c_device_id at24_ids[] = {
 		AT24_FLAG_READONLY | AT24_FLAG_IRUGO) },
 	{ "24c04", AT24_DEVICE_MAGIC(4096 / 8, 0) },
 	/* 24rf08 quirk is handled at i2c-core */
-	{ "24c08", AT24_DEVICE_MAGIC(8192 / 8, 0) },
+	/* 24c08 exhibits a quirk where it will not NACK durring an
+	 * acknowledge poll so we have to send a stop after the dummy write in
+	 * a read.
+	 */
+	{ "24c08", AT24_DEVICE_MAGIC(8192 / 8, AT24_FLAG_STOPPOLL) },
 	{ "24c16", AT24_DEVICE_MAGIC(16384 / 8, 0) },
 	{ "24c32", AT24_DEVICE_MAGIC(32768 / 8, AT24_FLAG_ADDR16) },
 	{ "24c64", AT24_DEVICE_MAGIC(65536 / 8, AT24_FLAG_ADDR16) },
@@ -212,6 +216,12 @@ static ssize_t at24_eeprom_read(struct at24_data *at24, char *buf,
 		msgbuf[i++] = offset;
 
 		msg[0].addr = client->addr;
+		/*
+		 * Some EEPROMs do not perform the acknowledge poll correctly
+		 * and have to send a STOP after the dummy write.
+		 */
+		if (at24->chip.flags & AT24_FLAG_STOPPOLL)
+			msg[0].flags = I2C_M_STOP;
 		msg[0].buf = msgbuf;
 		msg[0].len = i;
 
diff --git a/include/linux/platform_data/at24.h b/include/linux/platform_data/at24.h
index be830b1..1773822 100644
--- a/include/linux/platform_data/at24.h
+++ b/include/linux/platform_data/at24.h
@@ -47,6 +47,7 @@ struct at24_platform_data {
 #define AT24_FLAG_READONLY	0x40	/* sysfs-entry will be read-only */
 #define AT24_FLAG_IRUGO		0x20	/* sysfs-entry will be world-readable */
 #define AT24_FLAG_TAKE8ADDR	0x10	/* take always 8 addresses (24c00) */
+#define AT24_FLAG_STOPPOLL	0x08	/* Send stop before ACK poll */
 
 	void		(*setup)(struct nvmem_device *nvmem, void *context);
 	void		*context;
-- 
2.8.0.rc3.226.g39d4020
