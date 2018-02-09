Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4003:c06::243; helo=mail-oi0-x243.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="AFUElf46"; 
 dkim-atps=neutral
Received: from mail-oi0-x243.google.com (mail-oi0-x243.google.com
 [IPv6:2607:f8b0:4003:c06::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zd38v2KmJzF1By
 for <openbmc@lists.ozlabs.org>; Fri,  9 Feb 2018 16:12:31 +1100 (AEDT)
Received: by mail-oi0-x243.google.com with SMTP id e15so5210135oiy.2
 for <openbmc@lists.ozlabs.org>; Thu, 08 Feb 2018 21:12:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=VhT6wqdJn+8ZoNtgRn0/4ytwtdlTN/CFTZ2/j1GfhkY=;
 b=AFUElf46fE9yJp/acvULBEYz7I74Hle44xKv5Or5VJYyonn/6h8AflIwyRe3bmfF/I
 T8dajta5pCoF9R2+uT4gMnp0lecJr5cjjgmsu53O23eQ/yopdXb7svREddNNH7hlYWTi
 36BzlJonRB84iDNv5aeRpRspDqQTybVzAHaEpTLE1SWY2gfZ5//NFSFDuQ1Zy+K/UQl+
 ZqqCdKvBfIKVffxOT/IMtuqgwa78AKIOwgBcQaUepMGa/9dli76+ZO8acxslVxBzbIXZ
 YV4uUIApd/xOoen6G/S4IPqWuXEYYwKmpLMJg6QAluw21X0oib5JF/KZ5KzBJj/042hQ
 xHxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=VhT6wqdJn+8ZoNtgRn0/4ytwtdlTN/CFTZ2/j1GfhkY=;
 b=KBel4MN6PT7XARnjVIRLJhgYkAdluF2ry3H9waMk9GyE5k70PyTgZrxYJWtXA9cBN5
 npLPnw1fyZkvS7n7HUrRbXemTDrIW9HaJnXelQUe7YZS3d/fWXGZEVICyI2AmnFXCfEw
 3n0L5fMrYrKPs4QgiCEglLpB5HfxJX2fzZuWa97yicMrwV7x0Xv9euYmTFlUYh6ZTnhM
 GSJSFF8ztDQcAL6TrwvrTGWdTNkGfuev+a1YRZyWyk8PtJHhhLU9V375m3ME2HDVcX8z
 wZUowcdLgBGHo5CCaOFITMCp43RAgJzQRf9ACI+yw//N6MjPsYZxFFZev61SpIwtsGTW
 s0XQ==
X-Gm-Message-State: APf1xPBUG/X4q7WMXgiuJfuzUHaiQ1TT2fT3j30YcQHhqXNk+HDdjYzd
 1tA81zXLA71czeOujM1O2JF1Zc+V
X-Google-Smtp-Source: AH8x226z5FiQgSFVOU+euJX5PoP5ev7XpNBfaALPW9DMofXha9WIozCGNBRFuLPRp4ycqEv5cP6Q0A==
X-Received: by 10.202.166.134 with SMTP id t6mr990961oij.89.1518153148792;
 Thu, 08 Feb 2018 21:12:28 -0800 (PST)
Received: from aurora.jms.id.au ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id d190sm769788oig.32.2018.02.08.21.12.25
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 08 Feb 2018 21:12:28 -0800 (PST)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Fri, 09 Feb 2018 15:42:23 +1030
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Cc: Lei YU <mine260309@gmail.com>, Andrew Jeffery <andrew@aj.id.au>,
 Cyril Bur <cyrilbur@gmail.com>
Subject: [PATCH linux dev-4.13 v2 4/4] misc: aspeed-lpc-ctrl: Enable FWH and
 A2H bridge cycles
Date: Fri,  9 Feb 2018 15:41:58 +1030
Message-Id: <20180209051158.32354-5-joel@jms.id.au>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180209051158.32354-1-joel@jms.id.au>
References: <20180209051158.32354-1-joel@jms.id.au>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.25
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 09 Feb 2018 05:12:31 -0000

To date this driver has relied on prevous state from out of tree hacks
and vendor u-boot trees in order to have the host be able to access
data over the LPC bus.

Now we explicitly enable the AHB to LPC bridge and FWH cycles from when
the user first configures the address to map. We chose to do this then
as before that time there is no way for the kernel to know where it is
safe to point the LPC window.

Tested-by: Lei YU <mine260309@gmail.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
--
v2: Enable both FWH and A2H
---
 drivers/misc/aspeed-lpc-ctrl.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/aspeed-lpc-ctrl.c b/drivers/misc/aspeed-lpc-ctrl.c
index 4a818ad3827e..1d7d3a6c570f 100644
--- a/drivers/misc/aspeed-lpc-ctrl.c
+++ b/drivers/misc/aspeed-lpc-ctrl.c
@@ -21,6 +21,10 @@
 
 #define DEVICE_NAME	"aspeed-lpc-ctrl"
 
+#define HICR5 0x0
+#define HICR5_ENL2H	BIT(8)
+#define HICR5_ENFWH	BIT(10)
+
 #define HICR7 0x8
 #define HICR8 0xc
 
@@ -155,8 +159,18 @@ static long aspeed_lpc_ctrl_ioctl(struct file *file, unsigned int cmd,
 		if (rc)
 			return rc;
 
-		return regmap_write(lpc_ctrl->regmap, HICR8,
-			(~(map.size - 1)) | ((map.size >> 16) - 1));
+		rc = regmap_write(lpc_ctrl->regmap, HICR8,
+				(~(map.size - 1)) | ((map.size >> 16) - 1));
+		if (rc)
+			return rc;
+
+		/*
+		 * Enable LPC FHW cycles. This is required for the host to
+		 * access the regions specified.
+		 */
+		return regmap_update_bits(lpc_ctrl->regmap, HICR5,
+				HICR5_ENFWH | HICR5_ENL2H,
+				HICR5_ENFWH | HICR5_ENL2H);
 	}
 
 	return -EINVAL;
-- 
2.15.1
