Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::442; helo=mail-pf1-x442.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="rg/F4ZH/"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44lM0h6HdlzDqS1
 for <openbmc@lists.ozlabs.org>; Fri, 19 Apr 2019 00:28:36 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id z5so1201539pfn.3
 for <openbmc@lists.ozlabs.org>; Thu, 18 Apr 2019 07:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lMCCCGnGzv475CkrSoEuprgaVEO0wilfpkiZ7PqWFI0=;
 b=rg/F4ZH/b9dYzXf4u+F0DiemdytVWHNTU6VGZpfFZlnnOm9UeMQxQulNlTViRD6ilM
 P6tbk1XWj0JKijDyrKCv2nZl6+nKg0eRKWmWCg2Q40meOeJGjKImRdOCUtKFvWhSjbVH
 lHFZKK+MDMCmYVsOj8J4Yxmej+PDp/Ogx29Vk0qwMeEDxHOEue7Bj01Xm8wQJv+lcyaa
 IlpC5poUCDijSp6yzZw5oFsJd69a1zsbZZWtVZ/O8E+bH036LC26NqNUkWF3OtUQ26cq
 Z45T4hdQ4rwheJtL/SHA+rRjzB4cQi44FT77x6vwQCjWdiaYzocPhQvrJUXCWN+Mfcb7
 9Nhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lMCCCGnGzv475CkrSoEuprgaVEO0wilfpkiZ7PqWFI0=;
 b=dNqQDPRoVhDbTvoZo0LZRX/6VURdbyyaahMLobNZOzQYSPxUUcrOaEZtFczpxbuc5v
 5zcKLZhRaabRtZGVEuZdFtseGY81XSlbYmxdySNoEvvoEPbnqaBb8WIvBLOUKYu0vRUV
 PanAyN0aqUbLDSu3CxJvwy0kyYKH2ky+3sMHDd2a/ZfLsSXz+12ZNjxYd2c9E/9mOwr+
 lxjNMUeG4vsmwkqAZrCmWOhR6V1QBAltiP8Rxmce1rjzawve9sH6Oh7CP3FXX1eEseSE
 72NTWjiv3jaDduy1uga7ka2sD/vnvdyeaTK8HJ3HyrRlL0MU4Em7WTibnPcKm8WPjNc8
 EMzQ==
X-Gm-Message-State: APjAAAV2rFX3GrifTF01krUO/FA1LKKweQfqjrqOAjiEE4k6ruS/1Dpm
 WTuEyD8Pxral5tV612uQPWlmt/ftcQ7lXgxCOUPoFQ==
X-Google-Smtp-Source: APXvYqzrwbAUxIktfBx6VEXs/P+2CmHHxq+jZx33nNcdyKqgAUz6/WzPwkfUXd/9XhpjjJCfZhbD1nfxp7yLNo/qdyM=
X-Received: by 2002:a62:15cf:: with SMTP id 198mr6599110pfv.243.1555597713955; 
 Thu, 18 Apr 2019 07:28:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190412144206.68324-1-venture@google.com>
 <CAO=notx11Vp2arQFSQ8oN0sba8XJZnrGNEpWfRtDN1no-CY-Fg@mail.gmail.com>
 <8b0798ab-dfa8-4762-a2f0-c5bc742f9cc4@www.fastmail.com>
 <CAO=notydftOSwwLPetonXpb+Q5Saiz1Xz9krUqRu8WWDYAz3KA@mail.gmail.com>
In-Reply-To: <CAO=notydftOSwwLPetonXpb+Q5Saiz1Xz9krUqRu8WWDYAz3KA@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Thu, 18 Apr 2019 07:28:22 -0700
Message-ID: <CAO=notxNa7S9-p3uxCrg2+jWf1DdDvzreoQbZyPCC2HpnpQ4ww@mail.gmail.com>
Subject: Re: [PATCH dev-5.0] ARM: dts: aspeed: zaius: add Infineon and
 Intersil regulators
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Joel Stanley <joel@jms.id.au>, Maxim Sloyko <maxims@google.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Robert Lippert <rlippert@google.com>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Thu, 18 Apr 2019 14:28:37 -0000

