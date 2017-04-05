Return-Path: <raltherr@google.com>
Received: from mail-pg0-x235.google.com (mail-pg0-x235.google.com
 [IPv6:2607:f8b0:400e:c05::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vyrYs6GCVzDqHK
 for <openbmc@lists.ozlabs.org>; Thu,  6 Apr 2017 02:16:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="v+ZBNqxV"; 
 dkim-atps=neutral
Received: by mail-pg0-x235.google.com with SMTP id g2so10246723pge.3
 for <openbmc@lists.ozlabs.org>; Wed, 05 Apr 2017 09:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=lY8vGvH/JbPVh+gWhWmKihl23RzqWrSkHV6PLZTvHQI=;
 b=v+ZBNqxVEmdgPZ8CqQFqWwpzxVuiOpFHWKkJuh4eqScgAhiOoOVchbdObRT7UsyybD
 YPdyZqPl7htuHRMLqrHmDtUXmS+Io7jwZsjNMhOfN2QlOlm1aLSbiQd765u+DzX/IABT
 VXV0lUwKC+z5WfpDsAHdEFnebw/B5iwhIIVrnVqlpIHHZbbNLhsOkOW4qvlIjO2YOfgU
 wNU5Xn2r0ugMgSPcxE0r1X5bf0dFLxFAI4bFrDbcYGHbAn+Vq0RM0U1IkDX1HsazEm3g
 oq4PTyhSS1BrkfWis29/u8hZuvN1YRdM3OT/FwwBUhR7mpBWbR1BQnLzqPzgoJUXkhpi
 0eAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=lY8vGvH/JbPVh+gWhWmKihl23RzqWrSkHV6PLZTvHQI=;
 b=X6Pb8yCNbUtXrKECF5zaElRBjQo/87KoEdq0oOCQN2sW9IUKIzL+S5W87Ye9KYHdX7
 h9Vx9qwHr25fPpLaj8nwPV+yfGyJteYhTkV8frdRAnuY5uPDvecUWYUhHRvx1GGGDMKo
 mTQifJ71cP+hQKeWhLcxc6U0NbVKtbLVkXrsvVSd4pj+yzNvc737+2ALTPYzlFSvaXJg
 keG88a4vxOnNoF74qHuoOWLnZws3kukvEKDRdz/t7e0WKMQqA1GRU/KGF9Am/NIEL3oC
 iyHoYeIousKrJrQN4dNi5Pmg/Tv+QN6r/xoeWUz2wchLUXhw6FKmUFi5QmAwyX6cFThO
 FrWQ==
X-Gm-Message-State: AFeK/H1lxj/5tlLfL1xq1Kwv5ABlRtg2Z0r5F/ql1unAmOwD6SCfhvfnnLHQ28IosVSzLQQK
X-Received: by 10.98.112.134 with SMTP id l128mr30577534pfc.110.1491408974933; 
 Wed, 05 Apr 2017 09:16:14 -0700 (PDT)
Received: from raltherr-linux.svl.corp.google.com ([100.123.242.49])
 by smtp.gmail.com with ESMTPSA id x30sm5087071pgc.2.2017.04.05.09.16.13
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 05 Apr 2017 09:16:13 -0700 (PDT)
From: Rick Altherr <raltherr@google.com>
To: Joel Stanley <joel@jms.id.au>
Cc: openbmc@lists.ozlabs.org
Subject: [RESEND PATCH linux dev-4.7 v1] dts: aspeed: Add hardware RNG to
 aspeed-g4 and aspeed-g5
Date: Wed,  5 Apr 2017 09:16:11 -0700
Message-Id: <20170405161611.22659-1-raltherr@google.com>
X-Mailer: git-send-email 2.12.2.715.g7642488e1d-goog
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
X-List-Received-Date: Wed, 05 Apr 2017 16:16:18 -0000

Signed-off-by: Rick Altherr <raltherr@google.com>
---

 arch/arm/boot/dts/aspeed-g4.dtsi | 6 ++++++
 arch/arm/boot/dts/aspeed-g5.dtsi | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
index e5be87076a6b..ee735e92c3d9 100644
--- a/arch/arm/boot/dts/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed-g4.dtsi
@@ -840,6 +840,12 @@
 				reg = <0x1e6e202c 0x4>;
 			};
 
+			hwrng@1e6e2078 {
+				compatible = "timeriomem_rng";
+				reg = <0x1e6e2078 0x4>;
+				period = <1>;
+			};
+
 			adc: adc@1e6e9000 {
 				compatible = "aspeed,ast2400-adc";
 				reg = <0x1e6e9000 0xB0>;
diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index 48fd068251d6..df2712caa36d 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -1009,6 +1009,12 @@
 				reg = <0x1e6e202c 0x4>;
 			};
 
+			hwrng@1e6e2078 {
+				compatible = "timeriomem_rng";
+				reg = <0x1e6e2078 0x4>;
+				period = <1>;
+			};
+
 			gfx: display@1e6e6000 {
 				compatible = "aspeed,ast2500-gfx", "syscon";
 				reg = <0x1e6e6000 0x1000>;
-- 
2.12.2.715.g7642488e1d-goog
