Return-Path: <ryanchen.aspeed@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c01::241; helo=mail-pl0-x241.google.com;
 envelope-from=ryanchen.aspeed@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="rwSq07jh"; 
 dkim-atps=neutral
Received: from mail-pl0-x241.google.com (mail-pl0-x241.google.com
 [IPv6:2607:f8b0:400e:c01::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41bcWy67TQzF0PZ
 for <openbmc@lists.ozlabs.org>; Thu, 26 Jul 2018 13:09:33 +1000 (AEST)
Received: by mail-pl0-x241.google.com with SMTP id t17-v6so131954ply.13
 for <openbmc@lists.ozlabs.org>; Wed, 25 Jul 2018 20:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=5DK6EsgMEgC8FFovp7BqzGjz9A+PfNKyDyYj8CYGCcI=;
 b=rwSq07jhdr247nv+GNs9XP8NVqhpvB/WXt+aizi5oBbDnrPcGx1biB9pSJwdSQW7JC
 SLHb/fG7Px8GaOxCDNmrnsxWpBTMrpAS/JoZq1rkPujz9ipYjmp6BgVXVqXUWuT/MGEl
 T2swRIWdyBieFJr2LJ430ZnNlc2Vjfnxr/gFx0zNQ8yOsbq0oNeAGiVelDfmbDYn5lYD
 NLcI9MjypTvxjSS/To9jwC0D0pmzHK/yRv7kEzrRpPqah8fHGxzp98iethqeBXhBFa9B
 p0mtkMYw0GlrA0H8LVg2VsLfLaY2SIXfcKLzYmORYYe+VpPrT/TjRQzHxe2cPy0AurdB
 5K/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=5DK6EsgMEgC8FFovp7BqzGjz9A+PfNKyDyYj8CYGCcI=;
 b=XF2k6JKGc/aLZ8OtVyNU3uGoLfJwIhyIQn3l2W3PRMhfkYpAlXcj+ZIzZWQMdQOFsA
 9opkE/oajK3ZjREmgIV68UPYQ7Tg/oOY0HUlobOAOcYPvUJXrbXu/wR1Tq4xVd8fntW9
 iAKxNM6z0a9Ukd5NO1ik3nqhbzUg9VJOUxd5yM5sDLqSxriXh35KsBdR+7oZZY2d5WOE
 JJbZvGDmLf6i3KwHzEwl+O5GYe2g3ootTYAEWsZmSBBaNbSCQtXxKf5Oc7uifhOm5k98
 YaJ7DdfN19kvmb9OhjwpCiLm9pVTQZr2RBPGRWf+LdABsrwJ4C7fy4o6+jcnhI5e302Q
 MOig==
X-Gm-Message-State: AOUpUlH/VAdQcyI+iJd9uTExw3VocMnDL/wkwq68qrVGPHDfNid1lFY6
 p//jOiEoqc/jh8bCS0sjVSI=
X-Google-Smtp-Source: AAOMgpekuvFw2PU/GE/gjVx2vcil9b6RaeE+9c0hdduUqWYwKG4pYOWzXoxkp3lpBMcEdgLlhdxQOA==
X-Received: by 2002:a17:902:82c7:: with SMTP id
 u7-v6mr212222plz.83.1532574571530; 
 Wed, 25 Jul 2018 20:09:31 -0700 (PDT)
Received: from ryan-ubuntu (211-20-114-70.HINET-IP.hinet.net. [211.20.114.70])
 by smtp.gmail.com with ESMTPSA id
 t69-v6sm289466pfj.7.2018.07.25.20.09.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 25 Jul 2018 20:09:30 -0700 (PDT)
Date: Thu, 26 Jul 2018 11:07:33 +0800
From: Ryan Chen <ryanchen.aspeed@gmail.com>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: openbmc@lists.ozlabs.org, joel@jms.id.au, andrew@aj.id.au,
 ryan_chen@aspeedtech.com, mine260309@gmail.com
Subject: Re: [PATCH linux dev-4.17 3/7] mmc: Aspeed: Add Aspeed sdhci core
 driver
Message-ID: <20180726030733.GA6957@ryan-ubuntu>
References: <1531812378-14316-1-git-send-email-ryanchen.aspeed@gmail.com>
 <1531812378-14316-4-git-send-email-ryanchen.aspeed@gmail.com>
 <24399f18e3ee62052398806906cebf242da2abb4.camel@kernel.crashing.org>
 <1f4f8f6e01e215046da53cbb2f7bf6a27ff0d17d.camel@kernel.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1f4f8f6e01e215046da53cbb2f7bf6a27ff0d17d.camel@kernel.crashing.org>
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
X-List-Received-Date: Thu, 26 Jul 2018 03:09:35 -0000

On Thu, Jul 26, 2018 at 11:47:40AM +1000, Benjamin Herrenschmidt wrote:
> On Thu, 2018-07-26 at 11:41 +1000, Benjamin Herrenschmidt wrote:
> > Change the "irq" prefixes on the functions.. Dont' do a chained
> > handler, that will be too much overhead for no benefit. Your SoC aren't
> > very fast and you want to avoid that overhead.
> > 
> > Just do a normal interrupt handler, and have it call each port
> > interrupts.
> > 
> > This isn't really an interrupt controller, it has no
> > enable/disable/masking ability, I would just create the ports directly
> > from the same driver and process the interrupts.
> > 
> > I don't think there's benefit in keeping the ports as separate drivers.
> 
> Look at how shdci-pci does it, sdhci-acpi as well, they have multiple
> slots. You can just register multiple slots from a single driver
> I think. You can still use device-tree sub-nodes and iterate them
> from the core driver to create the slots if you want, in case you may
> add slots in the future, but it's not even that a big deal.
> 
> Ben.
> 
>
Thanks, after look into sdhci-pci, it should only request one pci_irq, 
But, i am wondering where is the slot dispatch. could you help me point out it?
