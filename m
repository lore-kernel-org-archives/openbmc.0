Return-Path: <raltherr@google.com>
Received: from mail-pa0-x231.google.com (mail-pa0-x231.google.com
 [IPv6:2607:f8b0:400e:c03::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rfr7m6g2GzDqw0
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 04:00:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=fkh76hE/; 
 dkim-atps=neutral
Received: by mail-pa0-x231.google.com with SMTP id hl6so19666710pac.2
 for <openbmc@lists.ozlabs.org>; Wed, 29 Jun 2016 11:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=QPcPWhhrXdHjoia66/ZHhh0wuayNT2dpUCjfD4vnB4Y=;
 b=fkh76hE/am5TQw+wY1i8qitdp5lU611eJFh1G99o6NETzNpoNveSkJe7bL7IZ8FNEc
 uiC+YCW5OmNNgOe06ONV6k1sqnBPQocBkvKUBB+LrzzG4DO4zNDSCFZ61YkqVfOk+sz8
 O+FutHbeGDTZI/JBj/hQ7Izd7tuKKYjMYl1jAp40OTP/V5s5tI65l4fcPjkW7OPvLiOT
 0bdU57cNdcy1kR/p9EymWW+oP1eCYap6u6JBeZ5yEp5kbpUWWOr3VarwNnnPaT3x7so3
 f7S7hUAA7tjFwUgncY55Z8SoXyEby+WseDN63/o554deWL6oebZeaEe9K6vWjBI5mVpH
 j5lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=QPcPWhhrXdHjoia66/ZHhh0wuayNT2dpUCjfD4vnB4Y=;
 b=QOsVUDteGOtZBcSal8JuHTJMJzHwp+kKSbHeEeCPU71LB4uMtsa6c06osJbuMZFCY2
 glwniONzpToblb4gqUZ+28SCw2QdTZt/1noaEuDILv4QgZAdzXiyQlnusNGCvrcCREfr
 EQGnZ1Ny+P1oYXOL8WvjqNdS42SfragevN+j52clXiWfmQG/2MRqgtWX0PYU/ayJVmxF
 hOM1jVspx0AKv5N/3wsdKmEzOJSw+4qNnCv4Eq8fwdYJwfbReUUTCSB2ML47Lg0NNYP5
 w0CyJEngDT5vn5C9VZ9544wF+gm5DnBn4DP7LlyLdKEIAq/S4TPczFOYc9SxctcV4/rJ
 CWLA==
X-Gm-Message-State: ALyK8tJj2h5nO/Cze3Jvd9qICNvhUYrs/RfKX8jVyH3RhDkDrw8z6ZqqWOuY3rkltd76pgQV
X-Received: by 10.66.150.67 with SMTP id ug3mr13994641pab.41.1467223250232;
 Wed, 29 Jun 2016 11:00:50 -0700 (PDT)
Received: from raltherr-linux.mtv.corp.google.com ([172.18.64.20])
 by smtp.gmail.com with ESMTPSA id ln4sm7513693pab.38.2016.06.29.11.00.47
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 29 Jun 2016 11:00:47 -0700 (PDT)
From: Rick Altherr <raltherr@google.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH 3/3] ARM: dts: OpenBMC variant of AST2500 EVB
Date: Wed, 29 Jun 2016 11:00:43 -0700
Message-Id: <1467223243-9156-4-git-send-email-raltherr@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
In-Reply-To: <1467223243-9156-1-git-send-email-raltherr@google.com>
References: <1467223243-9156-1-git-send-email-raltherr@google.com>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 29 Jun 2016 18:00:53 -0000

Signed-off-by: Rick Altherr <raltherr@google.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-ast2500-evb.dts | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-opp-ast2500-evb.dts

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-ast2500-evb.dts b/arch/arm/boot/dts/aspeed-bmc-opp-ast2500-evb.dts
new file mode 100644
index 0000000..76feae1
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-ast2500-evb.dts
@@ -0,0 +1,9 @@
+/dts-v1/;
+
+#include "aspeed-ast2500-evb.dtsi"
+
+&bmc_pnor {
+	flash@0 {
+#include "aspeed-bmc-opp-flash-layout.dtsi"
+	};
+};
-- 
2.8.0.rc3.226.g39d4020
