Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::642; helo=mail-pl1-x642.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="TkxEgWDl"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44lLhV661hzDqMg
 for <openbmc@lists.ozlabs.org>; Fri, 19 Apr 2019 00:14:33 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id w23so1244753ply.4
 for <openbmc@lists.ozlabs.org>; Thu, 18 Apr 2019 07:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=l/4WOyyN4m6jHy8l22Z3kpGyynxOUz5R0A5dQ8geiUw=;
 b=TkxEgWDlHtb2lthqITl4L6UCCRyBJ5uaoSTi1ooRIqvu0fEHoeumSs1M1uMeCj7TVp
 8jCWcAdgHMTJPvpjDvf0E7i5jVJ0iKIs9WITRMn6Sw4s3XZvT573wybA8E6Sr/Vo1g6v
 j+HJxg+erBuNkhvwXJVw+Flk8/ejfLcpakLq05gDJBAliu2m0JTs9P++AViI+am9TNUY
 CNxI0g37oEsLViN8guFfQQXxJMtOHlSMatrsrvSG8NwZ1GAMX/KWMkzkBcb9L6cttLeP
 ssCvjc+vUiR4bvgR7M9GzsTzoTRfqJAQuAleNaeqyo/nFUsRrhbtWxj32b/o4Umq+idj
 7RWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l/4WOyyN4m6jHy8l22Z3kpGyynxOUz5R0A5dQ8geiUw=;
 b=IceFgKrZ5nSMUDitz+tM7/Ecw7/TKoXIyN8+OuId/2ADROwL9RWSk8AHIYu1IEvlb4
 3/7Rc1fhkg4EoiWr4vUWOnBNuU2Fe4XCXs9VDAiS+2JO8Ve8cPZP70mg0cbPDRyL5OYj
 vCRVJkkDwaHFWZt6EjvzjEgF4ethAMLu7Mm1/whwcGA8GPINYVEVlVh2a/uej/yN7KTS
 bcyuRIFLYP8AKIC+2wkGLQMNXYwyF0OF1H6cU0K74LyndH97sgeo8gVrOdwgjjME9L/I
 S2BYJIOaElBAeAig2XJwsYOq/yLaMVH9okPJAxd33ScNqnUpD9JxvvnruEsAhRHRNu6W
 SqnA==
X-Gm-Message-State: APjAAAWvUZXn740bH+H9YpbGV6K/j0EyJgajt9kRrP3st+cW4/vFqzTx
 4h9xLDxDwZdolO5VmleycM5kVjrGDUhBVUZnp50GTQ==
X-Google-Smtp-Source: APXvYqz42z1Sy3AI/RyRLTmyzB8fxKFm1rVsv624iKViW/hlByRlHtgvxqCO4wl9s8N1wM0bUUhkHquwkg9lmeEMkQ8=
X-Received: by 2002:a17:902:8345:: with SMTP id
 z5mr95902150pln.197.1555596867313; 
 Thu, 18 Apr 2019 07:14:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190412144206.68324-1-venture@google.com>
 <CAO=notx11Vp2arQFSQ8oN0sba8XJZnrGNEpWfRtDN1no-CY-Fg@mail.gmail.com>
 <8b0798ab-dfa8-4762-a2f0-c5bc742f9cc4@www.fastmail.com>
In-Reply-To: <8b0798ab-dfa8-4762-a2f0-c5bc742f9cc4@www.fastmail.com>
From: Patrick Venture <venture@google.com>
Date: Thu, 18 Apr 2019 07:14:15 -0700
Message-ID: <CAO=notydftOSwwLPetonXpb+Q5Saiz1Xz9krUqRu8WWDYAz3KA@mail.gmail.com>
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
X-List-Received-Date: Thu, 18 Apr 2019 14:14:36 -0000

