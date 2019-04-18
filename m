Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="paUT379d"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="jwgxHBGX"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44l85d2D3zzDqCR
 for <openbmc@lists.ozlabs.org>; Thu, 18 Apr 2019 16:17:09 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id DD5BB21C08;
 Thu, 18 Apr 2019 02:17:06 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 18 Apr 2019 02:17:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=9smq9zHxY5fn4b7FEXOn9/kH6TfGbMr
 H2WcnGRh61lQ=; b=paUT379dQ3W/bVxHGajavbBzDq2cTLZq3lU3rIpATIf7tpE
 5+SX5nnW99raC0nIBv9+gdHI5SP4L+ZihCdw6Q39CXGc4M7KHLUHY6gfx5fSqd0x
 MbgZxrHRELUuJ3s+bYhRAK43HO8aXsYSjMw7nMsOZN3DdexCjZ1tAoQr/Yd3Q5/H
 VcduW+IZ7DHMtMCd/gr7AUTLOg6AbCEBz0LbZAn4PDiyWRMlLaeJB9lVs6wbotKe
 BrxOfht5LAY/b7wC4Ph1trKW9ZbwLZqXtLBXNN/A2vqfgOqxduj8Mg2GpE/WNRss
 nBVlQ+FPYhTJpOpa6sQGPIyzs0z/1jAxgOFBAng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=9smq9z
 HxY5fn4b7FEXOn9/kH6TfGbMrH2WcnGRh61lQ=; b=jwgxHBGXCPW9Dop85Wj38e
 U2cCZPdmyjG1ZdZTHEhB1rjoO6qaxkLQJV91SNGTlN10eTqILtxsd1CusqIjkR52
 rkdNPRPWALoxSKlVIGSjgeQPTxlmyZhgWYdUdn61PfkwC4pSzn2nX0rqpLxNvLkM
 icrDgheoiQBUyXF65UyLTPUGqqlc/kbD2acKkyDNqS+Sfxdsgr3J2gtnzwvMbpcr
 I5+bhXSbDSBxPeSa5A+Tl+BwdK2mzkmy4krT7GLITMc00+jEBAFW8TFA/eLICHwK
 Rb//tnj7dpmM9fytVBr5geuOPrkszGHUl5SOAR6UzHxUt9JyK1SUW6z/AeYTKk0g
 ==
X-ME-Sender: <xms:YRa4XEVDiEQAdWRo8r4Ou2vLt6iuz7lnmAmNC-IKo87wT9YSq_RjPA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrfeeggddutdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:YRa4XC3bARBNK7gI-L4rTN1est2ZYSyPXAPidkTr_yIT5RoYr77R0Q>
 <xmx:YRa4XHVsdYxlw7z7jMH-bOsKqnImRRwaLXDrhvXT399o1paXBsznwQ>
 <xmx:YRa4XK9qi92l365i5qx0noMbxl-7VYI2GTPM5yu7IVTdXnN6YTtCWQ>
 <xmx:Yha4XB-7prU64BcnacDef9X6AtYygh9eH7vc4Sa3NyZENcsdro5BKw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 611E87C132; Thu, 18 Apr 2019 02:17:05 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-443-g918f9d3-fmstable-20190416v3
Mime-Version: 1.0
X-Me-Personality: 52947553
Message-Id: <8b0798ab-dfa8-4762-a2f0-c5bc742f9cc4@www.fastmail.com>
In-Reply-To: <CAO=notx11Vp2arQFSQ8oN0sba8XJZnrGNEpWfRtDN1no-CY-Fg@mail.gmail.com>
References: <20190412144206.68324-1-venture@google.com>
 <CAO=notx11Vp2arQFSQ8oN0sba8XJZnrGNEpWfRtDN1no-CY-Fg@mail.gmail.com>
Date: Thu, 18 Apr 2019 02:17:04 -0400
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Patrick Venture" <venture@google.com>, "Joel Stanley" <joel@jms.id.au>
Cc: "Maxim Sloyko" <maxims@google.com>,
 "OpenBMC Maillist" <openbmc@lists.ozlabs.org>,
 "Robert Lippert" <rlippert@google.com>
Subject: =?UTF-8?Q?Re:_[PATCH_dev-5.0]_ARM:_dts:_aspeed:_zaius:_add_Infineon_and_?=
 =?UTF-8?Q?Intersil_regulators?=
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
X-List-Received-Date: Thu, 18 Apr 2019 06:17:10 -0000



