Return-Path: <awilliams@marvell.com>
Authentication-Results: lists.ozlabs.org;
 spf=fail (mailfrom) smtp.mailfrom=marvell.com
 (client-ip=173.8.172.90; helo=roger.doofus.org;
 envelope-from=awilliams@marvell.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=marvell.com
Received: from roger.doofus.org (unknown [173.8.172.90])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43ldDW5ydBzDqJL
 for <openbmc@lists.ozlabs.org>; Thu, 24 Jan 2019 21:09:30 +1100 (AEDT)
Received: from flash.localnet (unknown [192.168.0.16])
 by roger.doofus.org (Postfix) with ESMTPSA id 27BF2846C555
 for <openbmc@lists.ozlabs.org>; Thu, 24 Jan 2019 02:09:27 -0800 (PST)
From: Aaron Williams <awilliams@marvell.com>
To: openbmc@lists.ozlabs.org
Subject: Flashing host SPI NOR
Date: Thu, 24 Jan 2019 02:09:26 -0800
Message-ID: <13232291.bT86dyEiza@flash>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
X-List-Received-Date: Thu, 24 Jan 2019 10:09:32 -0000

Hi all,

I've run into a problem when it comes to flashing our host SPI NOR. If I boot 
our host then the SPI NOR is put in a different mode and I am unable to write 
to it from OpenBMC. The only way I can update our host SPI NOR is if I first 
power down the host then reboot OpenBMC. Is there some way I can force OpenBMC 
to re-initialize the SPI NOR before writing to it? I can read from the SPI nor 
just fine from the BMC after the host has accessed it, I just can't erase or 
write to it without everything getting corrupted. The device is a Macronix 
MX25L25645GMI-08G. Note that on the host side we are using QREAD and 4PP mode 
and 4 bit mode whereas for OpenBMC we only have 1 bit mode wired up. 

Ideally I'd love to be able to make use of the GPIO arbitration we have 
between the host and the BMC. We have two GPIO pins, one where the host 
requests access to the SPI NOR and the other where the BMC grants access.

-Aaron
