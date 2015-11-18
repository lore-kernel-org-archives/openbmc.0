Return-Path: <benh@kernel.crashing.org>
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 9D0E71A0736
 for <openbmc@lists.ozlabs.org>; Thu, 19 Nov 2015 07:09:47 +1100 (AEDT)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.13.8) with ESMTP id tAIK9ePg011305;
 Wed, 18 Nov 2015 14:09:41 -0600
Message-ID: <1447877380.3729.86.camel@kernel.crashing.org>
Subject: Re: Supporting new flash in pflash
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Thu, 19 Nov 2015 07:09:40 +1100
In-Reply-To: <CACPK8XcNRfAxQbNg3=J9v1frgP5UBgRuOtLHzxn=wOwO3GHS-w@mail.gmail.com>
References: <CACPK8XcNRfAxQbNg3=J9v1frgP5UBgRuOtLHzxn=wOwO3GHS-w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.18.1 (3.18.1-1.fc23) 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 20 Nov 2015 04:14:00 +1100
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
X-List-Received-Date: Wed, 18 Nov 2015 20:09:48 -0000

On Wed, 2015-11-18 at 17:23 +1030, Joel Stanley wrote:
> Hi Ben,
> 
> On the barreleye BMC we have a 32MB flash. I can pflash -i the system
> pnor, but when I attempt to look at the BMC flash, It errors out.
> 
> u-boot indicated that it's a 0x20ba19, so I added this to the
> flash_info table.
> 
> +       { 0x20ba19, 0x02000000, FL_ERASE_4K  | FL_ERASE_64K |
> FL_CAN_4B |
> +                                FL_ERASE_BULK | FL_MICRON_BUGS,
> +                                                          "Micron
> N25Q256A"    },
> 
> However this fails:
> 
> root@barreleye:~# ./pflash -i -b
> LIBFLASH: Failed to set controller 4b mode
> LIBFLASH: Flash configuration failed
> Failed to open flash chip
> 
> Do you have any ideas?

Not off the top of my mind. I think Norm is shipping us a couple of
these chips. Otherwise, catch me later today or tomorrow and I'll have
a look.

> Cheers,
> 
> Joel
