Return-Path: <raltherr@google.com>
Received: from mail-pf0-x230.google.com (mail-pf0-x230.google.com
 [IPv6:2607:f8b0:400e:c00::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vpwPd6mFFzDq93
 for <openbmc@lists.ozlabs.org>; Fri, 24 Mar 2017 05:41:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="QnSsNkEf"; 
 dkim-atps=neutral
Received: by mail-pf0-x230.google.com with SMTP id o126so109441232pfb.3
 for <openbmc@lists.ozlabs.org>; Thu, 23 Mar 2017 11:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=5RDdUvKNpBpW8c8POJAI124OGMc+slBDeKMk6al52Fg=;
 b=QnSsNkEfnrfRP7V1pSogEUySF6uN9p9si/r5/VIVaLnpb43aENwTn9xtxj+ItiGkZC
 BufMJ2tTGgAqrICu0TRKeMwKK+0v2SBZy18uz9Vj3lp/ZNWqk6sWrHs9dARe4Vr5idKk
 /eCXPFjas81rKRRDeYIAGfUJj4P4VCtiFK/48tPQZxZK/8pnGFLFDO07Cc5kHo0kOpOw
 Oi+m2kOKonUgrzTaOfBktHpucRGT1jmd4LfklUsyav3LQzhplqouxYYSG3onvbX3k/WS
 1PiLP8jzuvthUKicFnEYMmqTfbkyT8t/2zClaHBjMf41FsmTbGuGKb9NZCgX2qiUroqY
 vFtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=5RDdUvKNpBpW8c8POJAI124OGMc+slBDeKMk6al52Fg=;
 b=INHJ6oIj9NQ3Gp54VmA3nldB4rlqX8BsDsikLEnp7evh/mdECjSfqt3RkIBKhbRXIs
 341kxD6O0sBQnROYykJZ1eNxrflJkvrqMJrdBJg9cEVyOSl4fuEXiUJ0pe02J2I33ben
 DRBgiqxLIvnGS9teUJi18cR2BRocIdMw96vXNLfOjVFgYi/WeS1wVMigHyfQUypJ6bvD
 Ko4W5Ys+5FIlV0cL4gLC9PndJs4WZwSrf9NgAqCxrVpup3sG8ZgWtYxBXeotLfQX1pyY
 7SiEw+nrvqUaSK53hEIEQJAgddT6xMMSiRN3JqKgPfF2O0i7q/7LL56GUWqmXnsNmcut
 csLg==
X-Gm-Message-State: AFeK/H1nyLRRbQaZmJzL9E8i1pUKQPKJMGkmpT2k/qPl0KVXOAe/ZLHEW4YA8zPaxQrFx8JJ
X-Received: by 10.99.116.78 with SMTP id e14mr1588679pgn.135.1490294498973;
 Thu, 23 Mar 2017 11:41:38 -0700 (PDT)
Received: from raltherr-linux.svl.corp.google.com ([100.123.242.49])
 by smtp.gmail.com with ESMTPSA id b14sm11679951pfh.114.2017.03.23.11.41.37
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 23 Mar 2017 11:41:37 -0700 (PDT)
From: Rick Altherr <raltherr@google.com>
To: openbmc@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-iio@vger.kernel.org,
 Hartmut Knaack <knaack.h@gmx.de>, Rob Herring <robh+dt@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Mark Rutland <mark.rutland@arm.com>,
 Jonathan Cameron <jic23@kernel.org>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>
Subject: [PATCH v4 1/2] Documentation: dt-bindings: Document bindings for
 Aspeed ADC
Date: Thu, 23 Mar 2017 11:41:34 -0700
Message-Id: <20170323184136.7349-1-raltherr@google.com>
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
X-List-Received-Date: Thu, 23 Mar 2017 18:41:42 -0000

Signed-off-by: Rick Altherr <raltherr@google.com>
---

Changes in v4: None
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
