Return-Path: <benh@kernel.crashing.org>
Authentication-Results: lists.ozlabs.org; spf=permerror (mailfrom)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=benh@kernel.crashing.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41bdYB3LNpzDqnG
 for <openbmc@lists.ozlabs.org>; Thu, 26 Jul 2018 13:55:42 +1000 (AEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id w6Q3tNWk000485;
 Wed, 25 Jul 2018 22:55:24 -0500
Message-ID: <3b06669e59ba53630129f9033b0d538490ef810f.camel@kernel.crashing.org>
Subject: Re: [PATCH linux dev-4.17 3/7] mmc: Aspeed: Add Aspeed sdhci core
 driver
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Ryan Chen <ryanchen.aspeed@gmail.com>
Cc: openbmc@lists.ozlabs.org, joel@jms.id.au, andrew@aj.id.au,
 ryan_chen@aspeedtech.com, mine260309@gmail.com
Date: Thu, 26 Jul 2018 13:55:23 +1000
In-Reply-To: <20180726032639.GA20992@ryan-ubuntu>
References: <1531812378-14316-1-git-send-email-ryanchen.aspeed@gmail.com>
 <1531812378-14316-4-git-send-email-ryanchen.aspeed@gmail.com>
 <24399f18e3ee62052398806906cebf242da2abb4.camel@kernel.crashing.org>
 <1f4f8f6e01e215046da53cbb2f7bf6a27ff0d17d.camel@kernel.crashing.org>
 <20180726030733.GA6957@ryan-ubuntu>
 <7880c8f400a5bf343e28ddd84e4d88980601b8bf.camel@kernel.crashing.org>
 <20180726032639.GA20992@ryan-ubuntu>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.4 (3.28.4-1.fc28) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Jul 2018 03:55:43 -0000

On Thu, 2018-07-26 at 11:26 +0800, Ryan Chen wrote:
> > 
> > 
> 
> Yes, there is two way, to handle irq.
> One is use share irq, so my sdhci driver have following outcome when share 
> irq, 
>         cat /proc/interrupt
>         ----------
>         34:         82      AVIC  26 Edge      mmc0, mmc1
>         ---------
> when use cascaded interrupt. 
>         .........
>         292:         35  sdhci-ic   0 Edge      mmc0
>         293:         42  sdhci-ic   1 Edge      mmc1
>         ---------
> use separate slot (actually it is) interrupt, it have advantage for each slot 
> debug. if use share. the debug will not easy.

I see ... well, you can then continue doing a cascaded controller if
you wish then. I sitll don't think you need to have separate drivers
however, but that's up to you.

You definitely don't want to use core initcalls. Also having a single
driver might make it easier to implement the card detect stuff which is
done by the "common" part, isn't it ?

Cheers,
Ben.
