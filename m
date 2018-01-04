Return-Path: <mine260309@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c00::242; helo=mail-pf0-x242.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="RilskW4C"; 
 dkim-atps=neutral
Received: from mail-pf0-x242.google.com (mail-pf0-x242.google.com
 [IPv6:2607:f8b0:400e:c00::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zC2S83fZVzDqps
 for <openbmc@lists.ozlabs.org>; Thu,  4 Jan 2018 20:24:24 +1100 (AEDT)
Received: by mail-pf0-x242.google.com with SMTP id m26so525780pfj.11
 for <openbmc@lists.ozlabs.org>; Thu, 04 Jan 2018 01:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=aRI31DjtD9fVGmC/SAfJVgTGqTpOywjP+ozeiH4DMQc=;
 b=RilskW4CnDa3zZ20STsT2llyf1dLosjtV+k1cvRq9Z/KhdeUOQHXIJgNUtlxC9eUWZ
 N4o7DnObAavvYnfJV9gNd6Y1M9QSkb5AjIfpljZ3H+O1tf9ei+BoovHdnCRA7h+m7YM8
 Uj3CGJi0sBx4nDM7ubTcJg730jUcrN4HBU1ZLQ6xzf8eJeGp4R1HXRR6U1Tma2GkCTxW
 rsx4J8VB/f7UsLf9lV9qx1FSmrUvkCSMhyeC6uB+gaDWW/YRjCGQcBCEs3kUHHk+3IoE
 bqGEc7vGMxVG+RzWDMRlDF4G1PepE3KGpc1MHvMc1Ns20GthH5AxC6KNMKvoJ3fiPjQK
 FDZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=aRI31DjtD9fVGmC/SAfJVgTGqTpOywjP+ozeiH4DMQc=;
 b=kW3mAqrHtBLUZGVBoTVpjdWsTG+it8LGyxFkfuZ7IwcwFb5hbgAD8rc20OBjy7SyB/
 woSgR0/UmURiJFXovY9Yq8TVJN5lEOncPvNpXgKwZgsK2eLXnAoqDO9sCIm2hsiNtSLh
 zya7CwOxUuucwWNkW1KiZstFO7U6ZaNNCkD6g1jaGn2+d5FKxgr/88VsSNv6GFeSO7ad
 eDv8h7Ed2mhigFpfrVkFe6QwuCIDhKa3y0Z0QYZ+dVNhdww8Y46tMRG++tO8J415x3yB
 ivNwyTLG8TA53zC6VVXbWgvkZzBGjGjfkDKoJpDx3/n/FrpGc6Ro84RXnU3pjk00Yc5y
 4DZg==
X-Gm-Message-State: AKGB3mJLjtn4uA4RXiColtIo+aVNEFBAT0kpQHZD/KCeXQw9m8qpPOYp
 FiJhX8Nq/gjaxOL5cMe4MXqVkdcR
X-Google-Smtp-Source: ACJfBouOTayZ17bWeEITCtQtaTi0oDAcEEBMbGhFRYvsBn/mk0ew++5MXAbYOwQpnh+lyYbiF20G+Q==
X-Received: by 10.99.109.75 with SMTP id i72mr3432435pgc.86.1515057861378;
 Thu, 04 Jan 2018 01:24:21 -0800 (PST)
Received: from localhost ([159.203.222.251])
 by smtp.gmail.com with ESMTPSA id m11sm6101109pfh.35.2018.01.04.01.24.18
 (version=TLS1_2 cipher=AES128-SHA bits=128/128);
 Thu, 04 Jan 2018 01:24:20 -0800 (PST)
From: Lei YU <mine260309@gmail.com>
To: openbmc@lists.ozlabs.org
Cc: Lei YU <mine260309@gmail.com>,
	joel@jms.id.au,
	abarrera@us.ibm.com
Subject: [PATCH linux dev-4.10] ARM: dts: aspeed: zaius: Add pcie-e2b-present
 gpio key
Date: Thu,  4 Jan 2018 17:24:07 +0800
Message-Id: <1515057847-30492-1-git-send-email-mine260309@gmail.com>
X-Mailer: git-send-email 1.9.1
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Jan 2018 09:24:26 -0000

Add GPIO key to check presence of PCIE E2B

Signed-off-by: Lei YU <mine260309@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
index 17f2000..f583dcc 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
@@ -55,6 +55,12 @@
 			gpios = <&gpio ASPEED_GPIO(F, 7) GPIO_ACTIVE_LOW>;
 			linux,code = <ASPEED_GPIO(F, 7)>;
 		};
+
+		pcie-e2b-present{
+			label = "pcie-e2b-present";
+			gpios = <&gpio ASPEED_GPIO(E, 7) GPIO_ACTIVE_LOW>;
+			linux,code = <ASPEED_GPIO(E, 7)>;
+		};
 	};
 
 	leds {
-- 
1.9.1
