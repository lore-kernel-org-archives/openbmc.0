Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="D7tdpHFs"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="jaliLk/l"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40wcVd0zWKzDr3M;
 Wed, 30 May 2018 14:07:03 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id EFAF421B46;
 Wed, 30 May 2018 00:06:59 -0400 (EDT)
Received: from web4 ([10.202.2.214])
 by compute4.internal (MEProxy); Wed, 30 May 2018 00:06:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=AF4LrFbI0DDCh3iBOIRa1AqW1X1mR
 XQKQRGAeMW4LLI=; b=D7tdpHFszxhUZr0ld3JGcmZJS+XaKAIIngV1QuzBIuIrJ
 QlkfUXseJ7sOC22sOrtJsoJz0QN3JbwLWnm/QBiil7alVhVBMW2GClnLIsOZmdWD
 7W2VEtuYFTwJ4tiivByONRaKxRqHS2fu6OLV//T9XNJLcrS3T5Zz2cdFbx2vTKQH
 J3bJryxhUw9O1TD9PwF16ChM9xwyX9tIQx2KB/LMu0dqQFcY4gQrYmO3mNFrTPMj
 NnxSsbXfP4X4A+9FAzaPAHOEKAXOUgYmgaM9KlXT8JfkZCeBksLKIHjHoMg7SlvN
 3mBaOFJ057k1GZIMRYUfzXCZsEC2w7An/lOiUGOXQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=AF4LrF
 bI0DDCh3iBOIRa1AqW1X1mRXQKQRGAeMW4LLI=; b=jaliLk/l/v8w7sM3dVdG8Z
 NSedbZgnDxBpVCebB2Ln4m0IEKAqNF33AkCj6lJeFInERbLkmdV2Nn87o5gmGWTu
 3fLSxxETK5FfThYr1EG3G2y2oV+9Cma2J/Jh3OVXWR6EVApUR09G+TKY8OGfe8+g
 C1LzqYIniR2ojZgKBkxEZyVgN2s3S+hdZf4gRjDFXQP97LNRxjQ5ixjKOC6f9ao6
 q5FVDIv06GDBDQRIUoKThD39WLtArQgjatW1uE7ZgfQOJPNsgRXulKj/I2wAxlfE
 XIl/SdEL2a6xh6kmq49tlI8ad9JuTzkn9ONr+9TwSudLNh0VxD07WynKA9Phvtag
 ==
X-ME-Proxy: <xmx:YyMOW42iVh9vGYAQPARnGOP1ugo0ZkSc728Xbn_JDTxxqNlRk1YNIA>
X-ME-Proxy: <xmx:YyMOW1CSA6iDh_TxuLcUgFKtsHZXoNwQTVzK6SLfMu8DystFPhzPGw>
X-ME-Proxy: <xmx:YyMOW7QfP7DWiqP3hfaA6ldxw86VahG3he1Nor51CsWcfZYcPHG4vw>
X-ME-Proxy: <xmx:YyMOW_JdvvZPwFA0IoWkyJpIbqZzoIOhjFaaGJRFDwWZzrwHwLmIjQ>
X-ME-Proxy: <xmx:YyMOW6FtIIina-vfWXvV2SfCfZqeorFyE4NC0dMBC7mDW2pR971_QQ>
X-ME-Proxy: <xmx:YyMOW3kxsw6iFeO2z28rvVVX0OWo8nezWDGmuGND-EvRwgpESyJsmg>
X-ME-Sender: <xms:YyMOW5_sWzP4A_PppxWlZpfUeRKlk-D6jW9c9GWUTIAZ0qNcbQ2gcA>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id A7208BA77F; Wed, 30 May 2018 00:06:59 -0400 (EDT)
Message-Id: <1527653219.1600524.1389969792.6D07B793@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Paul Menzel <pmenzel@molgen.mpg.de>, Joel Stanley <joel@jms.id.au>
Cc: Gunnar Mills <gmills@us.ibm.com>, openbmc@lists.ozlabs.org,
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-397f98d6
In-Reply-To: <287c6a85-65ba-5782-e532-d17d517614f5@molgen.mpg.de>
Date: Wed, 30 May 2018 13:36:59 +0930
Subject: Re: Status of aspeed-bmc-opp-firestone (IBM S822LC)
References: <287c6a85-65ba-5782-e532-d17d517614f5@molgen.mpg.de>
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
X-List-Received-Date: Wed, 30 May 2018 04:07:07 -0000

Hi Paul,

On Wed, 30 May 2018, at 00:23, Paul Menzel wrote:
> Dear Joel, dear Linux folks,
> 
> 
> We have an IBM S822LC system (Firestone(?)). Building of OpenBMC 
> currently fails, as the not everything was ported from dev-4.10 to 
> dev-4.13 [1], and therefore a file cannot be found.
> 
> Looking at upstream Linux, there are BMCs for Power 8 systems, like 
> Palmetto, included.
> 
> ```
> $ ls arch/arm/boot/dts/aspeed-bmc-opp-*
> arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> ```
> 
> Does somebody know, why Firestone was not upstreamed? Is somebody 
> working on upstreaming it? If not, do you have scripts to port such 
> work? Manually cherry-picking stuff in this case is hard, as there are a 
> lot of conflicts.

Firestone was never really maintained. We hacked around with it for a bit, but nothing concrete really came of it. As far as I'm aware, no-one is working on upstreaming it.

Also, I don't think there were any scripts used in the process, so it's going to be some drudge work to get things running.

Sorry that I don't have a more positive answer. Maybe someone else knows better.

Cheers,

Andrew
