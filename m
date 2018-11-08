Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="qzm1r+g+"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="N6F8AaOH"; dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42r4XQ4jCtzF37r
 for <openbmc@lists.ozlabs.org>; Thu,  8 Nov 2018 11:53:26 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 0CBC421D12;
 Wed,  7 Nov 2018 19:53:20 -0500 (EST)
Received: from web3 ([10.202.2.213])
 by compute4.internal (MEProxy); Wed, 07 Nov 2018 19:53:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 message-id:from:to:mime-version:content-transfer-encoding
 :content-type:subject:references:date:in-reply-to; s=fm1; bh=war
 a3kFRiTNuS9WxCA7CnMrGTVWPPU7tWymWMNbEmgs=; b=qzm1r+g+isEnbK57R+5
 jKoKUWAJPOz/xer/DFYdwswHfQfhfFMLQZuXWGMenhF4opfzLXijxFjzZL2NT8i3
 tC915A1mR3HR4qfreSP1I3szhFO7VVfYfL08W5w1o3SayUWT4A929vRtVAmHVli7
 ERK/UvQhtrWl1GWnNwWFn9OqC4Em7CFbMYC8zDKBO0nRoasgo5OLiCM/2MjOHTrR
 b+oFzRNtECSK+m0ZD+6a2Vco90WTu1HQcNOklOewMGNxBDSFd7B6BcEKTzbfS9v+
 uHKN71pU6GCHkuQlF2mO8Gn9hD88TEIhxXO5Kkq75BRZ57gAK/thuSpxAxqgICcq
 6Dg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=wara3kFRiTNuS9WxCA7CnMrGTVWPPU7tWymWMNbEm
 gs=; b=N6F8AaOHPv4DxmhzbNA/Na88E00eWOhZWl1zc9r0ghQ1O7jEcl5RX7dAb
 BR4J4UyPTHCsZ/4HiDT3qXJq7YciwimkfGHtmB0HYi7dbWohH2aKixbuS6By+87m
 WyRHpnXy0sM6w5iFgVgiXnrrxjjWqktyJ7UyxweUEz8gDDPyssLDXx/hO15Ll4mI
 xXEJBiw1WZ3bUjbrBYP2ndn1v0hwRimXpfe5kPkO2tvjmV/GPS6zB61XvTePYBYG
 nkaqImnbhdtt+gpPnXUWHgDR4evhYHRBa0QWA9AHmhFCawFWL15QBkrX9K3Qslzv
 FCI/+Lz/nQTK8tSxRYY7MjvZYiMwA==
X-ME-Sender: <xms:_4jjW_GZz13_YuAmyy-OxUG8v-_kErrF8S7anNfE-NKEL3iW9mK5zg>
X-ME-Proxy: <xmx:_4jjW5nSh8xg0LPXTr8tkBEdpTZmgsAqacGmXMuMrT4Ru7Tx_A3Irg>
 <xmx:_4jjWxuzPJmonCqcOq19lVA9qh5MrrltMJcLbREtogz1EPFNtxodBg>
 <xmx:_4jjW-atD_QbUMd2_qFr04f1G8iCfWOInMgEpVjI1xwNbGy9-5Kagw>
 <xmx:_4jjW92tJAR7OQBTd4BV4oOphQb-RUSfEJxTG_BiCeQpeOnVXsBD7w>
 <xmx:_4jjWwsdNV73O3L_UJ9AJMMWmQGgjgMqacUUwIsYydb2UpbT0DfEBQ>
 <xmx:AInjWyLtrP7GMP_j8C_tR9Cs42vW6UHEwadVJkpj11KKKesV4beWag>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 62B8C9E4F3; Wed,  7 Nov 2018 19:53:19 -0500 (EST)
Message-Id: <1541638399.1479739.1569471432.26186A93@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Tao Ren <taoren@fb.com>, openbmc@lists.ozlabs.org
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-d469da0c
Subject: Re: [PATCH v2 2/2] ARM: dts: aspeed: Add Facebook Backpack-CMM BMC
References: <20181106042842.2771782-1-taoren@fb.com>
 <1541636646.1469369.1569439336.00B37737@webmail.messagingengine.com>
 <01a78e33-79d6-28bd-9b6e-346968c32d37@fb.com>
Date: Thu, 08 Nov 2018 11:23:19 +1030
In-Reply-To: <01a78e33-79d6-28bd-9b6e-346968c32d37@fb.com>
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
X-List-Received-Date: Thu, 08 Nov 2018 00:53:27 -0000

On Thu, 8 Nov 2018, at 11:16, Tao Ren wrote:
> On 11/7/18 4:24 PM, Andrew Jeffery wrote:
> 
> >> +&uart1 {
> >> +	status = "okay";
> >> +};
> >> +
> >> +&uart3 {
> >> +	status = "okay";
> >> +};
> >> +
> >> +&uart4 {
> >> +	status = "okay";
> >> +};
> > 
> > UARTs 1-4 should be explicitly pinmuxed. It's a bit fiddly as each of the UART lines has its own mux configuration, but it at least allows some flexibility (i.e. whether you just want Rx/Tx, or something more). See e.g. the uart1 node in arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts.
> 
> Thank you for pointing it out and I will fix it.
> 
> > Speaking of pinctrl, as it's an AST2500 system you'll probably want to add the following to ensure you have full control of the pinmux configuration:
> > 
> > &pinctrl {
> > 	aspeed,external-nodes = <&gfx &lhc>;
> > };
> > 
> >> +
> >> +&uart5 {
> >> +	status = "okay";
> >> +};
> > 
> > UART5 has fixed pins, so no pinctrl necessary here.
> 
> Got it. Thank you.
> 
> 
> > You said this in the commit message:
> > 
> >> Note: I2C devices on Backpack Line Cards and Fabric Cards are not
> >> listed in the device tree file because Line/Fabric Cards may be
> >> unplugged.
> > 
> > It's not clear to me what this actually means, and I'm trying to reconcile it with enabling all of the i2c buses as I'm curious as to whether that's necessary.
> 
> Sorry for the confusion. In general, all the i2c buses are initialized 
> in device tree, but i2c leaf devices are created from user space because 
> these i2c devices may be unplugged at boot time (which causes 
> driver_probe failures).

This is what I was thinking, was just after some clarification.

> Let me refine the commit message and will send 
> out updated patch soon.

Thanks.

Andrew

> 
> Thanks,
> Tao Ren
