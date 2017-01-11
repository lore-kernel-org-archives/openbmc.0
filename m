Return-Path: <xow@google.com>
Received: from mail-pf0-x236.google.com (mail-pf0-x236.google.com
 [IPv6:2607:f8b0:400e:c00::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tyqyp2R9TzDqL4
 for <openbmc@lists.ozlabs.org>; Wed, 11 Jan 2017 11:49:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="UzePUuof"; 
 dkim-atps=neutral
Received: by mail-pf0-x236.google.com with SMTP id 127so55434324pfg.1
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jan 2017 16:49:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oUIGKpgp4eQyN3BAuSjkFj/RHHpcE2GgWXWxcKzinPQ=;
 b=UzePUuofZHqx6q7qdMomZaeJX2zyJ03TXYkdaBkzwn2bPTgrVJZVDm5M2fcBa3kwgz
 WJtqMvxgEwfWNQY78EHtiNoMsNmrzNv426xxHkph9Qle5a25Tjy7c/c8rHHalGQ32COL
 b1viR2+edlsdiBOGeKvv0zcr6APvEZbOYjO01/exO3ooqEqDaPM4lZExKP6z6j6h/hZb
 hgrTn1gHkCzjo88UehjldVLq8gFot46PpYcAv+JZiCjVFA4r69JXqMzDWiZXVItt7sXq
 R2lMYXZmwukVqkbYXSPTj4nlX5LLaVGIif6t36X6u660WUOi++Xl9wa9vJCcE2fCQeRY
 1U6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oUIGKpgp4eQyN3BAuSjkFj/RHHpcE2GgWXWxcKzinPQ=;
 b=eBSz9rbFuCzQfvnG8d7vmMZj/S2/xI+aLXSlcJn6Zl9IeVhRhyxL+kxkOb1e+7tUpz
 NVaZKB9bylCjRLer3GkdQqlqxDYeVRJ9yJntKLJPg6p5GAko7tBl2q6MPn74TyTvWDZW
 +eYatxgGrhpOYyFqauDrkdG3C8RCIa5dlonrli6mpwiqfetKl4SXb+4RbDlyiPyKv8v1
 L99w4EddlWQkDD+r/89ioc8pSJbiLwrhQ9wIA8M/GNZKxyiAqYBcgcgbl5CC5MWEYowe
 vt3E30qB5fzDLrSSTqfhu3+wjCOztWKg2MpAMobzR8oAeu8n/io8yDyLpcbSExM91U/d
 yRlw==
X-Gm-Message-State: AIkVDXIlQqdBp/S72kwGzYyndn9hTTwIq/WbQDi8yKaO0OyGHFJco2z89T14yOzjyXKrt24r
X-Received: by 10.99.121.69 with SMTP id u66mr7196656pgc.96.1484095743267;
 Tue, 10 Jan 2017 16:49:03 -0800 (PST)
Received: from pewter.svl.corp.google.com ([100.123.242.121])
 by smtp.gmail.com with ESMTPSA id e5sm8432530pfd.77.2017.01.10.16.49.02
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 10 Jan 2017 16:49:02 -0800 (PST)
From: Xo Wang <xow@google.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux 1/2] gpio: dt-bindings: Fix typo in two-letter ports
Date: Tue, 10 Jan 2017 16:48:57 -0800
Message-Id: <20170111004858.12031-1-xow@google.com>
X-Mailer: git-send-email 2.11.0.390.gc69c2f50cf-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Wed, 11 Jan 2017 00:49:07 -0000

Add missing port AC.

Signed-off-by: Xo Wang <xow@google.com>
---
 include/dt-bindings/gpio/aspeed-gpio.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/dt-bindings/gpio/aspeed-gpio.h b/include/dt-bindings/gpio/aspeed-gpio.h
index 058c527cbcaf..0f8ab977c352 100644
--- a/include/dt-bindings/gpio/aspeed-gpio.h
+++ b/include/dt-bindings/gpio/aspeed-gpio.h
@@ -39,7 +39,8 @@
 #define ASPEED_GPIO_PORT_Y 24
 #define ASPEED_GPIO_PORT_Z 25
 #define ASPEED_GPIO_PORT_AA 26
-#define ASPEED_GPIO_PORT_BB 27
+#define ASPEED_GPIO_PORT_AB 27
+#define ASPEED_GPIO_PORT_AC 28
 
 #define ASPEED_GPIO(port, offset) \
 	((ASPEED_GPIO_PORT_##port * 8) + offset)
-- 
2.11.0.390.gc69c2f50cf-goog