On Thu, Apr 18, 2019 at 7:14 AM Patrick Venture <venture@google.com> wrote:
>
> On Wed, Apr 17, 2019 at 11:17 PM Andrew Jeffery <andrew@aj.id.au> wrote:
> >
> >
> >
> > On Wed, 17 Apr 2019, at 01:00, Patrick Venture wrote:
> > > On Fri, Apr 12, 2019 at 7:42 AM Patrick Venture <venture@google.com> wrote:
> > > >
> > > > From: Maxim Sloyko <maxims@google.com>
> > > >
> > > > Add the nodes for the ir38064 and isl68137 devices on the Zaius board.
> > > >
> > > > Signed-off-by: Maxim Sloyko <maxims@google.com>
> > > > Signed-off-by: Robert Lippert <rlippert@google.com>
> > > > Signed-off-by: Patrick Venture <venture@google.com>
> > > > ---
> > > >  arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts | 65 ++++++++++++++++++++--
> > > >  1 file changed, 60 insertions(+), 5 deletions(-)
> > > >
> > > > diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> > > > index 0c0ea41cbe27..53751adebf17 100644
> > > > --- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> > > > +++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> > > > @@ -301,6 +301,32 @@
> > > >                                 reg = <0x54>;
> > > >                         };
> > > >                 };
> > > > +
> > > > +       };
> > > > +
> > > > +       vrm@64 {
> > > > +               compatible = "intersil,isl68137";
> > > s/intersil/isil/g
> >
> > Hrm, I didn't see this follow up and applied the patch as is.
> >
> > Can you send a fix-up if necessary?
>
> Yeah, I can send a fixup.  The fixed up patch was sent out for review
> to Joel's staging repo the other day.  In this case, should I send a
> fixup here or just wait until this patchset is dropped when the next
> rebase occurs?

Just decided to send a fixup.   I'll send a fixup for the isl driver as well.

>
> >
> > Andrew
> >
> > >
> > > > +               reg = <0x64>;
> > > > +       };
> > > > +
> > > > +       vrm@40 {
> > > > +               compatible = "intersil,isl68137";
> > > > +               reg = <0x40>;
> > > > +       };
> > > > +
> > > > +       vrm@60 {
> > > > +               compatible = "intersil,isl68137";
> > > > +               reg = <0x60>;
> > > > +       };
> > > > +
> > > > +       vrm@43 {
> > > > +               compatible = "infineon,ir38064";
> > > > +               reg = <0x43>;
> > > > +       };
> > > > +
> > > > +       vrm@41 {
> > > > +               compatible = "intersil,isl68137";
> > > > +               reg = <0x41>;
> > > >         };
> > > >
> > > >         /* Master selector PCA9541A @70h (other master: CPU0)
> > > > @@ -316,18 +342,47 @@
> > > >         /* CPU0 VR ISL68137 0.7V, 0.96V PMBUS @64h */
> > > >         /* CPU0 VR ISL68137 1.2V CH03 PMBUS @40h */
> > > >         /* CPU0 VR ISL68137 0.8V PMBUS @60h */
> > > > -       /* CPU0 VR 1.0V IR38064 I2C @11h, PMBUS @41h */
> > > > +       /* CPU0 VR 1.0V IR38064 I2C @11h, PMBUS @43h */
> > > >         /* CPU0 VR ISL68137 1.2V CH47 PMBUS @41h */
> > > > +       /* Master selector PCA9541A @70h (other master: CPU0)
> > > > +        *   LM5066I PMBUS @10h
> > > > +        */
> > > > +       /* 12V SMPS Q54SH12050NNDH @61h */
> > > >  };
> > > >
> > > >  &i2c8 {
> > > >         status = "okay";
> > > >
> > > > -       /* CPU1 VR ISL68137 0.7V, 0.96V PMBUS @65h */
> > > > -       /* CPU1 VR ISL68137 1.2V CH03 PMBUS @44h */
> > > > -       /* CPU1 VR ISL68137 0.8V PMBUS @61h */
> > > > +       vrm@64 {
> > > > +               compatible = "intersil,isl68137";
> > > > +               reg = <0x64>;
> > > > +       };
> > > > +
> > > > +       vrm@40 {
> > > > +               compatible = "intersil,isl68137";
> > > > +               reg = <0x40>;
> > > > +       };
> > > > +
> > > > +       vrm@41 {
> > > > +               compatible = "intersil,isl68137";
> > > > +               reg = <0x41>;
> > > > +       };
> > > > +
> > > > +       vrm@42 {
> > > > +               compatible = "infineon,ir38064";
> > > > +               reg = <0x42>;
> > > > +       };
> > > > +
> > > > +       vrm@60 {
> > > > +               compatible = "intersil,isl68137";
> > > > +               reg = <0x60>;
> > > > +       };
> > > > +
> > > > +       /* CPU1 VR ISL68137 0.7V, 0.96V PMBUS @64h */
> > > > +       /* CPU1 VR ISL68137 1.2V CH03 PMBUS @40h */
> > > > +       /* CPU1 VR ISL68137 1.2V CH47 PMBUS @41h */
> > > >         /* CPU1 VR 1.0V IR38064 I2C @12h, PMBUS @42h */
> > > > -       /* CPU0 VR ISL68137 1.2V CH47 PMBUS @45h */
> > > > +       /* CPU1 VR ISL68137 0.8V PMBUS @60h */
> > > >  };
> > > >
> > > >
> > > > --
> > > > 2.21.0.392.gf8f6787159e-goog
> > > >
> > >
