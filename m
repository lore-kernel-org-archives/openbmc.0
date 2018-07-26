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
 by lists.ozlabs.org (Postfix) with ESMTPS id 41bZjn4bjmzF0dY
 for <openbmc@lists.ozlabs.org>; Thu, 26 Jul 2018 11:47:57 +1000 (AEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id w6Q1leVl028579;
 Wed, 25 Jul 2018 20:47:41 -0500
Message-ID: <1f4f8f6e01e215046da53cbb2f7bf6a27ff0d17d.camel@kernel.crashing.org>
Subject: Re: [PATCH linux dev-4.17 3/7] mmc: Aspeed: Add Aspeed sdhci core
 driver
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Ryan Chen <ryanchen.aspeed@gmail.com>, openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, andrew@aj.id.au, ryan_chen@aspeedtech.com,
 mine260309@gmail.com
Date: Thu, 26 Jul 2018 11:47:40 +1000
In-Reply-To: <24399f18e3ee62052398806906cebf242da2abb4.camel@kernel.crashing.org>
References: <1531812378-14316-1-git-send-email-ryanchen.aspeed@gmail.com>
 <1531812378-14316-4-git-send-email-ryanchen.aspeed@gmail.com>
 <24399f18e3ee62052398806906cebf242da2abb4.camel@kernel.crashing.org>
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
X-List-Received-Date: Thu, 26 Jul 2018 01:47:58 -0000

On Thu, 2018-07-26 at 11:41 +1000, Benjamin Herrenschmidt wrote:
> Change the "irq" prefixes on the functions.. Dont' do a chained
> handler, that will be too much overhead for no benefit. Your SoC aren't
> very fast and you want to avoid that overhead.
> 
> Just do a normal interrupt handler, and have it call each port
> interrupts.
> 
> This isn't really an interrupt controller, it has no
> enable/disable/masking ability, I would just create the ports directly
> from the same driver and process the interrupts.
> 
> I don't think there's benefit in keeping the ports as separate drivers.

Look at how shdci-pci does it, sdhci-acpi as well, they have multiple
slots. You can just register multiple slots from a single driver
I think. You can still use device-tree sub-nodes and iterate them
from the core driver to create the slots if you want, in case you may
add slots in the future, but it's not even that a big deal.

Ben.
