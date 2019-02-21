Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="jYbI40mM"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="qAkDlQ4+"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 444dzy1VbDzDqDF
 for <openbmc@lists.ozlabs.org>; Thu, 21 Feb 2019 13:42:37 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id D6D82220C6;
 Wed, 20 Feb 2019 21:42:34 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 20 Feb 2019 21:42:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 message-id:date:from:to:subject:content-type; s=fm2; bh=0rJt1h3p
 d0YIm6TzSBZjWapggutsbDAfai7KGdwwjQ4=; b=jYbI40mMTESkVRQg+CqvqoNu
 Siuxaj3g1+VVtgja4Opr870wp0xb+Pn6RHSvqYMLnLTQVIKhvMvt2u4VgorBlq6f
 0y8cNQmN7WMCpSV6xC/zeSCZZjwlnyZ5yHGhHFHC9ocdxWiPEx2WBtwYbvi2cRtI
 6CQhAz3JA1orJBo4CjF21L5KaAPGo4Fyb8+I/GsOINZRcH55szHUcrMZcNqQ3zbs
 BY4FXePhQudEGVxKiTUl2FrzSMK6p/ooO1L+gG30ynVLcXHbshWdw0I+BxIwTz9C
 rsy/0MAqNqE7GnuBhDQRsuAgzWU+OvJ7ujOxjCz6WQDZT1x8cyrwZ5tvyTp0mw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:message-id:subject
 :to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=0rJt1h3pd0YIm6TzSBZjWapggutsbDAfai7KGdwwjQ4=; b=qAkDlQ4+
 qVIK8dhYUFXRjYPghR0yD/NIlgZVcKMK+DyRSqRlpVAVD9fzWA9cddo4thHsCP2N
 VnXUBoirfaWJt4QK5RqS/AipTmDOKt2og+ytddhGmRjGuqk6gQmCkhRA4ejh6wko
 HvUz74bHvnxh4dmgzSseu6xaF9ZAIlw8+ntsip6eCyELoXqvErgLepAGgJ0IS1Nd
 f6NAITlio8QNj7R/daFkcrXQMCmwhTlluTCSdVeGPmkBYuV2MAHHe2vWwHqPVkCv
 Hv6bWftnX1euCwqYADwtp7svoPTKK0rZRqQLzyRbhm5MDUW4TQYXHPWidfku242m
 +AM0tUJJs+oviQ==
X-ME-Sender: <xms:GhBuXG0MP65IpmPUA_cR2ZLDehXNF55UGEv_oG9WNDyBPHh29_briQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedutddrtdejgdegleculddtuddrgedtledrtddtmd
 cutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfhuthen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefofgfkfffhvffutgesthdtredtre
 ertdenucfhrhhomhepfdetnhgurhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegr
 jhdrihgurdgruheqnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrd
 hiugdrrghunecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:GhBuXE63oN808bi3va3vI1YvQ2LSSnhVH0HbqX5loYDOnHsGTEgpTg>
 <xmx:GhBuXGNO43ae6klpLlx5Rge0Rut26GPNIJoNTkw84_1rNC2T9CbpMA>
 <xmx:GhBuXLE1BPKlJb7jppUVpeX0Y126HL-k8CZevJ_koKU5cSR9aHmVew>
 <xmx:GhBuXCiMQS-7yrykKcCeNA7MIKca2-XZS7XOaXs6ekdCmp5U9Skz1A>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 4270C7C1EB; Wed, 20 Feb 2019 21:42:34 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.5-895-g0d23ba6-fmstable-20190213v1
X-Me-Personality: 52947553
Message-Id: <011d0902-7189-4562-86d3-f50e7f249e12@www.fastmail.com>
Date: Wed, 20 Feb 2019 21:42:33 -0500
From: "Andrew Jeffery" <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org, "Brad Bishop" <bradleyb@fuzziesquirrel.com>
Subject: Repository for CVE-2019-6260 test tool
Content-Type: text/plain
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
X-List-Received-Date: Thu, 21 Feb 2019 02:42:41 -0000

Hi Brad,

We're looking to publish a tool for testing the state of the bridges outlined in CVE-2019-6260. The initial release of the tool can only be run on the BMC, using /dev/mem as a backend to test the bits. Thus users will already need to authenticate as root to the BMC to inspect whether the system is vulnerable and the tool is _not_ a PoC demonstrating how to use the bridges.

Can you please create a cve-2019-6260 repository under the OpenBMC github organisation to host the tool?

Cheers,

Andrew
