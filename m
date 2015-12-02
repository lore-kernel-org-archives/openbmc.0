Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 5138A1A0286
 for <openbmc@lists.ozlabs.org>; Wed,  2 Dec 2015 19:30:56 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1449045050559730.4669116371136;
 Wed, 2 Dec 2015 00:30:50 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Ken <ken.sk.lai@mail.foxconn.com>
Subject: [PATCH skeleton v7 19/19] Add BMC_CPLD GPIO define
Date: Wed,  2 Dec 2015 03:30:33 -0500
Message-Id: <1449045033-30280-20-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1449045033-30280-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1449045033-30280-1-git-send-email-openbmc-patches@stwcx.xyz>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 02 Dec 2015 08:30:56 -0000

From: Ken <ken.sk.lai@mail.foxconn.com>

---
 bin/Barreleye.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/bin/Barreleye.py b/bin/Barreleye.py
index e255ca7..f009b48 100755
--- a/bin/Barreleye.py
+++ b/bin/Barreleye.py
@@ -494,6 +494,10 @@ GPIO_CONFIG['USB_RESET']    = { 'gpio_pin': 'B6', 'direction': 'out' }
 GPIO_CONFIG['BEEP']    	  =   { 'gpio_pin': 'N7', 'direction': 'out' }
 GPIO_CONFIG['BMC_TROTTLE']    	  =   { 'gpio_pin': 'J3', 'direction': 'out' }
 GPIO_CONFIG['BMC_HEARTBEAT']    	  =   { 'gpio_pin': 'R4', 'direction': 'out' }
+GPIO_CONFIG['CPLD_TCK']       =   { 'gpio_pin': 'P0', 'direction': 'out' }
+GPIO_CONFIG['CPLD_TDO']       =   { 'gpio_pin': 'P1', 'direction': 'out' }
+GPIO_CONFIG['CPLD_TDI']       =   { 'gpio_pin': 'P2', 'direction': 'out' }
+GPIO_CONFIG['CPLD_TMS']       =   { 'gpio_pin': 'P3', 'direction': 'out' }
 GPIO_CONFIG['SLOT0_RISER_PRESENT'] =   { 'gpio_pin': 'N0', 'direction': 'in' }
 GPIO_CONFIG['SLOT1_RISER_PRESENT'] =   { 'gpio_pin': 'N1', 'direction': 'in' }
 GPIO_CONFIG['SLOT2_RISER_PRESENT'] =   { 'gpio_pin': 'N2', 'direction': 'in' }
-- 
2.6.3
