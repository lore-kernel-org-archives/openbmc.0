Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::642; helo=mail-pl1-x642.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Z4h2HzXH"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44qlpL3V2TzDqdD
 for <openbmc@lists.ozlabs.org>; Fri, 26 Apr 2019 04:19:53 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id o7so175618pll.13
 for <openbmc@lists.ozlabs.org>; Thu, 25 Apr 2019 11:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TypyVBKV3wt92wDeGv9xgeQ1HfUBBlD6khJiYIwUM3U=;
 b=Z4h2HzXHgGV7qp1CrZYepXXUx0Jj6zjV/+6Divr7zy8r+k3Wa0DhKd/4S34PRAy80I
 HuS0dqt27AhdeiG6lM/jvh0LLGrzToaZAV62xM2e867N0FE7VtQpq5KtWnMoCy8V1w8+
 n0rYMg3fJHsxpBKH3cork6AAfG36ivlnwbAdSYyVckXP/6lc7WYegxJQA9WZAoRP1F0s
 admN+6aVitijagW0RfTCxkoEv+CeClAANdOYajNi0WVwwJJfQsuyPKMuC5RV4r1uchJP
 9eVyiG5cr//sFGsi6SXAUVT/pG+jzBRGiBiMfcYYcYk0fg150Y/J0BLf0zUlZYqqUBO0
 kI3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TypyVBKV3wt92wDeGv9xgeQ1HfUBBlD6khJiYIwUM3U=;
 b=sP6ll+UbuVuKvELGnQM35bgrZ63YoIWn8GVOTe6RjCapHHaHJ8tB+hoKN7ltEu8hCC
 ujeFw2xe+be3Px71NMcNpsuyOZCr9UKyKsIvO1ayDp1dUFKr8eRRSQkDTLuGBNdzoF+q
 /7xFbj19SdbkCKbOgGUKXaRCiS8AbvyL7dUMsxQs1sJoBPf2sf9Ytmpw3mnXnrYDxvN2
 YKPD81hVC5EHqtbo9U2xxMaywjzqDBz1bTwzf4DQPJC3wxs2tf8Gk/4VloEXTzhnhe0q
 gNIcGKIB4hE5VuYWTooEcej5nPVa5s/LofgyftKta0O46K7Bo2fF1UwrlJzBlJo0vDAu
 fcYA==
X-Gm-Message-State: APjAAAXqfZoxXQ7nEB66ownuVaWVpZh8vX64xUSmtOkcl6wVml/F5jBE
 Tql2NPc1e2EPXx0Iut9nwxz84bKRLlrAuZ3HHw/41Q==
X-Google-Smtp-Source: APXvYqwWkvJoK1aolJ+GLvDaRnkTyq8LBgkHx0Uz0h5OB6H1RBqXKH21LzAagWltfPeBlXo3106EeDmVg+X8uya1YfM=
X-Received: by 2002:a17:902:e183:: with SMTP id
 cd3mr737204plb.233.1556216389608; 
 Thu, 25 Apr 2019 11:19:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190425181535.142536-1-venture@google.com>
 <CAO=notxmw52bo9MLAy95zkbhZ==Nvg5GcuwjS9+oEZ97vqgtxA@mail.gmail.com>
In-Reply-To: <CAO=notxmw52bo9MLAy95zkbhZ==Nvg5GcuwjS9+oEZ97vqgtxA@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Thu, 25 Apr 2019 11:19:38 -0700
Message-ID: <CAO=notxsLrXitF=8t68+4ojW-QeOHXWryvCJTBTmpfviXkTXJg@mail.gmail.com>
Subject: Re: [PATCH dev-5.0 1/2] dt-bindings: misc: aspeed-p2a-ctrl: add
 support
To: Patrick Venture <venture@google.com>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Thu, 25 Apr 2019 18:19:55 -0000

On Thu, Apr 25, 2019 at 11:16 AM Patrick Venture <venture@google.com> wrote:
>
> +OpenBMC Maillist
>
> On Thu, Apr 25, 2019 at 11:15 AM Patrick Venture <venture@google.com> wrote:
> >
> > Document the ast2400, ast2500 PCI-to-AHB bridge control driver bindings.
> >
> > Signed-off-by: Patrick Venture <venture@google.com>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
> > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > (cherry picked from commit 28703c6ef6228635f7c8b248c1d846511a2b60a3)
> > ---
> >  .../bindings/misc/aspeed-p2a-ctrl.txt         | 47 +++++++++++++++++++
> >  1 file changed, 47 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/misc/aspeed-p2a-ctrl.txt
> >
> > diff --git a/Documentation/devicetree/bindings/misc/aspeed-p2a-ctrl.txt b/Documentation/devicetree/bindings/misc/aspeed-p2a-ctrl.txt
> > new file mode 100644
> > index 000000000000..854bd67ffec6
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/misc/aspeed-p2a-ctrl.txt
> > @@ -0,0 +1,47 @@
> > +======================================================================
> > +Device tree bindings for Aspeed AST2400/AST2500 PCI-to-AHB Bridge Control Driver
> > +======================================================================
> > +
> > +The bridge is available on platforms with the VGA enabled on the Aspeed device.
> > +In this case, the host has access to a 64KiB window into all of the BMC's
> > +memory.  The BMC can disable this bridge.  If the bridge is enabled, the host
> > +has read access to all the regions of memory, however the host only has read
> > +and write access depending on a register controlled by the BMC.
> > +
> > +Required properties:
> > +===================
> > +
> > + - compatible: must be one of:
> > +       - "aspeed,ast2400-p2a-ctrl"
> > +       - "aspeed,ast2500-p2a-ctrl"
> > +
> > +Optional properties:
> > +===================
> > +
> > +- memory-region: A phandle to a reserved_memory region to be used for the PCI
> > +               to AHB mapping
> > +
> > +The p2a-control node should be the child of a syscon node with the required
> > +property:
> > +
> > +- compatible : Should be one of the following:
> > +               "aspeed,ast2400-scu", "syscon", "simple-mfd"
> > +               "aspeed,g4-scu", "syscon", "simple-mfd"
> > +               "aspeed,ast2500-scu", "syscon", "simple-mfd"
> > +               "aspeed,g5-scu", "syscon", "simple-mfd"
> > +
> > +Example
> > +===================
> > +
> > +g4 Example
> > +----------
> > +
> > +syscon: scu@1e6e2000 {
> > +       compatible = "aspeed,ast2400-scu", "syscon", "simple-mfd";
> > +       reg = <0x1e6e2000 0x1a8>;
> > +
> > +       p2a: p2a-control {
> > +               compatible = "aspeed,ast2400-p2a-ctrl";
> > +               memory-region = <&reserved_memory>;
> > +       };
> > +};
> > --
> > 2.21.0.593.g511ec345e18-goog
> >
>
> --suppress-cc=all really meant all.
