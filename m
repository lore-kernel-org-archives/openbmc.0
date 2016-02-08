Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id C70DA1A0018
 for <openbmc@lists.ozlabs.org>; Tue,  9 Feb 2016 06:10:32 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1454958627883609.4930647160332;
 Mon, 8 Feb 2016 11:10:27 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Norman James <nkskjames@gmail.com>
Subject: [PATCH linux] Fix polarity and names of LEDs
Date: Mon,  8 Feb 2016 13:10:26 -0600
Message-Id: <1454958627-1783-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
X-Zoho-Virus-Status: 1
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
X-List-Received-Date: Mon, 08 Feb 2016 19:10:34 -0000

Makes names consistent with schematic and correct polarity.

Signed-off-by: Norman James <nkskjames@gmail.com>

https://github.com/openbmc/linux/pull/47

Norman James (1):
  Fix polarity and names of LEDs

 arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

-- 
2.6.4
