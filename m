Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="fGS/rllJ"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Xi0OxsRJ"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 447sPp3dKyzDqP4
 for <openbmc@lists.ozlabs.org>; Tue, 26 Feb 2019 19:27:41 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 9B1B123191
 for <openbmc@lists.ozlabs.org>; Tue, 26 Feb 2019 03:27:37 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Tue, 26 Feb 2019 03:27:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 message-id:in-reply-to:references:date:from:to:subject
 :content-type; s=fm2; bh=iCubV5A7KVF8+iumR32wMQSuuNREjn7gjwdw4B4
 v2VY=; b=fGS/rllJKXf7JwUdES195xSTAiGTG/nlRvgH/Wwkwnsgjul7CHcjaBM
 FikWjNZJY8KScD38J5UEaz+ZkcNQIMN3thHNJqtfRHHvyn3GDj88vKmoKhRhj6FW
 /8DSu+DnlfUQXTQ9X830rRhG3Q1FWXwVaNgyrOO+zrw+PRQrFO31DNRQcrpeQp5W
 n332T/sfsV1J4o5qZhoVYx45Z2ZzmYS8FFNLMzd05icmoTn3qjiV0RteViEGZadG
 watL3tgYq9Z/5PIS7UoTMeSlnbcHldGUUcRK7NZhoqh3Dnl4HKCB4PUkXDUrignT
 IlIItuNdl+EY3polpZ3QTxgSr5qWVKg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:references:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=iCubV5A7KVF8+iumR
 32wMQSuuNREjn7gjwdw4B4v2VY=; b=Xi0OxsRJ52o8gIUPVh+YYOmStVEjZlcCJ
 UXSMAZ5BOk3yByUyQGaqtTg7o/P8rzh1VBx4a7mQPqs9C9wwKPdy0py+fZ4o9BXo
 HuGgyNTEmUoC+QOw48DAKBhwGfYRi8Ys/7goE008hvc3WMor5uUYG0g8Y748murQ
 5r8t17rTdXa8ZGIicat/1WIvW/XgE3DHpdiBJrIvT9ZtpRZqccYvKg1kw4uZG1rK
 xISdx/2a6RF2mFslUIZlRTuLudKqXfzqX4WH3gU1uwVRSdOFw2QREG6vfoP03Bke
 FoauNFtkDCd5zCtRbmJ8xDMFY5T3zX0INjsqRzSj/vSRjQCQ0Fxhw==
X-ME-Sender: <xms:ePh0XI6E3KxJlKLFrNRW68aoX4nrshQNxcRsGP3cjOrJ7PRPJLPHsA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedutddrudekgdduvddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdlvdefmdenucfjughrpefofg
 fkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgurhgvficulfgvfhhf
 vghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuffhomhgrihhnpehophgvnh
 gsmhgtqdhprhhojhgvtghtrdighiiinecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgu
 rhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:ePh0XLJ4ubt85nf6ho6z4O48btTQZPx1ICunusNRBjfiwTt4IPCFuw>
 <xmx:ePh0XEitksuHF_uj7ZBGDLfcdv_thYQ2no25tDB9_ZWLxgjPv77MQQ>
 <xmx:ePh0XAJ6pnYOE9e01ExZn1S9-q8G_lyo4-pebtEJhgxjqVLs9fps_A>
 <xmx:efh0XBhUABy6ic218qGyFOSXaUeb18Em9l60qzX47ziwyRCS--ghcw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id C390F7C1EB; Tue, 26 Feb 2019 03:27:36 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.5-895-g0d23ba6-fmstable-20190213v1
X-Me-Personality: 52947553
Message-Id: <2dbf6734-cf35-41aa-b1bc-e1159564c41b@www.fastmail.com>
In-Reply-To: <c0185b95-00a9-325c-90ec-172751ee6e98@linux.intel.com>
References: <c0185b95-00a9-325c-90ec-172751ee6e98@linux.intel.com>
Date: Tue, 26 Feb 2019 03:27:36 -0500
From: "Andrew Jeffery" <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Subject: Re: gerrit down?
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
X-List-Received-Date: Tue, 26 Feb 2019 08:27:46 -0000



On Tue, 26 Feb 2019, at 17:38, Jia, Chunhui wrote:
> Brad,
> 
> Is gerrit server down?
> 
> I tried to access https://gerrit.openbmc-project.xyz/ and got "502 Bad 
> Gateway".
> 
>

Yeah, seems to be dead
