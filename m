Return-Path: <roblip@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c00::243; helo=mail-pf0-x243.google.com;
 envelope-from=roblip@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="IbM96yWs"; 
 dkim-atps=neutral
Received: from mail-pf0-x243.google.com (mail-pf0-x243.google.com
 [IPv6:2607:f8b0:400e:c00::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ym2P5754kzDrZ3
 for <openbmc@lists.ozlabs.org>; Tue, 28 Nov 2017 10:02:01 +1100 (AEDT)
Received: by mail-pf0-x243.google.com with SMTP id t69so18066995pfg.4
 for <openbmc@lists.ozlabs.org>; Mon, 27 Nov 2017 15:02:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=pf0yZOu+kClbJHQFtr621h48JGxcFiL1Rd+X9g9lFPQ=;
 b=IbM96yWsbc2TmUX0UXvaSMpT9BO5BcDK9FDSdtvHlneqB5neMUEsrx1EIbMJiI7nkm
 naGW5+NMhpHdo/fBxL6XNch1h0II6IdEbBfhmM/OnNjWjBKg4MCWpNNLlgz4Ku30e68D
 xhzFAkRaa/t4CH2gOfZLtp4z20PKdm+j6CV2o1tSTbUicCvpQKmAvKiyxP6CyZXDuzkq
 GupZJax6FHVYo9XaWFSyKA9w0NBSnlulOhRKVMkS8SlvmAjGfCcjFbOlB7LO0cdeeIB7
 IiEsWjknBMLEo0lF2Baz+bDAEZOCbV3ONozWXVyCjoSJXb9fBlSkrveCftXgScJ4nST/
 9v+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=pf0yZOu+kClbJHQFtr621h48JGxcFiL1Rd+X9g9lFPQ=;
 b=eXhiN5tJ9MqHwgfb6kyqt7OcAPk0hpj5JL9dhs9GgXPLVqPgf1awx6W6GcyRp0wMCD
 wQoWhYluuhMN34tvq9GliyjFrEyOvmbCermaARe/sfxZgBMv2x0441libCM3PBWOUx6l
 MlKYIHK7hzWnwUSjvV9VRJ7DgbmOVFOm/Ijum+JLy4n/1EnB8EEuWAKKlUCnH5+jRR1D
 I6IDfm+Q7CU0wXDJcqNai1lAjJ5iqepkrpnGwEAAPJ9zUEnphN3taz780rvBd6e+5w5M
 oDmMS/HU9i3E2n+yzACaOwXNzbgxoV7dy1U9uQKo+e67WcIR46GjHJTVTLf1eh8bRGJe
 axMw==
X-Gm-Message-State: AJaThX5GcWAq11RF55EZ40fD0XRkLsTTDkTe623Ga2N+OqAlKT1g8a5Z
 oyTgDJXAZEzexVwaI4waXkQ=
X-Google-Smtp-Source: AGs4zMYMesirkCA3dRzgTVnTXQy0zP3jPzaIW3JBCLRFrfe6n8iSlYzCy8t9CHVMLO626sKdQ64cLQ==
X-Received: by 10.98.211.73 with SMTP id q70mr39184085pfg.107.1511823719141;
 Mon, 27 Nov 2017 15:01:59 -0800 (PST)
Received: from rlippert.svl.corp.google.com ([100.123.242.116])
 by smtp.gmail.com with ESMTPSA id m87sm41706947pfi.88.2017.11.27.15.01.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 27 Nov 2017 15:01:58 -0800 (PST)
From: Robert Lippert <roblip@gmail.com>
X-Google-Original-From: Robert Lippert <rlippert@google.com>
To: joel@jms.id.au
Cc: openbmc@lists.ozlabs.org, maxims@google.com,
 Robert Lippert <rlippert@google.com>
Subject: [PATCH u-boot] aspeed/flash: fix buffersize of MX6651235F flash chip
Date: Mon, 27 Nov 2017 15:01:08 -0800
Message-Id: <20171127230108.11935-1-rlippert@google.com>
X-Mailer: git-send-email 2.15.0.417.g466bffb3ac-goog
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
X-List-Received-Date: Mon, 27 Nov 2017 23:02:03 -0000

The MX66L51235F had a wrong write buffersize of 512 bytes set which
causes issues when trying to write an environment block >256 bytes
as the SPI chip only "listens" to the last 256 bytes.

Signed-off-by: Robert Lippert <rlippert@google.com>
---
 arch/arm/mach-aspeed/flash.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-aspeed/flash.c b/arch/arm/mach-aspeed/flash.c
index e1e3cf8d7f..907e785d8c 100644
--- a/arch/arm/mach-aspeed/flash.c
+++ b/arch/arm/mach-aspeed/flash.c
@@ -1009,7 +1009,7 @@ static ulong flash_get_size (ulong base, flash_info_t *info)
 			info->readcmd = 0x0b;
 			info->dualport = 0;
 			info->dummybyte = 1;
-			info->buffersize = 512;
+			info->buffersize = 256;
 			WriteClk = 50;
 			EraseClk = 20;
 			ReadClk  = 50;
-- 
2.15.0.417.g466bffb3ac-goog
