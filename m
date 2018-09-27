Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::842; helo=mail-qt1-x842.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="fP9nYHI4"; 
 dkim-atps=neutral
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42LKg224c0zF3Ll
 for <openbmc@lists.ozlabs.org>; Thu, 27 Sep 2018 13:14:54 +1000 (AEST)
Received: by mail-qt1-x842.google.com with SMTP id l2-v6so1208993qtr.12
 for <openbmc@lists.ozlabs.org>; Wed, 26 Sep 2018 20:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cKgLph78qRZFq6tvtp1QjFO+mqXdlSWTwvpo7hDQH2I=;
 b=fP9nYHI4Eo/KZnqM4tDDUEwkAGKd0cnxNjhoGFmJN35OX1le7rkvhvMW6CTxGn9M0b
 3UkSu+Rw3dJGPt3TmJzL2/wd6NBHZwoyMd2zpkn7omrwqMmjdeY3yoQzdb0uY5vu9DcT
 KQymykkoqQEDxBOoWwBbBm9ZCdtfjM2XgjUP4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cKgLph78qRZFq6tvtp1QjFO+mqXdlSWTwvpo7hDQH2I=;
 b=cZbVVLDiKKkhQWrWL++3yYIzWuCIoKPkP/BY5yOmz9NYpu8WNvDC/7gVNxwO9rqQEx
 QSVYW1qun4uSfRzAqXp4EWT920+9roGiWniMhV5v6NpV4xV5OOlJKh1Ukyi0DlW7lGpq
 HQpzXi/vHHf7Hxylw0jKeJqgluoWZiwuKdlmYkvSE5X+f/O7XUMECGzNFFou7VK2qE7s
 2rnsHuNVEW0Kw2atv+CGN0W+G9UKmgmaNcHNL5en70HtbryOttySYnzcsaSkkygIgo5c
 HaKzBU6uoO3VXAIYKnEgLr7Mo06yVLpwarHhylbCvLTuoyT+qrLZ9RdQBrwnOWAHexZp
 lwug==
X-Gm-Message-State: ABuFfoipIlwQQeoB/WxSrnOSb1OUlBgidENKohti7JC3JenDH7KVmPMO
 QuLrqE9Z1oH96fRa4lzpBwjIRbgs4h5VkomTP8M=
X-Google-Smtp-Source: ACcGV6007fHWRnnrvcMDW8W1E1F42/pDdrpf7B9B31x8fUy+6zcAxz//5By621sDkL3EDiYPWpL6bVTjFfGlF9pj24A=
X-Received: by 2002:a0c:eac3:: with SMTP id y3-v6mr6388549qvp.89.1538018091779; 
 Wed, 26 Sep 2018 20:14:51 -0700 (PDT)
MIME-Version: 1.0
References: <20180919164712.4030353-1-vijaykhemka@fb.com>
 <20180926230026.GA26508@bogus>
In-Reply-To: <20180926230026.GA26508@bogus>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 27 Sep 2018 07:14:39 +0400
Message-ID: <CACPK8XctuiN8yphXFUmwXnpphb5LP2i8Cje_HAdsBwMWSvpsdA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] ARM: dt-bindings: Add vendor prefix for Facebook
To: Rob Herring <robh@kernel.org>
Cc: vijaykhemka@fb.com, OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 devicetree <devicetree@vger.kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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
X-List-Received-Date: Thu, 27 Sep 2018 03:14:54 -0000

On Thu, 27 Sep 2018 at 03:01, Rob Herring <robh@kernel.org> wrote:
>
> On Wed, 19 Sep 2018 09:47:10 -0700, Vijay Khemka wrote:
> > Initial introduction of Facebook TiogaPass family equipped with
> > Aspeed 2500 BMC SoC. TiogaPass is a x86 server development kit
> > with a ASPEED ast2500 BMC manufactured by Facebook.
> >
> > This adds an entry of Facebook in Documentation for vendor prefix
> >
> > Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>
> > ---
> >  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
> >  1 file changed, 1 insertion(+)
> >
>
> Reviewed-by: Rob Herring <robh@kernel.org>

Rob, can you take this through the dt tree? I've already merged
Vijay's device tree through the arm soc tree, and don't plan on
sending another pull req for 4.20 at this stage.

Cheers,

Joel
