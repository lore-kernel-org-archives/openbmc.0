Return-Path: <3Lt65XAcKB70yhqwxuhjrrjoh.frprshqepfolvwv.r2odev.ruj@flex--venture.bounces.google.com>
Authentication-Results: lists.ozlabs.org; spf=pass (mailfrom)
 smtp.mailfrom=flex--venture.bounces.google.com
 (client-ip=2607:f8b0:4864:20::749; helo=mail-qk1-x749.google.com;
 envelope-from=3lt65xackb70yhqwxuhjrrjoh.frprshqepfolvwv.r2odev.ruj@flex--venture.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="PaoLMNei"; 
 dkim-atps=neutral
Received: from mail-qk1-x749.google.com (mail-qk1-x749.google.com
 [IPv6:2607:f8b0:4864:20::749])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44lzFh5rCgzDqBN
 for <openbmc@lists.ozlabs.org>; Sat, 20 Apr 2019 00:41:54 +1000 (AEST)
Received: by mail-qk1-x749.google.com with SMTP id d8so4395070qkk.17
 for <openbmc@lists.ozlabs.org>; Fri, 19 Apr 2019 07:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=BelyAusOx0YfiakkT+ISkR4vR8JMKkPLQAmRbMojJck=;
 b=PaoLMNei7CdzPdNJd5KxBljKRUrjESo2OrqBvVZZtBM+5Q56WARgxtjDWUimF9Qy/h
 B3/hJCDefSxKko8gUoWwejE0uCM/yDYcb5TeQ1FghiL1cTOvLPwkeYhy8exTpKdZeVF6
 zD8TsmHjgaJSfsQ+rtOX8cHQ8J84U4eVSnRN1Ag+k9QLg5u1LDlMJ+nz9y0kFVm+YjC6
 CM3RaBt5AiSC+3yfQ1ys1zIl8Qi6HtyXuIVdX7pNmzEuQckmmeJxT9o8n6UrJp1RCgr6
 fSEyS+Gj88EUEKLfeXfz7PTMaMSLuk4gD+1KyEQpmZ0kWBVWP9kGwjvPbsVBL7cuiulY
 FS0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=BelyAusOx0YfiakkT+ISkR4vR8JMKkPLQAmRbMojJck=;
 b=BKYkC6w8PiQIepN+XE+aPdGDvog6zqylG/71K0Mvu8hlHysAkgUT7ZxO40SRzg0Phn
 /OTPf+gGnsNvYLS08k+/njgxSUZfeRyzDyoO08nsQNPRQGpBH0fCSq0rQ2YzVTrBrrB5
 3ZbrClbgLru7fslpZ7wB+/2GXC1i87byfGx+vo4RM4g4XIoeTYShG5BcEsap3b2qv5KC
 rfxOJSt8cguoE3VtQ6gRoFMzSYLcD+qVeNkK2V2TCMmHkjorxRSPZKQMl9mgTIOi9WgD
 I3qQ2t6DMQ9IwVNzkgZoASzlGlYmZTBHYQ26lwMoMZMGWIZgIcoOUtMZ5WDGUG93vANo
 VGTA==
X-Gm-Message-State: APjAAAW4z82AUXyvg6N43EYaboCbLWkSK68w8WlRPZ6YAoClZjyfh9RU
 RVW5sdlXI5pdDPIfkyAYKFRyDyC+X4C/
X-Google-Smtp-Source: APXvYqyhwHVlOE48V7YMdCz2Jfj5ICcAIg5fnHiXv5M+Vi0LggkU/rGtjLKDs8aLkxjw4ik/tZEajNDQa8B5
X-Received: by 2002:ac8:1185:: with SMTP id d5mr2869078qtj.260.1555684910631; 
 Fri, 19 Apr 2019 07:41:50 -0700 (PDT)
Date: Fri, 19 Apr 2019 07:41:44 -0700
Message-Id: <20190419144144.255631-1-venture@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.21.0.392.gf8f6787159e-goog
Subject: [PATCH dev-5.0 1/2] ARM: dts: aspeed: zaius: update 12V brick I2C
 address
From: Patrick Venture <venture@google.com>
To: venture@google.com, andrew@aj.id.au, joel@jms.id.au
Cc: Robert Lippert <rlippert@google.com>, openbmc@lists.ozlabs.org
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
X-List-Received-Date: Fri, 19 Apr 2019 14:42:01 -0000

From: Robert Lippert <rlippert@google.com>

The I2C address of the brick is different depending on the board SKU.

Update the values to instantiate addresses which work for most boards.

Signed-off-by: Robert Lippert <rlippert@google.com>
Signed-off-by: Patrick Venture <venture@google.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
index 63e892f16d050..51265af622574 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
@@ -328,10 +328,21 @@
 	 *   LM5066I PMBUS @10h
 	 */
 
-	/* 12V Quarter Brick DC/DC Converter Q54SJ12050 @61h */
-	power-brick@61 {
+	/*
+	 * Brick will be one of these types/addresses.  Depending
+	 * on the board SKU only one is actually present and will successfully
+	 * instantiate while the others will fail the probe operation.
+	 * These are the PVT (and presumably beyond) addresses:
+	 *    12V Quarter Brick DC/DC Converter Q54SJ12050 @6Ah
+	 *    12V Quarter Brick DC/DC Converter Q54SH12050 @30h
+	 */
+	power-brick@6a {
+		compatible = "delta,dps800";
+		reg = <0x6a>;
+	};
+	power-brick@30 {
 		compatible = "delta,dps800";
-		reg = <0x61>;
+		reg = <0x30>;
 	};
 
 	/* CPU0 VR ISL68137 0.7V, 0.96V PMBUS @64h */
@@ -342,7 +353,6 @@
 	/* Master selector PCA9541A @70h (other master: CPU0)
 	 *   LM5066I PMBUS @10h
 	 */
-	/* 12V SMPS Q54SH12050NNDH @61h */
 };
 
 &i2c8 {
-- 
2.21.0.392.gf8f6787159e-goog
