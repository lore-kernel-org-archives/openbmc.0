Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c05::241; helo=mail-pg0-x241.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="IBkkw2wE"; 
 dkim-atps=neutral
Received: from mail-pg0-x241.google.com (mail-pg0-x241.google.com
 [IPv6:2607:f8b0:400e:c05::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40S74Q6YNZzF1tF
 for <openbmc@lists.ozlabs.org>; Fri, 20 Apr 2018 17:37:58 +1000 (AEST)
Received: by mail-pg0-x241.google.com with SMTP id e9so3678349pgr.7
 for <openbmc@lists.ozlabs.org>; Fri, 20 Apr 2018 00:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id;
 bh=FsZqvAn709ZkkZZnIgOvdchfgSnuh0feMBw+UcBrQ4Y=;
 b=IBkkw2wEjimKA0WKFcUx8iZ02NRKUQQ66FutsnKlX7mKIOmC7OzCMDxyNDy3KQRN3y
 oQQ4SDyskUlodCtzwbo34D7zoJN3z4JrN5Ga0/xhSiI+qrXgh/SEBaaJcJ9AugGYZaGd
 OwqGCa3wWvophGtAHuYti9KnGDZF6tL5ZgTfcq+SD0Ll2uxWQArB1nG1uButys2hGWvI
 hW3ekG09zitLN91vkj+/uggMIElTrkztmDdn+S9oBgZPP0AWCtT9u3OnNPSExZn0YfMA
 ii6nSa3AhFAeZ+q+J7qqBRYwC6Q8e4EHa6Q48c42ZdwKdcZzjFiF8STiQUxNniipd58/
 s51g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id;
 bh=FsZqvAn709ZkkZZnIgOvdchfgSnuh0feMBw+UcBrQ4Y=;
 b=IITlo+CdC5zwll9iWPmt4XwzG7CWLT4N8sPTsejBKhcZmCG4MkSxUH62UnB1bJbWhJ
 Vn2QtTGnwtsv3Hd4eQoP0ejPb2npP+UihODjiDzwkaZ99vqy903OSLSPXIR6cq8NwK9L
 ILZ8lbTLpcJbA3LsIROXwwRBqWlb/YLRDd4sn57wv/4US+Y6SAY6sNpmPBtklKBo062R
 vnVk91sBnccUowzcYwXx2yltJAHUjTDMRxEuM5j+Mbqs8n8CUJ7mMvGurAUoQwv2SjAN
 npMnJfEdWrPWAEiGLNp2cBjWuPumR7rjjMiRSNPEXf3nm6Zw7BW7bkKY5v4n1lt+8kkS
 8ZKQ==
X-Gm-Message-State: ALQs6tAuqGVg03oogIpxoPJlyX4P/Rk2ozGoRaKC62ktdmPr/Qhwl/p0
 AQWFh72dalBVFds6HhxWlk0YOKkt
X-Google-Smtp-Source: AIpwx4/UOmLEcn6KaqnB5Frxw0ZCw2xUS3UR1koCEkLsvspO3CVXF2k2SOzekEX5/9xF5/W6DnXVOg==
X-Received: by 10.99.49.205 with SMTP id x196mr5985261pgx.397.1524209876314;
 Fri, 20 Apr 2018 00:37:56 -0700 (PDT)
Received: from aurora.jms.id.au ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id u131sm6601653pgc.8.2018.04.20.00.37.53
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 20 Apr 2018 00:37:55 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Fri, 20 Apr 2018 17:07:50 +0930
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org,
	andrew@aj.id.au
Subject: [PATCH linux dev-4.13 v2] ARM: dts: aspeed-g5: Add DAC MUX userspace
 control
Date: Fri, 20 Apr 2018 17:07:49 +0930
Message-Id: <20180420073749.23098-1-joel@jms.id.au>
X-Mailer: git-send-email 2.17.0
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
X-List-Received-Date: Fri, 20 Apr 2018 07:37:59 -0000

This exposes SCU2C "Misc. Control Register" bits 16 and 17 which control
the input to the VGA DAC. They are used to select which graphics device
drives the analog output:

  00: VGA mode (default)
  01: Graphics CRT mode
  10: Pass-through mode from Video input port-A
  11: Pass-through mode from Video input port-B

We don't need the reg property, so remove it and the unit name.

OpenBMC-Staging-Count: 1
Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v2: Consolidate the two SCU scratch register nodes into one

 arch/arm/boot/dts/aspeed-g5.dtsi | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index 4ca4bc463347..01b66359e6d6 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -158,9 +158,8 @@
 
 				};
 
-				vga_scratch: scratch@50 {
+				vga_scratch: scratch {
 					compatible = "aspeed,bmc-misc";
-					reg = <0x50 0x20>;
 				};
 
 				hwrng@78 {
@@ -1441,6 +1440,11 @@
 };
 
 &vga_scratch {
+	dac_mux {
+		offset = <0x2c>;
+		bit-mask = <0x3>;
+		bit-shift = <16>;
+	};
 	vga0 {
 		offset = <0x50>;
 		bit-mask = <0xffffffff>;
-- 
2.17.0
