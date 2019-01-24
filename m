Return-Path: <awilliams@marvell.com>
Authentication-Results: lists.ozlabs.org;
 spf=fail (mailfrom) smtp.mailfrom=marvell.com
 (client-ip=173.8.172.90; helo=roger.doofus.org;
 envelope-from=awilliams@marvell.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=marvell.com
X-Greylist: delayed 582 seconds by postgrey-1.36 at bilbo;
 Thu, 24 Jan 2019 20:13:27 AEDT
Received: from roger.doofus.org (unknown [173.8.172.90])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43lbzq0ZzwzDqDS
 for <openbmc@lists.ozlabs.org>; Thu, 24 Jan 2019 20:13:25 +1100 (AEDT)
Received: from flash.localnet (unknown [192.168.0.16])
 by roger.doofus.org (Postfix) with ESMTPSA id A85AD846C55C
 for <openbmc@lists.ozlabs.org>; Thu, 24 Jan 2019 01:03:40 -0800 (PST)
From: Aaron Williams <awilliams@marvell.com>
To: openbmc@lists.ozlabs.org
Subject: OpenBMC Sensors
Date: Thu, 24 Jan 2019 01:03:40 -0800
Message-ID: <6065976.siBLTEBlHZ@flash>
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
X-List-Received-Date: Thu, 24 Jan 2019 09:13:27 -0000

Hi all,

I have a board with a couple of i2c sensors that I am trying to configure to 
work in OpenBMC but I have a lot of confusion. Do I need to add all the IPMI 
configuration for the sensors? I'm still fairly new to OpenBMC and IPMI and am 
not sure how to go about configuring things. I'm looking at the IBM Romulus 
board as an example.

We have two temperature sensors, a TI TMP421 which monitors the CPU core 
temperature as well as an ADT7462 which monitors several locations around the 
motherboard and controls the fans.

We want to control the speed of the CPU fan based on the temperature measured 
by the tmp421 in order to keep it within our thermal envelope, which shouldn't 
be too difficult to do whereas the chassis fans would be based on the 
motherboard temperature.

I see how to set up the hwmon portion defining the devices based on the device 
tree, but I am unsure how to go about configuring the YAML and other files for 
this.

At some point we should also be able to obtain internal per-core temperature 
information as well which we would also like to report.

Engineering has made this a rather high priority since the CPU fan sounds like 
a jet engine and rarely needs to run anywhere near 100%.

The ADT7462 can also measure the voltage and monitor the fan speeds.

-Aaron
