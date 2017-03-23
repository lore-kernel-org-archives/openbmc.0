Return-Path: <mine260309@gmail.com>
Received: from mail-pf0-x243.google.com (mail-pf0-x243.google.com
 [IPv6:2607:f8b0:400e:c00::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vpcSf5HcwzDq5W
 for <openbmc@lists.ozlabs.org>; Thu, 23 Mar 2017 17:43:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="cWaD/283"; 
 dkim-atps=neutral
Received: by mail-pf0-x243.google.com with SMTP id n11so18820352pfg.2
 for <openbmc@lists.ozlabs.org>; Wed, 22 Mar 2017 23:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=5g7BISU1SzEK9ao6vQdiVD2/XMzxwIY9WKhDfEujzh4=;
 b=cWaD/283j1BiD3aFsphGpPZfswJ/z1Jpik1wFsPc+NuOR1KbYC1tXvAXZ1yhxeh5mE
 +UXNW1UDcKxHbV73Jiby43ZTtvY7A5zY0/bloAx9Wp+Oi2Iut8rVkJdDM7K/bFVc93Uh
 yeghfal+mXnywxz7O9rSJcQn30uyofuNLqpSNSiBwrdRCvGMBXJuzdY66bkbOl+t8SvT
 3F4Zlu9b4Jpa8Hprrheur8aJ0tqQfjJZHlbT0KMuL/L2FU8LXogYE8NE2S3BJKAjC7Rb
 DnYKoLY5EJV3/SwXuaDhSjgh6qL9YzfaQgTBFGQXD1MK+H9/ZtnsMK5tUPg3g0RuF7+5
 kkrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=5g7BISU1SzEK9ao6vQdiVD2/XMzxwIY9WKhDfEujzh4=;
 b=lxsi7Eu+6ipgrp0UOwPCjDcMiAGHtGMh5ukyvHdwEKsGo+5z8kvtLRa9k+Cxq7+FFW
 XtqxQtBWj3yhY0zcHihBTBN90Sphh5gUXykXzgH6dyvECl6pSWleXZ2KZLLbzv6zMntV
 5HPKo5Hi5x3CVTLw+tY7fyiUglIOsIpFCextGxxT71dO3y//VHGtbRMu0K7yalRwdlkW
 NQgkA+LK/VLyEfoIEHIczCeG0jsDtF/1o4D9DGjITy7gkygIe0hIaoWLcnqV4A4Eoo2v
 JaQJOc/6CJCJnDDzttEEM0Nudmdqbewa6DAxRjHbxs0NKXeyUM+Vwgda+s+M1l4IRx52
 9WZg==
X-Gm-Message-State: AFeK/H1XCNCeYNVr68a/zD8mscQKbMnZloe+mKIFJnGrelt066LlIleXuft0FX7lUYJ9Yw==
X-Received: by 10.99.101.67 with SMTP id z64mr1136977pgb.78.1490251392466;
 Wed, 22 Mar 2017 23:43:12 -0700 (PDT)
Received: from localhost ([159.203.222.251])
 by smtp.gmail.com with ESMTPSA id r8sm7634871pfk.80.2017.03.22.23.43.11
 (version=TLS1_2 cipher=AES128-SHA bits=128/128);
 Wed, 22 Mar 2017 23:43:11 -0700 (PDT)
From: Lei YU <mine260309@gmail.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.7 1/2] ARM: dts: aspeed: romulus: Add UART1
Date: Thu, 23 Mar 2017 14:42:48 +0800
Message-Id: <1490251369-6481-1-git-send-email-mine260309@gmail.com>
X-Mailer: git-send-email 1.9.1
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
X-List-Received-Date: Thu, 23 Mar 2017 06:43:15 -0000

Romulus has a RS-232 connection on the back of chassis, add UART1 to use
this connection.

Signed-off-by: Lei YU <mine260309@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
index 2266c85..65be964 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
@@ -73,6 +73,21 @@
 	status = "okay";
 };
 
+&uart1 {
+	/* Rear RS-232 connector */
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_txd1_default
+			&pinctrl_rxd1_default
+			&pinctrl_nrts1_default
+			&pinctrl_ndtr1_default
+			&pinctrl_ndsr1_default
+			&pinctrl_ncts1_default
+			&pinctrl_ndcd1_default
+			&pinctrl_nri1_default>;
+};
+
 &uart5 {
 	status = "okay";
 };
-- 
1.9.1
