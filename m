Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="smtOQxDy"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="GFvj97bL"; dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44rVTh4gTWzDqTq
 for <openbmc@lists.ozlabs.org>; Sat, 27 Apr 2019 09:23:02 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 6A43B22165;
 Fri, 26 Apr 2019 19:22:59 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Fri, 26 Apr 2019 19:22:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=Vn79VgmTuXJH7eCTb5t+80vK3C0cytb
 ++7nCd7/KjfA=; b=smtOQxDyNhOM98SIPztiA4ZduulQFaYyuXSqRHiiTIUFOOy
 0DL3GkQhCa8kk574hLxye2L1gNyV0zWToWtOY9QnydYQyPj5kHjz7NsW3xf2MZHR
 Nmdlhzahgc1OWwkqCZ1z/AR8ZXvkghf1fjy88lBHPziy/T1m5NJL+rHffCDTPk7M
 4ElGXcYDM+buphO++apsqaRTW18xY1EulM7WD17v7qfGQn4UiPR5WDtKoAdkNz87
 LmCNnzk0nzbaxaLEsUI/UO279L8HQd4j6JSJTGzRZB2/R2Yqj7q3oqD78XYKka9F
 yoUrPDgb7dOqIIYM5gd6dcC9Ss2ERmfRSt9kHog==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Vn79Vg
 mTuXJH7eCTb5t+80vK3C0cytb++7nCd7/KjfA=; b=GFvj97bLXnNEVkKCbJQy2N
 i1UW7yvJmAS0MdmggvPz8ekfVIAIDPw336qto82xS1FuggoMBK4cJH3if2QxHLzM
 1mApNcCSHkgk4puE3cBkrZ5ZLyrgXTJg8lO9iPa311Hkp6db2F9zZWDdb88uq6KG
 WylFrj8Jvnicszd9d1PC6p0X7mQUTNzqXEpZ7Z5WppbyVaq+ngcDPq9WwBDWLb3Z
 GbI1agBDQDOhI2lOF7wJYyMiu/EwH2Q79ub5q2xCbHrVkG05M/WoIs8Jln4VjmZg
 uWblEfZR5/WZU1N2k1rxtpeivep4qWkGxIu1SdTyuIDuG+eAXdISw97vjXNm7lFw
 ==
X-ME-Sender: <xms:0pLDXNQ7rE-YpapB_ov7Fj5rAza15vu9jXeCU_HWU-pM_8zU3zfueA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrheejgddvgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:0pLDXMIEcTHbtL9sdWkWvJW3lnX4NR_JKIbrTpzkKLssEwaomkYQag>
 <xmx:0pLDXDA5alEwtvIfDcW_AHyRfprNUdErBXsgjA3wEsDyhYII34u6qw>
 <xmx:0pLDXFAM7hSCaNd-n00MXixZCnV99lYpDRs8vKbuzVOciB0RI5grVQ>
 <xmx:05LDXMIMcyEV1clwhizYL7y7H-1DnGRDawW44L2kjlSRiQN3yZtgSQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 076527C199; Fri, 26 Apr 2019 19:22:58 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-444-g755619f-fmstable-20190423v1
Mime-Version: 1.0
Message-Id: <e898d5c9-132b-4ba5-ac64-ed25bac2807a@www.fastmail.com>
In-Reply-To: <CAO=notx9iWQoOLPxKiHm-V=B5b99XZhLQE5PkgNEPg-J_9apiQ@mail.gmail.com>
References: <CAO=notxyVAx=LY+5tCUWaezZP67JKy7z3NT3SAUcKR64W8Pk_w@mail.gmail.com>
 <d4abbc06-a4ea-4cd0-95f7-b32cd388293e@www.fastmail.com>
 <CAO=notx9iWQoOLPxKiHm-V=B5b99XZhLQE5PkgNEPg-J_9apiQ@mail.gmail.com>
Date: Fri, 26 Apr 2019 19:22:56 -0400
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Patrick Venture" <venture@google.com>
Cc: "OpenBMC Maillist" <openbmc@lists.ozlabs.org>,
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
X-List-Received-Date: Fri, 26 Apr 2019 23:23:08 -0000



On Fri, 26 Apr 2019, at 08:46, Patrick Venture wrote:
> On Fri, Apr 26, 2019 at 8:14 AM Andrew Jeffery <andrew@aj.id.au> wrote:
> >
> >
> >
> > On Fri, 26 Apr 2019, at 08:01, Patrick Venture wrote:
> > > I'm getting feedback from a patchset I sent upstream that there are
> > > compiler warnings.  Which surprised me because my OpenBMC builds with
> > > those patches don't complain.  I imagine therefore we have them
> > > silenced and was curious where we silence them.
> >
> > How are you building the kernel?
> >
> > I strongly recommend you build kernels directly from the kernel source tree rather than using bitbake, if that's what you're doing.
> 
> I'm building the kernel via bitbake as you surmised.
> 
> >
> > In the kernel source tree, do:
> >
> > $ export ARCH=arm
> > $ export CROSS_COMPILE=arm-linux-gnueabi-
> > $ make aspeed_g5_defconfig
> > $ make W=1 -j$(nproc)
> >
> > This exports are from memory, ymmv.
> 
> Thanks. I've fired off a complete build of the kernel to catch this.
> I don't have the openbmc SDK toolchain installed at the moment, but
> that's not a difficult task.

I recommend installing your distro's arm cross toolchain if that's possible. It's a much less invasive solution than sourcing the sdk's environment script.

Andrew

> 
> >
> > In addition to giving you more output than Greg is after, it has a much lower write/compile/test latency.
> >
> > Hope that helps,
> >
> > Andrew
> >
> > >
> > > Patrick
> > >
>
