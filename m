Return-Path: <wangzqbj@inspur.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=inspur.com
 (client-ip=210.51.61.248; helo=ssh248.corpemail.net;
 envelope-from=wangzqbj@inspur.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=inspur.com
Received: from ssh248.corpemail.net (ssh248.corpemail.net [210.51.61.248])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46BpD82kwKzDqjk
 for <openbmc@lists.ozlabs.org>; Mon, 19 Aug 2019 19:14:52 +1000 (AEST)
Received: from ([60.208.111.195])
 by ssh248.corpemail.net (Antispam) with ASMTP (SSL) id KRH58026;
 Mon, 19 Aug 2019 17:14:26 +0800
Received: from localhost (10.100.1.52) by Jtjnmail201617.home.langchao.com
 (10.100.2.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 19 Aug
 2019 17:14:26 +0800
From: John Wang <wangzqbj@inspur.com>
To: <robh+dt@kernel.org>, <mark.rutland@arm.com>, <trivial@kernel.org>,
 <linux@roeck-us.net>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <openbmc@lists.ozlabs.org>,
 <duanzhijia01@inspur.com>, <mine260309@gmail.com>, <joel@jms.id.au>
Subject: [PATCH v6 1/2] dt-bindings: Add ipsps1 as a trivial device
Date: Mon, 19 Aug 2019 17:14:25 +0800
Message-ID: <20190819091425.29094-1-wangzqbj@inspur.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.100.1.52]
X-ClientProxiedBy: jtjnmail201605.home.langchao.com (10.100.2.5) To
 Jtjnmail201617.home.langchao.com (10.100.2.17)
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
X-List-Received-Date: Mon, 19 Aug 2019 09:15:05 -0000

The ipsps1 is an Inspur Power System power supply unit

Signed-off-by: John Wang <wangzqbj@inspur.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
v6:
    - No changes
v5:
    - No changes
v4:
    - Rebased on 5.3-rc4 instead of 5.2, No changes
v3:
    - Fix adding entry to the inappropriate line
v2:
    - No changes.
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 2e742d399e87..870ac52d2225 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -104,6 +104,8 @@ properties:
           - infineon,slb9645tt
             # Infineon TLV493D-A1B6 I2C 3D Magnetic Sensor
           - infineon,tlv493d-a1b6
+            # Inspur Power System power supply unit version 1
+          - inspur,ipsps1
             # Intersil ISL29028 Ambient Light and Proximity Sensor
           - isil,isl29028
             # Intersil ISL29030 Ambient Light and Proximity Sensor
-- 
2.17.1
