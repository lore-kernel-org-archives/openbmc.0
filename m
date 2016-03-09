Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id E1B461A05F9
 for <openbmc@lists.ozlabs.org>; Thu, 10 Mar 2016 04:30:59 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1457544657298432.6863060764341;
 Wed, 9 Mar 2016 09:30:57 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Adi Gangidi <adi.gangidi@rackspace.com>
Subject: [PATCH skeleton] Updated SCU88 register for Correct PCIe inventory
Date: Wed,  9 Mar 2016 11:30:55 -0600
Message-Id: <1457544655-29669-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1457544655-29669-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1457544655-29669-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 09 Mar 2016 17:31:00 -0000

From: Adi Gangidi <adi.gangidi@rackspace.com>

Before This change:
a) SCU 88 was double assigned, first to 0x01C000FF in line:97 and then to 0x01C0007F in line:100.
b) Which meant (in both cases, some or all of) bits 7:0 were set to 1. That is: We were reading : PWMx or VPIGx instead of GPIONx (GPIONx gives us the PCIe inventory status, where x is bit number)

After This Change:
a) Got rid of the double assignment by commenting out the second SCU88 assignment
b) Bits (7:0) of SCU 88 are set to 0 . (According to Page 111 of data sheet these have to be set to 0 for us to to read GPION0 to GPIO N7 which indicate if PCIe device is present )

Description of pins 7:0 of SCU 88:
7 RW Enable PWM7 or VPIG7 function pin  (SCU90[5:4]=0x2 select Video pin)
6 RW Enable PWM6 or VPIG6 function pin   (SCU90[5:4]=0x2 select Video pin)
5 RW Enable PWM5 or VPIG5 function pin    (SCU90[5:4]!=0 select Video pin)
4 RW Enable PWM4 or VPIG4 function pin     (SCU90[5:4]!=0 select Video pin)
3 RW Enable PWM3 or VPIG3 function pin      (SCU90[5:4]!=0 select Video pin)
2 RW Enable PWM2 or VPIG2 function pin        (SCU90[5:4]!=0 select Video pin)
1 RW Enable PWM1 or VPIG1 function pin        (SCU90[5:4]=0x3 select Video pin)
0 RW Enable PWM0 or VPIG0 function pin         (SCU90[5:4]=0x3 select Video pin)
---
 objects/control_bmc_barreleye.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/objects/control_bmc_barreleye.c b/objects/control_bmc_barreleye.c
index ddfde88..0afc58d 100644
--- a/objects/control_bmc_barreleye.c
+++ b/objects/control_bmc_barreleye.c
@@ -94,10 +94,10 @@ void reg_init()
 	bmcreg = memmap(mem_fd,GPIO_BASE);
 	devmem(bmcreg+0x84,0x00fff0c0);  //Enable UART1
 	devmem(bmcreg+0x80,0xCB000000);
-	devmem(bmcreg+0x88,0x01C000FF);
+	devmem(bmcreg+0x88,0x01C00000);		//Changed Assigned value to SCU 88 for PCie inventory to work
 	devmem(bmcreg+0x8c,0xC1C000FF);
 	devmem(bmcreg+0x90,0x003FA009);
-	devmem(bmcreg+0x88,0x01C0007F);
+	// devmem(bmcreg+0x88,0x01C0007F);	// Commented out to prevent dual assignment of SCU88
 
 
 	bmcreg = memmap(mem_fd,COM_BASE);
-- 
2.7.1
