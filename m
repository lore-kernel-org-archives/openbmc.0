Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="jyf6odCj"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="mKnZ1cqC"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ySqNd1ks7zDqvT
 for <openbmc@lists.ozlabs.org>; Fri,  3 Nov 2017 15:53:53 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 1CF1C20D47;
 Fri,  3 Nov 2017 00:53:51 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Fri, 03 Nov 2017 00:53:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=Rn+0XhvgwsBLBUoLK
 EVEZSuvzMssQF1OjYceQBMyT54=; b=jyf6odCj/8U80KFVZFt/RCvwJYiUvL8Iw
 JYpLsGUYepEqSB7B2gxmZvMBqkUhA9+nSOVBqVzw3ewhcjvmkjJWAb0VZ28UPLnD
 PL8fGhM2VLop++KWihh/dnZqe2JtG+N6z31rCDTd0IsTtXl9ScDxcbnkEMWDnu+t
 La3Zqfed58m8KS//XVc4HCt6M4yXzYZY4GYOTbvHRN4rrJU3UE0p76RlIbDg11XY
 XGo4Vd5Nf3KN2O2/R1brCHwacGedyA7cS1uzghEafV5GnF++KlZgmw1gFHKSwgMW
 65j80szhsOpkkuOBh8KrOZf//wmtIQCqRbCmRZJqekDKK9vPWUVBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=Rn+0XhvgwsBLBUoLKEVEZSuvzMssQF1OjYceQBMyT54=; b=mKnZ1cqC
 mhGx/WEz60hUECKoJVSuNPsaN8+cpTCb7QX6F9e60TrlT1Fouoik+CjOm1NIBVcY
 wGYTJrN4VYfsIb9ETkak5oWmoDVkK+rX1S6vmBDCCZePSu7dwHIdNEM++KOlVtI9
 Ekg7IYh8/m3ggOqCq/eI1sW3Rp3sH92ogc4E2r27WGyaBssZIGqf4b2cpbcAvRKf
 5jryR6wDMquGea/yEev+As9e2NgAKd+lXG3zlkDozZjD/o/SPQb31g9sINoo+8qR
 w036iQ/qzKSHZ3f+QkYmjk6YhgF82hQ7i+IrJOieHCQiC+euzyr93PqpGZFSMpHF
 TwHb3f+0Zd094g==
X-ME-Sender: <xms:X_b7WZUYlyuNMsXng7avJDZG3E_fNV6yI0BSN7OAg6dTqhWzH8HOxA>
Received: from keelia.au.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
 by mail.messagingengine.com (Postfix) with ESMTPA id A362124009;
 Fri,  3 Nov 2017 00:53:46 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-hwmon@vger.kernel.org
Cc: Andrew Jeffery <andrew@aj.id.au>, linux@roeck-us.net, robh+dt@kernel.org,
 mark.rutland@arm.com, jdelvare@suse.com, corbet@lwn.net,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, joel@jms.id.au, openbmc@lists.ozlabs.org
Subject: [PATCH v4 1/6] dt-bindings: pmbus: Add Maxim MAX31785 documentation
Date: Fri,  3 Nov 2017 15:53:01 +1100
Message-Id: <20171103045306.26448-2-andrew@aj.id.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20171103045306.26448-1-andrew@aj.id.au>
References: <20171103045306.26448-1-andrew@aj.id.au>
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
X-List-Received-Date: Fri, 03 Nov 2017 04:53:53 -0000
X-List-Received-Date: Fri, 03 Nov 2017 04:53:53 -0000

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 .../devicetree/bindings/hwmon/max31785.txt         | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/max31785.txt

diff --git a/Documentation/devicetree/bindings/hwmon/max31785.txt b/Documentation/devicetree/bindings/hwmon/max31785.txt
new file mode 100644
index 000000000000..106e08c56aaa
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/max31785.txt
@@ -0,0 +1,22 @@
+Bindings for the Maxim MAX31785 Intelligent Fan Controller
+==========================================================
+
+Reference:
+
+https://datasheets.maximintegrated.com/en/ds/MAX31785.pdf
+
+The Maxim MAX31785 is a PMBus device providing closed-loop, multi-channel fan
+management with temperature and remote voltage sensing. Various fan control
+features are provided, including PWM frequency control, temperature hysteresis,
+dual tachometer measurements, and fan health monitoring.
+
+Required properties:
+- compatible     : One of "maxim,max31785" or "maxim,max31785a"
+- reg            : I2C address, one of 0x52, 0x53, 0x54, 0x55.
+
+Example:
+
+        fans@52 {
+                compatible = "maxim,max31785";
+                reg = <0x52>;
+        };
-- 
2.11.0
