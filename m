Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c09::241; helo=mail-qk0-x241.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="JGgwVKa+"; 
 dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="bz8wj4hc"; 
 dkim-atps=neutral
Received: from mail-qk0-x241.google.com (mail-qk0-x241.google.com
 [IPv6:2607:f8b0:400d:c09::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40nL9V1BqSzF29J
 for <openbmc@lists.ozlabs.org>; Fri, 18 May 2018 17:57:01 +1000 (AEST)
Received: by mail-qk0-x241.google.com with SMTP id z75-v6so5741052qkb.6
 for <openbmc@lists.ozlabs.org>; Fri, 18 May 2018 00:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=X/WzRWtqivpnc2pqMVG7zJFA94PQwyv6donZsktDo1M=;
 b=JGgwVKa+gHYc9SKKn8xmGkPozjx01SQvxC4blWV3ap/Y86hxlduexvS5HNfL4ipmlh
 QnzcleaqDw4B1/r144tE+LGY5hgia7goXavadTkAFJAP/Ci+7eV8bKY6fI3wQIb0Mo5K
 /9ARO0grYut4lQ4vuSLiAVtQqAM/6PBT+JxdzrSCz04amATnXvdjpvozlGVbELQ0+d0P
 1v606ooTPyaoB+IxfueDJ0d4B28A/4EQ5C0sucOdoUUMxlIhx+7qhZE4gwtirWoZfqH5
 yFUiSYbh+Z4tXwvKrTXmKOmxJKnPp9mP2B+aEcVDP8tQOeI59Ioq0y7VtiV41turgUch
 IKEw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=X/WzRWtqivpnc2pqMVG7zJFA94PQwyv6donZsktDo1M=;
 b=bz8wj4hc47mphHI6qpnn0dV9GnAGMHAcrlmwWbovZAhGbOuN6CD3ez9l1gzakQEA7F
 WwL+EF1Oab3lEFaLZylBwEZcsmF8aZ/5r1KC7JAW0Kx/m2SQfmncghEYkh/5fSCvVqzD
 5Fo0mTabUq9LNpvptmXN8d8M65aPLAe70hDks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=X/WzRWtqivpnc2pqMVG7zJFA94PQwyv6donZsktDo1M=;
 b=qc0Hx2btKms5qmn506U5rfcCgyopZ7b83V/gijQOVQofPUTDwpQrip0re+6r7uYTnz
 2DGjT0vRQszB4+aDoe4Q9iYkupyn18fTEjfsviT4JRFsV60yRQ7etRLjZq6wzSY4aZoa
 8dXhBSHuJLeSNkoJnV2n10rBG5leNFfVdtKmvP2rnNrnjBLyZ/faF1pYJAmVhdcmbayx
 j1Hl8R5pQq4Vbpu1OECCnK4iWExWqHyaxkH3ycscevfrrZ/U2dppUymxs8H09DpG6dUX
 o+Ou7EmTqmIdVaM+mvvGayabGQRv3uPCIBUraOjn+ZelgXaZD2vH/uKkqnbBh4ER4SRP
 VCww==
X-Gm-Message-State: ALKqPwc3J/jg2mhorpKSM088P7A1Zqz2vGWsUPkWrgN1cTQ7NmcgtMNX
 ZmGNxx2Frv1BNrUWhYm1j8PttgJSFltHecE3CvcZTQ==
X-Google-Smtp-Source: AB8JxZpfPHnB75nt5GXWdgK1oRGpkZXhi22QCvcXcmjCII+EAFMuH16Y12utVPKboMW3mrU5MJ2zeU4K5/lnid1HyRw=
X-Received: by 2002:a37:11e0:: with SMTP id
 93-v6mr7407301qkr.370.1526630218735; 
 Fri, 18 May 2018 00:56:58 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.24.79 with HTTP; Fri, 18 May 2018 00:56:38 -0700 (PDT)
In-Reply-To: <1526563450-20630-1-git-send-email-tmaimon77@gmail.com>
References: <1526563450-20630-1-git-send-email-tmaimon77@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 18 May 2018 17:26:38 +0930
X-Google-Sender-Auth: 5mYdDo_ZLr3JnwrMbSFDH3sCJPk
Message-ID: <CACPK8Xf9V-PQCJJNLLnMTu-xGXsdbVqQ58HQo_pAsU1-Ey0_OA@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.13 v2 0/2] pinctrl: npcm: add NPCM7xx pinctrl
 driver
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 18 May 2018 07:57:02 -0000

On 17 May 2018 at 22:54, Tomer Maimon <tmaimon77@gmail.com> wrote:
> Changes since version 1:
> fixed comments from Andrew Jeffery<andrew@aj.id.au>:
> https://patchwork.ozlabs.org/patch/853395/
>
> This patch set adds pin controller support for the
> Nuvoton NPCM7xx Baseboard Management Controller (BMC).
>
> The NPCM7XX Pin Controller multi-function routed
> through the multiplexing block, Each pin supports
> GPIO functionality (GPIOx) and multiple functions
> that directly connect the pin to different hardware
> blocks.

I've applied these to dev-4.13.

How is the upstream submission going?

Cheers,

Joel

>
> Tomer Maimon (2):
>   dt-binding: pinctrl: document NPCM7xx pin controller DT bindings
>   pinctrl: npcm: add NPCM7xx pin control driver
>
>  .../bindings/pinctrl/nuvoton,npcm7xx-pinctrl.txt   |   70 +
>  drivers/pinctrl/Kconfig                            |    1 +
>  drivers/pinctrl/Makefile                           |    2 +
>  drivers/pinctrl/nuvoton/Kconfig                    |   12 +
>  drivers/pinctrl/nuvoton/Makefile                   |    1 +
>  drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c          | 2133 ++++++++++++++++++++
>  6 files changed, 2219 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/nuvoton,npcm7xx-pinctrl.txt
>  create mode 100644 drivers/pinctrl/nuvoton/Kconfig
>  create mode 100644 drivers/pinctrl/nuvoton/Makefile
>  create mode 100644 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
>
> --
> 2.14.1
>
