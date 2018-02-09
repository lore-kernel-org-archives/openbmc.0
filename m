Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::230; helo=mail-qt0-x230.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="n2hxmLVF"; 
 dkim-atps=neutral
Received: from mail-qt0-x230.google.com (mail-qt0-x230.google.com
 [IPv6:2607:f8b0:400d:c0d::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zcyWg1pwkzDr8c
 for <openbmc@lists.ozlabs.org>; Fri,  9 Feb 2018 12:43:26 +1100 (AEDT)
Received: by mail-qt0-x230.google.com with SMTP id a9so2155096qtj.8
 for <openbmc@lists.ozlabs.org>; Thu, 08 Feb 2018 17:43:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=AfOHNyGYcBTBFR3GY4iqtNSfPB3lV2BowHOZ54Nq+1Q=;
 b=n2hxmLVF27+p/vyhweSzh381qPQ72dAQ7hUgrkTivjt3X0uSPxk7hT60PdLoK+iadp
 X3TVqkv9fyUnGMynRJ0X38zfzTmfELW0W56FlZAcKUfqfX9kAGWCSpGOp7p50iqe4BW+
 4wTz2FFGAtN7ThQPMZwkfNnOc8TFejVfCEKy/Dc+B/6RcoDIZr6oFrKzJAXFXUxpKI48
 DJu9jWv9jlBTASEdZcm/O8d0XeWCyTz6cYCaXQA+ic3Xqp+h34yAU11B+Q/5Uxfx/T9w
 XT1i40kr87YyeOztE1SX5TMpyw99atOHvTzZV9hwwefouafj7Q5/v2a9KZpCv9PoRPJO
 zOgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=AfOHNyGYcBTBFR3GY4iqtNSfPB3lV2BowHOZ54Nq+1Q=;
 b=DqTcPV7/ts9YEekiihnOWM0ZwWyjsMECnhsDi/CsG/ZmBftL60HnCgCQ+yQP6OFnDM
 KDvdna11AINupIctaDUmerJBSytpeBpLIzrXX0smwW8pBpiRGFHW+T1y/0Wo2SBrMpuR
 BNITXE8OcF5wFtAUzHcS8yJVpWlwFkxO6SYf3HuitA7BRiWrOgoCLojP4/sUxXMQGFUe
 +AjeoApLMhlTToJnHMIMV6yg5B2Qq398ajTXikwgkTkjleDjzDCqrqAmalafGGZvgvDS
 qESp1wJ1IrbMdJdABYL+HUFk1k4pNwZGaz3FtmaklLBtJmgMh7fDAPlzRDOu1M44Ptmo
 6beA==
X-Gm-Message-State: APf1xPCsXxNPiH7e1JaLzCSa0FJbF/rZC48XUf58WLsoHsw8UBt5xfgw
 kuM6N89kFMmhwudrR4wfipG/RIerGOFtSjc3AB8=
X-Google-Smtp-Source: AH8x224LgRo3xQqeGnD+29GT4oeXujaf6kxgt29qSwBa5pyrYkJQzJpxJa6Xt5sCNdxzH0HF2PU2V3R6lp05neOflzI=
X-Received: by 10.200.50.46 with SMTP id x43mr1919108qta.130.1518140604348;
 Thu, 08 Feb 2018 17:43:24 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.50.81 with HTTP; Thu, 8 Feb 2018 17:43:03 -0800 (PST)
In-Reply-To: <599c29f92c5e4849a7c30820442d8f7e@AUSX13MPC105.AMER.DELL.COM>
References: <599c29f92c5e4849a7c30820442d8f7e@AUSX13MPC105.AMER.DELL.COM>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 9 Feb 2018 12:13:03 +1030
X-Google-Sender-Auth: Z3ztVIMlNNZ6ADQsbGdPWdgNvzw
Message-ID: <CACPK8Xc1g0nWhyYhH1wD7p50wt=Nashh9-swRfSiGXTj-L_TGw@mail.gmail.com>
Subject: Re: Serial Mux Mode in NPCM
To: Eugene.Cho@dell.com
Cc: Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Jeremy Kerr <jk@ozlabs.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brian.Berry@dell.com, Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.25
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 09 Feb 2018 01:43:28 -0000

Hey Eugene,

On Fri, Feb 9, 2018 at 7:32 AM,  <Eugene.Cho@dell.com> wrote:
> Any thoughts how we should handle the serial mux mode (SPMOD in SPSWC) in the NPCM? It seems we need to able to switch between modes runtime (as these are customer configurable options that can change at anytime).

Are we talking about the ability to have characters appear on
different ports on the back of a chassis if a user selects an option?
Or is this more about the system integrator deciding that UART2 goes
to connector X, and UART4 goes to connector Y?

Instead of me guessing, perhaps you describe what this looks like to the user?

>
> We use almost all the modes in some fashion...
>
> Could this be a handled like the 8250_aspeed_vuart.c? Maybe another simple sysfs driver? Thoughts?

The vuart driver is about exposing a normal Linux tty serial device
for the UART registers that are part of the LPC bus. This is mostly a
normal 8250 driver, with a pair of sysfs files that configure where
the device appears to the host.

It is then up to userspace (obmc-console) to shuffle characters
to/from that tty device to/from a software console (IPMI SoL", or a
ssh based "SoL"), a physical RS-232 port (exposed to Linux as another
tty device), or log it to a file.

Cheers,

Joel

Cheers,

Joel
