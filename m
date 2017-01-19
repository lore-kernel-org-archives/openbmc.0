Return-Path: <cyrilbur@gmail.com>
Received: from mail-pf0-x241.google.com (mail-pf0-x241.google.com
 [IPv6:2607:f8b0:400e:c00::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v3kdn2bJBzDqGt
 for <openbmc@lists.ozlabs.org>; Thu, 19 Jan 2017 11:06:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="fnCiCTqX"; 
 dkim-atps=neutral
Received: by mail-pf0-x241.google.com with SMTP id y143so2015729pfb.1
 for <openbmc@lists.ozlabs.org>; Wed, 18 Jan 2017 16:06:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Hj12nr1SBKVX9ghwKRlQKD1m+WiA6GV+y4Ln3D2fCr4=;
 b=fnCiCTqX9R3XJeC6Gq6tsVg82/EjIsZ1S3c34xIflU6JyFLTXQw7WntppLWwB5Szo0
 qU0YYAs2y0IjVVHoIJmMqMJRKieITb8Mpa6IK3O7rnqbG13dUj1ZWnvsh2AIXPvBHQQC
 djWNx2sCqQUgeHGasQvbhQUwnTUlXtiL7TmDjYGFe5auF1Go4PEgVGT0goA09v5Vnp5q
 tFWzyTk5JFGjy63xgY8QgKFJb3c/q0SXRsViuK3eC+wSMVzaX7GHGJpUSIiUuGyiNds2
 mbosDLrxFTLYdFvhEfpuh0xXrfvJ+YrEvRBpi2cDtv0Hsv4QeCE/oy9RHPdJxi0TtbrJ
 m+PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Hj12nr1SBKVX9ghwKRlQKD1m+WiA6GV+y4Ln3D2fCr4=;
 b=PCVucSFgIlwUoLcIfFV80hhZ/cTfRlh2mJRsNgYqzoYPNGLhHsBu7Z4/Qexf/gLdUc
 LUXtc5vTm8N1XCfNpL+0rDSEJu5L6/y2ua4WM4CaXgW+4aNG3LtrB5mNDeGMVrQDXlmf
 aqRSe1zfONPRLGRjbv2WH1Ix7LV6AydVjuvEn7HnBHzgtXABlV7YbSh5G+fP0ng7nqcb
 QKWDS7r/CBBP8UiqDaJMZrB46NHI0HwRdEbmqmBXI/McAyAxajW/NWSJILnbEbJXa0zg
 yCvBay6y1RBWCXy3hJ2KQbKM53UrL9Uxn6venAwHzScjQ3obscaJaK+E1IAngfu+VqOc
 irCQ==
X-Gm-Message-State: AIkVDXIJKLT6Dn/vcwfWy2eKy5MBjDjwNV1mJh3Z/rz2p6bP2cTgI4dsAFIsWqpVyePSsg==
X-Received: by 10.98.71.7 with SMTP id u7mr6863424pfa.76.1484784378428;
 Wed, 18 Jan 2017 16:06:18 -0800 (PST)
Received: from [138.44.241.182] ([138.44.241.182])
 by smtp.googlemail.com with ESMTPSA id b10sm3321151pga.21.2017.01.18.16.06.12
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 18 Jan 2017 16:06:17 -0800 (PST)
Message-ID: <1484784318.4097.2.camel@gmail.com>
Subject: Re: [PATCH 1/4] Documentation: dt: mailbox: Add Aspeed ast2400/2500
 bindings
From: Cyril Bur <cyrilbur@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, jassisinghbrar@gmail.com, arnd@arndb.de, 
 gregkh@linuxfoundation.org, joel@jms.id.au, mark.rutland@arm.com, 
 openbmc@lists.ozlabs.org, andrew@aj.id.au, benh@kernel.crashing.org, 
 xow@google.com, jk@ozlabs.org
Date: Thu, 19 Jan 2017 11:05:18 +1100
In-Reply-To: <20170118203833.3htpccig67kpd6xl@rob-hp-laptop>
References: <20170112002910.3650-1-cyrilbur@gmail.com>
 <20170112002910.3650-2-cyrilbur@gmail.com>
 <20170118203833.3htpccig67kpd6xl@rob-hp-laptop>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.3 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Jan 2017 00:06:22 -0000

On Wed, 2017-01-18 at 14:38 -0600, Rob Herring wrote:
> On Thu, Jan 12, 2017 at 11:29:07AM +1100, Cyril Bur wrote:
> > Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
> > ---
> >  .../devicetree/bindings/mailbox/aspeed-mbox.txt    | 44 ++++++++++++++++++++++
> >  1 file changed, 44 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mailbox/aspeed-mbox.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/mailbox/aspeed-mbox.txt b/Documentation/devicetree/bindings/mailbox/aspeed-mbox.txt
> > new file mode 100644
> > index 000000000000..633cd534d91c
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mailbox/aspeed-mbox.txt
> > @@ -0,0 +1,44 @@
> > +ASpeed Mailbox Driver
> > +=====================
> > +
> > +The ASpeed mailbox allows for communication between different
> > +processors. The mailbox on the ASpeed ast2400 and ast2500 is a set of
> > +16 single byte data registers along with interrupt and configuration
> > +registers directly on the SoC. These are memory mapped on the aspeed
> > +and can be accessed via the SuperIO registers on the other processor.
> > +
> > +Device Node:
> > +============
> > +This represents the mailbox on the Soc.
> > +
> > +As the mailbox registers sit on the LPC bus, it makes most sense for
> > +the device to be within the LPC host node. See
> > +Documentation/devicetree/bindings/mfd/aspeed-lpc.txt for more
> > +information. This does not have to be the case, provided the reg
> > +property can give the full address of the mbox registers.
> 
> This does have to be the case. I'd expect all devices on the LPC bus to 
> be under a LPC bus node.
> 
> Drop the last sentence, and:
> 
> Acked-by: Rob Herring <robh@kernel.org>

Will do, thanks for the review.

Cyril
