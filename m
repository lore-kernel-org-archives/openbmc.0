Return-Path: <joel.stan@gmail.com>
Received: from mail-pf0-x241.google.com (mail-pf0-x241.google.com
 [IPv6:2607:f8b0:400e:c00::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t7y5R63pmzDvJX
 for <openbmc@lists.ozlabs.org>; Wed,  2 Nov 2016 16:56:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=et7+X7Th; 
 dkim-atps=neutral
Received: by mail-pf0-x241.google.com with SMTP id a136so760356pfa.0
 for <openbmc@lists.ozlabs.org>; Tue, 01 Nov 2016 22:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=sender:from:to:subject:date:message-id;
 bh=wZ3xHo78Y3Rz9BXhVpsC4Yz1/STCB8UL2HzTvAwhuNo=;
 b=et7+X7ThfM1Yu4wzSNRyqLVoh/JJd9jsFLWxU42NRDXAgoDroVxH7eoIXlSBQ+VeTH
 eqfMXTbz/WyeRjzWXw0F0FgOjNMrQHzPPKRznKJspShii8mZ2xPfBI+OBZeMNgkT8T9v
 ifG1bftvTU979IhLXgPGEix0aHz1m3T/aA7x0hlqQ9iOMwiye/FkHep9Mym2rMiJhI6Y
 Mwlru4wf3wyTlTcrlEFBp87w+3vkUEsY3Ffk/oHq/M/rwLETmQr0QrxBV0Q0/Q1SQNC2
 EWN5OeukMKuVw2XAw0PnGO+a6M+sySu5FUPMGmbel+mrKGRtiToLy8Q8fiodkI+2cYhq
 SpxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:sender:from:to:subject:date:message-id;
 bh=wZ3xHo78Y3Rz9BXhVpsC4Yz1/STCB8UL2HzTvAwhuNo=;
 b=bu2pe9kYNyaB0QYKfhrrnn5+uBbURhBXHAC/Nkk1jUguKKoogAhcjPnWvRe65+/R6O
 l65HKrKS4Svj/1Xuy+WcJS4EUCae+LGi3kSoGmgvxcZpob3xy6WYB/wrrshwYhfZe13G
 nUAguRgqhPQa/+M9ZL73ZD4mRtKOC4SqVhgjziEYani9ibIEnDsHDH69CudbryG4KSrj
 43bJWANSXDUHawBpZH5NkXljXhdwXa3vyyFxQuWDVZGp5hwvzYE6eIoJpz235Q1p0eX4
 qVzSP9CbMG7Pzeo+P+5xikpjdulHStF4tR9tI7S+26K3PZUZw/jtLEH0fmomOhzwa8dA
 twHA==
X-Gm-Message-State: ABUngvcg9TGOd3J3Q8+PijSP+Sw2cbaRMIfFwHSRWgJ5igWWBAj7jNjxG+1oxZ1129y7pA==
X-Received: by 10.99.154.2 with SMTP id o2mr3056990pge.19.1478066169695;
 Tue, 01 Nov 2016 22:56:09 -0700 (PDT)
Received: from aurora.jms.id.au ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id 3sm1083730pfo.31.2016.11.01.22.56.06
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Tue, 01 Nov 2016 22:56:09 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Wed, 02 Nov 2016 16:26:02 +1030
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org,
	Xo Wang <xow@google.com>
Subject: [PATCH 1/2] arm: aspeed: Add Romulus BMC-specific early setup
Date: Wed,  2 Nov 2016 16:25:56 +1030
Message-Id: <20161102055557.24349-1-joel@jms.id.au>
X-Mailer: git-send-email 2.9.3
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
X-List-Received-Date: Wed, 02 Nov 2016 05:56:12 -0000

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/mach-aspeed/aspeed.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
index ebb2224dcd13..0a4578290d5e 100644
--- a/arch/arm/mach-aspeed/aspeed.c
+++ b/arch/arm/mach-aspeed/aspeed.c
@@ -214,6 +214,10 @@ static void __init do_zaius_setup(void)
 	}
 }
 
+static void __init do_romulus_setup(void)
+{
+	do_ast2500_common_setup();
+}
 
 #define SCU_PASSWORD	0x1688A8A8
 
@@ -262,6 +266,8 @@ static void __init aspeed_init_early(void)
 		do_witherspoon_setup();
 	if (of_machine_is_compatible("ingrasys,zaius-bmc"))
 		do_zaius_setup();
+	if (of_machine_is_compatible("ibm,romulus-bmc"))
+		do_romulus_setup();
 }
 
 static void __init aspeed_map_io(void)
-- 
2.9.3
