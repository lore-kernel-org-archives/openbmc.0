Return-Path: <raltherr@google.com>
Received: from mail-pf0-x232.google.com (mail-pf0-x232.google.com
 [IPv6:2607:f8b0:400e:c00::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vpc6j4ZfSzDq5W
 for <openbmc@lists.ozlabs.org>; Thu, 23 Mar 2017 17:27:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="j3lXfxGf"; 
 dkim-atps=neutral
Received: by mail-pf0-x232.google.com with SMTP id o126so101330542pfb.3
 for <openbmc@lists.ozlabs.org>; Wed, 22 Mar 2017 23:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=FzWqc2JuXFTy5aMq90+ehc+DSUD0VVo56j7oDs/871I=;
 b=j3lXfxGfwyL3oUgaQ0P9cMMwEWCVODGZK4qI0RboCKYzfz/k9OlB7a7+7dOljx66W0
 C4qvw5jdNlgxKdcOVF7ZWTMuaEQKUQym1yvAKATTqCeO49+w2gemNafjN94fRn/x6mwE
 4/3C+ZxogPiqcNgcSuBRpy/JvyeDkuxB6uhhGxbwiywedRpMeYSotqT/xMQ2GbM+Y/t5
 m6cWCA7275ztqDbC6bPGWt640TIyzhZGtisGzHS23segWMPLVAlvTfCn/pWeXKFyfmiG
 XDepP9cPS4tp5g0hdV2wQw+V5BmlRPyVeiNr1jLAjConuA7SsCAc4UxgadOG3+jV+kwq
 msSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=FzWqc2JuXFTy5aMq90+ehc+DSUD0VVo56j7oDs/871I=;
 b=HCsuuYc5GJTzLAW7uVI1l6ckgfhLc3KcWD3bvUunKggaTlneZTys8V83+IC1jKWP2H
 GqOEigZtzyIBVhyHZfATojoCCTDpkKQ2x2D7SNi3ktcGNl+cd86toE1bP74tZLDFeRxE
 VGBV37s9AentqcbzAqhfH6pPJ/eFwlcq8bLedMUttpYkGmeXJJkMvteG/o1WX9EyN+pV
 h02K7FU29Vgf4kyG5u6vMYudIKctg1D7/s2Y9a45uGc1HATxjqlVBOVAxR9ePHgTYSkH
 ayiFbkBAummKHSphJW+tdCcvOCqeag8okDjq6WXKJWf2zqQgdOBmZ1BLOqPC3f543Z0Z
 gQmg==
X-Gm-Message-State: AFeK/H3/9bthv4f8U4n62mWi7NdiPKgBf9+gjh4aVcSX+OK9Uq+o+sT7XSjQ0k+gy5yF0VBg
X-Received: by 10.98.7.203 with SMTP id 72mr1019604pfh.197.1490250458968;
 Wed, 22 Mar 2017 23:27:38 -0700 (PDT)
Received: from raltherr-linux.svl.corp.google.com ([100.123.242.49])
 by smtp.gmail.com with ESMTPSA id t67sm7517841pfd.76.2017.03.22.23.27.37
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 22 Mar 2017 23:27:38 -0700 (PDT)
From: Rick Altherr <raltherr@google.com>
To: openbmc@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-iio@vger.kernel.org,
 Hartmut Knaack <knaack.h@gmx.de>, Rob Herring <robh+dt@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Mark Rutland <mark.rutland@arm.com>,
 Jonathan Cameron <jic23@kernel.org>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>
Subject: [PATCH v3 1/2] Documentation: dt-bindings: Document bindings for
 Aspeed ADC
Date: Wed, 22 Mar 2017 23:27:34 -0700
Message-Id: <20170323062735.7317-1-raltherr@google.com>
X-Mailer: git-send-email 2.12.1.500.gab5fba24ee-goog
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
X-List-Received-Date: Thu, 23 Mar 2017 06:27:42 -0000

Signed-off-by: Rick Altherr <raltherr@google.com>
---

Changes in v3:
- Consistently write hex contstants with lowercase letters
- Drop model numbers from description as same IP is used in every generation

Changes in v2:
- Rewritten as an IIO ADC device

 .../devicetree/bindings/iio/adc/aspeed_adc.txt       | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/aspeed_adc.txt

diff --git a/Documentation/devicetree/bindings/iio/adc/aspeed_adc.txt b/Documentation/devicetree/bindings/iio/adc/aspeed_adc.txt
new file mode 100644
index 000000000000..674e133b7cd7
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/aspeed_adc.txt
@@ -0,0 +1,20 @@
+Aspeed ADC
+
+This device is a 10-bit converter for 16 voltage channels.  All inputs are
+single ended.
+
+Required properties:
+- compatible: Should be "aspeed,ast2400-adc" or "aspeed,ast2500-adc"
+- reg: memory window mapping address and length
+- clocks: Input clock used to derive the sample clock. Expected to be the
+          SoC's APB clock.
+- #io-channel-cells: Must be set to <1> to indicate channels are selected
+                     by index.
+
+Example:
+	adc@1e6e9000 {
+		compatible = "aspeed,ast2400-adc";
+		reg = <0x1e6e9000 0xb0>;
+		clocks = <&clk_apb>;
+		#io-channel-cells = <1>;
+	};
-- 
2.12.1.500.gab5fba24ee-goog
