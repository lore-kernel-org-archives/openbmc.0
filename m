Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="rfosRBN2"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="C/2CrTfn"; dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40L7VJ2Qd8zF24t
 for <openbmc@lists.ozlabs.org>; Tue, 10 Apr 2018 23:36:06 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 84F6920F5B;
 Tue, 10 Apr 2018 09:36:03 -0400 (EDT)
Received: from web6 ([10.202.2.216])
 by compute4.internal (MEProxy); Tue, 10 Apr 2018 09:36:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=LN9wCxKGbOKeGC3wVLZ2OR5DijShh
 v8gTac/lAGKnoQ=; b=rfosRBN2TYOHmKBephnnXSjg4wuREbKX1D4jN1y31L1dp
 ohItgd0SJsG+TR+I5cXOKx8ikjP5DmzPEaj7rao+PDy5vVAZlVhGML8bmcxETkna
 W//ZNBqKB32lnPyTrbBY/m2daFQlKUO7dwULaVVilgN6Yji+l25sjeEWE7DdONt2
 n8Adf+6/8Gbg2SixPJq1YphSk96T+xL7UfIeg28d+RJfvNr9uASKI7IrJtHTAD7h
 FXDURKmxmantYsI5yAaq6vO+q3xJYZIpCEIxPmyYKlVzscWsS/fxq2RPpuRx4RRV
 VNSHG5YBsKiScgfTncBEInFqr/ezkT+YPJtFKK6Pw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=LN9wCx
 KGbOKeGC3wVLZ2OR5DijShhv8gTac/lAGKnoQ=; b=C/2CrTfn0WQ1wh1gCz7ves
 vZc2ad/sgl1z4Pnw69VqH78GVcEdy14JW4hRwDkGozQXRQhtqlnUHp2ErLhH5c6C
 wPDldulNQpANJfhb9Yxnxpmcb+kBCO15gsR+AQYQCmPdQ3dWaLoLs+PRVYBMBBjs
 Dy+cTk7uaWIbFnchgFAY/KKNjQNp+uFwyN4K9iFBNoN9qAk7w++Kh0aeD3toII96
 K2qDUqxYdodUNJob9IU8dRCzdigyNDVk/voS1V85lvxArV/B4K14pdJkAgrJMVzp
 L+wbLFAEIxwmZ8YdiOaYHJiSNyEGx9sGy1Fza7Az8v45R+3lhOKpGVGjlkvlYl7w
 ==
X-ME-Sender: <xms:w73MWt0PA6ke6e6eOHpGAcfQBDW6gropKjpn_87d5XJUxio7DgCnbg>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 5958D4122; Tue, 10 Apr 2018 09:36:03 -0400 (EDT)
Message-Id: <1523367363.1598830.1332941912.403D2457@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Brad Chou <chou.brad@gmail.com>, openbmc@lists.ozlabs.org
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-61ab7380
Date: Tue, 10 Apr 2018 23:06:03 +0930
Subject: Re: How to power on Intel x86 based CPUs
References: <6BB03E30-7768-4455-BB7D-6B1C8AECBDE4@gmail.com>
In-Reply-To: <6BB03E30-7768-4455-BB7D-6B1C8AECBDE4@gmail.com>
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
X-List-Received-Date: Tue, 10 Apr 2018 13:36:11 -0000

Hi Brad,

On Tue, 10 Apr 2018, at 19:35, Brad Chou wrote:
> Hi,
> I am going to power on my OEM server board with two Intel x86 CPUs. The 
> BMC chip is ASPEED 2500.
> 
> By the Intel data sheets, I just need to control a power on GPIO to 
> emulate power button behavior.
> The problems are, when I send Host State Control commands as mentioned 
> in docs/host-management.md, the journal log shows a lot of systemctl 
> errors.
> 
> Looks like it is going to start the OpenPower related host control 
> services, which only applies to PowerPC system.
> I try to modify GPIO_CONFIGS appears in skeleton recipe to match my 
> board, but I still got some other errors says pflash stuffs.

It sounds like you're building an OpenPOWER-based BMC image - this is controlled by how you set the TEMPLATECONF environment variable when sourcing the `openbmc-env` file to build (at a guess I'd say you're building for Palmetto, as it's used throughout the examples in the docs repo).

We do have support for a couple of x86 machines in the tree - your best bet is probably the Quanta 71L machine maintained by Patrick Venture:

https://github.com/openbmc/openbmc/tree/master/meta-openbmc-machines/meta-x86/meta-quanta/meta-q71l

As an aside, if you're experimenting and switching between target machines, it's probably a good idea to blow away your build/conf directory to make sure things get set up correctly when you next set TEMPLATECONF and source openbmc-env.

> 
> Because there is no documents to tell me how to customize the openbmc to 
> fit on x86 CPUs, so I am not sure the GPIO_CONFIGS in skeleton is the 
> right way or not.

Yeah, there's not a wealth of documentation on bringing up a new machine. It would be great if you could document your experience once you get there :)

Hope that helps in some way,

Andrew
