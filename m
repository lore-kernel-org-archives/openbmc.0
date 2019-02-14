Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="su3Yc85t"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="5SdOUMxR"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 440smZ3CpCzDqC7;
 Fri, 15 Feb 2019 10:19:42 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id A68EA2222E;
 Thu, 14 Feb 2019 18:19:39 -0500 (EST)
Received: from web1 ([10.202.2.211])
 by compute4.internal (MEProxy); Thu, 14 Feb 2019 18:19:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 message-id:from:to:cc:mime-version:content-transfer-encoding
 :content-type:subject:references:in-reply-to:date; s=fm2; bh=bFe
 pqL0NpvwEbbi2xzMWcVXlAegulWGMVwzoseaRqsQ=; b=su3Yc85t1tC3cWPFpfW
 hXDO3JCVRbgiTcA1ogPp5u74lXLRAmYg4Yr7x/xz59ysPzxHtTb6cuND/Mm+FqyC
 OAtFTwYllWPdI6XRL0OuK0x2bDRP9yeOHpd0Apx/zMP8RiSslyCVz2M+ZTfL/SaI
 epkbql+I8suTzYcHW31+vPxkFH5DMOdPp4ycTvb6BNhUi6oZ6JIxalsjb04NsHKR
 TQ0qcEJgszAVBDJrmjvggzK5MLG6dfUsXzaGg1bpgVFfnRLxUXKnWvchnIdYcQ4q
 M2uZbVokhHGMK4hU75tNlVK+atLdFSSlNu4GjPp+X01V7O5JrTT/Z6atIO/0/m9u
 p5w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=bFepqL0NpvwEbbi2xzMWcVXlAegulWGMVwzoseaRq
 sQ=; b=5SdOUMxRYKRS0LHNBeg6V8CP6M9lbCU+50Ih0cytoAc1u7iW3qfE3cXeq
 ElZ0Y1f2GVbKij8pFPJfjQ44YuskrLZRUflWn6nZTK0IQreg22bTM2wm66BplbYo
 Tsl7lXO5AeWWY8pbQsU4U4KDHbU9RrztkfkXy0Hyr6f2iv6BehS6dT2y5VrGvfxY
 wmA2VSlCHXrQ0Vlm/umlRYyYs6a5uqg46MW9g25QnNIjo45lxXKEdjTrksFW6BuB
 zGjAH2cmfSezNq6wfuJxVCeYHdzySmtYqSUE4TCK27xTCNbkleEICO+kKSXrdV+h
 kKYQc1BwJ9ITK4m5m48VquKJoLzNg==
X-ME-Sender: <xms:ivdlXBs_rj67gb1g5TgAWzqUVG706sv-cwLbllW7NErhJ__ARcgNiQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedtledruddtiedgtdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfquhhtnecuuegrihhlohhuthemucef
 tddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenogfuuhhsphgvtghtffhomh
 grihhnucdlgeelmdenucfjughrpefkhffvggfgtgfoufhfjgffsehtjeertdertdejnecu
 hfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghjrdhiugdrrg
 huqeenucffohhmrghinhepghhoohhglhgvrdgtohhmnecurfgrrhgrmhepmhgrihhlfhhr
 ohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:ivdlXJMibapyCl4ywka-_V1bx5kj9ZzrKhRg48xNec6QHWoVVQn6mA>
 <xmx:ivdlXG-DXme4EVPtq0mbk8qMUB5mzp2qkn88_H7-RMaqDLsb8Lg0wg>
 <xmx:ivdlXMtFa1uQSCqAgjobYssYDtuELFoXgxTt2PuknIrRPeRkL6cLvg>
 <xmx:i_dlXE3BgH5500Ny4tZModyAHkDBJnCifFikxSlaotkVNwTFjgkmkg>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id B116E94513; Thu, 14 Feb 2019 18:19:38 -0500 (EST)
Message-Id: <1550186378.4136016.1658266304.4858D971@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Joseph Reynolds <jrey@linux.ibm.com>
Cc: Nancy Yuen <yuenn@google.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>,
 openbmc <openbmc-bounces+jrey=linux.ibm.com@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-e97eb308
Subject: Re: Secure boot for BMC
References: <20190205141403.y2yno3nmxvwgd6ex@thinkpad>
 <1549861046.1162750.1655235472.36317B95@webmail.messagingengine.com>
 <CADfYTpENfKyyoMuhuN+RzD7nCQbo+g8sWS-mxMU0PUS5C-Z3yw@mail.gmail.com>
 <1550013215.2866613.1656755904.44211550@webmail.messagingengine.com>
 <02642911831c76d37123735a2964984f@linux.vnet.ibm.com>
In-Reply-To: <02642911831c76d37123735a2964984f@linux.vnet.ibm.com>
Date: Fri, 15 Feb 2019 09:49:38 +1030
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
X-List-Received-Date: Thu, 14 Feb 2019 23:19:46 -0000

On Thu, 14 Feb 2019, at 11:04, Joseph Reynolds wrote:
> On 2019-02-12 17:13, Andrew Jeffery wrote:
> > On Tue, 12 Feb 2019, at 11:00, Nancy Yuen wrote:
> >> We are working on secure boot, but we have a requirement for a Google 
> >> HW
> >> root of trust so I'm not sure if that fits in with these discussions.
> > 
> > I think it would help to have some idea of Google's requirements so the 
> > project
> > can accommodate them where we can, if you can reveal any details. It 
> > may also
> > help inform others (me?) on strategies to secure firmware.
> 
> The OpenBMC security working group has discussed various "root of trust" 
> ideas.  The way I understand it, OpenBMC community members are looking 
> into different solutions including
> "Secure Boot" and "Trusted Platform Module" (TPM) solutions, including 
> Google's OpenTitan chip.  See the meeting minutes for details:
> https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI
> 
> My understanding of the "Secure Boot" concept is that some chip 
> validates the boot loader's digital signature after loading it and 
> before jumping into it.  Then the boot loader would validate the code it 
> loads before jumping into it.  Etc.  A validation failure could either 
> (a) cause the BMC to fail to boot, or (b) boot the BMC in failsafe mode 
> where it could not write to its flash or talk to its host.  OpenBMC may 
> also need some way to talk to the chip.
> 
> My understanding of TPMs is much more limited.  So we are waiting for 
> proposals.

On OpenPOWER systems I think we need the TPM approach, as we can't
restrict our customers by burning e.g. IBM keys into the ASPEED OTP key
slots (... in the 2600).

Andrew
