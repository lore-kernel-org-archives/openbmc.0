Return-Path: <sam@mendozajonas.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=mendozajonas.com
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=sam@mendozajonas.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=mendozajonas.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=mendozajonas.com header.i=@mendozajonas.com
 header.b="V7/QDhnY"; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="LDvYXKWE"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40xlgP12KbzF0S0
 for <openbmc@lists.ozlabs.org>; Fri,  1 Jun 2018 10:33:36 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 6D37F21C1E;
 Thu, 31 May 2018 20:33:34 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 31 May 2018 20:33:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 mendozajonas.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=dWbENW
 JwqWsBPeg95XR6n2ST8nptUnfLGGu4jg1I+BE=; b=V7/QDhnYoOVRmPILLAr5Ku
 1Zr+JUXj57RMODQ91c01HRNw72DfWcAAC844N4JgN63a/bem735hEntcbJNf8NPX
 cIGx9ZAN4RfFitzkfTAQ6jKUOT/a6v8RzW2yDM83MkF9k0Q0dR0x5hY3qHroWyiN
 5inSPDy9QDfeEzqQgpu4ucNo6Lak4R49qz6rHG8QCmGYyXBDOznMGipp11TGzYZH
 lSyUhGlJP7g8z+t9Lq6NiKCYks1Z78lvOqIaOE8SampmSsVgnyGc59nqhSzZampJ
 OdAoK8Avx4qRBDP44Pb8aAy3MJv5DxA8C9VYdUUfUD+C15QKrJg2z9OyN+q6DaGA
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=dWbENW
 JwqWsBPeg95XR6n2ST8nptUnfLGGu4jg1I+BE=; b=LDvYXKWEchwwb6BRa/MojV
 W0DlTF8x2WgmnRrq1A2YfnMxrxI+OWpYu61ETbBTmAFFjeSDG+jpqkyQNHdGHz0q
 tKVvo6Ml0Bdhwn8oix9JheiSZCWpNgVTf8/RF10ybcwjJ+4x9GQbMQVOjG7u1Mt8
 tQYtH8aaKYI8UKsWZNKRUCtBl2a5p37JEbeFM9AcYI6sGOl8SDopqXymrUsaHa/H
 V+FalTTsipo1ohBh7NDRxmPu58AWFgvr0ye373o2r98t1pkfQVS04OQELnAGHnM6
 u8G2IQiMuQPdYdnrPgDoYm6FhE9RwQEPMlZcEzUbJuzfIUQMNAgHXgX6pBF+ECYg
 ==
X-ME-Proxy: <xmx:XpQQW_GEux3gGwZmM7hjz7yVKGq77Fws39jr9GK_due0sc84EqQVeg>
X-ME-Proxy: <xmx:XpQQW4wfp-3G97IA7TbZiKgVGNyHEDG3YkjPgBhw0xY1hruw9gXcIg>
X-ME-Proxy: <xmx:XpQQW46-Noyw7RwLqi4XndTmQWKXGjNu5Kvx4zhbIFswjAuUyWM3vA>
X-ME-Proxy: <xmx:XpQQW98QsP2wyUr0LSMyj4fQ77eT7adEEIHQfPJikFl9Om-aDMUCRA>
X-ME-Proxy: <xmx:XpQQW8ofs1KtZrPKqLLzZr5wpcbCMBLF9Z0dRxPKqy_ZZpJPsfzhAg>
X-ME-Proxy: <xmx:XpQQW1mpnTpKgJNVn3kNSEGygf7YRPCOx27zeQOspf5t_mAT-4H_bg>
X-ME-Sender: <xms:XpQQWzls2OmqRBrXbtxtFRML8dcgSLJ_37SUzrFJ4Lk5Ir6pbENeUQ>
Received: from v4 (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0FCDC10262;
 Thu, 31 May 2018 20:33:31 -0400 (EDT)
Message-ID: <c8013f0894299c6aedfbcd5e35f5fa33b858d915.camel@mendozajonas.com>
Subject: Re: [PATCH net-next] net/ncsi: Avoid GFP_KERNEL in response handler
From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
To: Eric Dumazet <eric.dumazet@gmail.com>, netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org
Date: Fri, 01 Jun 2018 10:33:27 +1000
In-Reply-To: <69fcb143-00a2-2ddf-e2d4-c692b650f292@gmail.com>
References: <20180531070254.28878-1-sam@mendozajonas.com>
 <69fcb143-00a2-2ddf-e2d4-c692b650f292@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Jun 2018 00:33:38 -0000

On Thu, 2018-05-31 at 04:50 -0400, Eric Dumazet wrote:
> 
> On 05/31/2018 03:02 AM, Samuel Mendoza-Jonas wrote:
> > ncsi_rsp_handler_gc() allocates the filter arrays using GFP_KERNEL in
> > softirq context, causing the below backtrace. This allocation is only a
> > few dozen bytes during probing so allocate with GFP_ATOMIC instead.
> > 
> 
> Hi Samuel
> 
> You forgot to add
> 
> Fixes: 062b3e1b6d4f ("net/ncsi: Refactor MAC, VLAN filters")
> 
> size = (rsp->uc_cnt + rsp->mc_cnt + rsp->mixed_cnt) * ETH_ALEN;
> 
> -> seems to be able to reach more than few dozen bytes...

Hi Eric,

The NCSI spec (at least in the v1.1.0 version I'm looking at) sets the
total number of MAC address filters at 8, so we would be looking at a
maximum of 8 * ETH_ALEN = 48 bytes.
That said it shouldn't be too arduous to move the allocation to later in
the probe/configure cycle so if needed we could do that.

> 
> Also, what prevents ncsi_rsp_handler_gc() to be called multiples times ?
> 
> nc->mac_filter.addrs & nc->vlan_filter.vids would be re-allocated and memory would leak.
> 

Good point, we should put a check there just in case to see if it's
allocated. We should be safe though as ncsi_rsp_handler_gc() should only
be called via ncsi_probe_channel() which only happens through
ncsi_start_dev(), and addrs/vids is cleaned up in ncsi_remove_channel().
Rogue packets shouldn't hit the ncsi_rsp_handler_gc() handler without an
outstanding request.. but it probably is safer to check regardless.

Regards,
Sam
