Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id B38351A0809
 for <openbmc@lists.ozlabs.org>; Thu, 10 Dec 2015 12:30:31 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1449711027739851.4973346607533;
 Wed, 9 Dec 2015 17:30:27 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux] aspeed: correct sram address in ast2400.dtsi
Date: Wed,  9 Dec 2015 19:30:26 -0600
Message-Id: <1449711027-9631-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
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
X-List-Received-Date: Thu, 10 Dec 2015 01:30:32 -0000

Correct address of sram in ast2400.dtsi.

https://github.com/openbmc/linux/pull/29

Milton D. Miller II (1):
  aspeed: correct sram address in ast2400.dtsi

 arch/arm/boot/dts/ast2400.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.6.3
