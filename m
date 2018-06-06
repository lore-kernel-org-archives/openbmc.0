Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="UshSP56b"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="cKXmI+jg"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 410t8x6GwkzF1xl
 for <openbmc@lists.ozlabs.org>; Wed,  6 Jun 2018 12:36:32 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 29B9521C53;
 Tue,  5 Jun 2018 22:36:26 -0400 (EDT)
Received: from web2 ([10.202.2.212])
 by compute4.internal (MEProxy); Tue, 05 Jun 2018 22:36:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=vXpZbvzPwuZjXgIyo0LW3lf0lLnmA
 rept6pacUabQdw=; b=UshSP56bmrKYb16qB1M8j+oaYdtCYur/6vfqbx8EAVIQX
 xoc7ZfHA3mm2+JGpXU3qvGyZZci0l9dsDUpQ2mJCVRE3RBLFYXoB8wAWnoXJZzeW
 +XNpuBczc4N1ZfssTUfPZJ4GZAqwEuh28dpa7T8/+zHaRxAhS0hq2VcAy+0PUKNl
 igBKKQ8ub5B14d6G2woOdwVCD9mr7orKmOC8GrFy0Ko1g8jVwNO44CJAW+pJedUB
 LSaZlAag0HM/8RD51/aWJWL/a2bLL3dsStRkvI0++7aWUnrwymjQPLht/muP3IKn
 PaifU1jHW0SUDTTk17ZyWu350+FoAuszQhCqb3Lyg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=vXpZbv
 zPwuZjXgIyo0LW3lf0lLnmArept6pacUabQdw=; b=cKXmI+jg2PdUIlLnFruDvD
 1JPTzZsXhvsfH15pS8DNlB7duh5ZLF7AXTe5U4lKwzU55SHBelhMF5drTAGORRLB
 2+uQs/7HK1mOerkTY9zyYeEBaR8gsuAtAAnYLOfrv9bZBJITyCW4RZAymudhWL7r
 Ro7b1vmH3Klh/pbz9EWsmnQbVg9bkOCp+GupNQYPyXTDcskeggOVafXRnTKYb+PD
 HCNBk8+roQF8Wx0TwIUCWjjT7ySOPpzYwkXjT6WPhsEmfhjBflgAPm3MITqnbJm4
 rQCJcRPlf4X+cvTbaUGOojZpHKa3W59/dbtEyw8wrjNMCzrznyIzPPT0RMbXVjxw
 ==
X-ME-Proxy: <xmx:qkgXW_SVf6qLV-SqbRd6qal4aoUBX4XgqLNDr10BFaKvkVDwmhYGZA>
X-ME-Proxy: <xmx:qkgXW9dcphtLJQ7jYe68TIrUUkD9rrEtH0B-v59-UtBGkH1MnDAqwA>
X-ME-Proxy: <xmx:qkgXW4uUYL9JY5fVfFiAqgOJ0OwH41EdT2L70SmZ2gMAca92-f5vzg>
X-ME-Proxy: <xmx:qkgXW5IUflktyDvYwe2-aNcqdTn4pV00MAoOjWn-VtXxUkxzLaNtNA>
X-ME-Proxy: <xmx:qkgXW8Y7ObtOX576SH3pv1WiZdpKqHiQc8OMklP1sSBudcVs6uJ7TA>
X-ME-Proxy: <xmx:qkgXW2KI9-nndmjisxGGdLioUS2-FggUcQPs3ei_AcsDgB-QXgZSVg>
X-ME-Sender: <xms:qkgXW7asqaxpYR8kLCHaOgulb-4UOzgCbflfcwovT91ofG7ACilg_Q>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id D9A1E621DC; Tue,  5 Jun 2018 22:36:25 -0400 (EDT)
Message-Id: <1528252585.1372887.1397896680.27123F8A@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Henbin Chang <henbinchang@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-fb4a77ea
Subject: Re: How to configure Clock Stop Control Register
References: <CAG9c7cA1Zz_z=Rz1E+i3U_HD4JNOxisQQn27gOgAV9RBs7AdiA@mail.gmail.com>
In-Reply-To: <CAG9c7cA1Zz_z=Rz1E+i3U_HD4JNOxisQQn27gOgAV9RBs7AdiA@mail.gmail.com>
Date: Wed, 06 Jun 2018 12:06:25 +0930
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
X-List-Received-Date: Wed, 06 Jun 2018 02:36:35 -0000

Hi Henbin,

On Wed, 6 Jun 2018, at 11:30, Henbin Chang wrote:
> Hi,
> 
> I found 'SCU0C[8] Stop LCLK' was set after boot into Kernel.
> 
> Could anyone share how/where I should configure the Clock Stop Control
> Register?

What kernel tree are you building/booting? Can you provide a link?

Currently we've tied the LCLK to enabling LPC2AHB bridge:

https://github.com/openbmc/linux/blob/dev-4.13/arch/arm/boot/dts/aspeed-g5.dtsi#L302

You may need to add the following to your dts if you've developed your own:

```
&lpc_ctrl {
        status = "okay";
};
```

Andrew
