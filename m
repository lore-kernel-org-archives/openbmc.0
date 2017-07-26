Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xHg5g0DTLzDqpR
 for <openbmc@lists.ozlabs.org>; Thu, 27 Jul 2017 02:08:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="pAiGeZ2Y"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="IYCqv+OM"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 7F62B20963;
 Wed, 26 Jul 2017 12:08:52 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Wed, 26 Jul 2017 12:08:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=m7L/RS
 FhL+NFLottki82G/2cjcZC7vNXPJlOHqrTHaM=; b=pAiGeZ2YAuS4J7+0cGIw7E
 R36y5KxaootdmfIubV+W0ZTpMJQcdw/5W3i9VmvZWdIloO+FpPjOq4KbIaaq2oiI
 S0Wlqm/GlGOBb71tfL5S1CfRxaC1MD/0MsMoUHE5583x6geCXdVOWSj1ZoQHDn8C
 95gBkAL2a40Nu6OSV4vyv3kM56MZo8ieqiyKufctuqk/y15FqPVQs6SAYAvGdekE
 IaUfj3c5UgSQnS1xjIZwztT0/6wGlPc6WRvfo5vGsJB90AcVoKI0iTUcaSEsteFf
 5ctpiJrwmvay9sPAC0kdJPg2qhu0EJ+hOuP37yDEONqu2Ov3AejgGXVqboTE4G7Q
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=m7L/RSFhL+NFLottki82G/2cjcZC7vNXPJlOHqrTH
 aM=; b=IYCqv+OM45KX4UAH0my2myPfMixklaSkJDRibiWgCOPMqvehiXzzuz/Ui
 QeSQbqOTmDU8FTVNsRAmIrs9BeV658awiRRbnKVOkJ3PH4XpfBd95ElVRiNxGimA
 GntTjnbN7Wx3PoqsLO4osQF/m6O7TXCCjWM7Qjz4Q6lggXiEzbTNRXkCozz1XncH
 wSF5dGsLU4561FE7CO1M0USI7Cbvqn+9mM9yerHkeQoElSat0YuRV6NkTONlsCJE
 KYfIa42aCKdYw6YU7E8JiT2QMBpwBOjoroorfuwmSRD9dsfCFOULSLufoXwLZaT7
 jv9/9KgI1SfS2yKHDOPShm72Bu1gw==
X-ME-Sender: <xms:lL54WU7hQfCZl6qs08Bq2JY4lKQWPfHvfCTAxcDyIAQG3AqIgFnxAg>
X-Sasl-enc: 9NC1yA7W3t5uDtXSEL82/44CzOTSFjpuNn3qVRpM9+PX 1501085331
Received: from keelia.aj.id.au (ppp118-210-176-216.bras2.adl6.internode.on.net
 [118.210.176.216])
 by mail.messagingengine.com (Postfix) with ESMTPA id 284A82414B;
 Wed, 26 Jul 2017 12:08:49 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: Andrew Jeffery <andrew@aj.id.au>, mspinler@linux.vnet.ibm.com,
 msbarth@linux.vnet.ibm.com, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 v2 4/4] ARM: dts: aspeed: Witherspoon WDT1
 external signal is push-pull
Date: Thu, 27 Jul 2017 01:38:31 +0930
Message-Id: <20170726160831.17867-5-andrew@aj.id.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170726160831.17867-1-andrew@aj.id.au>
References: <20170726160831.17867-1-andrew@aj.id.au>
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
X-List-Received-Date: Wed, 26 Jul 2017 16:08:55 -0000

Correctly drive the latch asserting the FAULT pin on the MAX31785 when
the watchdog bites. This ensures the fan outputs are ramped to 100% PWM
duty.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
index c28222c17d03..df36b87ba105 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
@@ -488,6 +488,7 @@
 &wdt1 {
 	aspeed,reset-type = "none";
 	aspeed,external-signal;
+	aspeed,ext-push-pull;
 
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_wdtrst1_default>;
-- 
2.11.0
