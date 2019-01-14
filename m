Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Krobgt0x"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="gVk52Rgf"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43dJ9J6WgSzDqK9
 for <openbmc@lists.ozlabs.org>; Mon, 14 Jan 2019 13:59:48 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 750CE28AD4;
 Sun, 13 Jan 2019 21:59:45 -0500 (EST)
Received: from web3 ([10.202.2.213])
 by compute4.internal (MEProxy); Sun, 13 Jan 2019 21:59:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 message-id:from:to:cc:mime-version:content-transfer-encoding
 :content-type:in-reply-to:date:references:subject; s=fm1; bh=N7Q
 C0nYGYz+3YIJbztxLxdBhRRVcHGAw01lybV8hvlI=; b=Krobgt0xOdfMYCUII4W
 gNgwyD8LUpnx7fS4/iXpTWECBQeLEaAQUZ928KYEcrMtCnXGvOL+iEOQjHUGRM9p
 o0bIwcOwnJ/siOiJ6SSOQMK97O8sdKyD8u4r/j4eQAGmZFRXWIXBFc0kRylFqlX8
 440/A0cY6+SUdnKTRDNthe+t73GFcociChV90/m+cOFlpk2fad8g6mghUmjoAIIw
 FieNYIHSn9bcE0RLtLMtqVl4IinhWxqsz2Vx/Gn/Rkn6Ft6LkHkCW4K52y2KhL82
 Nw4y4VHJt7pvS28sMXKBEaI3AKuq8L6NfZNRN6FbYb9N5u3GxHRnKt9wpBYNkr26
 9Xw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=N7QC0nYGYz+3YIJbztxLxdBhRRVcHGAw01lybV8hv
 lI=; b=gVk52Rgf0GgOM3sXEu4XjEqEb+KyLSe/4ugYZYsWlYH8WiqFZoe4wLOeF
 7/9ouEvhBFfiy70fW7drxplUn2ULaPP+2q+lXGvP2adjtY6PXzX8HafMRrRfd94G
 JcFejQ7l8OFENMhuiTpuXrDhG1350NwrJtvNV+GYjG2JbHM626swpj5FTxWTA37a
 mC8ZKo7IvsNKLtwGkETK8V5j4cYQXxmlz/SLBItvSQl+cjQ5/0lVXrIVtsaeDq8c
 RETnGvjY4Ki7nwv5hU7wuqTn3aBm5Y0FmDRkCcqyAPUqOLJfBQ3nXBhd0LzWdiZd
 s2GMijDGAkEQ9HoiBznRnQf7anHtg==
X-ME-Sender: <xms:IPs7XM2faaIq_knMphZxqHLQxsye3dxiOTgPVSe4fltbYDht1ezEeA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedtledrgedtgdehgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfhuthenuceurghilhhouhhtmecufedt
 tdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkffhvfgggfgtof
 gjffhfufesthejredtredtjeenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceo
 rghnughrvgifsegrjhdrihgurdgruheqnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnh
 gurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:IPs7XIbpWMHKRUA0XLwU8CH0ZIqyidp1ESTRuKpd22R4mzud-TxmMA>
 <xmx:IPs7XJjWYEsNzYQU0TBKzNRey-Mv8TgHX09hQucOLTbKdvRwuC-i0Q>
 <xmx:IPs7XIiW42fwYkwasqheNSNk1Uze5LuEdNAiVuv2tcPCUDtN0i1CMw>
 <xmx:Ifs7XKGTRxCVA3yLLNwA9wmOFOZzz6fUMOnKGywT96Q-cOMaUnFv3A>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 924EB9E564; Sun, 13 Jan 2019 21:59:44 -0500 (EST)
Message-Id: <1547434784.3014503.1633687936.2F06F402@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Linus Walleij <linus.walleij@linaro.org>, Joel Stanley <joel@jms.id.au>
Cc: kuiying.wang@intel.com,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Andrew Geissler <geissonator@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, vernon.mauery@intel.com,
 james.feist@intel.com, Jae Hyun Yoo <jae.hyun.yoo@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-36e4bfd3
In-Reply-To: <CACRpkdbz0uqyDH9BJ9T7DvvPPomjh2BY2c=Wcd4zQF-7wSP7bw@mail.gmail.com>
Date: Mon, 14 Jan 2019 13:29:44 +1030
References: <959CAFA1E282D14FB901BE9A7BF4E7724E41D8EE@shsmsx102.ccr.corp.intel.com>
 <CACPK8Xf_oEuG0=_-bRiaTAWpiw_qNEVVsW9_dtamwGcUM0JtRQ@mail.gmail.com>
 <CACRpkdbz0uqyDH9BJ9T7DvvPPomjh2BY2c=Wcd4zQF-7wSP7bw@mail.gmail.com>
Subject: Re: Enable buttons GPIO passthrough
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
X-List-Received-Date: Mon, 14 Jan 2019 02:59:53 -0000

On Fri, 11 Jan 2019, at 19:31, Linus Walleij wrote:
> On Thu, Dec 13, 2018 at 2:21 AM Joel Stanley <joel@jms.id.au> wrote:
> > On Tue, 11 Dec 2018 at 18:32, Wang, Kuiying <kuiying.wang@intel.com> wrote:
> > >
> > > Hi Joel/Andrew,
> > >
> > > I write a drive to enable GPIO passthrough for buttons (like power/reset/id button) as
> > > following attached patch.
> > >
> > > Do you think it is acceptable?
> > >
> > > Or we could do it in pinmux and extend gpio driver? Design passthrough state
> > > except in/out.
> >
> > I think that this direction would be better than a misc driver. I've
> > added Linus, the maintainer for these subsystems, and the linux-gpio
> > mailing list to cc.
> 
> I am sorry but I'm confused about this. It's a very terse explanation
> of the problem and a bunch of code.
> 
> Can you folks please define what exactly you mean with a
> "GPIO passthrough" and what you are trying to achieve with
> this on these buttons?

On the Aspeed BMC SoCs, several GPIO banks (D and E) can be
configured so the pins in the low half of a bank of 8 pins are
input, and the pins in the high half of the bank are output. The
line state of pins 0 <= i < 4 is reflected on pin i + 4. This way it
appears as though the BMC is not present in the circuit.

This is useful when the BMC may not have firmware of its own,
or if it does, if the BMC firmware is not required on the critical
path of the host's boot process. If or when the BMC firmware
boots up, it may choose to break the pass-through behaviour
in order to provide its own out-of-band management capabilities.

This can be used for things like a box's power button as
mentioned: If the BMC is not up, poke the host directly,
otherwise, poke the BMC firmware and have it poke the host.

The pass-through settings are tied to the SoC's pinmux. Intuitively
it should be integrated into the pinmux driver, but IIRC there was
some ugly coupling of the function that didn't have a neat solution
with the currently-separate GPIO and pinmux drivers.

Hope that helps.

Andrew
