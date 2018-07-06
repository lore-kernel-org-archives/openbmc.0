Return-Path: <3QLI_WwwKB4Miluqhtpumhpynvvnsl.jvtvwluitjspz0z.v6shiz.vyn@flex--benjaminfair.bounces.google.com>
Authentication-Results: lists.ozlabs.org; spf=pass (mailfrom)
 smtp.mailfrom=flex--benjaminfair.bounces.google.com
 (client-ip=2607:f8b0:400d:c09::24a; helo=mail-qk0-x24a.google.com;
 envelope-from=3qli_wwwkb4miluqhtpumhpynvvnsl.jvtvwluitjspz0z.v6shiz.vyn@flex--benjaminfair.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="es1lKXse"; 
 dkim-atps=neutral
Received: from mail-qk0-x24a.google.com (mail-qk0-x24a.google.com
 [IPv6:2607:f8b0:400d:c09::24a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41Mjd31lSczDqHx
 for <openbmc@lists.ozlabs.org>; Sat,  7 Jul 2018 04:17:38 +1000 (AEST)
Received: by mail-qk0-x24a.google.com with SMTP id f132-v6so13583502qkb.12
 for <openbmc@lists.ozlabs.org>; Fri, 06 Jul 2018 11:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:date:message-id:subject:from:to:cc;
 bh=+aFA2TdFy3WZX5mPwAxavTvkiAMb0exwhMOXrhYp58I=;
 b=es1lKXsefbhP7Nqmyg2xAttjugZQe5pJtRIc/Pykdkjm4qX7cXdWfQOkuPRILwBdSq
 NPG+afsa6visddDczvLx9tO2nlomS/YZSeuYsoh0qognM3A4fEuI8dFKBcJu90LKoYGK
 WuZWE39q9Zp4i/VGCG1WwKeNdLNL6nty5rrxL4AT6zmLrtyh/zAT5CL0kfba2HhPWiL1
 /Sl9JhRgrREExvbOsrv8xmmD26EbD1iMw+xnbecljte8gRfL2tRQkHPlGZALyX2WTAPl
 JyGj2C0Ss+Euz6KFNWJTdLNw6FP/T0irBKThBQRzigeeZWUkZ7hmp/Kpwvgo458xYfk+
 N92Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to:cc;
 bh=+aFA2TdFy3WZX5mPwAxavTvkiAMb0exwhMOXrhYp58I=;
 b=nwxz0051+f9AcFDSwWSaFvPRmkt5gnuIkqse+lc/MasDLquvxKvnqjUMdaigveudiB
 tTDXM0zd+AS5nIuvs1NDzgXjinBYKnJYOJ4yJuEL9RoTDrTGrM5lfm6MPh9BDneJ4Bcn
 ulbblfmsSrJzHWUSakj4kpTGFgrwCu1YTZldgfQMJjGceeth13oRDX3lVw5JQYWSy9GC
 Qf9E8VKZPFZESvRfM96zncu/4RpV+oZH1e7WZY0nIJbShYdvNLFrSCOlLKyNKZFQrTgh
 DSdWxPxUndTuMgXtAh7GvzbJaEmfYap4UxhUTzBEYzzsWfCVQoF1rfdhJMraaAvlB8qH
 rISA==
X-Gm-Message-State: APt69E35mUfKLxHNvkwtX85NMuUmNYGs0GRe+dL0oJ65D+5BG30V6GLa
 Mu9b4sNxusKwwRBVj/5KPGKFHfk2LF2Yn/rVH5s=
X-Google-Smtp-Source: AAOMgpci0Ty/DBTVPdRjFVWJmM+pfTfrlLLdL+9oFtk8gEeg5wrvVlCDnwJyAMorYtKrpbRGC4hPwb+0iQyWlcXNQt0=
MIME-Version: 1.0
X-Received: by 2002:a0c:9ac8:: with SMTP id k8-v6mr6125368qvf.45.1530901056225; 
 Fri, 06 Jul 2018 11:17:36 -0700 (PDT)
Date: Fri,  6 Jul 2018 11:16:03 -0700
Message-Id: <20180706181601.134913-1-benjaminfair@google.com>
X-Mailer: git-send-email 2.18.0.203.gfac676dfb9-goog
Subject: [PATCH] ipmi: kcs_bmc: don't change device name
From: Benjamin Fair <benjaminfair@google.com>
To: Corey Minyard <minyard@acm.org>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 openipmi-developer@lists.sourceforge.net, 
 joel@jms.id.au, openbmc@lists.ozlabs.org
Cc: AviFishman70@gmail.com, tmaimon77@gmail.com, haiyue.wang@linux.intel.com, 
 tali.perry1@gmail.com, Benjamin Fair <benjaminfair@google.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 06 Jul 2018 18:17:44 -0000

kcs_bmc_alloc(...) calls dev_set_name(...) which is incorrect as most
bus driver frameworks, platform_driver in particular, assume that they
are able to set the device name themselves.

Signed-off-by: Benjamin Fair <benjaminfair@google.com>
---
 drivers/char/ipmi/kcs_bmc.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/char/ipmi/kcs_bmc.c b/drivers/char/ipmi/kcs_bmc.c
index fbfc05e3f3d1..cd75118bb0ac 100644
--- a/drivers/char/ipmi/kcs_bmc.c
+++ b/drivers/char/ipmi/kcs_bmc.c
@@ -16,6 +16,8 @@
 
 #include "kcs_bmc.h"
 
+#define DEVICE_NAME "ipmi-kcs"
+
 #define KCS_MSG_BUFSIZ    1000
 
 #define KCS_ZERO_DATA     0
@@ -440,8 +442,6 @@ struct kcs_bmc *kcs_bmc_alloc(struct device *dev, int sizeof_priv, u32 channel)
 	if (!kcs_bmc)
 		return NULL;
 
-	dev_set_name(dev, "ipmi-kcs%u", channel);
-
 	spin_lock_init(&kcs_bmc->lock);
 	kcs_bmc->channel = channel;
 
@@ -455,7 +455,8 @@ struct kcs_bmc *kcs_bmc_alloc(struct device *dev, int sizeof_priv, u32 channel)
 		return NULL;
 
 	kcs_bmc->miscdev.minor = MISC_DYNAMIC_MINOR;
-	kcs_bmc->miscdev.name = dev_name(dev);
+	kcs_bmc->miscdev.name = devm_kasprintf(dev, GFP_KERNEL, "%s%u",
+					       DEVICE_NAME, channel);
 	kcs_bmc->miscdev.fops = &kcs_bmc_fops;
 
 	return kcs_bmc;
-- 
2.18.0.203.gfac676dfb9-goog
