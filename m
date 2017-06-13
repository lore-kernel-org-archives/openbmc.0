Return-Path: <venture@google.com>
Received: from mail-io0-x233.google.com (mail-io0-x233.google.com
 [IPv6:2607:f8b0:4001:c06::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wnNj151FyzDqL5
 for <openbmc@lists.ozlabs.org>; Wed, 14 Jun 2017 07:49:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="iDw26akB"; 
 dkim-atps=neutral
Received: by mail-io0-x233.google.com with SMTP id t87so62325487ioe.0
 for <openbmc@lists.ozlabs.org>; Tue, 13 Jun 2017 14:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=oj4oV5+lTIEgrxV4EC4WnaPzFvetRcDkVthMgii2Buo=;
 b=iDw26akBX6FwTTnkOVaqWDr1DnF6O5+rQLWBN7fMRpVjb6/rGYPCu6NftaasraF2MK
 pFneIJnNTVjLlBAy5MJ5VEFucE+5rImZ8Uy7hXAzqaFOGM/8znWtrzXfm7aTb5hlEauE
 AsDrd6jpfPYqnNu7fEFgkpm0qUABZS04zx4rLoCIDRGrzpqYmKIshbmCX1sAam8VNFCy
 q9Etq8ElskUxBmQKuPKb0orjGyOUKv/Y1FHXCQz2xlQ3fz2O3YZOoy9LHHg9lZQ2KN9L
 O/SxK+DiTLSVnDMZmPpuHHc9EF8w9gJ2VzAuoEPjT9/nqZXQn/ekLFljE5iNgOU5eUvW
 GtVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=oj4oV5+lTIEgrxV4EC4WnaPzFvetRcDkVthMgii2Buo=;
 b=KHot1WuExfbrlkpYQVWR4Ib/bWUY8q2a+jE8rouCep/p1EWefuT0CQtoMBymrEGpm2
 E8diWKw0bA0jhoj+jLmAlgM9WyudaDGPns2j6Sp0YQp8q+4nsq5wPDE6F8ZG0X5PJtIe
 2uhqk9bIR6tHEr6NyJXUqrtE7fwvhzxpKhrvjUjMRKM68s8Twu1V37//x8rOQWlvJB3w
 M5OXCaAr8VD0k5acd5ejIhup9//dRqTUddos555czmUyCXGEMnHXyqE8/Ulkek9nHluD
 lgKQ3sX4e2NtWdmWuQ3NCbuqubHS6nrLHsB6S7IGHO+OiZLKUTiBc9k1Eaq26Keydhjr
 rqMA==
X-Gm-Message-State: AKS2vOy90G+oNI6wQdlhaqsE7uKHvaIa/wPzXDZK20uAArGYWDStW5Nx
 CijQBL6MH6i/bIuR
X-Received: by 10.107.37.82 with SMTP id l79mr2579419iol.209.1497390594921;
 Tue, 13 Jun 2017 14:49:54 -0700 (PDT)
Received: from venture.svl.corp.google.com ([100.123.242.104])
 by smtp.gmail.com with ESMTPSA id k136sm6988269iok.50.2017.06.13.14.49.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 13 Jun 2017 14:49:54 -0700 (PDT)
From: Patrick Venture <venture@google.com>
To: venture@google.com,
	joel@jms.id.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH] ARM: dts: aspeed: quanta-q71l Added the 3 temp sensors
Date: Tue, 13 Jun 2017 14:49:51 -0700
Message-Id: <20170613214951.97062-1-venture@google.com>
X-Mailer: git-send-email 2.13.1.518.g3df882009-goog
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
X-List-Received-Date: Tue, 13 Jun 2017 21:49:58 -0000

Devices labeled based on schematics.

Signed-off-by: Patrick Venture <venture@google.com>
---
 arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
index 50be8dd921cf..3eba3d08595c 100644
--- a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
@@ -83,6 +83,24 @@
 
 &i2c1 {
 	status = "okay";
+
+	/* temp2 inlet */
+	tmp75@4c {
+		compatible = "ti,tmp75";
+		reg = <0x4c>;
+	};
+
+	/* temp3 */
+	tmp75@4e {
+		compatible = "ti,tmp75";
+		reg = <0x4e>;
+	};
+
+	/* temp1 */
+	tmp75@4f {
+		compatible = "ti,tmp75";
+		reg = <0x4f>;
+	};
 };
 
 &i2c2 {
-- 
2.13.1.518.g3df882009-goog
