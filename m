Return-Path: <eajames.ibm@gmail.com>
Received: from mail-it0-x242.google.com (mail-it0-x242.google.com
 [IPv6:2607:f8b0:4001:c0b::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tgMXc3xzNzDqgj
 for <openbmc@lists.ozlabs.org>; Sat, 17 Dec 2016 07:36:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="PzNU1/CZ"; 
 dkim-atps=neutral
Received: by mail-it0-x242.google.com with SMTP id n68so3869041itn.3
 for <openbmc@lists.ozlabs.org>; Fri, 16 Dec 2016 12:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=UnJE65vbfiItbpUF2y/ONDpZeBC9Exw7gHTpM+Ab4D0=;
 b=PzNU1/CZ6/lWFkSktpEKkPvgafsJleHCnkPU7FEiq8uSQFVdYBjeyqe9QeFrrtspzs
 miWVCEXwxsoh6IbBmJ8XDjtKjbeSDj2WdCeGvRdwaAgB4zjmGsm/JMY2m/iHYZECHHsa
 1EKz43m8YRVpJUFCztOv8BFYjLz0C6eOjyxi2ws9G+CXd8q0NbRoiNFE9n1jx+7y3DPx
 6G5x1iqDUwbMyUtE8mrHQYEedMmhl3j4qsW4aLHr3Ffilpry2KelI3vlrvW72/25K12y
 4NYnfNXARWZSzXn3ez3uWT+2ma5h+maNCCGqg2k4CYiIwbqPcD+kHGErzt35L8DxCpP9
 ABBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=UnJE65vbfiItbpUF2y/ONDpZeBC9Exw7gHTpM+Ab4D0=;
 b=ZOP2cQiv6eTxeC/N8x6LzD0oSBv4wS+OgzVhS7kV3FybjDj9Y2KZNSx0sIyQ61pII5
 JsNeFZabySrAQc6b2wDQez8/kQDxHA1D27n+6RWRJtSe4g+1FQWACXD4fTbUfqkhY9Bv
 nDaz6xrqlEjs55eKt4+c79zDDfm3vWE4E83PcQNz76yzKysjYbql+EddvnC7ozfLwNuc
 DU4UOAIDkOCc6QiO0/Xnh167AMp9RYmuliag5BFz/KeXiMbWHRbWEmhLmmvVw+mUHEwC
 CDfZJ2AzNetUjB5pkRsc+yL5gyhgDlHJQiDoExNLG2V5vCng/13kW5cwSjdP+TB4BmPV
 IO4g==
X-Gm-Message-State: AKaTC01u/vemIph35AONP2WKhN1hDAiESgLp32lFazCDpMGPdj7BbkAWJdiUnATddd+vZg==
X-Received: by 10.36.98.206 with SMTP id d197mr5732581itc.52.1481920574855;
 Fri, 16 Dec 2016 12:36:14 -0800 (PST)
Received: from eajames-austin-w350.austin.ibm.com ([32.97.110.57])
 by smtp.gmail.com with ESMTPSA id x190sm1915001ite.14.2016.12.16.12.36.13
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 16 Dec 2016 12:36:13 -0800 (PST)
From: eajames.ibm@gmail.com
To: openbmc@lists.ozlabs.org
Cc: andrew@aj.id.au,
	joel@jms.id.au,
	"Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux 6/7] arm: aspeed: dts: Add I2C POWER8 OCC compatible
 string
Date: Fri, 16 Dec 2016 14:36:08 -0600
Message-Id: <1481920568-7080-1-git-send-email-eajames.ibm@gmail.com>
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
X-List-Received-Date: Fri, 16 Dec 2016 20:36:17 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Add devicetree entry to probe up the POWER8 OCC driver on I2C bus.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
index cc5fcf2..1a775f5 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
@@ -20,6 +20,15 @@
 	};
 };
 
+&i2c3 {
+	status = "okay";
+
+	occ@50 {
+		compatible = "ibm,p8-occ-i2c";
+		reg = <0x50>;
+	};
+};
+
 &uart5 {
 	status = "okay";
 };
-- 
1.9.1
