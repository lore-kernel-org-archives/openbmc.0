Return-Path: <kunyi@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4001:c06::243; helo=mail-io0-x243.google.com;
 envelope-from=kunyi@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="OoJLRFfV"; 
 dkim-atps=neutral
Received: from mail-io0-x243.google.com (mail-io0-x243.google.com
 [IPv6:2607:f8b0:4001:c06::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41mm754GTWzDqww
 for <openbmc@lists.ozlabs.org>; Fri, 10 Aug 2018 10:23:12 +1000 (AEST)
Received: by mail-io0-x243.google.com with SMTP id q4-v6so6287061iob.8
 for <openbmc@lists.ozlabs.org>; Thu, 09 Aug 2018 17:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bRDo6+WuHy4fXjYpmVcxSBqa6jWM7FRPfIAcILNoQhQ=;
 b=OoJLRFfVcw7Ovwl1IZT5FIEQQjJeclhsdyOmQXVShsKqYpgUK/tHinoENyTMJ/e9LV
 v3Z3RvvQvKZa6LqaxsyV51azH/moRPkrx96nxCAeKKj5Fc0idb4k/EILgfT19ZyIimfh
 TT294B38ReSea9nb3v6+axiW+UofUv9n2bGM2Cwd7jYI8ah+KJWhCqYJ2CaRj9w2Hpi5
 EDO1let0dCoJfBVwLfnsOJt9Jss8otWa7tsbTRxTVZ35pdOpwf+oRz3tzaxYETnU/nvI
 GOFyuMH8uPOx4bAh09CIl1isSvhxeaRmS81fie9FlshBCKyYFQMUw417l3Dvlprm7AP9
 9W5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bRDo6+WuHy4fXjYpmVcxSBqa6jWM7FRPfIAcILNoQhQ=;
 b=uHmdl5/bELPSocjURAj6L4u0cR3+EVoLk9SNzkxfdM1t4gGKquRKGIaI5+IY9rlzbg
 YdT4y0Tdft/vHXldUzaVOWYiQPg4p8IkZuLD5QuF+Tn7Zpvu22xHzxcAh7XPhgjTUJj0
 4yCDjs4/4WU7+fLXcjkZAXJ25USJ1BPsXqHUIlsCO1R9DVODcFpS/sL3Nlb+TZPWCDO2
 Fpkxrie+PZbLPcN8xXlY1jQMowOmeYwe4y9ADe7y974xISTjXizc2GRBMgWYMoslBy4f
 +1zIZHZ3wslLQUzo90t/50ryb69ICqOQ6nTki/kOBBJXsCusfxNm7kLskobpHf0od0Mi
 mBTw==
X-Gm-Message-State: AOUpUlEoveCWEBpJtB8OzPnhYRD5R4MVGE/LoVD/8P1cZWoAZcl3dJwT
 KGMnN26ZO2JnXDal/9IYjis3J30xpRWEgwBARhixrQ==
X-Google-Smtp-Source: AA+uWPxIPPgypL4zoR2MT1uX5vtLV/NydZ9oKEc2KR2+rvkY7omSBk5m+j0iLUQlN+3YbBx2AIghZoci7GMQdEh+OJ0=
X-Received: by 2002:a6b:bf04:: with SMTP id p4-v6mr3587593iof.15.1533860589235; 
 Thu, 09 Aug 2018 17:23:09 -0700 (PDT)
MIME-Version: 1.0
References: <20180711053122.30773-1-andrew@aj.id.au>
 <20180711053122.30773-2-andrew@aj.id.au>
 <20180711200450.GB17291@rob-hp-laptop>
 <1531356830.3551458.1437853280.551CA8C5@webmail.messagingengine.com>
 <CAL_JsqKpXxR4t_-3BOy-0mFePXkaSck_4PfHRD=OZQ-_-T5P=w@mail.gmail.com>
 <b6ced4cad4d7ff78330181b2c893855c23103953.camel@kernel.crashing.org>
 <1531463489.747186.1439263128.075AECE1@webmail.messagingengine.com>
 <CAL_JsqLZo-=7UkuvvUFYdCR4asBBiWyC=Q1ryH=-HLU6vzf9tA@mail.gmail.com>
 <ece91112ecfdc7218184c4c4519e455cf9397e11.camel@kernel.crashing.org>
 <CAL_JsqL_bMXLAA0091-g8PmhXR5g5Pf2y2=ey7Ss5ofHm46sWw@mail.gmail.com>
 <c69d0e7c3a95d83da87b566a62619462671a233b.camel@kernel.crashing.org>
 <1531967302.2140539.1445583600.0F5ED287@webmail.messagingengine.com>
 <9787b471abc49c0b3db60e3471473a7a5b45ade7.camel@kernel.crashing.org>
 <1532045276.1219110.1446722072.546C1F9D@webmail.messagingengine.com>
 <483b76bac7cb8043d9d780d5ffa5e43438279887.camel@kernel.crashing.org>
In-Reply-To: <483b76bac7cb8043d9d780d5ffa5e43438279887.camel@kernel.crashing.org>
From: Kun Yi <kunyi@google.com>
Date: Thu, 9 Aug 2018 17:22:42 -0700
Message-ID: <CAGMNF6XCSdif5=kAQ4eh_6+nmHLAu9Fva403EU2Ji2w27H9R0A@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/4] dt-bindings: misc: Add bindings for misc. BMC
 control fields
To: benh@kernel.crashing.org
Cc: Andrew Jeffery <andrew@aj.id.au>, robh@kernel.org, Eugene.Cho@dell.com, 
 a.amelkin@yadro.com, mark.rutland@arm.com, devicetree@vger.kernel.org, 
 gregkh@linuxfoundation.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 linux-kernel@vger.kernel.org, stewart@linux.ibm.com, 
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 10 Aug 2018 00:23:14 -0000

Andrew, Benjamin, Rob,

Thanks for bringing up the set of patches and a great discussion.
After going through the thread I figured that I'd like to share a few
things we needed to hack when programming several BMC boards:

- Debug UART enable/mux
- Disable GPIO D/E passthrough (I think this is supported by the
current pinctrl driver)
- RMII/RGMII strapping
- iLPC2AHB control
- SPI master mux select
- Various SuperIO configurations

As for the discussion whether these belong to a platform driver or
device tree nodes, I think in an ideal world all these configurations
could be nicely grouped and abstracted in a platform kernel driver (or
drivers). However in reality think this as an "M * N" problem: there
are M variants of BMCs and N different platforms built with these
BMCs. Each platform-BMC combination is going to have its own quirks
and slightly different requirements in BMC "tunables". Were there a
kernel driver for the M BMC variants, it would inevitably have a lot
of churn due to the different needs of the platforms.

What I like about the device tree approach is the expressiveness of
the format and the ability to specify non-conflicting initial values
easily. Sometimes we need initial values for these parameters set
before running userspace, and setting such values in device tree is
easier than using #defines or kernel parameters.




On Thu, Jul 19, 2018 at 9:57 PM Benjamin Herrenschmidt
<benh@kernel.crashing.org> wrote:
>
> On Fri, 2018-07-20 at 09:37 +0930, Andrew Jeffery wrote:
> > >
> > > Andrew, can you start with a list that shows what you expect us to need
> > > on our systems ?
> > >
> >
> > Okay, our Witherspoon and Romulus platforms containing the ASPEED AST2500 currently need the following tuneables exposed:
> >
> > > From the SCU:
> >
> > - Debug UART enable
> > - VGA DAC mux
> > - VGA scratch registers 0-7
> > - LPC SuperIO decode enable
> > - VGA MMIO decode enable
> >
> > > From the LPC controller:
> >
> > - iLPC2AHB enable
> > - SuperIO scratch registers 0x20-0x2f
> >
> > (The LPC controller is just as much of a collection of random bits as the SCU)
> >
> > Lastly, our Palmetto platform uses an AST2400 which has fewer features compared to the AST2500. Its tuneable list is the same as the above with the exception of "Debug UART enable".
> >
> > Tuneables that we may need to expose in the future include:
> >
> > > From the SCU:
> >
> > - PCI VID/DID for the BMC PCIe device
> > - VGA device enable (may need to be disabled if the platform contains a discrete graphics processor)
>
> Additionally there's a bunch of resigters controlling the mapping of
> various MMIO regions of the BMC PCIe device to portions of the BMC
> address space. I'm not sure what's the best way to handle that.
>
> This specific set might require a dedicated device as a subnode of
> the SCU in the DT that contains all the mappings as properties...
>
> That or we consider them static enough and just whack it in u-boot.
>
> > > From the LPC controller:
> >
> > - UART mux
> >
> > Alexander, Eugene, can you chime in with your platforms' needs?
> >
> > Cheers,
> >
> > Andrew



--
Regards,
Kun
