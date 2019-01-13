Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="hC5iAqM0"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="UH7DNfZI"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43d9my5SlJzDqDl;
 Mon, 14 Jan 2019 09:11:45 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 296A5288CE;
 Sun, 13 Jan 2019 17:11:41 -0500 (EST)
Received: from web3 ([10.202.2.213])
 by compute4.internal (MEProxy); Sun, 13 Jan 2019 17:11:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 message-id:from:to:mime-version:content-transfer-encoding
 :content-type:date:in-reply-to:references:subject; s=fm1; bh=270
 16duVphlpoGWemGJ+BJBeVGTARow1OdgvCeczXFc=; b=hC5iAqM0t3woIXzdvHe
 fVsEeopiHLcmFjtvb9zO02KCRDdy6c3Tp48J/B910tQs/jTfZ+bmSxVvJnAOFZBB
 7cIBSDZy1xu5936T2rTG7zyvIKL0691jO106VyQxbzpTWGHC7SIeHZTlIxvX3oQq
 iAtZOybTxGhNEqqHbpve/FfYVpSFQ1TDWtJ13yJ8r9pnY7q0opR/Sxr6PnUVIBz1
 9g2kNG1UVJ+PJwdEPjRw8umZhF9nL+zbYw3ZkkYKtj2yqBy/MiU88AY9KUJDnzjo
 ud2tFZVEVJ0g2HYbjDmoAzt5nSCalHjh5rcH7F0Ay68iLfBrJjjBNgDeqmyXCqWP
 ycA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=27016duVphlpoGWemGJ+BJBeVGTARow1OdgvCeczX
 Fc=; b=UH7DNfZIU/6sX1bHvybQTopQxUhN5POVAAoVx8zbO2dQj1slxCO4ghc+m
 xvj0CwBPxrerimsUXnKosPH/nEafhKI5AudvUyFwi8LaQJB/PEyi0IqE1IQaHIIE
 4xvR6gx/meR6tnmCK71YEGrgxe/A7mf9z4xUVjjqy9+eBGL8m7rJPNNwoNpHRGeI
 B6Ks3YTxR7L/gb6MD6XKcCRMjVzK438pX6lwia1yTDUfNP0RbowFMUcH9yffTRus
 TOB/MTP+PQZJUK8nPP41ufTgyjVQwcSXNtyt/qliQzvatNuAaqtBxsDQ9AmcepOt
 v2NixM4/bMumvDI3t7Ckb+iwC0yNQ==
X-ME-Sender: <xms:nLc7XE5BlILSTGubP0aPqth1Y1MH79N9q1SgpN5CofC4hLnZD6i8TA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedtledrfeelgdduiedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfquhhtnecuuegrihhlohhuthemucef
 tddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfghrlhcuvffnffculddvfe
 dmnecujfgurhepkffhvfgggfgtofffjghfufesthejredtredtjeenucfhrhhomheptehn
 ughrvgifucflvghffhgvrhihuceorghnughrvgifsegrjhdrihgurdgruheqnecuffhomh
 grihhnpehophgvnhgsmhgtqdhprhhojhgvtghtrdighiiinecurfgrrhgrmhepmhgrihhl
 fhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:nLc7XKLX2EQgcvsOlWxzmAhDb86L-VUdxX2oiAScyZhZYzX3gj6fpg>
 <xmx:nLc7XOdIEileCdYMBLHGsrkeVMKEWi7KjYqgx8isGKX-seKWzSts1g>
 <xmx:nLc7XNedO4C6qyQaERzqmuV3dmc-GS1kMDlvRcF3rnD8XbqYv5TaZw>
 <xmx:nbc7XI-qr8_1DltZx68eYFAqFI1q-Cdv_4RimzdyGqdrPLgdktAWiw>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 291939E57C; Sun, 13 Jan 2019 17:11:40 -0500 (EST)
Message-Id: <1547417500.2307798.1633547288.3FA0702E@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Vijay Khemka <vijaykhemka@fb.com>, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-36e4bfd3
Date: Mon, 14 Jan 2019 08:41:40 +1030
In-Reply-To: <F7A6D855-479B-48FD-98C0-FEAAB372B52A@fb.com>
References: <F7A6D855-479B-48FD-98C0-FEAAB372B52A@fb.com>
Subject: Re: phosphor-ipmi-host.service broken
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
X-List-Received-Date: Sun, 13 Jan 2019 22:11:50 -0000

Hi Vijay,

The linux-aspeed@lists.ozlabs.org list is for kernel patches going upstream - Joel uses it as a way to track relevant patches in patchwork. For openbmc discussions (i.e. userspace questions like this) please use openbmc@lists.ozlabs.org


On Thu, 10 Jan 2019, at 05:12, Vijay Khemka wrote:
> I see new changes in this phosphor-ipmi-host.service file where it needs 
> org.openbmc.HostIpmi.service service to be running and this 
> org.openbmc.HostIpmi.service service depends on phosphor-ipmi-
> host.service file. So it is cyclic dependency which in turn not letting 
> run any of these service.

We've fixed this: https://gerrit.openbmc-project.xyz/#/c/openbmc/meta-phosphor/+/16856/

Sorry for breaking things - I had forgotten about the KCS backend.

Andrew
