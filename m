Return-Path: <36dC7WwUKB14GQJUECKKCHA.8KIKLAJ7I8HEOPO.KVH67O.KNC@flex--kunyi.bounces.google.com>
Authentication-Results: lists.ozlabs.org; spf=pass (mailfrom)
 smtp.mailfrom=flex--kunyi.bounces.google.com
 (client-ip=2607:f8b0:4864:20::d49; helo=mail-io1-xd49.google.com;
 envelope-from=36dc7wwukb14gqjueckkcha.8kiklaj7i8heopo.kvh67o.knc@flex--kunyi.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="I91n2RiS"; 
 dkim-atps=neutral
Received: from mail-io1-xd49.google.com (mail-io1-xd49.google.com
 [IPv6:2607:f8b0:4864:20::d49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42TYtC1fsMzF31W
 for <openbmc@lists.ozlabs.org>; Tue,  9 Oct 2018 08:49:32 +1100 (AEDT)
Received: by mail-io1-xd49.google.com with SMTP id p22-v6so20521284ioh.7
 for <openbmc@lists.ozlabs.org>; Mon, 08 Oct 2018 14:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=DGjpJh6NY26XNmkgK/G3W85M0KbT1oJdmcCbZa5PHLo=;
 b=I91n2RiS7+dQbL9RuN/a27WtrIatJqaKpPZWaTIr7cDU5UuMgDjlYLAz9+6mXHUYEb
 iZb8g0TUSpoeiIJeQxIciHe7gKG20xGwagmmZGmHzDA2/nSZOfqIURpIUoi+z917Z6Y+
 66syTLyuhLdtPozVZITHzqiqHL4tz7sKma9zpUIjeCi3NvQr8O8vazjH35Smv7MdxHfQ
 9ePiUDycYrpcaX+BHygWCOTjlzQaOIewWrz2BiQZWctxAuBZ8dcgxQwFD+Y+BsthORUo
 tXVWiBSMkhALn+Fm4P/h7X9V06Z9E22L4//mpLZf4BejqmbrT7TcYD57r8PbpxXDuW0t
 HlVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=DGjpJh6NY26XNmkgK/G3W85M0KbT1oJdmcCbZa5PHLo=;
 b=ogNF4t3WpBVgLgBb56ljm+hnCcZsQsPGRCFDEcPG45LyRhVRUMMm9O0So6bXNX+LIr
 oG0mNMDEafPkK9VU1gVB36NLIHj+65l/awmirD/fazjdgqFLLFL3fxHPHxTkrkaLRCp3
 jryjp/Q7vIKfmKUROBNs4Nz45p94v+qrQriP6jaZ0OZhYOup6ogngu9xs78BMG3TYq5B
 JKGfmOV+ZwsnReBp8KROKmR+XnVr607K9hdceCBH0zsH4yXOEhWZuEKfgO2nVmE3bCe9
 3/z1ryY/zTr589NG7CxcUMhnmGW67M+PA+iHbxBSijp75+d8PwrH+hwt3C97+Aa/+4Ec
 etyA==
X-Gm-Message-State: ABuFfojRukoia+S0YTxBJEu6rD3A4OP8KIkoQ5X8zwGG6cTDdSXDeXZ+
 xRnnzVLm70AnlKJKDCETkU0GQb09sA==
X-Google-Smtp-Source: ACcGV63gMLjQFuWcULek/00WKjkMhnV+NrVG+Si0OpxQh8TbT+p0PNOxMtTWhnzaKBAVyCDoreLXH/apyg==
X-Received: by 2002:a24:e48b:: with SMTP id
 o133-v6mr8514229ith.0.1539035369836; 
 Mon, 08 Oct 2018 14:49:29 -0700 (PDT)
Date: Mon,  8 Oct 2018 14:49:25 -0700
Message-Id: <20181008214925.86281-1-kunyi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.19.0.605.g01d371f741-goog
Subject: [PATCH] hwmon: (npcm-750-pwm-fan): Change initial pwm target to 255
From: Kun Yi <kunyi@google.com>
To: avifishman70@gmail.com, tmaimon77@gmail.com, jdelvare@suse.com, 
 linux@roeck-us.net, openbmc@lists.ozlabs.org, linux-hwmon@vger.kernel.org
Cc: rlippert@google.com, benjaminfair@google.com, Kun Yi <kunyi@google.com>
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
X-List-Received-Date: Mon, 08 Oct 2018 21:49:40 -0000

Change initial PWM target to 255 to prevent overheating, for example
when BMC hangs in userspace or when userspace fan control application is
not implemented yet.

Signed-off-by: Kun Yi <kunyi@google.com>
---
 drivers/hwmon/npcm750-pwm-fan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/npcm750-pwm-fan.c b/drivers/hwmon/npcm750-pwm-fan.c
index 96634fd54e0b..c0fab54c0094 100644
--- a/drivers/hwmon/npcm750-pwm-fan.c
+++ b/drivers/hwmon/npcm750-pwm-fan.c
@@ -52,7 +52,7 @@
 
 /* Define the Counter Register, value = 100 for match 100% */
 #define NPCM7XX_PWM_COUNTER_DEFAULT_NUM		255
-#define NPCM7XX_PWM_CMR_DEFAULT_NUM		127
+#define NPCM7XX_PWM_CMR_DEFAULT_NUM		255
 #define NPCM7XX_PWM_CMR_MAX			255
 
 /* default all PWM channels PRESCALE2 = 1 */
-- 
2.19.0.605.g01d371f741-goog
