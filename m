Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::643; helo=mail-pl1-x643.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="do/3gaqd"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42vCGh5M57zF3M3
 for <openbmc@lists.ozlabs.org>; Tue, 13 Nov 2018 14:07:24 +1100 (AEDT)
Received: by mail-pl1-x643.google.com with SMTP id g59-v6so5254560plb.10
 for <openbmc@lists.ozlabs.org>; Mon, 12 Nov 2018 19:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J9IpDcTEoGvC/Hh7mZ5lUuV62MnHMxuAkvH/CnQWZYQ=;
 b=do/3gaqd5Ne4ET2gKmGmBNyGtQCT+v4z3eASuVqOMIx+attO9wO4ANwXBsYc+qZIKd
 TdWhx5U3XQfm3TMTXYLreOhk82xj3Y8IQRZ15DXnAo3yikHkwqKkLx6/9aSP4HFvKV5d
 2cV+7aVvohZDyFkFTsnC5RAwS37i/o8w1KxPNDan6q8u9jubV4T6BYL0zvkXQI11uYQQ
 QPJqdyUpumf/dWpkmSAqTqdseGl6A/v7voR2SlBipQ77X1ZNcA0lt0KmTyw5rVEJrAKO
 iSsaSZ6Fj7MKLlqD0XLxEpEvqMROjDFPr15E7SPk+hsFQhvWq5GU9IKyXOgZMX6eDtnu
 N+xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=J9IpDcTEoGvC/Hh7mZ5lUuV62MnHMxuAkvH/CnQWZYQ=;
 b=SjBChOs1z+vL6viMgeMJ3Unc4T5xgcWnfu5A38WAHdPKFxStZQtGKIvLfb+oc5UEj1
 GhMraNPe7WFSncAIIwP1rwZsv119SUnX30Tt4f7MfPJy9ndVjXqSo9P6ywWLqvVYtHuu
 +bWpnEoDU1aiPnmZL26ZhoFp2N0b2v6nhpKjOajFHLOIT4dD33k5pey1efUFJ91tqoHO
 z8D2SVEZ/oGXaJHKNDGnHpUufu3nmpxzAaWkDrCrhe/QJTHCPqK5qkOv+rPFBsyHBaMp
 fesgVBBHeYU2iCfdf27xuqy18yGkCQ28NDQ+MyjzRFBjmLVsFQLT7bKHr/b/f7Gq/Dv7
 tJeg==
X-Gm-Message-State: AGRZ1gJvDyQEWEmfTbRAheX+W0wsxDKzt+5LsV7jEHuDGUc0Ai7odDsu
 bfzveZPYpZ5VYsqYjfJWTiKaaK4v
X-Google-Smtp-Source: AJdET5cYyleu6/9ot44noraUBZARv43d5k8IG7HKlA6yR/bV4yHpjOva3YHWM2YgXnqqxEUJZf6Bzw==
X-Received: by 2002:a17:902:5a03:: with SMTP id
 q3-v6mr3396567pli.186.1542078442689; 
 Mon, 12 Nov 2018 19:07:22 -0800 (PST)
Received: from aurora.jms.id.au ([45.124.203.15])
 by smtp.gmail.com with ESMTPSA id 67-v6sm23756748pfk.134.2018.11.12.19.07.19
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 12 Nov 2018 19:07:21 -0800 (PST)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Tue, 13 Nov 2018 13:37:16 +1030
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH qemu aspeed-3.1 2/2] aspeed/scu: Implement power off command
Date: Tue, 13 Nov 2018 13:34:21 +1030
Message-Id: <20181113030421.6264-3-joel@jms.id.au>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181113030421.6264-1-joel@jms.id.au>
References: <20181113030421.6264-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 13 Nov 2018 03:07:25 -0000

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 hw/misc/aspeed_scu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
index 51498ce70be6..257f9a6c6b8a 100644
--- a/hw/misc/aspeed_scu.c
+++ b/hw/misc/aspeed_scu.c
@@ -16,6 +16,7 @@
 #include "qapi/visitor.h"
 #include "qemu/bitops.h"
 #include "qemu/log.h"
+#include "sysemu/sysemu.h"
 #include "crypto/random.h"
 #include "trace.h"
 
@@ -84,6 +85,7 @@
 #define SRAM_DECODE_BASE1    TO_REG(0x194)
 #define SRAM_DECODE_BASE2    TO_REG(0x198)
 #define BMC_REV              TO_REG(0x19C)
+#define POWEROFF             TO_REG(0x1A0)
 #define BMC_DEV_ID           TO_REG(0x1A4)
 
 #define SCU_IO_REGION_SIZE 0x1000
@@ -263,6 +265,9 @@ static void aspeed_scu_write(void *opaque, hwaddr offset, uint64_t data,
         }
         /* Avoid assignment below, we've handled everything */
         return;
+    case POWEROFF:
+        qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
+        break;
     case FREQ_CNTR_EVAL:
     case VGA_SCRATCH1 ... VGA_SCRATCH8:
     case RNG_DATA:
-- 
2.19.1
