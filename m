Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id D5AA11A0C86
 for <openbmc@lists.ozlabs.org>; Thu, 14 Jan 2016 05:10:31 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1452708627901183.08749635085974;
 Wed, 13 Jan 2016 10:10:27 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Norman James <nkskjames@gmail.com>
Subject: [PATCH linux] Disable internal AST RTC
Date: Wed, 13 Jan 2016 12:10:26 -0600
Message-Id: <1452708627-4454-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 13 Jan 2016 18:10:32 -0000

The RTC implementation is system specific.  Some systems have external RTC circuits.  We only want one /dev/rtc for hwclock to use.   This disables the AST RTC which is not battery backed up so if an external RTC circuit is specified in system device tree, it will be assigned to /dev/rtc

Signed-off-by: Norman James <nkskjames@gmail.com>

https://github.com/openbmc/linux/pull/38

Norman James (1):
  disable internal RTC

 arch/arm/boot/dts/ast2400.dtsi | 1 +
 1 file changed, 1 insertion(+)

-- 
2.6.4
