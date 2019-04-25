Return-Path: <3Dh7CXAcKBz8wfouvsfhpphmf.dpnpqfocndmjtut.p0mbct.psh@flex--venture.bounces.google.com>
Authentication-Results: lists.ozlabs.org; spf=pass (mailfrom)
 smtp.mailfrom=flex--venture.bounces.google.com
 (client-ip=2607:f8b0:4864:20::a4a; helo=mail-vk1-xa4a.google.com;
 envelope-from=3dh7cxackbz8wfouvsfhpphmf.dpnpqfocndmjtut.p0mbct.psh@flex--venture.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="EX4agwxV"; 
 dkim-atps=neutral
Received: from mail-vk1-xa4a.google.com (mail-vk1-xa4a.google.com
 [IPv6:2607:f8b0:4864:20::a4a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44qqBg4z97zDqdM
 for <openbmc@lists.ozlabs.org>; Fri, 26 Apr 2019 06:52:35 +1000 (AEST)
Received: by mail-vk1-xa4a.google.com with SMTP id k78so514369vkk.17
 for <openbmc@lists.ozlabs.org>; Thu, 25 Apr 2019 13:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=fk3MJybCVKsORh1Tq0hg8ASRi/woeOAvGNjUuVPtJa0=;
 b=EX4agwxVl59AYmrhF2qK+8C6KYqzvue/nYrLToL3znskNa6QRfmgmslE1EAVFzBQHc
 A9DXee5AHdizRyEO4nYBO8QLA98E97360P2aEbgqOfLZpK7KWpRxKwgAtGY6tAKN1rkE
 jWAQ5h/os5bO7C/xQWH/HF1ULbCnioIkkN5AIxCu9cPoC1If0z37FXDk3l7g1uStcPhi
 gKmXuySQVxosbVk+sAc/qKDWvgUHNxUOnS7Nk1RrvgZmFvB7es0UX+yclwQ5euDCJsCT
 HoFpRY9QtiSRVJ+TQ2mIBYSlQRy0PDcjtcH0VNSRZCk9in7NRxLVifKxSyV81g/qYYKi
 O6Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=fk3MJybCVKsORh1Tq0hg8ASRi/woeOAvGNjUuVPtJa0=;
 b=F+z2xVumVhE3fMQObRra7i2djIWbelzBu0knIzgYIkmur/PDsnISCYWF0P+b0s5U7H
 C/R98vU/QrZWWLc2JWZ1rSY6jVOahrXUr5CjWzHZDJrt87FCeC2q2PAsSG96fHpXKBbq
 RJP+hHdEgLgX7QiaGxYFNqGpu/SE+A3fGdzh/+IIniKWAe0njZVZKVb/Jl9d5hTJF9iE
 4KDI5HbafCDq7d85mVM6169YI6smqvugJbRDsnJKE0HOEotWK4BUQbc4sCInxxto4dMq
 XJ6DITADADspWSYtCI9yktVVAxKMdLjlap3u+7qxzm2OhV0Rlz/KhtRrlLNZr0dwJmz7
 Tihw==
X-Gm-Message-State: APjAAAWI19LciTIF2WAx7IvfdvvYvXrTRnxnxW1xJOzHpq/hmjOAZLYM
 Xtv5CqstNi+19b+hrtAy/jgm7kbzXyQd
X-Google-Smtp-Source: APXvYqxUPj/t4HArVG0Mtl632gbZVqJKuc4UvSeLuSl02ld5T7egx8Xcya7wUBGmWozzjiwF+CRoTQfWruGG
X-Received: by 2002:a67:eeda:: with SMTP id o26mr22227236vsp.209.1556225550517; 
 Thu, 25 Apr 2019 13:52:30 -0700 (PDT)
Date: Thu, 25 Apr 2019 13:52:28 -0700
Message-Id: <20190425205228.94065-1-venture@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.21.0.593.g511ec345e18-goog
Subject: [PATCH dev-5.0 v2 1/3] dt-bindings: misc: aspeed-p2a-ctrl: add support
From: Patrick Venture <venture@google.com>
To: venture@google.com, joel@jms.id.au, andrew@aj.id.au
Cc: openbmc@lists.ozlabs.org
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
X-List-Received-Date: Thu, 25 Apr 2019 20:52:44 -0000

Document the ast2400, ast2500 PCI-to-AHB bridge control driver bindings.

Signed-off-by: Patrick Venture <venture@google.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
(cherry picked from commit 28703c6ef6228635f7c8b248c1d846511a2b60a3)
---
v2:
 - Nothing changed, added to a three-patchset chain.
---
 .../bindings/misc/aspeed-p2a-ctrl.txt         | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/aspeed-p2a-ctrl.txt

diff --git a/Documentation/devicetree/bindings/misc/aspeed-p2a-ctrl.txt b/Documentation/devicetree/bindings/misc/aspeed-p2a-ctrl.txt
new file mode 100644
index 000000000000..854bd67ffec6
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/aspeed-p2a-ctrl.txt
@@ -0,0 +1,47 @@
+======================================================================
+Device tree bindings for Aspeed AST2400/AST2500 PCI-to-AHB Bridge Control Driver
+======================================================================
+
+The bridge is available on platforms with the VGA enabled on the Aspeed device.
+In this case, the host has access to a 64KiB window into all of the BMC's
+memory.  The BMC can disable this bridge.  If the bridge is enabled, the host
+has read access to all the regions of memory, however the host only has read
+and write access depending on a register controlled by the BMC.
+
+Required properties:
+===================
+
+ - compatible: must be one of:
+	- "aspeed,ast2400-p2a-ctrl"
+	- "aspeed,ast2500-p2a-ctrl"
+
+Optional properties:
+===================
+
+- memory-region: A phandle to a reserved_memory region to be used for the PCI
+		to AHB mapping
+
+The p2a-control node should be the child of a syscon node with the required
+property:
+
+- compatible : Should be one of the following:
+		"aspeed,ast2400-scu", "syscon", "simple-mfd"
+		"aspeed,g4-scu", "syscon", "simple-mfd"
+		"aspeed,ast2500-scu", "syscon", "simple-mfd"
+		"aspeed,g5-scu", "syscon", "simple-mfd"
+
+Example
+===================
+
+g4 Example
+----------
+
+syscon: scu@1e6e2000 {
+	compatible = "aspeed,ast2400-scu", "syscon", "simple-mfd";
+	reg = <0x1e6e2000 0x1a8>;
+
+	p2a: p2a-control {
+		compatible = "aspeed,ast2400-p2a-ctrl";
+		memory-region = <&reserved_memory>;
+	};
+};
-- 
2.21.0.593.g511ec345e18-goog
