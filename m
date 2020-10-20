Return-Path: <SRS0=Gaxx=D3=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A411C4363A
	for <openbmc@archiver.kernel.org>; Tue, 20 Oct 2020 22:12:11 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74FEA22256
	for <openbmc@archiver.kernel.org>; Tue, 20 Oct 2020 22:12:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 74FEA22256
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CG7CD1gPzzDqf2
	for <openbmc@archiver.kernel.org>; Wed, 21 Oct 2020 09:12:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=76.164.61.194; helo=kernel.crashing.org;
 envelope-from=benh@kernel.crashing.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CG79d5N1LzDqc7;
 Wed, 21 Oct 2020 09:10:45 +1100 (AEDT)
Received: from localhost (gate.crashing.org [63.228.1.57])
 (authenticated bits=0)
 by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 09KMA9S4006827
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 20 Oct 2020 17:10:14 -0500
Message-ID: <32bfb619bbb3cd6f52f9e5da205673702fed228f.camel@kernel.crashing.org>
Subject: Re: [PATCH] net: ftgmac100: Fix missing TX-poll issue
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Arnd Bergmann <arnd@arndb.de>, Dylan Hung <dylan_hung@aspeedtech.com>
Date: Wed, 21 Oct 2020 09:10:02 +1100
In-Reply-To: <CAK8P3a2pEfbLDWTppVHmGxXduOWPCwBw-8bMY9h3EbEecsVfTA@mail.gmail.com>
References: <20201019073908.32262-1-dylan_hung@aspeedtech.com>
 <CACPK8Xfn+Gn0PHCfhX-vgLTA6e2=RT+D+fnLF67_1j1iwqh7yg@mail.gmail.com>
 <20201019120040.3152ea0b@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <PS1PR0601MB1849166CBF6D1678E6E1210C9C1F0@PS1PR0601MB1849.apcprd06.prod.outlook.com>
 <CAK8P3a2pEfbLDWTppVHmGxXduOWPCwBw-8bMY9h3EbEecsVfTA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
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
Cc: BMC-SW <BMC-SW@aspeedtech.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Po-Yu Chuang <ratbert@faraday-tech.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, "David S . Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Tue, 2020-10-20 at 21:49 +0200, Arnd Bergmann wrote:
> On Tue, Oct 20, 2020 at 11:37 AM Dylan Hung <dylan_hung@aspeedtech.com> wrote:
> > > +1 @first is system memory from dma_alloc_coherent(), right?
> > > 
> > > You shouldn't have to do this. Is coherent DMA memory broken on your
> > > platform?
> > 
> > It is about the arbitration on the DRAM controller.  There are two queues in the dram controller, one is for the CPU access and the other is for the HW engines.
> > When CPU issues a store command, the dram controller just acknowledges cpu's request and pushes the request into the queue.  Then CPU triggers the HW MAC engine, the HW engine starts to fetch the DMA memory.
> > But since the cpu's request may still stay in the queue, the HW engine may fetch the wrong data.

Actually, I take back what I said earlier, the above seems to imply
this is more generic.

Dylan, please confirm, does this affect *all* DMA capable devices ? If
yes, then it's a really really bad design bug in your chips
unfortunately and the proper fix is indeed to make dma_wmb() do a dummy
read of some sort (what address though ? would any dummy non-cachable
page do ?) to force the data out as *all* drivers will potentially be
affected.

I was under the impression that it was a specific timing issue in the
vhub and ethernet parts, but if it's more generic then it needs to be
fixed globally.

> There is still something missing in the explanation: The iowrite32()
> only tells the
> device that it should check the queue, but not where the data is. I would expect
> the device to either see the correct data that was marked valid by the
> 'dma_wmb();first->txdes0 = cpu_to_le32(f_ctl_stat);' operation, or it would see
> the old f_ctl_stat value telling it that the data is not yet valid and
> not look at
> the rest of the descriptor. In the second case you would see the data
> not getting sent out until the next start_xmit(), but the device should not
> fetch wrong data.
> 
> There are two possible scenarios in which your patch would still help:
> 
> a) the dma_wmb() does not serialize the stores as seen by DMA the
>     way it is supposed to, so the device can observe the new value of txdec0
>     before it observes the correct data.
> 
> b) The txdes0 field sometimes contains stale data that marks the
>     descriptor as valid before the correct data is written. This field
>     should have been set in ftgmac100_tx_complete_packet() earlier
> 
> If either of the two is the case, then the READ_ONCE() would just
> introduce a long delay before the iowrite32() that makes it more likely
> that the data is there, but the inconsistent state would still be observable
> by the device if it is still working on previous frames.

I think it just get stuck until we try another packet, ie, it doesn't
see the new descriptor valid bit. But Dylan can elaborate.

Cheers,
Ben.


