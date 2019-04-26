Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="OZFvZ7BM"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Dq+ExEbP"; dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44rHf05zvjzDqYt
 for <openbmc@lists.ozlabs.org>; Sat, 27 Apr 2019 01:14:31 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id AEF1721FBA;
 Fri, 26 Apr 2019 11:14:28 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Fri, 26 Apr 2019 11:14:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm2; bh=ttZ5p6um2DfcTOKIZqCn52Hrm2VFeF+
 bXdGW9HqPXYc=; b=OZFvZ7BMkWIkkhdINI69d26JZZG+t8Dc5k3Muq3RdLptPbD
 OhCGE5m/6mKWURjplncdphE51dW1pbq+0Y9ZD2yQw8l+p7oOfnW5henqu7MbaV27
 qXNj3vsTaeA1ChsZCISsR9dUFsvk8TNEnz211y/YO+Vn+pnzRgRK0uOflyalLp4N
 QPtfuOSlAU0ms5G623IOF0l29lpb5+7NYeZCJIB3hQJqJrUjsmsJdugRPIkjSdKV
 Kt6q1ceU7kdZibCmUhGXN9Qfpqk7gYhc6XAOL9Mhjf4/vABEf8mkziH/mCRjldyQ
 WRwm9CQU2ec4O24q6W459VtOkpr96+pa4MPDx4w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=ttZ5p6
 um2DfcTOKIZqCn52Hrm2VFeF+bXdGW9HqPXYc=; b=Dq+ExEbP+EWx5Fxg6pk8pU
 l+M9gN7yFm4d2iIOp2PFjOmKZF6akDvs75kmzOOuoUryLZZMqI3HLiHKE+YNGQ5x
 2fss8iLE6b7b4mAUclQA+ocR2psg/uH710RI9cCpqZ+NAUv7lMmYQPXctyfGFESw
 HPPNh92su0HHPEO3dxPkW1UIDmBbF8g+67HWRM8CYGctDXZFS4xNZA1sNC25i0uJ
 mz9oML6+d57fLFaJ4LGushI8mfG+Y++gf5TdJ81uyv6iHnA3Yw/iROJr8c/8pZMT
 QCbxhIdssOZ6zqh0b/PhtuJnhodtO7UR53b2or4knwUMi2GB9KyBQM6wkzeog6bA
 ==
X-ME-Sender: <xms:VCDDXOT11WxGEmQyeD8i2J3ooc7YAyTrv9tosV80tL9nB1sKw_OP7w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrheeigdekkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:VCDDXLOBBqobK74r_oO1ub_RGsLT7tKyPrinz3PYjifU76nvFhxwUw>
 <xmx:VCDDXJMTzjzoODjqJjPaHCVMcsogVublMvNiEhNGdTe2uEAxZDEdPw>
 <xmx:VCDDXDvronc8gIsp1x_OqWoLDnwr58A2nu-0oMSkMz5Y_zk9Agr0Ng>
 <xmx:VCDDXJPWCEISWArRuMEQhiKiXEwEK_qTehc3qpKDFoVntWzcdm3fOQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id E87E37C199; Fri, 26 Apr 2019 11:14:27 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-444-g755619f-fmstable-20190423v1
Mime-Version: 1.0
Message-Id: <d4abbc06-a4ea-4cd0-95f7-b32cd388293e@www.fastmail.com>
In-Reply-To: <CAO=notxyVAx=LY+5tCUWaezZP67JKy7z3NT3SAUcKR64W8Pk_w@mail.gmail.com>
References: <CAO=notxyVAx=LY+5tCUWaezZP67JKy7z3NT3SAUcKR64W8Pk_w@mail.gmail.com>
Date: Fri, 26 Apr 2019 11:14:26 -0400
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Patrick Venture" <venture@google.com>,
 "OpenBMC Maillist" <openbmc@lists.ozlabs.org>,
 "Joel Stanley" <joel@jms.id.au>
Subject: Re: linux kernel compiler warnings ignored
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
X-List-Received-Date: Fri, 26 Apr 2019 15:14:35 -0000



On Fri, 26 Apr 2019, at 08:01, Patrick Venture wrote:
> I'm getting feedback from a patchset I sent upstream that there are
> compiler warnings.  Which surprised me because my OpenBMC builds with
> those patches don't complain.  I imagine therefore we have them
> silenced and was curious where we silence them.

How are you building the kernel?

I strongly recommend you build kernels directly from the kernel source tree rather than using bitbake, if that's what you're doing.

In the kernel source tree, do:

$ export ARCH=arm
$ export CROSS_COMPILE=arm-linux-gnueabi-
$ make aspeed_g5_defconfig
$ make W=1 -j$(nproc)

This exports are from memory, ymmv.

In addition to giving you more output than Greg is after, it has a much lower write/compile/test latency.

Hope that helps,

Andrew

> 
> Patrick
>
