Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c01::242; helo=mail-pl0-x242.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="m5z0Ko+X"; 
 dkim-atps=neutral
Received: from mail-pl0-x242.google.com (mail-pl0-x242.google.com
 [IPv6:2607:f8b0:400e:c01::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zsFrs5h4bzF1ZJ
 for <openbmc@lists.ozlabs.org>; Thu,  1 Mar 2018 12:55:57 +1100 (AEDT)
Received: by mail-pl0-x242.google.com with SMTP id d4-v6so2727845pll.5
 for <openbmc@lists.ozlabs.org>; Wed, 28 Feb 2018 17:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=3PORx1pGfObLFg0coqhqHVeWgtDkaKIMCiEojiuMTuY=;
 b=m5z0Ko+X8MDu8CF5xXdvCt8nAX+2oQm0bs7/RtC9K9stVqPzOXqIDbw3iunN4dcGlp
 Or/DBQfET+VZruLqLk0q/5Z4tqd6qKYhsuaCvT2qeMKYBkGE0nfXaiShTaZlISCa/oIZ
 W5TxYWSPL1/7j/cY3nIQ460oU4Q8ZCbXmqR77XCwd9Eq2RWykmcpwhSYP6O0gfuQM6Q0
 XcGpmLe+5hY34owoez1ObxYlZQ2HqjgmW6V0r2jia9tKWIQXxTVpC7zpbAVW5FE6x0i9
 yUanovyyucYznkUjxchQsCn+V8ngBAqAVSpygjeFfa1U6uepNE7cPNyGcglaBYI24MMe
 MryQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=3PORx1pGfObLFg0coqhqHVeWgtDkaKIMCiEojiuMTuY=;
 b=Y97UOcjM51OGXcA1wOVZzuOTlpg4VCBRn1c5M6kvRFL23nbkRnUtPTiZ349ld1qcMj
 2Bm42SJTlcTggwyFzUHvQdKWx37DyjIt1jk3YyqRGx48b8z/pZURD9enHBuBhiAXDFOu
 KEr79BHt8orGwidbrCxoSbYxvtzH71xCFB4wEdCtEcbhMKnD0gGJ0bFDGC4e422tU18d
 NhlxCQCr2LRl/++9AAZWFHM/KkJrnxtQY+5OxdEyNjEhF0uigeLY5k85EfiLn80Ead8L
 iwmnVp7jGzvQk7ycRZFjXqtvYnauH0yenUCk06oUKfVMvJ7DgTkUQinMZlVEYXrdd+F4
 93Uw==
X-Gm-Message-State: APf1xPDR6kz6yT1GSlVqFZe6vQXVHsseIOf2SnsOvgBjuqi58bA8LZlb
 Z69lpueL0ADtSg44UgsAnpix2YPx
X-Google-Smtp-Source: AG47ELsMl3SkhP9L8g6YBWOQRnKizGSV1kIO0pN6mlFLSthpRIhiXWTF0lwBBDl0iR2VOGPb4+wCJg==
X-Received: by 2002:a17:902:2cc1:: with SMTP id
 n59-v6mr189647plb.215.1519869354741; 
 Wed, 28 Feb 2018 17:55:54 -0800 (PST)
Received: from aurora.jms.id.au ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id n7sm5174348pgd.87.2018.02.28.17.55.51
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 28 Feb 2018 17:55:54 -0800 (PST)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Thu, 01 Mar 2018 12:25:48 +1030
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Cc: Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH linux dev-4.10] ARM: dts: aspeed-palmetto: Correct flash
 window location
Date: Thu,  1 Mar 2018 12:25:47 +1030
Message-Id: <20180301015547.772-1-joel@jms.id.au>
X-Mailer: git-send-email 2.15.1
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 01 Mar 2018 01:55:58 -0000

The flash window location was pointing off into the distance, far past
any RAM. Rein it back in to a useful location.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
index 18df9c75c740..377539181142 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
@@ -26,9 +26,9 @@
 			reg = <0x5f000000 0x01000000>; /* 16MB */
 		};
 
-		flash_memory: region@98000000 {
+		flash_memory: region@5e000000 {
 			no-map;
-			reg = <0x98000000 0x01000000>; /* 16MB */
+			reg = <0x5e000000 0x1000000>; /* 16MB */
 		};
 	};
 
-- 
2.15.1
