Return-Path: <3Fdy5XAcKB6AVENTUREGOOGLE.COMOPENBMCLISTS.OZLABS.ORG@flex--venture.bounces.google.com>
Authentication-Results: lists.ozlabs.org; spf=pass (mailfrom)
 smtp.mailfrom=flex--venture.bounces.google.com
 (client-ip=2607:f8b0:4864:20::649; helo=mail-pl1-x649.google.com;
 envelope-from=3fdy5xackb6aventuregoogle.comopenbmclists.ozlabs.org@flex--venture.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Ar+wgEmy"; 
 dkim-atps=neutral
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com
 [IPv6:2607:f8b0:4864:20::649])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44lz3P2PZMzDqTv
 for <openbmc@lists.ozlabs.org>; Sat, 20 Apr 2019 00:32:57 +1000 (AEST)
Received: by mail-pl1-x649.google.com with SMTP id p11so3601849plr.3
 for <openbmc@lists.ozlabs.org>; Fri, 19 Apr 2019 07:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=sSRHZ+zdOR0Fuw/mRbsW2wNy2XknL3g7+iyrJIV+Gmg=;
 b=Ar+wgEmy6V4Z3AKHFl5zjgZ2AA5YTC+1/spkKpk/MZaqujxV9RVQ0+lzUhGAZhS6Ma
 zRY6aNhNhc+IkDGjWsMh4PdWPRsu8UoxQOZWNS3WOgzBGPtUBGQPTqNdn7kHEucDE5Eu
 7AM6zogi5XOeSxC2yt4+nvV13LEaJ/V+pdizDOrLGTE62zdz7SGJxhds2aDDkojuH938
 EhOkINeE/6TnXiDZ12dv3x1tHj8Lc+D9P4QHO9r4bKihnXGdoV6p3rw6096NIc/8wL+t
 BBq7+7VSZFYB1zSqWLaU65UdST8HIfNJ0fXLp8HkYqomMwAJV2TTLQZd/8stGUh6vI/R
 JyhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=sSRHZ+zdOR0Fuw/mRbsW2wNy2XknL3g7+iyrJIV+Gmg=;
 b=c20T0n2V8UYtZ8BwE0ubDjkpo2IdqhVtxmJqK9HcGlMZC2iCIvWm+NP1oKhrq+HXy/
 WlYTcZ3/sQHUlq9nlhcYoB/TcOXeN9hW5zymLdvSZbPPKjRz9Dff03ESp9qf9vYqNDKo
 fVQ+CVvCPX/DlqB514A6vbG9Y1ok6H9CgwtzPFOD0XT29o6aRL5o5znNt/lTdxZibnHK
 ANLVREO1tADJ343fzUL5+L3Ieo0+1s7lpB2CawNhlG580nx5OS5mo5ijRFCofaJ3Obkz
 WqCiG8OZ6T9JmcKWBfCqBbOI9Xmp2tL302hftr6RRNwjqMHJhBIMipqu0RfB4tvj1u5q
 qXPg==
X-Gm-Message-State: APjAAAWUMnYVH+rakAha/8AZAPwm7XONxWy/eNkT7gTcV3bkqyocwybZ
 SXmCdeiEy+llxJ2e/FqgHJ/3h6a8171S
X-Google-Smtp-Source: APXvYqyV6lz0nIsO4DexBN9igfW+dt5Fa92M2YJuFQDFSlcPyrVWmw7aQATXkYBp5z1BGaMEvynS/SS8nPMg
X-Received: by 2002:a63:ad4b:: with SMTP id y11mr4183634pgo.405.1555684373361; 
 Fri, 19 Apr 2019 07:32:53 -0700 (PDT)
Date: Fri, 19 Apr 2019 07:32:49 -0700
Message-Id: <20190419143249.230002-1-venture@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.21.0.392.gf8f6787159e-goog
Subject: [PATCH dev-5.0] hwmon: (pmbus/isl68137): Remove default y in Kconfig
From: Patrick Venture <venture@google.com>
To: venture@google.com, andrew@aj.id.au, joel@jms.id.au
Cc: openbmc@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Fri, 19 Apr 2019 14:33:06 -0000

Remove the default y in the Kconfig so this driver isn't always built
into a system.

Note: This was caught by the upstream review but missed when I applied
the other changes to this driver's primary patchset.

Signed-off-by: Patrick Venture <venture@google.com>
---
 drivers/hwmon/pmbus/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index b6c228a55da2..965efe1d13c1 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -56,7 +56,6 @@ config SENSORS_IR35221
 
 config SENSORS_ISL68137
 	tristate "Intersil ISL68137"
-	default y
 	help
 	  If you say yes here you get hardware monitoring support for Intersil
 	  ISL68137.
-- 
2.21.0.392.gf8f6787159e-goog
