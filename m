Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c00::243; helo=mail-pf0-x243.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="C2/p6Psb"; 
 dkim-atps=neutral
Received: from mail-pf0-x243.google.com (mail-pf0-x243.google.com
 [IPv6:2607:f8b0:400e:c00::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zcRn34X6vzF17f
 for <openbmc@lists.ozlabs.org>; Thu,  8 Feb 2018 16:38:15 +1100 (AEDT)
Received: by mail-pf0-x243.google.com with SMTP id w83so1343908pfi.12
 for <openbmc@lists.ozlabs.org>; Wed, 07 Feb 2018 21:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Y/EGYfzR0yUElDYex4MZhp0kO66LybID4+bmxILOiiI=;
 b=C2/p6PsbEIqH59XMvF46PZkPguidPcmTeLvP/Doik9d/u+u6xqd0nwX3+zTo0iPT3Q
 tmtLLOn0thhiO+uA/m0PL5q5p/mjCQdO++UaAYz5CzybBTxz2FHNiOOnPtRmqKVH9V87
 3pJiTjTZfeTPa7kyDvW/tdMMZrmp1utmTQ17ySOTMrisvA2F0a5Ay+oosKhzfvmplBpe
 N223NJOoQsMpm+OwQGkyyoadukSPT+OoshmpK/3Kc6iA0xbPch32g6yQG1WD7yPJqrkC
 nAPDeYUFnFJ2z84gpt1PhhSzp+kwk+0MQRLdLI9gJtqPiDB4uQc5MIvAegmWscyHrQKU
 q29g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=Y/EGYfzR0yUElDYex4MZhp0kO66LybID4+bmxILOiiI=;
 b=OeaEDdRrzItSL/VAcPIPmtFj2958vyaxrSFUmqp0J6YcwokBKMQ58IG1873aBZ/EvT
 U9VU1mv6OrZ09meHaVRflPKguBui9WC9w/Zv1Uls0IflAs8QnnzkXcKshIqo4B0UDZ5Y
 UvS1851mJtTH8Jd+81QJlvQBhKN9/LLUqx6phESdO9DkgBm85TSnZ28TWE8p/zYLuRHs
 vivv+XEJZ6ge4iAH84t9uMHtySZxLeOBnLUZUUyVLo0OCsGJmVNWiiH+KQ6+TwFCGvBy
 lZZ9SJIau434ezFBP4sByzkixJRvUwfS+lLavWhA0SewbpV80qwDsldDZFoKpCmyz3Fq
 77TQ==
X-Gm-Message-State: APf1xPBkfBih9B/aeYVkGQ54U6rBn6+U1jMmXcAIH+TFN/m+OfBJi3Ng
 xbs64IZ90CzzmnTyXJQ3rlAyQxeL
X-Google-Smtp-Source: AH8x227cLN9vh+8isxFQNE6m1VYxcLOhmn978unre+70AIRjryGcA+n5yXA6pQyrc16SEBv2Va27Jw==
X-Received: by 10.99.110.10 with SMTP id j10mr6811069pgc.72.1518068293497;
 Wed, 07 Feb 2018 21:38:13 -0800 (PST)
Received: from aurora.jms.id.au ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id x185sm6968501pfd.186.2018.02.07.21.38.10
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 07 Feb 2018 21:38:12 -0800 (PST)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Thu, 08 Feb 2018 16:08:07 +1030
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Cc: Lei YU <mine260309@gmail.com>, Andrew Jeffery <andrew@aj.id.au>,
 Cyril Bur <cyrilbur@gmail.com>
Subject: [PATCH linux dev-4.13 3/3] soc: aspeed-lpc-ctrl: Enable FWH cycles
Date: Thu,  8 Feb 2018 16:07:45 +1030
Message-Id: <20180208053745.31254-4-joel@jms.id.au>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180208053745.31254-1-joel@jms.id.au>
References: <20180208053745.31254-1-joel@jms.id.au>
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
X-List-Received-Date: Thu, 08 Feb 2018 05:38:15 -0000

To date this driver has relied on prevous BMC state in order
to have the host be able to access data over the LPC bus.

Now we explicitly enable the FWH cycles from when the user first
configures the address to map. We chose to do this then as before that
time there is no way for the kernel to know where it is safe to point
the LPC window.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/misc/aspeed-lpc-ctrl.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/aspeed-lpc-ctrl.c b/drivers/misc/aspeed-lpc-ctrl.c
index 4a818ad3827e..21b4ee9d0a38 100644
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
 
@@ -155,8 +159,17 @@ static long aspeed_lpc_ctrl_ioctl(struct file *file, unsigned int cmd,
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
+				HICR5_ENFWH, HICR5_ENFWH);
 	}
 
 	return -EINVAL;
-- 
2.15.1
