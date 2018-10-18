Return-Path: <sam@mendozajonas.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=mendozajonas.com
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=sam@mendozajonas.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=mendozajonas.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=mendozajonas.com header.i=@mendozajonas.com
 header.b="JCa2LC7B"; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="XP6d0pBV"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42bl514Bd2zF3L0
 for <openbmc@lists.ozlabs.org>; Fri, 19 Oct 2018 10:05:25 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 58B58226DF;
 Thu, 18 Oct 2018 19:05:19 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 18 Oct 2018 19:05:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 mendozajonas.com; h=message-id:subject:from:to:cc:date
 :in-reply-to:references:content-type:mime-version
 :content-transfer-encoding; s=fm1; bh=qReEp1SB7cdYYzkyrhBEtjS5cQ
 F4GJTebujWTxuRncA=; b=JCa2LC7BX3wwMhgy3ermK4atJ8UBvW00AVWfTv5Uz7
 E6FyWdsusA2/7U4QMmKh0nkCROMYCH69zkbprrc0rNFF8Ae8fnlB2Lk+WZCFU/Wc
 5uCO8cD8oUMVb0pYeZEuOqHO3ubQy4KW8DeFFbDV0kQbCXA0vQPtiA7Fkh/GRJ7X
 dADIiZoyzi3eoghzuVx9G5qLKCOuzYuX6WXYot3G+hx15zCHkiIVXfLcnGj8e9lc
 enhI8Uq87/e9XlxnLDyiNvtCxXWwE/GgVm4VcfNgiYe0meIMak+jiNE0Ufo26130
 3KtLntKVjSA0MMidMBc70IiXMxzFiEUFoab7IM4AmqdA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=qReEp1SB7cdYYzkyrhBEtjS5cQF4GJTebujWTxuRn
 cA=; b=XP6d0pBVsU4AVtBnlDeymuNjTXbykOEcgZ5Py2pGeSXMQwiovxfWB3rLg
 hn6evMyiqcCBQK+9ZviKKB0yhk78CK1u59m6DAAyLOEgIrhIO+XtCQC6nucg8ltJ
 k+NfG/nqcHY4Ez6Pby7JAQSN3p/Bz6M2nISSPpFjeFmm7M7pkqlxPOnmjAH0s9bt
 z6icUg0t0wbFYFXn1XKp2D57u+6d8oTJdVjndIymC72obyiglUZW/sNgd3aeeNJT
 9IpygvCrq7DN5iT2IR7sm0WOCVf1q/PB+iW70MvXNRm7rAO4AUembE8Lkh/zIf95
 ZWjztn4U+E2xYxBDhhTrlPiONIDEw==
X-ME-Sender: <xms:rhHJW3tJEQF5ywNKF1yrN44Ch2XeZ6LbzIWIhuaFIsTEQcGEdopIsg>
X-ME-Proxy: <xmx:rhHJW45tDjwuG0DqaCii-vJARso8RPbcDLGB__JTeqKdgaR9Z_x9IA>
 <xmx:rhHJW_At2cW7npGkHmsB6Kpk_alsbZ_oleLis-cOyHBfIu3LnbSPvw>
 <xmx:rhHJW6YG0FK4rgBpxxREr5LzRwh_y_ezTtpbQttna5YiLhqT-vRm0Q>
 <xmx:rhHJWzJB4HDJcNXQ2rEPQ1HARKq_TS_N8n8N40UZisJPV4lfM6wDgA>
 <xmx:rhHJWzD9KdxdT-q3RybEcUG5RCFMz631eW5DUyTRWYTN_O-4SWQqww>
 <xmx:rxHJWwSceZ0OlL-WImt6Jlw7NJCnX5aJh9g2StnciXjzGhN4uutY7g>
Received: from v4 (pa49-180-141-13.pa.nsw.optusnet.com.au [49.180.141.13])
 by mail.messagingengine.com (Postfix) with ESMTPA id 14EE8E462B;
 Thu, 18 Oct 2018 19:05:14 -0400 (EDT)
Message-ID: <7f3744217190fe94bb1df879fa107593e911d7b5.camel@mendozajonas.com>
Subject: Re: [PATCH net-next 0/6] net/ncsi: Allow enabling multiple packages
 & channels
From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
To: David Miller <davem@davemloft.net>
Cc: netdev@vger.kernel.org, Justin.Lee1@Dell.com,
 linux-kernel@vger.kernel.org,  openbmc@lists.ozlabs.org
Date: Fri, 19 Oct 2018 10:05:09 +1100
In-Reply-To: <20181018.155647.1045018243241594303.davem@davemloft.net>
References: <20181018035917.19413-1-sam@mendozajonas.com>
 <20181018.155647.1045018243241594303.davem@davemloft.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.1 
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
X-List-Received-Date: Thu, 18 Oct 2018 23:05:29 -0000

On Thu, 2018-10-18 at 15:56 -0700, David Miller wrote:
> From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
> Date: Thu, 18 Oct 2018 14:59:11 +1100
> 
> > This series extends the NCSI driver to configure multiple packages
> > and/or channels simultaneously. Since the RFC series this includes a few
> > extra changes to fix areas in the driver that either made this harder or
> > were roadblocks due to deviations from the NCSI specification.
> > 
> > Patches 1 & 2 fix two issues where the driver made assumptions about the
> > capabilities of the NCSI topology.
> > Patches 3 & 4 change some internal semantics slightly to make multi-mode
> > easier.
> > Patch 5 introduces a cleaner way of reconfiguring the NCSI configuration
> > and keeping track of channel states.
> > Patch 6 implements the main multi-package/multi-channel configuration,
> > configured via the Netlink interface.
> > 
> > Readers who have an interesting NCSI setup - especially multi-package
> > with HWA - please test! I think I've covered all permutations but I
> > don't have infinite hardware to test on.
> 
> This doesn't apply cleanly to net-next.  Does it depend upon changes
> applied elsewhere?  You must always make that explicit.

Ah, my mistake; I hadn't updated my net-next branch recently enough and
missed Vijay's OEM command patch. Will rebase.

> 
> Also, please explain this locking in ncsi_reset_dev():
> 
> +       NCSI_FOR_EACH_PACKAGE(ndp, np) {
> +               NCSI_FOR_EACH_CHANNEL(np, nc) {
> +                       spin_lock_irqsave(&nc->lock, flags);
> +                       enabled = nc->monitor.enabled;
> +                       state = nc->state;
> +                       spin_unlock_irqrestore(&nc->lock, flags);
> +
> +                       if (enabled)
> +                               ncsi_stop_channel_monitor(nc);
> +                       if (state == NCSI_CHANNEL_ACTIVE) {
> +                               active = nc;
> +                               break;
> +                       }
> 
> Is that really protecting anything?
> 
> Right after you drop np->lock those two values can change, the state
> of the 'nc' can change such that it isn't NCSI_CHANNEL_ACTIVE anymore
> etc.
> 
> At best this locking makes sure thatn enabled and state are consistent
> with respect to eachother, only.  It doesn't guarantee anything about
> the stability of the state of the object at all, and it can change
> right from under you.

And you've caught this correctly, I'll fix this up in the rebase to
protect actually checking the channel/monitor state.

Thanks,
Sam
