Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xM1m05vL0zDsPN
 for <openbmc@lists.ozlabs.org>; Tue,  1 Aug 2017 13:20:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="CqT3FFYB"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Bop6tmHx"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id D0C9A2084E;
 Mon, 31 Jul 2017 23:20:13 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Mon, 31 Jul 2017 23:20:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=Jk1Xvo
 D6Af4GB94XZEY7BF9sewQDBWlrLlw343RJg0c=; b=CqT3FFYB0GPU4AGSNE37tj
 OMzcBHYQ2s3ImBV/HPg5/8FVRQafsbPouT/4hKhYU2pU3gAwgxF+D2Q4JA9EKt7Y
 XX70+WFAcpwlQw72knN/HbOiOlbABoxFPGEBkYDCAxnFpGNac+NVWwrtBOguP4FT
 Z8J8ph6VPgmjjuh1sw7l+Y2+KXQeOF/Ql5qb0qMnHYFkEwFAn142XtlNdzq0Os/g
 z4FrkrspTgiDJ5vj9qWJaQNgTezD0LWP97MSX9H1ln7hQRtaoM1FUnYRPGVIyyOb
 Ei2o+uX/FzNZHnZ1tHFt5uZDGDXjAdEGIut91o76AyaC2e0CiuHh6mb085P+Fqmg
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=Jk1XvoD6Af4GB94XZEY7BF9sewQDBWlrLlw343RJg
 0c=; b=Bop6tmHxv7OAsPQ0HXpnNsNczFNQTyDaLmZ14uLpeIccqLqCoVuTNctg8
 VJ90zJ8dI5zmSL9umKibFN0rTCnPOkDr6SXHN+20oH4G37up2X/+RfZ7jnpCSZns
 Btelx8eq07jq6S4cMRzgGzPMggZl8l+XeP2Le5oypjTUzZI/PXF6hsTfjf/a3nj1
 hETMJpCKDOfTRaYoAuS6I2Y0PFeo1enpv9jkxcbrBK/k0/0fUv22kPoLvJE1wL8B
 QYgMMAywjfbAgIIx4196yBdiray9k2hKTBEYcTXFySy4/BGVEaL0HchGUmEF/uZG
 UuLO085Aqef5ceKkGv4fwIxWbDxzQ==
X-ME-Sender: <xms:bfN_WeCwwHKexoB4P6-80YeR-8l_UKhcN6sJ8dCCl3GZGZhI0wy05A>
X-Sasl-enc: YQtKhLwUo/Jydm5KrsaVDEV+NIiWL66ybj0X8bJpHTMr 1501557613
Received: from keelia.au.ibm.com
 (ppp118-210-176-216.bras2.adl6.internode.on.net [118.210.176.216])
 by mail.messagingengine.com (Postfix) with ESMTPA id 960547E1D9;
 Mon, 31 Jul 2017 23:20:11 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: Andrew Jeffery <andrew@aj.id.au>, mspinler@linux.vnet.ibm.com,
 msbarth@linux.vnet.ibm.com, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 v2 1/3] dt-bindings: max31785: Add
 use-stored-presence property
Date: Tue,  1 Aug 2017 12:49:30 +0930
Message-Id: <20170801031932.4328-2-andrew@aj.id.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170801031932.4328-1-andrew@aj.id.au>
References: <20170801031932.4328-1-andrew@aj.id.au>
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
X-List-Received-Date: Tue, 01 Aug 2017 03:20:17 -0000

It's a system design decision with regards to managing the default
values of registers such as FAN_CONFIG_1_2. Do not assume the hardware
is configured such as the fans are marked as installed, rather expose a
devicetree property to inform the driver of whether it should treat the
devicetree or the device state as canonical.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 Documentation/devicetree/bindings/hwmon/pmbus/max31785.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/max31785.txt b/Documentation/devicetree/bindings/hwmon/pmbus/max31785.txt
index 96e705434a59..7d9fc31a829d 100644
--- a/Documentation/devicetree/bindings/hwmon/pmbus/max31785.txt
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/max31785.txt
@@ -10,6 +10,12 @@ Required properties:
 - #address-cells : Must be 1
 - #size-cells    : Must be 0
 
+Optional properties:
+- use-stored-presence    : Do not treat the devicetree description as canon for
+                           fan presence (the 'installed' bit of FAN_CONFIG_*).
+                           Instead, rely on the on the default value store of
+                           the device to populate it.
+
 Capabilities are configured through subnodes of the controller's node.
 
 Fans
-- 
2.11.0
