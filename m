Return-Path: <ryanchen.aspeed@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c01::244; helo=mail-pl0-x244.google.com;
 envelope-from=ryanchen.aspeed@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="EqpcEN0y"; 
 dkim-atps=neutral
Received: from mail-pl0-x244.google.com (mail-pl0-x244.google.com
 [IPv6:2607:f8b0:400e:c01::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41bcy054K0zDqnG
 for <openbmc@lists.ozlabs.org>; Thu, 26 Jul 2018 13:28:39 +1000 (AEST)
Received: by mail-pl0-x244.google.com with SMTP id t17-v6so151513ply.13
 for <openbmc@lists.ozlabs.org>; Wed, 25 Jul 2018 20:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=f0H54w226Etm9YVdO8bHZPOz6zUwdDSFo4GHqBwLWgc=;
 b=EqpcEN0yBiqWGXHmYkcX5fao97AervHZDSowbTVIOsSKbgjPPPAR3DOqPmVK8dBOoV
 pVcO4baIgNQefMoi682C+R77OXlGdLyBVkfEwTAWd5p8r7Ru7HUswF70Q0Rjk1MgwAAG
 8aAiLAcKmSe2emyD/Ap2aCr/i/3DfJuzISK6Io0hLGll7OUv1K6nzF6y7A1G9rVPvOht
 JEcMPv8P4JkHe2EWXkLbD2FG8myGa7Iu76Eb87JyJ7UVn8Ee06sUtTQ+e6l7ug+qCD1Y
 6LIbC5YNQ9z37D4W3tXB+rvcr2gFJ2/OLF7fsjLMiWMTjmosLOx3A0/MWBqbgHDycKQb
 +zzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=f0H54w226Etm9YVdO8bHZPOz6zUwdDSFo4GHqBwLWgc=;
 b=MOFb5S3BlXTBpteA2pRK1dGjs+6Dld3rppW/cvH15qJu1cHucPW+r1dge4ezYDoEGM
 PEnIxwN+AZ2ZEYWqQvT9mHqJ1oczhpF1F7VVi+KlR1V7F9uoLL9+WPZEKDD4pDeXu9bU
 +hxRAnXWT0UNGoMBZCse10V7V2cPv4vTddmUzWntV15Sp8ZHffWmaQxYMaOE0C3slv9J
 j4d3DkjbiQRbG//clSr9SXFuWkHJMjlEmGDk2uuO6XgKv96ZmEfKQNhrCDACsKRF/57k
 b689WezNNFdYt053KeGj7w9Hrdrp1lIWvfLH2pLMlV9PeI8eMa8XsxmtPxgXQjs11MYn
 GA6g==
X-Gm-Message-State: AOUpUlF77+VAa9pVxhSfsayFbNTE2yisqaEPuTe8fTxluUJky48uHbAQ
 a48uaCtySM+5NJBd3vOrAYU=
X-Google-Smtp-Source: AAOMgpcrfKFrTZj7TiexOwdoJtuq5z+ka8YktFWxsEXZkU0/ptu9t+DZYOmEq+Z2Oo2SVoYvC8D+LQ==
X-Received: by 2002:a17:902:6e16:: with SMTP id
 u22-v6mr275769plk.13.1532575717879; 
 Wed, 25 Jul 2018 20:28:37 -0700 (PDT)
Received: from ryan-ubuntu (211-20-114-70.HINET-IP.hinet.net. [211.20.114.70])
 by smtp.gmail.com with ESMTPSA id
 n26-v6sm150645pgv.78.2018.07.25.20.28.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 25 Jul 2018 20:28:37 -0700 (PDT)
Date: Thu, 26 Jul 2018 11:26:39 +0800
From: Ryan Chen <ryanchen.aspeed@gmail.com>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: openbmc@lists.ozlabs.org, joel@jms.id.au, andrew@aj.id.au,
 ryan_chen@aspeedtech.com, mine260309@gmail.com
Subject: Re: [PATCH linux dev-4.17 3/7] mmc: Aspeed: Add Aspeed sdhci core
 driver
Message-ID: <20180726032639.GA20992@ryan-ubuntu>
References: <1531812378-14316-1-git-send-email-ryanchen.aspeed@gmail.com>
 <1531812378-14316-4-git-send-email-ryanchen.aspeed@gmail.com>
 <24399f18e3ee62052398806906cebf242da2abb4.camel@kernel.crashing.org>
 <1f4f8f6e01e215046da53cbb2f7bf6a27ff0d17d.camel@kernel.crashing.org>
 <20180726030733.GA6957@ryan-ubuntu>
 <7880c8f400a5bf343e28ddd84e4d88980601b8bf.camel@kernel.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7880c8f400a5bf343e28ddd84e4d88980601b8bf.camel@kernel.crashing.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
X-List-Received-Date: Thu, 26 Jul 2018 03:28:41 -0000

On Thu, Jul 26, 2018 at 01:14:58PM +1000, Benjamin Herrenschmidt wrote:
> On Thu, 2018-07-26 at 11:07 +0800, Ryan Chen wrote:
> > On Thu, Jul 26, 2018 at 11:47:40AM +1000, Benjamin Herrenschmidt wrote:
> > > On Thu, 2018-07-26 at 11:41 +1000, Benjamin Herrenschmidt wrote:
> > > > Change the "irq" prefixes on the functions.. Dont' do a chained
> > > > handler, that will be too much overhead for no benefit. Your SoC aren't
> > > > very fast and you want to avoid that overhead.
> > > > 
> > > > Just do a normal interrupt handler, and have it call each port
> > > > interrupts.
> > > > 
> > > > This isn't really an interrupt controller, it has no
> > > > enable/disable/masking ability, I would just create the ports directly
> > > > from the same driver and process the interrupts.
> > > > 
> > > > I don't think there's benefit in keeping the ports as separate drivers.
> > > 
> > > Look at how shdci-pci does it, sdhci-acpi as well, they have multiple
> > > slots. You can just register multiple slots from a single driver
> > > I think. You can still use device-tree sub-nodes and iterate them
> > > from the core driver to create the slots if you want, in case you may
> > > add slots in the future, but it's not even that a big deal.
> > > 
> > > Ben.
> > > 
> > > 
> > 
> > Thanks, after look into sdhci-pci, it should only request one pci_irq, 
> > But, i am wondering where is the slot dispatch. could you help me point out it?
> 
> So the PCI one just uses the same IRQ number for all the slots in
> sdhci_pci_probe_slot(), so the IRQ ends up shared.
> 
> So on every irq it will jsut check all slots.
> 
> Not sure if that's a problem. Due to how sdhci is organized, if you
> really want to make sure it only accesses the one slot, then you indeed
> do have to use a cascaded interrupt controller as you are doing, but
> I'm not sure it's really worthwhile.
> 
> Cheers,
> Ben.
> 
> 
Yes, there is two way, to handle irq.
One is use share irq, so my sdhci driver have following outcome when share 
irq, 
	cat /proc/interrupt
	----------
	34:         82      AVIC  26 Edge      mmc0, mmc1
	---------
when use cascaded interrupt. 
	.........
	292:         35  sdhci-ic   0 Edge      mmc0
	293:         42  sdhci-ic   1 Edge      mmc1
	---------
use separate slot (actually it is) interrupt, it have advantage for each slot 
debug. if use share. the debug will not easy.
