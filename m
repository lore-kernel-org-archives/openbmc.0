Return-Path: <avifishman70@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c0b::244; helo=mail-it0-x244.google.com;
 envelope-from=avifishman70@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="nVrhiW7f"; 
 dkim-atps=neutral
Received: from mail-it0-x244.google.com (mail-it0-x244.google.com
 [IPv6:2607:f8b0:4001:c0b::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40wwMD1hgSzDrYf
 for <openbmc@lists.ozlabs.org>; Thu, 31 May 2018 02:01:43 +1000 (AEST)
Received: by mail-it0-x244.google.com with SMTP id q4-v6so24123148ite.3
 for <openbmc@lists.ozlabs.org>; Wed, 30 May 2018 09:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=j2a/VYM3KQClcjM+Ikupiud4n2mw87Velhk/QRJUYME=;
 b=nVrhiW7fzvRtf1DWaIcfkSr6NULl4CLae6LKqPaoE8I/dtfVVVL1fwKd9Bzbpcrgij
 jEdU2JodIvL2UovYFJv/j3F1v391yW5NJsxeVkB5ltb0crUZD3N/xVHj3v5dEv7WwDj+
 jNZNTsHXIpqZjB+c8WMXyKS29WS8Z8IO9Ve0UOTE6Mvq2xKYJpQkKS0PJfV11Y9m94AS
 fD7G6Dz95kCZCP4IVXIHyH2k6/jmVbZ1VtmFFDt2fB9gWEYlEiHTukN1nAp9Qlajg8IM
 Gsd7ZebmWsCU4k4zUSaSoqmo0z/57Ijv1yGP4PGkAcKmtVa+sJchPZhWftEAehMDPU6C
 oR9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=j2a/VYM3KQClcjM+Ikupiud4n2mw87Velhk/QRJUYME=;
 b=EALpy5sEYM5j+q/xuytfQwiZ674oRm/cIrlB2hcb//O+1ducZu+nzkXXjEa99r5Wjp
 az2CF/Ne9U3nGwgaJue9cThnT0cF+st0y6O+cD5zOKic7kOOL87zb3mnuH96j914+muK
 1CwXphPTzh3ETck67J1nX5sgUqIFMXCx2/wt2ar5ATPkDkt4c8z7BcY1aaUY/8B8kNtT
 2F0hBAvVKdg+1ndgjaYTV/v2ulcM2cB8qbiy2n5am5N77nc0VvPxF4b3IesQJsPeNC/y
 epkcsJHsA9RnzYIjL7faINyoUHBos/0j6Z/CZl6TcPtEfpYy5ZsaRMZrD/TjgQr+f9Wr
 8Bsw==
X-Gm-Message-State: APt69E1yf7R6f071YKHUBYhtktU3Ad6joUNJAraSFetv4RxsyjzI2zqW
 NqvJKWD1f3dTk8hfxmFeS0r7pyXc8pLtUikA1g==
X-Google-Smtp-Source: ADUXVKIotNhvgMgNYX3Rmlq5qD4nxX2W6fgE/+VYOFZ2o3SkOgLbFPjXjjlwYaS/+XR/mISnjLRCEYi0ZS9nQbIJZik=
X-Received: by 2002:a24:c546:: with SMTP id
 f67-v6mr2398067itg.118.1527696101712; 
 Wed, 30 May 2018 09:01:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4f:ba01:0:0:0:0:0 with HTTP; Wed, 30 May 2018 09:01:40
 -0700 (PDT)
In-Reply-To: <1527582935-31175-1-git-send-email-avifishman70@gmail.com>
References: <1527582935-31175-1-git-send-email-avifishman70@gmail.com>
From: Avi Fishman <avifishman70@gmail.com>
Date: Wed, 30 May 2018 19:01:40 +0300
Message-ID: <CAKKbWA5zu2ty-OapQMiYXWg6wk0UisPq56gow7_1Tti_fg7fkw@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] USB host: Add USB ehci support for nuvoton npcm7xx
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stern@rowland.harvard.edu
Cc: Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
 Brendan Higgins <brendanhiggins@google.com>, mathias.nyman@linux.intel.com, 
 bjorn.andersson@linaro.org, jhogan@kernel.org, albeu@free.fr, 
 chunfeng.yun@mediatek.com, tony@atomide.com, baolu.lu@linux.intel.com, 
 elder@linaro.org, digetx@gmail.com, kstewart@linuxfoundation.org, 
 hdegoede@redhat.com, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-usb@vger.kernel.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 devicetree <devicetree@vger.kernel.org>, davem@davemloft.net, 
 mchehab+samsung@kernel.org, akpm@linux-foundation.org, rdunlap@infradead.org
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
X-List-Received-Date: Wed, 30 May 2018 16:01:45 -0000

From: Avi Fishman <AviFishman70@gmail.com>

This patch adds support for ehci controller for the Nuvoton npcm7xx platform.
Most of the code was taken from ehci-spear.c + specific initialization code

Avi Fishman (3):
  USB host: Add USB ehci support for nuvoton npcm7xx platform
  USB: DT probing support to ehci-npcm7xx
  MAINTAINERS: add subfolders for nuvoton *npcm*

 .../devicetree/bindings/usb/npcm7xx-usb.txt        |  18 ++
 MAINTAINERS                                        |   3 +
 drivers/usb/host/Kconfig                           |   8 +
 drivers/usb/host/Makefile                          |   1 +
 drivers/usb/host/ehci-npcm7xx.c                    | 212 +++++++++++++++++++++
 5 files changed, 242 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/npcm7xx-usb.txt
 create mode 100644 drivers/usb/host/ehci-npcm7xx.c


-- 
2.14.1
