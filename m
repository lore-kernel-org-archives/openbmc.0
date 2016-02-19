Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id C85E71A0795
 for <openbmc@lists.ozlabs.org>; Sat, 20 Feb 2016 06:11:10 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1455909067533305.4968721456944;
 Fri, 19 Feb 2016 11:11:07 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Norman James <nkskjames@gmail.com>
Subject: [PATCH u-boot] Move UART setup outside DRAM init
Date: Fri, 19 Feb 2016 13:11:05 -0600
Message-Id: <1455909066-21813-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
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
X-List-Received-Date: Fri, 19 Feb 2016 19:11:11 -0000

Signed-off-by: Norman James <nkskjames@gmail.com>

https://github.com/openbmc/u-boot/pull/2

Norman James (1):
  Move UART setup outside DRAM init

 board/aspeed/ast2400/platform.S | 81 +++++++++++++++++++++--------------------
 1 file changed, 42 insertions(+), 39 deletions(-)

-- 
2.7.1
