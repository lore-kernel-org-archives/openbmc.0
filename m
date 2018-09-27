Return-Path: <robh@kernel.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org; envelope-from=robh@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="lXaqdfZ7"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42LXlg3ry3zF33P
 for <openbmc@lists.ozlabs.org>; Thu, 27 Sep 2018 21:34:39 +1000 (AEST)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D0461215EC
 for <openbmc@lists.ozlabs.org>; Thu, 27 Sep 2018 11:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1538048076;
 bh=g6WUTW4M2gkmMrkGPpehGRiikbssFYddbz/aAcbuJc8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=lXaqdfZ7cMhNlql7kLNNhswRYUSZtbg6YLq3XgMSKBb9ekImmSonWqyrH7k/j5hWI
 dhk2kNt7hl5s+XicfnlcdreSpVlRC+8UC1/OPA0BdYUdIBvyWDp6nIlQNZBcw3Xj9W
 VsiFO4EsbsFZdFqe4qvxdcNUISauvJG66FSidc7I=
Received: by mail-qk1-f169.google.com with SMTP id c13-v6so1320419qkm.4
 for <openbmc@lists.ozlabs.org>; Thu, 27 Sep 2018 04:34:35 -0700 (PDT)
X-Gm-Message-State: ABuFfogStsM03UoVxs3poeUnxn4825szBjcFf9BL/9OpVqs2PlLe+11F
 DWhiv0+dIyxmoCAB5x5EZblJLWDKzCmVCb7DuQ==
X-Google-Smtp-Source: ACcGV61w5potfGRZRfw99UamSohzCXfcJb23c3pEHjc2Xy0gjlG4MqNlfJK9Sn8F9Dc2KVsIPKoGsFYSh7si9pI1olY=
X-Received: by 2002:a37:bec4:: with SMTP id
 o187-v6mr7407638qkf.326.1538048074967; 
 Thu, 27 Sep 2018 04:34:34 -0700 (PDT)
MIME-Version: 1.0
References: <20180919164712.4030353-1-vijaykhemka@fb.com>
 <20180926230026.GA26508@bogus>
 <CACPK8XctuiN8yphXFUmwXnpphb5LP2i8Cje_HAdsBwMWSvpsdA@mail.gmail.com>
In-Reply-To: <CACPK8XctuiN8yphXFUmwXnpphb5LP2i8Cje_HAdsBwMWSvpsdA@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 27 Sep 2018 06:34:23 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLvJDatz1oJG3CPY1LcFmqbRwdOeZ0-=Mpbbpq0jfmEwg@mail.gmail.com>
Message-ID: <CAL_JsqLvJDatz1oJG3CPY1LcFmqbRwdOeZ0-=Mpbbpq0jfmEwg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] ARM: dt-bindings: Add vendor prefix for Facebook
To: Joel Stanley <joel@jms.id.au>
Cc: Vijay Khemka <vijaykhemka@fb.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 devicetree@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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
X-List-Received-Date: Thu, 27 Sep 2018 11:34:40 -0000

On Wed, Sep 26, 2018 at 10:14 PM Joel Stanley <joel@jms.id.au> wrote:
>
> On Thu, 27 Sep 2018 at 03:01, Rob Herring <robh@kernel.org> wrote:
> >
> > On Wed, 19 Sep 2018 09:47:10 -0700, Vijay Khemka wrote:
> > > Initial introduction of Facebook TiogaPass family equipped with
> > > Aspeed 2500 BMC SoC. TiogaPass is a x86 server development kit
> > > with a ASPEED ast2500 BMC manufactured by Facebook.
> > >
> > > This adds an entry of Facebook in Documentation for vendor prefix
> > >
> > > Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>
> > > ---
> > >  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> >
> > Reviewed-by: Rob Herring <robh@kernel.org>
>
> Rob, can you take this through the dt tree? I've already merged
> Vijay's device tree through the arm soc tree, and don't plan on
> sending another pull req for 4.20 at this stage.

Sure, now applied.

Rob
