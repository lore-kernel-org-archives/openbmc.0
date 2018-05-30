Return-Path: <avifishman70@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c0b::242; helo=mail-it0-x242.google.com;
 envelope-from=avifishman70@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="f+rI1/uY"; 
 dkim-atps=neutral
Received: from mail-it0-x242.google.com (mail-it0-x242.google.com
 [IPv6:2607:f8b0:4001:c0b::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40wwqX43svzDr61
 for <openbmc@lists.ozlabs.org>; Thu, 31 May 2018 02:22:48 +1000 (AEST)
Received: by mail-it0-x242.google.com with SMTP id j186-v6so24200822ita.5
 for <openbmc@lists.ozlabs.org>; Wed, 30 May 2018 09:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=j2a/VYM3KQClcjM+Ikupiud4n2mw87Velhk/QRJUYME=;
 b=f+rI1/uYqGH2edR1YDTPEZ402tffyASfpq/pzvo5IJeuNp0xax0sgJhhyP9H/KDE0T
 8qj0JtXhRa+CBIYne44UWWlB/fbUu7pGPL3x/bk6m0k8NAyAac1zDLXThIXqGrIvMTRD
 redqPz/Lq11c3b2Vnz5S62fnH+hwd9wUn8eoE61aUzwu6G8F3KzDx6SuCx7MFKNYDD2O
 8W+AYCue8Vpxma3uJxqGAX26yeW4rGiTc42qfnaS2ckyMwg5CFHxOCebDYp6XfvKg1fr
 ipKR0irg3wJKNb3Cww9Q7CuZXvZNJMzBzo/0ZrbtATREK0Kpcn8nV/CAugfLwjrYWYBU
 QWTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=j2a/VYM3KQClcjM+Ikupiud4n2mw87Velhk/QRJUYME=;
 b=rQdx+SQ0UrwrXQR9ugFvM6DOSvKW2wBinVlkK7jWLhblV0k7bgKSRqEWKzLJKaKJcn
 kKsQMFekEJwt1Bahq+Q+uv4c468Vpgd7cabnRYsE9+16mMHBIqFXERb0CsZAeNvxt0ph
 3lFxQ682uJAFjxV6RAFIELm8bbXYBLo5xKlzKSzzcbPi2urrulBiE/rwGaBBJuh8WRVN
 ocvCgoMWFDHyNPhXzXr67OU9OgTuHsx5G0cS0mbZAOghdoMp10vGXEr84FzHoZt3PC5C
 5Bn7iwmM9H++JD11hEsf66+pj+32o8IIzbsJ6tL0VTbf426zC/DQqV+UOSMlW5ueRHK8
 bIaA==
X-Gm-Message-State: APt69E3HxZk1E177elvnQKCLVdvSTLBOaBymog+SAVDRro2jGZJlyk1B
 6DjeRc9cpsTnZ6EPhpGQpzoBXkirviaUbqFpXQ==
X-Google-Smtp-Source: ADUXVKIZjszVMPD3A5TY1sOW9HTG63EP43FzrUsAsf7zc6qhGNEmU6+lB1HH6VHnWttFPcpgIJbbzByfDeWF7RtZrM4=
X-Received: by 2002:a24:4151:: with SMTP id x78-v6mr2334956ita.0.1527697366048; 
 Wed, 30 May 2018 09:22:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4f:ba01:0:0:0:0:0 with HTTP; Wed, 30 May 2018 09:22:45
 -0700 (PDT)
In-Reply-To: <CAKKbWA5zu2ty-OapQMiYXWg6wk0UisPq56gow7_1Tti_fg7fkw@mail.gmail.com>
References: <1527582935-31175-1-git-send-email-avifishman70@gmail.com>
 <CAKKbWA5zu2ty-OapQMiYXWg6wk0UisPq56gow7_1Tti_fg7fkw@mail.gmail.com>
From: Avi Fishman <avifishman70@gmail.com>
Date: Wed, 30 May 2018 19:22:45 +0300
Message-ID: <CAKKbWA7N8aaCkJvMeNg3+3cJs3=AfaF5U8ZH_isVpL3oOs8t9Q@mail.gmail.com>
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
 akpm@linux-foundation.org, rdunlap@infradead.org
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
X-List-Received-Date: Wed, 30 May 2018 16:22:49 -0000

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
