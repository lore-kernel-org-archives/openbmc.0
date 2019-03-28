Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="ZhgtieNf"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="gZDol6bx"; dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44V4lJ2TMpzDqNL
 for <openbmc@lists.ozlabs.org>; Thu, 28 Mar 2019 11:00:59 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 69DDC21B0B;
 Wed, 27 Mar 2019 20:00:56 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 27 Mar 2019 20:00:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=cxYdk1zpgyYgph6q/ojZTv0Aq6iCdPf
 rkzrCGJGxiuw=; b=ZhgtieNf/z9XhlUtNwNMVsDhLeviXqBL2nuW/Ft6+c00aHl
 C005HeU1OSKQorbyeByShtwTM3Oy8+Avc6JrlnpeiR3qF2rBcmBn6ENDKvSS4ky/
 RE7jBlPLZfjF/9X/tmQMKpVhr4zQUNk1lt16E9OLhq6V8cuJhY6OVlApgtCymXih
 yEZOQS6lSjW2YqOSgnmplvorex1g7EsJun6u4DnGuAMRSoMgBeCzP096DqLU+mzx
 yJq7pJsp+BerW8x6K0ufgevo5IKopd8W2uqAPxvt8Z919J06aiu48JuaPHQWLcFa
 QqV8idkqcckwDr5FjO16lDNEtftY9kCJFG5XTWg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=cxYdk1
 zpgyYgph6q/ojZTv0Aq6iCdPfrkzrCGJGxiuw=; b=gZDol6bxmVLgnqN2n/KuF0
 +DQ8SyTtIRldq16Er+nNB8vVcowm7pPdk9k+fWSy/iDpfW+5VpydRVfRQMNaQFEI
 Z69fij+HjW+4dg/6WbMVK8XeWb5ESCqumv5Le1KJLX6RUpGnBswPqI2WGc/uF5ff
 90wv32vNzFnDU2ypxCtBEbRzAJFNr8rhbD5d/xDWLOQtNUJOR+j53c7XE5W+twwS
 mC3A5sdeehhK7JyI/LKzdYyDfp6s6i7u+VD5UlunUpyUQ0Zs/w01ZhtxiwA6NJcf
 BLdfK9xg1UrCjEL+TxDJuUBVLBqqL15Mv7cFbhsIHjhkBsyUQRdpUoLDTZZBIWJQ
 ==
X-ME-Sender: <xms:tg6cXAmxF_LnCIjoK1ZF1MP81oLbpSc3Czw1-o8VdPjxDaA6LWbFgg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedutddrkeefgddvkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:tg6cXJBMLZG8wELA5PajtvZphSmVoinhgbSE9ISmheUFuGVIV7ggFw>
 <xmx:tg6cXC4swJSjy9c90Lrv35RhAQF1GwLrgsycuMp88xwmCf5k705kog>
 <xmx:tg6cXCUmVKuZiJ_E-2usyGKE0Dgmm3xIMP0-XnNc23Yk8p8fhvHjqw>
 <xmx:uA6cXNSuuuSYDouOzcg1hJkKzSPyy8zUL1_cvoNispxguv5-BqtEcQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 40D007C1B7; Wed, 27 Mar 2019 20:00:54 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.5-976-g376b1f3-fmstable-20190314v3
Mime-Version: 1.0
X-Me-Personality: 52947553
Message-Id: <9268694b-01a5-40a4-ba00-f2f72f56a192@www.fastmail.com>
In-Reply-To: <b74842c0-2060-82fa-3509-355659d3cddf@linux.ibm.com>
References: <1553196610-29595-1-git-send-email-eajames@linux.ibm.com>
 <1553196610-29595-8-git-send-email-eajames@linux.ibm.com>
 <CACPK8Xd2ULjzCVEDdDYXNXMcgqjM4NkbApfO826bNs2PNNtHUQ@mail.gmail.com>
 <b74842c0-2060-82fa-3509-355659d3cddf@linux.ibm.com>
Date: Wed, 27 Mar 2019 20:00:53 -0400
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Eddie James" <eajames@linux.ibm.com>, "Joel Stanley" <joel@jms.id.au>,
 "Jeremy Kerr" <jk@ozlabs.org>
Cc: "OpenBMC Maillist" <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH dev-5.0 7/7] ARM: dts: romulus: Enable video engine
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
X-List-Received-Date: Thu, 28 Mar 2019 00:01:04 -0000



On Thu, 28 Mar 2019, at 01:37, Eddie James wrote:
> 
> On 3/27/19 1:11 AM, Joel Stanley wrote:
> > On Thu, 21 Mar 2019 at 19:30, Eddie James <eajames@linux.ibm.com> wrote:
> >> Enable the video engine and set it's required memory-region property.
> >>
> >> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> >> ---
> >>   arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts | 7 ++++++-
> >>   1 file changed, 6 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> >> index ee1a460..6b24608 100644
> >> --- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> >> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> >> @@ -37,7 +37,7 @@
> >>                  };
> >>
> >>                  gfx_memory: framebuffer {
> >> -                       size = <0x01000000>;
> >> +                       size = <0x04000000>;
> > You're using the memory region we have set aside for the gfx device -
> > the thing that you plug a monitor into the back of a machine with. Are
> > you sure that is what we want to do?
> 
> It still has to be allocated in the kernel, right? I'm assuming that the 
> kernel won't give memory areas we've grabbed with the gfx driver to the 
> video driver, and same in reverse. I could add a separate memory region 
> too, this just seemed convenient.

Lets go with a new node.

> 
> >
> >>                          alignment = <0x01000000>;
> >>                          compatible = "shared-dma-pool";
> >>                          reusable;
> >> @@ -315,4 +315,9 @@
> >>        memory-region = <&gfx_memory>;
> >>   };
> >>
> >> +&video {
> >> +       status = "okay";
> >> +       memory-region = <&gfx_memory>;
> >> +};
> >> +
> >>   #include "ibm-power9-dual.dtsi"
> >> --
> >> 1.8.3.1
> >>
> 
>
