Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s76jq1L7MzDqS5
 for <openbmc@lists.ozlabs.org>; Mon,  8 Aug 2016 16:21:02 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 147063725791860.89863733286472;
 Sun, 7 Aug 2016 23:20:57 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux] boot/dts: Keep the LED initial state during kernel
 loading
Date: Mon,  8 Aug 2016 01:20:56 -0500
Message-Id: <20160808062057.26873-1-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
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
X-List-Received-Date: Mon, 08 Aug 2016 06:21:03 -0000

Base on the Barreleye HW spec, the beep LED shouldn't be
turned to OFF until BMC ready.

Now the LED will be turned to OFF when the kernel loading,
so enable the LED sub-node property "default-state" to keep the LED
initial state.

Signed-off-by: johnhcwang <hsienchiang@gmail.com>

https://github.com/openbmc/linux/pull/99

johnhcwang (1):
  boot/dts: Keep the LED initial state during kernel loading

 arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts | 3 +++
 1 file changed, 3 insertions(+)

-- 
2.9.0
