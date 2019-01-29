Return-Path: <328lQXAcKB5oP8HNOL8AIIAF8.6IGIJ8H5G6FCMNM.ITF45M.ILA@flex--venture.bounces.google.com>
Authentication-Results: lists.ozlabs.org; spf=pass (mailfrom)
 smtp.mailfrom=flex--venture.bounces.google.com
 (client-ip=2607:f8b0:4864:20::849; helo=mail-qt1-x849.google.com;
 envelope-from=328lqxackb5op8hnol8aiiaf8.6igij8h5g6fcmnm.itf45m.ila@flex--venture.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="KQ0uLPYf"; 
 dkim-atps=neutral
Received: from mail-qt1-x849.google.com (mail-qt1-x849.google.com
 [IPv6:2607:f8b0:4864:20::849])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43q0TH3ZX7zDqRP
 for <openbmc@lists.ozlabs.org>; Wed, 30 Jan 2019 08:47:09 +1100 (AEDT)
Received: by mail-qt1-x849.google.com with SMTP id 42so26085562qtr.7
 for <openbmc@lists.ozlabs.org>; Tue, 29 Jan 2019 13:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=VfTmoNMPlJmohGl2Jrgx4BeuNBOVF9EMtA7Kyykgjb0=;
 b=KQ0uLPYfWNlH3/RpDZBUHajDNDRAuSm6tqYQOe8N/2DwozsycLvyteBAnkzDczWWXx
 kY5Qp4Uxr7jN6gUftrYAP8Rfoi7/JFDmaZhxSxrId1h05gxLLSsz9RptaeRJ0wOfvFZ+
 uyVnGu3KH2xkqSnK8QVE5sUkYeYIM8aBpDe11CK1P6QCHM5E/wiZGiUfUAWhq0bBViAu
 ypV5qEYqhwi0+Bgvk8JWpyO6JowsORJaf5HArhBRYQPWr0mtjZR4lcIp4l0kvLaMH+Ab
 uoWc4wyWo0STQbaXTQ1x0LuVgVxwjZjZF5U6h5ps1GMnaQWQzOMPRWVnDrhmS4ggEh9l
 Jfng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=VfTmoNMPlJmohGl2Jrgx4BeuNBOVF9EMtA7Kyykgjb0=;
 b=H9g2u+RatcDe8Qx/IuA+AuQO4OeAV0drkwlh6Byr9+6xx2hkInJNhcRza8xDq/7GvS
 MwHH1da3GR+7jVSKx39LLbLqq54Q7rEhatma35mxowOZZ5kHXpnWl3oD/OdKngCsH+x2
 IPdhRf7U8p+wILtKPpT4h2lV/eV/I1jrieN/bZJl1h9y7mKtAFnhxzGMJh8s6c4xkijM
 xz98+EVQ35jJPBYLDLDyBAbN5bzS45ruaAXF0xSSXRmg0YSvKSxkgYnbJcu6dKhQorA3
 9cxCRC/S876mBo6ZaU6eNGHyZXoapjf0fCLINw7FI2elfpeCBvoFfnM6IQmwaJsDsiWa
 jQXA==
X-Gm-Message-State: AJcUukeNK6lPqrRhMfdLwYHAmePB2J/sWfKTTPEtzDq8z4RMRCKv5AyY
 X3QC13rN5U/2nTnXGdaOrIr2Ge71RniU
X-Google-Smtp-Source: AHgI3IYndzSP3ThzJ3+zOZEdR7qNg7UVYBWhioP7GkG3xlWXwI1jT9aFqPjSpoqFkbN6u/lNBum9it3WqlZM
X-Received: by 2002:aed:3a25:: with SMTP id n34mr4385651qte.17.1548798427022; 
 Tue, 29 Jan 2019 13:47:07 -0800 (PST)
Date: Tue, 29 Jan 2019 13:47:02 -0800
Message-Id: <20190129214703.119694-1-venture@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.20.1.495.gaa96b0ce6b-goog
Subject: [PATCH] ARM: dts: aspeed: quanta-q71l: enable uart1
From: Patrick Venture <venture@google.com>
To: venture@google.com, joel@jms.id.au, robh+dt@kernel.org, andrew@aj.id.au, 
 mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org
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
X-List-Received-Date: Tue, 29 Jan 2019 21:47:17 -0000

Enable the uart1 node such that the clock will be enabled.

Signed-off-by: Patrick Venture <venture@google.com>
---
 arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
index 999679b5ef55..0d7c6339da46 100644
--- a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
@@ -138,6 +138,10 @@
 	pinctrl-0 = <&pinctrl_rgmii2_default &pinctrl_mdio2_default>;
 };
 
+&uart1 {
+	status = "okay";
+};
+
 &uart5 {
 	status = "okay";
 };
-- 
2.20.1.495.gaa96b0ce6b-goog
