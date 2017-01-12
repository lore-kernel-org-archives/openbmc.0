Return-Path: <raltherr@google.com>
Received: from mail-pf0-x233.google.com (mail-pf0-x233.google.com
 [IPv6:2607:f8b0:400e:c00::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tzTnq1JqTzDqPK
 for <openbmc@lists.ozlabs.org>; Thu, 12 Jan 2017 13:13:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="SuEUxjvN"; 
 dkim-atps=neutral
Received: by mail-pf0-x233.google.com with SMTP id 127so3878911pfg.1
 for <openbmc@lists.ozlabs.org>; Wed, 11 Jan 2017 18:13:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=V8Z6NyLsLZwuOdrZG4ZWHsZ2hixyrnCOV9xtj1XQAno=;
 b=SuEUxjvNTyd3+uwHIDGyz3WIXbXeoFkJd4zjKnOpDpDNa7/TalGhqJDKznD+h2XyRz
 foHhE59E3C1vFEFb4pV6e+/+ArFyG1COk6/vj964N2kkkd1DPAl+wTo07TdYpH7KIYS7
 BS7f144hFXbliDhtKssHnAapq/TiilP9AB/5mqP/XBOuOG1fHKb/4lHRn+jXhCGls8mp
 iER/PkyvmV5cwUSZNT1oo+1XujbsHtYIyhIgHa2W+n5I9isDpGkg3uX8pjPiR4A9CbkJ
 83xvKKHj826no+7avPN8TVdF3NStTRltKiu43j9ZuvW/4jGnJ3dna1nTJKBw82ImyWwj
 8+fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=V8Z6NyLsLZwuOdrZG4ZWHsZ2hixyrnCOV9xtj1XQAno=;
 b=ltw8e92E1vGwssuTVw6wCkKEdIHfC4c+dHt3h/y9Dv3Xfvh1MQmCOkP6eBChQaPlYy
 MyxjAHLxssMINYZlSoJnTb9Bzuu49wKLTIsZ5LjOkbOaYRAo4IonAF5TgURHsxiEEI9e
 MXKSdJcZwt5cilm2Z3soXaNnDyfeN6MKW52aFxW6FthbedH+cxRAS+vQ5T9S9Z4R43ZJ
 PzEsIi+f+eXVRU/aNe6FZqs1hcB8lbvv6sJdPVebe5FzxqeuMSOF6rPcjfAEWcPcVewJ
 NfwT2D1CN1GaMghVz9eDlzGR2BYST4clc9of4uwTQqDa/ZcLcjM8nazg8Gq7gwoG+DrV
 +Yyg==
X-Gm-Message-State: AIkVDXJMlZS/CUthpdnXhH+3QNZwjJT4q4ii8gS8jT9uafcQd076WgF1mIRP6cXN0W6GLcX7
X-Received: by 10.84.173.195 with SMTP id p61mr17760180plb.68.1484187212960;
 Wed, 11 Jan 2017 18:13:32 -0800 (PST)
Received: from raltherr-linux.svl.corp.google.com ([100.123.242.49])
 by smtp.gmail.com with ESMTPSA id e5sm16617141pfd.77.2017.01.11.18.13.31
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 11 Jan 2017 18:13:32 -0800 (PST)
From: Rick Altherr <raltherr@google.com>
To: openbmc@lists.ozlabs.org
Subject: [U-Boot PATCH 2/2] aspeed: use FIT-provided ramdisk if available
Date: Wed, 11 Jan 2017 18:13:28 -0800
Message-Id: <20170112021328.27200-3-raltherr@google.com>
X-Mailer: git-send-email 2.11.0.390.gc69c2f50cf-goog
In-Reply-To: <20170112021328.27200-1-raltherr@google.com>
References: <20170112021328.27200-1-raltherr@google.com>
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
X-List-Received-Date: Thu, 12 Jan 2017 02:13:35 -0000

If the kernel FIT specifies a ramdisk, use it.  Otherwise, expect a
ramdisk at 0x20300000.

Signed-off-by: Rick Altherr <raltherr@google.com>
---

 include/configs/ast-common.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/configs/ast-common.h b/include/configs/ast-common.h
index b39ea33ce7..110c780070 100644
--- a/include/configs/ast-common.h
+++ b/include/configs/ast-common.h
@@ -96,7 +96,11 @@
 #define CONFIG_ENV_OFFSET		0x60000	/* environment starts here  */
 #define CONFIG_ENV_SIZE			0x20000	/* Total Size of Environment Sector */
 
-#define CONFIG_BOOTCOMMAND	"bootm 20080000 20300000"
+#define CONFIG_BOOTCOMMAND	\
+	"fdt addr 20080000; " \
+	"if fdt get value ramdisk_conf /configurations/conf@1 ramdisk; then " \
+	"    bootm 20080000; else bootm 20080000 20300000; " \
+	"fi"
 #define CONFIG_ENV_OVERWRITE
 
 #define ASPEED_ENV_SETTINGS \
-- 
2.11.0.390.gc69c2f50cf-goog
