Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qTh9x2gq8zDq6X
 for <openbmc@lists.ozlabs.org>; Tue, 22 Mar 2016 16:30:45 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1458624642151665.9986730336273;
 Mon, 21 Mar 2016 22:30:42 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux v4 0/4] Updated SCU88 register and SCU90 init values
Date: Tue, 22 Mar 2016 00:30:32 -0500
Message-Id: <1458624636-15845-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 22 Mar 2016 05:30:46 -0000

Before This change:
a) SCU90[0]=1, function pin Incorrectly defined. It must be pull down internally.
b) For SCU88, bits 7:0 were set to 1. That is: We were reading : PWMx or VPIGx instead of GPIONx (GPIONx gives us the PCIe inventory status, where x is bit number). Because of this PCIe inventory was showing up wrong.

After This Change:
a) SCU90[0]=0 
b) Bits (7:0) of SCU 88 are set to 0 . (According to Page 111 of data sheet these have to be set to 0 for us to to read GPION0 to GPIO N7 which indicate if PCIe device is present ). 

Description of pins 0 of SCU 90:
Enable SD1 Function Pin 

Description of pins 7:0 of SCU 88:
7 RW Enable PWM7 or VPIG7 function pin  (SCU90[5:4]=0x2 select Video pin)
6 RW Enable PWM6 or VPIG6 function pin   (SCU90[5:4]=0x2 select Video pin)
5 RW Enable PWM5 or VPIG5 function pin    (SCU90[5:4]!=0 select Video pin)
4 RW Enable PWM4 or VPIG4 function pin     (SCU90[5:4]!=0 select Video pin)
3 RW Enable PWM3 or VPIG3 function pin      (SCU90[5:4]!=0 select Video pin)
2 RW Enable PWM2 or VPIG2 function pin        (SCU90[5:4]!=0 select Video pin)
1 RW Enable PWM1 or VPIG1 function pin        (SCU90[5:4]=0x3 select Video pin)
0 RW Enable PWM0 or VPIG0 function pin         (SCU90[5:4]=0x3 select Video pin)

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/linux/63)
<!-- Reviewable:end -->


https://github.com/openbmc/linux/pull/63

Adi Gangidi (4):
  Updated SCU88 register and SCU90 init values
  Barreleye SCU88 Setup to do_barreleye_setup
  Updated SCU88 register and SCU90 init values
  Updated SCU88 register and SCU90 init values

 arch/arm/mach-aspeed/aspeed.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

-- 
2.7.1
