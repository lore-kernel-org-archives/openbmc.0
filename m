Return-Path: <mine260309@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c05::241; helo=mail-pg0-x241.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Et2nkqo1"; 
 dkim-atps=neutral
Received: from mail-pg0-x241.google.com (mail-pg0-x241.google.com
 [IPv6:2607:f8b0:400e:c05::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3z6jnR2VJjzDqMZ
 for <openbmc@lists.ozlabs.org>; Thu, 28 Dec 2017 19:39:22 +1100 (AEDT)
Received: by mail-pg0-x241.google.com with SMTP id q67so10447240pga.9
 for <openbmc@lists.ozlabs.org>; Thu, 28 Dec 2017 00:39:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=hl3WbiMCdwlXhjcSc50zEClfuX3M5oCAKJdmuW8Ohfg=;
 b=Et2nkqo1ovHfn+dlrOXrzmXt8r0CFdbE4KOZcltawnIYCofMsp6yRb7ZjrEdie6iDw
 MRnEky0/P5DULyPFUfJQEAPoH+Dtr61aUzLHT+Jfb9L6xzn3Hn0/E6b+V5hNtXwHLDsM
 Zn5PBVBxhb0KRJY7r4tns02WtkvVH2PKuJT35gXlPrhBxvIANeMrCNSPjbdn3Xu8P8yd
 BmKzVx64nNJO2hb/5zgTjwONG5jFkzVoYMypbhBjw63oZX58mNp1zZtT2t8iTuEr3JVz
 3HzPkZHhOqgXz5e6EodFLGdesa6WQdwoSfgcuCEF7U3JD0H/wcIj07pscccs9fdMWXej
 gdKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=hl3WbiMCdwlXhjcSc50zEClfuX3M5oCAKJdmuW8Ohfg=;
 b=McVhPX7tn6VL+p8Bhb4C3JJd21M80nKVF3us27z5HCy+ifmB+yp42k8194J6xbD9zT
 2dHTyCNQGFBX1oSfBZNG4CXqS306WHE/JT9f5nSZ5QmmBW+Ekcb2JCMjrc3v0VbJF6r9
 kCXA6CtRzoORLyn0DvreZzoI94eZO92kqY0f9rZcdpFPSVDDe5rVl/dzeTHR6oJ9IdWc
 PoC4eCbwz/EsPDasofy568X/o04len1RHep1Eh8cT2fmSDbKZpo8YXgzBG2yXak0HtYh
 Lfm9K3Jx5ulmzSjeJce2ZjBC0dZHLbjqGg+nqR4+UqqPrBtXxy1y7ncAGtTdSQHKnccD
 HL1w==
X-Gm-Message-State: AKGB3mIousxNIu6TOt+MnlbV7jXgA9BFNKkk3sD8Rt4gl+yqrwPGg8sQ
 rt57BP0ZP1e7TSYGkjTq2hQo1CDA
X-Google-Smtp-Source: ACJfBouZxveHzPyRNK52o3qad83h19KQcX0KLmnrbyM3pIflB6WffbkO+1pZxAsrMU2ZvGnmSzXRnQ==
X-Received: by 10.99.124.65 with SMTP id l1mr19869913pgn.310.1514450358720;
 Thu, 28 Dec 2017 00:39:18 -0800 (PST)
Received: from localhost ([159.203.222.251])
 by smtp.gmail.com with ESMTPSA id f7sm64958909pfa.133.2017.12.28.00.39.17
 (version=TLS1_2 cipher=AES128-SHA bits=128/128);
 Thu, 28 Dec 2017 00:39:17 -0800 (PST)
From: Lei YU <mine260309@gmail.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10] ARM: dts: aspeed: romulus: hog GPIOS7
Date: Thu, 28 Dec 2017 16:38:06 +0800
Message-Id: <1514450286-580-1-git-send-email-mine260309@gmail.com>
X-Mailer: git-send-email 1.9.1
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Dec 2017 08:39:25 -0000

GPIOS7 shall be pulled low for CPLD to continue the power up sequence.
With this hogged as pull-low, the CPLD workaround can be removed in
OpenBMC.

Signed-off-by: Lei YU <mine260309@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
index d9596d9..1ca2457 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
@@ -279,6 +279,12 @@
 		output-low;
 		line-name = "nic_func_mode1";
     };
+    seq_cont {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(S, 7) GPIO_ACTIVE_HIGH>;
+		output-low;
+		line-name = "seq_cont";
+    };
 };
 
 &vuart {
-- 
1.9.1