On Wed, 17 Apr 2019, at 01:00, Patrick Venture wrote:
> On Fri, Apr 12, 2019 at 7:42 AM Patrick Venture <venture@google.com> wrote:
> >
> > From: Maxim Sloyko <maxims@google.com>
> >
> > Add the nodes for the ir38064 and isl68137 devices on the Zaius board.
> >
> > Signed-off-by: Maxim Sloyko <maxims@google.com>
> > Signed-off-by: Robert Lippert <rlippert@google.com>
> > Signed-off-by: Patrick Venture <venture@google.com>
> > ---
> >  arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts | 65 ++++++++++++++++++++--
> >  1 file changed, 60 insertions(+), 5 deletions(-)
> >
> > diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> > index 0c0ea41cbe27..53751adebf17 100644
> > --- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> > +++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> > @@ -301,6 +301,32 @@
> >                                 reg = <0x54>;
> >                         };
> >                 };
> > +
> > +       };
> > +
> > +       vrm@64 {
> > +               compatible = "intersil,isl68137";
> s/intersil/isil/g

Hrm, I didn't see this follow up and applied the patch as is.

Can you send a fix-up if necessary?

Andrew

> 
> > +               reg = <0x64>;
> > +       };
> > +
> > +       vrm@40 {
> > +               compatible = "intersil,isl68137";
> > +               reg = <0x40>;
> > +       };
> > +
> > +       vrm@60 {
> > +               compatible = "intersil,isl68137";
> > +               reg = <0x60>;
> > +       };
> > +
> > +       vrm@43 {
> > +               compatible = "infineon,ir38064";
> > +               reg = <0x43>;
> > +       };
> > +
> > +       vrm@41 {
> > +               compatible = "intersil,isl68137";
> > +               reg = <0x41>;
> >         };
> >
> >         /* Master selector PCA9541A @70h (other master: CPU0)
> > @@ -316,18 +342,47 @@
> >         /* CPU0 VR ISL68137 0.7V, 0.96V PMBUS @64h */
> >         /* CPU0 VR ISL68137 1.2V CH03 PMBUS @40h */
> >         /* CPU0 VR ISL68137 0.8V PMBUS @60h */
> > -       /* CPU0 VR 1.0V IR38064 I2C @11h, PMBUS @41h */
> > +       /* CPU0 VR 1.0V IR38064 I2C @11h, PMBUS @43h */
> >         /* CPU0 VR ISL68137 1.2V CH47 PMBUS @41h */
> > +       /* Master selector PCA9541A @70h (other master: CPU0)
> > +        *   LM5066I PMBUS @10h
> > +        */
> > +       /* 12V SMPS Q54SH12050NNDH @61h */
> >  };
> >
> >  &i2c8 {
> >         status = "okay";
> >
> > -       /* CPU1 VR ISL68137 0.7V, 0.96V PMBUS @65h */
> > -       /* CPU1 VR ISL68137 1.2V CH03 PMBUS @44h */
> > -       /* CPU1 VR ISL68137 0.8V PMBUS @61h */
> > +       vrm@64 {
> > +               compatible = "intersil,isl68137";
> > +               reg = <0x64>;
> > +       };
> > +
> > +       vrm@40 {
> > +               compatible = "intersil,isl68137";
> > +               reg = <0x40>;
> > +       };
> > +
> > +       vrm@41 {
> > +               compatible = "intersil,isl68137";
> > +               reg = <0x41>;
> > +       };
> > +
> > +       vrm@42 {
> > +               compatible = "infineon,ir38064";
> > +               reg = <0x42>;
> > +       };
> > +
> > +       vrm@60 {
> > +               compatible = "intersil,isl68137";
> > +               reg = <0x60>;
> > +       };
> > +
> > +       /* CPU1 VR ISL68137 0.7V, 0.96V PMBUS @64h */
> > +       /* CPU1 VR ISL68137 1.2V CH03 PMBUS @40h */
> > +       /* CPU1 VR ISL68137 1.2V CH47 PMBUS @41h */
> >         /* CPU1 VR 1.0V IR38064 I2C @12h, PMBUS @42h */
> > -       /* CPU0 VR ISL68137 1.2V CH47 PMBUS @45h */
> > +       /* CPU1 VR ISL68137 0.8V PMBUS @60h */
> >  };
> >
> >
> > --
> > 2.21.0.392.gf8f6787159e-goog
> >
>
