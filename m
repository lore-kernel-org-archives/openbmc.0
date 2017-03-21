Return-Path: <raltherr@google.com>
Received: from mail-pf0-x22a.google.com (mail-pf0-x22a.google.com
 [IPv6:2607:f8b0:400e:c00::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vnlK04JwlzDq7c
 for <openbmc@lists.ozlabs.org>; Wed, 22 Mar 2017 07:48:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="dMgrnN5B"; 
 dkim-atps=neutral
Received: by mail-pf0-x22a.google.com with SMTP id 20so36729648pfk.2
 for <openbmc@lists.ozlabs.org>; Tue, 21 Mar 2017 13:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=9m8mlVGrWSaULzYhiFwm4OlGVeWNloaM6yi8eEM8FE8=;
 b=dMgrnN5BqjJm8gPuZUlSv2Bo1nDqlDoZuixLyZkZ3buXNXZSCfYncQOuDT1CBhUJaZ
 flacpAxqpiLdMTvd6cEW47SSYhX9s4UmQ3FpJi6aU1C+hHrzkC4DbkKfW3HIqybRvMIZ
 jmPRtLdw1Xl4l5TpU0bj15TiOSB7CdngzDP5QvrgxGswlQ/lUzESC4mnCO84Ibd2vQlL
 J1pw6WmjpFWKxuOx/ymMWjhYHm71hMlw5ZwmFQBx+C5nfCMkfiAC5mAn4At3kItm003Z
 9vvHeX27u2+Y8aui90HOvVOy2Krib5acV7KGMcoQitRXUYkutLAmjOQxPRk+7RgYfXot
 sjfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=9m8mlVGrWSaULzYhiFwm4OlGVeWNloaM6yi8eEM8FE8=;
 b=GhmNta+KRYTCA+vkfodg7hMgJaKmANc1urODVeqUzgg+ggAIHL3k/UiDcfAvOH2KAv
 G30Z4OCIP44kxummOh9s5xd9JiU1qYBCafzx3Dw+1wEBYE1q0b2SMjuQwVps6fBxy6IJ
 9K6tuM22uH4MEoTJQKd/uWNIdgKtzawhrIPp1w9Kagt1j4V/RCi51OS7hT/UFAvoxAZS
 nSX1zRh4wdHfHZaIdVEUCJtouDnBxOXCy++u+mbP3RLoJkEe21YVmuGWj+KZcMfzgjsJ
 0x5InjUJ+PNo9PRD83zaOYbr1yDqLtpkuTVFNuE/q9mXxz9pC0LOzVeAS3ikjRi+BSJd
 NE7w==
X-Gm-Message-State: AFeK/H0E7zlDvfrJYx9jEsx6vzZjvkmSrf3J9prHkEeNmfTi/dNuzsZsSoCkdTBBn1U7Yvan
X-Received: by 10.84.210.167 with SMTP id a36mr50702712pli.40.1490129311937;
 Tue, 21 Mar 2017 13:48:31 -0700 (PDT)
Received: from raltherr-linux.svl.corp.google.com ([100.123.242.49])
 by smtp.gmail.com with ESMTPSA id c22sm41622939pgn.43.2017.03.21.13.48.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 21 Mar 2017 13:48:30 -0700 (PDT)
From: Rick Altherr <raltherr@google.com>
To: openbmc@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-iio@vger.kernel.org,
 Hartmut Knaack <knaack.h@gmx.de>, Rob Herring <robh+dt@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Mark Rutland <mark.rutland@arm.com>,
 Jonathan Cameron <jic23@kernel.org>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>
Subject: [PATCH v2 1/2] Documentation: dt-bindings: Document bindings for
 Aspeed AST2400/AST2500 ADC
Date: Tue, 21 Mar 2017 13:48:27 -0700
Message-Id: <20170321204828.31303-1-raltherr@google.com>
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
X-List-Received-Date: Tue, 21 Mar 2017 20:48:37 -0000

Signed-off-by: Rick Altherr <raltherr@google.com>
---

Changes in v2:
- Rewritten as an IIO ADC device

 .../devicetree/bindings/iio/adc/aspeed_adc.txt       | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/aspeed_adc.txt

diff --git a/Documentation/devicetree/bindings/iio/adc/aspeed_adc.txt b/Documentation/devicetree/bindings/iio/adc/aspeed_adc.txt
new file mode 100644
index 000000000000..7748c2c2ad0c
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/aspeed_adc.txt
@@ -0,0 +1,20 @@
+Aspeed AST2400/2500 ADC
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
+		reg = <0x1e6e9000 0xB0>;
+		clocks = <&clk_apb>;
+		#io-channel-cells = <1>;
+	};
-- 
2.12.1.500.gab5fba24ee-goog