On Wed, Apr 17, 2019 at 11:17 PM Andrew Jeffery <andrew@aj.id.au> wrote:
>
>
>
> On Wed, 17 Apr 2019, at 01:00, Patrick Venture wrote:
> > On Fri, Apr 12, 2019 at 7:42 AM Patrick Venture <venture@google.com> wrote:
> > >
> > > From: Maxim Sloyko <maxims@google.com>
> > >
> > > Add the nodes for the ir38064 and isl68137 devices on the Zaius board.
> > >
> > > Signed-off-by: Maxim Sloyko <maxims@google.com>
> > > Signed-off-by: Robert Lippert <rlippert@google.com>
> > > Signed-off-by: Patrick Venture <venture@google.com>
> > > ---
> > >  arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts | 65 ++++++++++++++++++++--
> > >  1 file changed, 60 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> > > index 0c0ea41cbe27..53751adebf17 100644
> > > --- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> > > +++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> > > @@ -301,6 +301,32 @@
> > >                                 reg = <0x54>;
> > >                         };
> > >                 };
> > > +
> > > +       };
> > > +
> > > +       vrm@64 {
> > > +               compatible = "intersil,isl68137";
> > s/intersil/isil/g
>
> Hrm, I didn't see this follow up and applied the patch as is.
>
> Can you send a fix-up if necessary?

Yeah, I can send a fixup.  The fixed up patch was sent out for review
to Joel's staging repo the other day.  In this case, should I send a
fixup here or just wait until this patchset is dropped when the next
rebase occurs?

>
> Andrew
>
> >
> > > +               reg = <0x64>;
> > > +       };
> > > +
> > > +       vrm@40 {
> > > +               compatible = "intersil,isl68137";
> > > +               reg = <0x40>;
> > > +       };
> > > +
> > > +       vrm@60 {
> > > +               compatible = "intersil,isl68137";
> > > +               reg = <0x60>;
> > > +       };
> > > +
> > > +       vrm@43 {
> > > +               compatible = "infineon,ir38064";
> > > +               reg = <0x43>;
> > > +       };
> > > +
> > > +       vrm@41 {
> > > +               compatible = "intersil,isl68137";
> > > +               reg = <0x41>;
> > >         };
> > >
> > >         /* Master selector PCA9541A @70h (other master: CPU0)
> > > @@ -316,18 +342,47 @@
> > >         /* CPU0 VR ISL68137 0.7V, 0.96V PMBUS @64h */
> > >         /* CPU0 VR ISL68137 1.2V CH03 PMBUS @40h */
> > >         /* CPU0 VR ISL68137 0.8V PMBUS @60h */
> > > -       /* CPU0 VR 1.0V IR38064 I2C @11h, PMBUS @41h */
> > > +       /* CPU0 VR 1.0V IR38064 I2C @11h, PMBUS @43h */
> > >         /* CPU0 VR ISL68137 1.2V CH47 PMBUS @41h */
> > > +       /* Master selector PCA9541A @70h (other master: CPU0)
> > > +        *   LM5066I PMBUS @10h
> > > +        */
> > > +       /* 12V SMPS Q54SH12050NNDH @61h */
> > >  };
> > >
> > >  &i2c8 {
> > >         status = "okay";
> > >
> > > -       /* CPU1 VR ISL68137 0.7V, 0.96V PMBUS @65h */
> > > -       /* CPU1 VR ISL68137 1.2V CH03 PMBUS @44h */
> > > -       /* CPU1 VR ISL68137 0.8V PMBUS @61h */
> > > +       vrm@64 {
> > > +               compatible = "intersil,isl68137";
> > > +               reg = <0x64>;
> > > +       };
> > > +
> > > +       vrm@40 {
> > > +               compatible = "intersil,isl68137";
> > > +               reg = <0x40>;
> > > +       };
> > > +
> > > +       vrm@41 {
> > > +               compatible = "intersil,isl68137";
> > > +               reg = <0x41>;
> > > +       };
> > > +
> > > +       vrm@42 {
> > > +               compatible = "infineon,ir38064";
> > > +               reg = <0x42>;
> > > +       };
> > > +
> > > +       vrm@60 {
> > > +               compatible = "intersil,isl68137";
> > > +               reg = <0x60>;
> > > +       };
> > > +
> > > +       /* CPU1 VR ISL68137 0.7V, 0.96V PMBUS @64h */
> > > +       /* CPU1 VR ISL68137 1.2V CH03 PMBUS @40h */
> > > +       /* CPU1 VR ISL68137 1.2V CH47 PMBUS @41h */
> > >         /* CPU1 VR 1.0V IR38064 I2C @12h, PMBUS @42h */
> > > -       /* CPU0 VR ISL68137 1.2V CH47 PMBUS @45h */
> > > +       /* CPU1 VR ISL68137 0.8V PMBUS @60h */
> > >  };
> > >
> > >
> > > --
> > > 2.21.0.392.gf8f6787159e-goog
> > >
> >
