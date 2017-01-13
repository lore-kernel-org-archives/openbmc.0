Return-Path: <clg@kaod.org>
X-Greylist: delayed 170557 seconds by postgrey-1.36 at bilbo;
 Sat, 14 Jan 2017 00:50:27 AEDT
Received: from 20.mo5.mail-out.ovh.net (20.mo5.mail-out.ovh.net
 [91.121.55.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v0PCR0xyRzDqKW
 for <openbmc@lists.ozlabs.org>; Sat, 14 Jan 2017 00:50:27 +1100 (AEDT)
Received: from player688.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id A77AE6C29C
 for <openbmc@lists.ozlabs.org>; Fri, 13 Jan 2017 14:44:44 +0100 (CET)
Received: from zorba.kaod.org (LFbn-1-10647-27.w90-89.abo.wanadoo.fr
 [90.89.233.27]) (Authenticated sender: postmaster@kaod.org)
 by player688.ha.ovh.net (Postfix) with ESMTPSA id 610FC2008D;
 Fri, 13 Jan 2017 14:44:41 +0100 (CET)
Subject: Re: [PATCH linux v2 0/3] ASPEED SPI driver support for dual IO mode
To: Robert Lippert <roblip@gmail.com>, openbmc@lists.ozlabs.org
References: <20170110225555.117814-1-rlippert@google.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <b3b47fb6-3d73-c7a4-064f-d5ccbbd27b1a@kaod.org>
Date: Fri, 13 Jan 2017 14:44:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <20170110225555.117814-1-rlippert@google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 15693637328078801666
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelgedrfedvgdehgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemuceonhhonhgvqeenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Jan 2017 13:50:27 -0000

Hello Robert,

On 01/10/2017 11:55 PM, Robert Lippert wrote:
> 
> Adds support for dual IO SPI mode.  This speeds up SPI accesses, dropping
> time to dump an entire 64MB Macronix chip from ~12s to ~6s using:
> 	dd if=/dev/mtdblock0 bs=64MB count=1 of=/dev/null
> 
> The dual IO bit mode should not depend on any board-specific properties
> as it uses the same IO lines as single bit mode.  Only issue could be
> if a board used a one-way level tranlator or mux on the MOSI line
> but that seems unlikely to me.
> 
> Tested on Zaius board with AST2500 chip, not tested on AST2400 but I
> expect it to work since registers are identical.
> 
> Note dropped TODO about quad mode since ASPEED SPI controller does
> not support quad mode.
> 
> Changes in v2:
> - Cleanups suggested by Cedric.

could you please give a quick try to this kernel : 

	https://github.com/legoater/linux/commits/openbmc-4.7

This is an openbmc 4.7 kernel with a backport of the mainline smc 
driver, dma support, fastread support and your dual io support.

I have tested it on a palmetto and an ast2500 evb but I don't have 
the HW you use.  

Thanks,

C.
