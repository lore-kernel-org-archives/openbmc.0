Return-Path: <venture@google.com>
Received: from mail-it0-x234.google.com (mail-it0-x234.google.com
 [IPv6:2607:f8b0:4001:c0b::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wnP5f2psfzDqL5
 for <openbmc@lists.ozlabs.org>; Wed, 14 Jun 2017 08:07:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="EKDwx4jA"; 
 dkim-atps=neutral
Received: by mail-it0-x234.google.com with SMTP id m47so3979108iti.1
 for <openbmc@lists.ozlabs.org>; Tue, 13 Jun 2017 15:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:signed-off-by;
 bh=+J7ID3UIwXCBfghhNQJraOjTltT2UiwMFp+R3L1toMA=;
 b=EKDwx4jAMUi7ThQicb6duUCWzXJsajIFfPXTQAsjxlDu+JdprMbelX+lznwicRzPRn
 XqdVT27BcDJLzas3uI7DmcTyYsTrLkr3KGQ+p2R8UxTnZYJNl5Bwr0oZxMsfPzDKvmOF
 nSlmyrMpmFa1uRszy5odh7qp/h43mTRWbpH/5ZAsXwCFzjSyyOgSk1m/RbrvUfqML5hs
 euHCblruGQl6265dbERwAgWCRxv6evnBEMGDfHPnAEfGPCRXxXn+aczL8pCv52k8+aYh
 c7x/lgpRhL8WZKhJC5636q4Apg1VNTpfk21zlOrAIE69ohQr+4aSyG5fBHHO5NkOpsbn
 aB8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:signed-off-by;
 bh=+J7ID3UIwXCBfghhNQJraOjTltT2UiwMFp+R3L1toMA=;
 b=WwpJtZURYPH42nHb4cJFdXeqHJYajHk5WknuWk9mMgsdaBF1oX0dmw160ToLY5pz7y
 cMRZKszqqdCyxcWeot8qRpwiYpYpOZv7g9SWNoukgwOCsHeNCh4MjnDmr1A2t4+UX7qy
 kjxOyne3VNjo3HHqHe3aDeuGO4HH+eobsuFyuPYW4IYe5RahBy+Z2Cwy1E8PkBbln4P2
 ArjDNEBfzn4hasjSgorYd0TWtPG4eQy18UcR5Lv0NbfwEiR+4slvlFaMlEl69hJb5rXp
 vYOlLR1VFP14c87x2w1X75/3j3gLGsvs4Ncj5CW4jtOtB7tEyUzgKt2l166/gBe+1ZXp
 BGxg==
X-Gm-Message-State: AODbwcCsG7mnyqn4m1AhBZYiA7YhVTk2IGeeZYUXhjMxWe8GnSEBI1g4
 SAf1ixY4wawUumlW
X-Received: by 10.36.178.26 with SMTP id u26mr20540635ite.102.1497391667303;
 Tue, 13 Jun 2017 15:07:47 -0700 (PDT)
Received: from venture.svl.corp.google.com ([100.123.242.104])
 by smtp.gmail.com with ESMTPSA id 66sm6725630iov.21.2017.06.13.15.07.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 13 Jun 2017 15:07:46 -0700 (PDT)
From: Patrick Venture <venture@google.com>
To: venture@google.com,
	joel@jms.id.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 1/4] ARM: dts: aspeed: quanta-q71l: Add BMC FRU
Date: Tue, 13 Jun 2017 15:07:43 -0700
Message-Id: <20170613220743.99770-1-venture@google.com>
X-Mailer: git-send-email 2.13.1.518.g3df882009-goog
Signed-off-by: Patrick Venture <venture@google.com>
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
X-List-Received-Date: Tue, 13 Jun 2017 22:07:51 -0000

From: Rick Altherr <raltherr@google.com>

---
 arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
index 50be8dd921cf..d6d4ba2cf2b2 100644
--- a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
@@ -111,6 +111,11 @@
 
 &i2c8 {
 	status = "okay";
+
+	eeprom@50 {
+		compatible = "atmel,24c64";
+		reg = <0x50>;
+	};
 };
 
 &vuart {
-- 
2.13.1.518.g3df882009-goog
