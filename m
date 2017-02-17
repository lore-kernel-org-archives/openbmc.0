Return-Path: <raltherr@google.com>
Received: from mail-pf0-x22a.google.com (mail-pf0-x22a.google.com
 [IPv6:2607:f8b0:400e:c00::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vPg2866WfzDqBs
 for <openbmc@lists.ozlabs.org>; Fri, 17 Feb 2017 15:26:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="I68VpD57"; 
 dkim-atps=neutral
Received: by mail-pf0-x22a.google.com with SMTP id e4so10600929pfg.1
 for <openbmc@lists.ozlabs.org>; Thu, 16 Feb 2017 20:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:subject:date:message-id;
 bh=8nQaRQE3bAAH7JHv0CuapmhHSIEqSuoXcs894AS3mF4=;
 b=I68VpD57dNFmaeUf6BMA28za2WyAVw8Cyo5ZN046HpsOeRIbF6RiA8XgRssCVKcF4H
 VMZT600dMu2qK6o+ZzxbVjnTjbImtUaXfSNUTEYVsazHVHZp7ttfw5TVEkc7bG0Pd/Wg
 ly3Py7FoEaYYGIprNMab4hu71AT6VEEzkKO/3awyiY67BMvvvPkpBJTwwxDZujTxGhDt
 8pt++5BcFNM8qdV92VatcMFUioaJnX2Lz0C8/5ZZeAsNy3TxBY/hvKtzBgUNtFkQzKxi
 vgQIOKEyO4DC+yfBi4BM9tUN8tFPI82sRpfWFus4t5/PPyVODFnfiXEELxW9WyVArS79
 fjaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=8nQaRQE3bAAH7JHv0CuapmhHSIEqSuoXcs894AS3mF4=;
 b=B7aUOCrwsmVMZb1uIyrk6OpB2gcI1Pb7Vy+Eg6dmfEA0aoLpgPkQQhn92gT15/JA2q
 LBK7GB368h7RDzRyHi1D9WEonuj5DsQc7TyFCo7rrMwAv7VAk8FunAUyzZT2JhtXXIEO
 hl+3+ErSwZDIGRZ6GNMhQOT5cFb0+YI7ctzlQJa3oSdbG6eMoSUg9c3KyfPzKu81SipX
 nAl3Avuk8un8itAoYfIX75f5oVUyMjPMjQOvtnG9TTbLRQgVCi8/j71NFIzbkpqg4sS2
 2DKGHdxrBjfWkaEYwiIXz7+a0T4DmWxxVc0IFPu8t0mMCSUtsn/wG7kV/KOZQydi/mve
 xaxw==
X-Gm-Message-State: AMke39kRejWfQEg/oZtsRg+fSz2WVQdsJKR3SWfQLRnGTJfmPQuT7OsKiHR3y702vNAb9G5O
X-Received: by 10.98.0.143 with SMTP id 137mr6861865pfa.173.1487305565378;
 Thu, 16 Feb 2017 20:26:05 -0800 (PST)
Received: from raltherr-linux.svl.corp.google.com ([100.123.242.49])
 by smtp.gmail.com with ESMTPSA id s3sm16331862pgn.55.2017.02.16.20.26.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 16 Feb 2017 20:26:04 -0800 (PST)
From: Rick Altherr <raltherr@google.com>
To: joel@jms.id.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux] dts: aspeed: Enable MAC1 on Quanta Q71L BMC
Date: Thu, 16 Feb 2017 20:26:03 -0800
Message-Id: <20170217042603.25864-1-raltherr@google.com>
X-Mailer: git-send-email 2.11.0.483.g087da7b7c-goog
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
X-List-Received-Date: Fri, 17 Feb 2017 04:26:09 -0000

Signed-off-by: Rick Altherr <raltherr@google.com>
---
 arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
index 229764c091dd..713246090906 100644
--- a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
@@ -75,6 +75,13 @@
 	no-hw-checksum;
 };
 
+&mac1 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rgmii2_default &pinctrl_mdio2_default>;
+};
+
 &uart5 {
 	status = "okay";
 };
-- 
2.11.0.483.g087da7b7c-goog
