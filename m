Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 432mp12H6tzDqWp
 for <openbmc@lists.ozlabs.org>; Sun, 25 Nov 2018 21:42:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="bkZrHLXp"; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 432mp04mccz9ryk;
 Sun, 25 Nov 2018 21:42:16 +1100 (AEDT)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1543142536; bh=QF59+fsbHElHYrBDsPoPf8SjQy4CeMvtWr58XLxnT2g=;
 h=Subject:From:To:Cc:Date:References:In-Reply-To:From;
 b=bkZrHLXpdKx6YfGZZVVA+zd8LnCplhaCiNsmIo9Sxu5vryG4EZ8NU/CdDj3dX2NX0
 1HV9Ee43dwoAx5I38JwMiJ9TMmqxpyyjJ+unYSC4cAozhq7PTPB96oVSpKbbTMAWku
 bPQr9Ttdmiis7Cjf34jf2B90DrbC6/reUe3LzLnmzcdJQ55GQgerrEMuXuaj9UcEV/
 xBSNWYQxSoIdJCMWRvIGfQOEPz+RV0m+gTCxOGsQugdNjNALD1bt9HyZ9XPjdqTmeY
 8h2FTQujZTYk+YCsS7rrMmn07COGedH8Gy6rn8cOqkr21raPR7Yr8qjIk3/LdBlrOs
 7XSMqY8PyTcAA==
Message-ID: <5190db8cd01920ea71636c7a87813f4d9182dad3.camel@ozlabs.org>
Subject: Re: SOL,obmc-console-client can't connect to the host OS
From: Jeremy Kerr <jk@ozlabs.org>
To: xiuzhi <1450335857@qq.com>
Cc: openbmc <openbmc@lists.ozlabs.org>
Date: Sun, 25 Nov 2018 18:42:12 +0800
References: <mailman.13.1542934803.27188.openbmc@lists.ozlabs.org>
 <tencent_3E424D8E19D15B754896EDBB@qq.com>
 <54d6a0985b858c42671abf294cd64dec1970df5b.camel@ozlabs.org>
 <tencent_0E48BB6E60EFF8C048940433@qq.com>
In-Reply-To: <tencent_0E48BB6E60EFF8C048940433@qq.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.2-1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Sun, 25 Nov 2018 10:42:18 -0000

Hi Xiuzhi,

>  >What hardware platform is this?
> My platform is AMD X86 platform.

OK, so some of my assumptions about how things are hooked up may not be 
correct then. But just to check:

You mention that you're connecting to the host through a physical UART 
connection (UART4: GPIOF5-GPIOF7). Does this mean that you have a
separate SuperIO chip doing UART on the host side? (and you have *not*
connected to the AST2500's LPC bus?) 

If this is the case, you will not be using the VUART - we use that on 
our machines where the host is mastering the AST2500's LPC slave - and
so this means that the 0x3f8 port on host LPC is directly interfacing to
the AST2500's VUART, not a separate SuperIO chip with a UART.

This also means that you'll need to change the `cat /dev/ttyVUART0` 
tests to use the proper UART on the BMC side (because you're not using 
the VUART device).

I think the main issue is that you seem to be mixing up the Linux device
names (ttySx, which are zero-based in the default setup) with the
hardware device names (UARTn, which are one-based). Try referring to the
MMIO base addresses (0x1e78x000) to check that you're using the right
uart. I suspect that you want to be using ttyS3 if you're using UART4
from the datasheet.

Since you're using a physical UART too, you'll need to ensure that the
baud rates are the same on host and BMC.

Also, I would suggest not using any of the obmc-console stuff until 
you'
ve confirmed that you can transfer data just using the serial 
devices on
host and BMC directly with `cat`.

> Which serial parameter should I use in the BMC file 
> etc/obmc-console.conf, BMC uart4 port or Host uart0?

Ah, that's a different setting.

The serial device that you specify on the obmc-console-server command
line is the UART that is connected to the host. This command-line
argument is configured through obmc-console@.service.

The serial device specified in the `local-tty` setting of obmc-
console.conf is a separate device that is typically connected to a BMC-
controlled port on the rear panel of the machine. This configures obmc-
console-server to mirror the serial data (from the host) to that port.

So, I'd suggest removing the `local-tty` setting when you start using
obmc-console, to avoid confusion. You can add it back (specifying a
serial port that is connected to only the BMC) when you want to mirror
to that port.

Regards,


Jeremy
