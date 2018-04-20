Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c01::244; helo=mail-pl0-x244.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="I1TBUEvt"; 
 dkim-atps=neutral
Received: from mail-pl0-x244.google.com (mail-pl0-x244.google.com
 [IPv6:2607:f8b0:400e:c01::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40S6p62BbhzF24t
 for <openbmc@lists.ozlabs.org>; Fri, 20 Apr 2018 17:25:33 +1000 (AEST)
Received: by mail-pl0-x244.google.com with SMTP id w21-v6so4767586plq.2
 for <openbmc@lists.ozlabs.org>; Fri, 20 Apr 2018 00:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id;
 bh=4/XwDIojKVnETuaiAjYN78dXVgwMGiX56NszeNyUJJ4=;
 b=I1TBUEvtV/KUXDF5PZaoukaZG0amF93AN4HBEUJBPgKrauPjzJqtvrfolbzAvriVE7
 59p/jHfEv8RWrdW3/1cAvTIeMDgR206MZ6uzZSMy4MXEpEAJ+J6Z1v0I3fg8kHoyjy0T
 H1vz8dqKZL9hceuW6Xws22W2M0hifNVlF6bzbaomigpgIydPWI9PEWtTs5/Ms5sNyEi2
 Xo6WSUg55atRQ3pP/jYj8kSG6cxh3gnwG4MHGqMWQdnWKwvDJoW4X7A9UOSXF14UrJOx
 WUAFbOSL6Kh+u14uAjv33+hhjC5i0jdSY6MulmyBkm6qKp/8jeopabcBEJdmT4ukUVqo
 6n7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id;
 bh=4/XwDIojKVnETuaiAjYN78dXVgwMGiX56NszeNyUJJ4=;
 b=HEwT0nFdCoorHDlMxLviRnwNmdz/zGzJga71DiuKeisW54CqQrNEEpeKaBWea13LQB
 KJ1gKs6cfC9eCdWimauX13WGN7EaChQR2JXv7Sua1JkZ20mJWZsVQxkSCzQVdgErY4BF
 3xbCVw9kCVL5R7a3XK7jqu+ppaVNyUBI3fKu0UZ/decJvENZnVXT3jbHrplN8FKw3WLc
 jXZYLfz60TMFR6HQiubYvFWgfC6OGundFmUyzYBWlBvhNbbHbC7Cwu4W6bLbbf82bQjT
 OnH4nK7wlpWn7iNfQ/YO+Gap+UBMBqQaZ0yZoB28AL2OxW+/4ZM9yXV0dMi2Qhg7J2Er
 J94g==
X-Gm-Message-State: ALQs6tB/B8dps2sYs9UDSwPGE6ujrhLlXVpLB7Mthux7l5bl1w1b6Sno
 1WIkd+3fyX311f9pp6Xztrixn1Zu
X-Google-Smtp-Source: AIpwx4/sS3OOKaYhdHnqMPPlmmbz0KzvzCSGhET3LAOGnnMvNs4TKavU9+gKfxQy88ubZ/Enc1TzZQ==
X-Received: by 2002:a17:902:aa03:: with SMTP id
 be3-v6mr8890096plb.299.1524209131761; 
 Fri, 20 Apr 2018 00:25:31 -0700 (PDT)
Received: from aurora.jms.id.au ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id h6sm9118664pfi.35.2018.04.20.00.25.28
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 20 Apr 2018 00:25:31 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Fri, 20 Apr 2018 16:55:25 +0930
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org,
	andrew@aj.id.au
Subject: [PATCH linux dev-4.13] ARM: dts: aspeed-g5: Add DAC MUX userspace
 control
Date: Fri, 20 Apr 2018 16:55:24 +0930
Message-Id: <20180420072524.14127-1-joel@jms.id.au>
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
X-List-Received-Date: Fri, 20 Apr 2018 07:25:35 -0000

This exposes SCU2C "Misc. Control Register" bits 16 and 17 which control
the input to the VGA DAC. They are used to select which graphics device
drives the analog output:

  00: VGA mode (default)
  01: Graphics CRT mode
  10: Pass-through mode from Video input port-A
  11: Pass-through mode from Video input port-B

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-g5.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index 4ca4bc463347..83b07954644a 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -158,6 +158,15 @@
 
 				};
 
+				scratch@2c {
+					compatible = "aspeed,bmc-misc";
+					dac_mux {
+						offset = <0x2c>;
+						bit-mask = <0x3>;
+						bit-shift = <16>;
+					};
+				};
+
 				vga_scratch: scratch@50 {
 					compatible = "aspeed,bmc-misc";
 					reg = <0x50 0x20>;
-- 
2.17.0
