Return-Path: <clg@kaod.org>
X-Greylist: delayed 4205 seconds by postgrey-1.36 at bilbo;
 Wed, 01 Feb 2017 21:34:11 AEDT
Received: from 14.mo4.mail-out.ovh.net (14.mo4.mail-out.ovh.net [46.105.40.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vCzyC2lgMzDqF3
 for <openbmc@lists.ozlabs.org>; Wed,  1 Feb 2017 21:34:10 +1100 (AEDT)
Received: from player759.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo4.mail-out.ovh.net (Postfix) with ESMTP id 5C6AA46244
 for <openbmc@lists.ozlabs.org>; Wed,  1 Feb 2017 10:15:11 +0100 (CET)
Received: from zorba.kaod.org (LFbn-1-10647-27.w90-89.abo.wanadoo.fr
 [90.89.233.27]) (Authenticated sender: postmaster@kaod.org)
 by player759.ha.ovh.net (Postfix) with ESMTPSA id 588036400AA;
 Wed,  1 Feb 2017 10:15:08 +0100 (CET)
Subject: Re: Support for Aspeed SoC in upstream U-Boot
To: Maxim Sloyko <maxims@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <CAFR_W8qLw174HCxC4kmPuxZp30nA+n1Ug6FRkk1xSsYBUxZSpg@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <e7627b17-2ac8-a954-5bd7-bcd3cd0e8ece@kaod.org>
Date: Wed, 1 Feb 2017 10:15:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <CAFR_W8qLw174HCxC4kmPuxZp30nA+n1Ug6FRkk1xSsYBUxZSpg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 12042062456871553794
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelgedrieejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
X-List-Received-Date: Wed, 01 Feb 2017 10:34:11 -0000

On 01/31/2017 01:00 AM, Maxim Sloyko wrote:
> Hi all,
> 
> I'm happy to announce that the basic support for aspeed (ast2500 eval
> board, to be specific) has been accepted into the upstream U-Boot and
> will appear in 2017.03 release.
> 
> It's a bare minimum required to boot the board into U-Boot prompt, but
> it already has WDT, Timer, Sysreset, Clock (very basic) and SDRAM MC
> drivers, all implemented in C from scratch.

Nice job. Thanks for working on this.
 
> Of these drivers, WDT, Timer and Sysreset *should* be ast2400
> compatible, but I haven't tested it,
> since I don't have the hardware. Clock driver is not ast2400
> compatible, but it should not be hard to make it such. 

indeed. a couple of dividers are different. SCU also.

> SDRAM driver is not compatible and my understanding that the controllers 
> on ast2500 and ast2400 boards are different enough to require different 
> drivers.

That is the main issue and the driver will be much more complex but
maybe we can start with some assembly.

> I plan to continue expanding this support, which basically means
> adding more drivers :)

What is on your todo list  ? Have you tried to rebase the current 
missing drivers, even in an hacky way, on top of upstream u-boot ? 


Thanks, 
  
C. 
