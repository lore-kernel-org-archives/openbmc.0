Return-Path: <avifishman70@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c0b::242; helo=mail-it0-x242.google.com;
 envelope-from=avifishman70@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="BP59+D9u"; 
 dkim-atps=neutral
Received: from mail-it0-x242.google.com (mail-it0-x242.google.com
 [IPv6:2607:f8b0:4001:c0b::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40xSzb0gTGzDrYf
 for <openbmc@lists.ozlabs.org>; Thu, 31 May 2018 23:31:38 +1000 (AEST)
Received: by mail-it0-x242.google.com with SMTP id d10-v6so27598890itj.1
 for <openbmc@lists.ozlabs.org>; Thu, 31 May 2018 06:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=+PCgqo8w2bjopx8x529AI+NMkNKbNVMCp6qICNCPHDw=;
 b=BP59+D9une3/PCZqboRAWwkTXVCOlWcfxYCKTkCsP9ooWaNDDVR6JTckQs3SuXkT7Y
 QuEaOko9YoYycsol4zNDOte6sqrBigYs8g3eknxNQu+95AWolO8Y1tp+UQhuHDxUDtKu
 ojIkPNrC1SwPpy797ZLx8DJnZB+otYlQw3YkEAkv/+0DmsfTivWDTHBPSvap4NAX/e9J
 kinwC2ycImc6vCMV8EEf5hny2UNw6umbDPWrANdJAlTtpOaMrhzJDf5ivxhMSqEqD5OD
 OlE6DAl2DFyk7MmS3gvb2N695fW52Te7GHiQ5NcVoA4+kJjipY2uKm2fyP2MiHDx4oKI
 8Snw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=+PCgqo8w2bjopx8x529AI+NMkNKbNVMCp6qICNCPHDw=;
 b=E6EKrY4aMUGyHDsyAE836qXoeJkKhBQ5btRpm3+3vtmoOp+FaihOpXupE6tiKXm5A4
 +/UZAtrEDs4RYsLB7sOhXrIpYWtHd+0rKJL9o786cJ08vtj0NE3jYevvUYEVfFpX8dpM
 rLyaScqJ0soaFo4ERGoDsM3kI2N+zzio+R3eRGywzj8978UVMqr1jqr5jPmLCwbYKyhK
 NeulVndTZr4yEpFfI+ogt4q6i3a1pMI6ovSp6XI680AqwcqQmbEQXmkEwleA3uJwc+4l
 rZfha6IaA/AVd7YXprwYysVljX8fwsIuCoTk9k5Z0nPgFsaUMzwIiz1iEouPrEWoE3xJ
 reZA==
X-Gm-Message-State: APt69E3z6ToibAw7HI6EErXfYONc32+SvyWOLzn5cVUsfUOnUMoMuGBf
 PoAcSQWPOMiBFkt17GI3hhV0IkbQpVf0h6XRxQ==
X-Google-Smtp-Source: ADUXVKL4e+0aaZJaWEhnGckLU+TNw4r8V4YZT6Tz1DmUG4KSwm6s2o3gAz0Lw4CKsgqHj+v9R6i2vBJnrjGjrbXsBic=
X-Received: by 2002:a24:320d:: with SMTP id
 j13-v6mr5585176ita.129.1527773496320; 
 Thu, 31 May 2018 06:31:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4f:ba01:0:0:0:0:0 with HTTP; Thu, 31 May 2018 06:31:35
 -0700 (PDT)
In-Reply-To: <CAKKbWA6CF3M7+ohT5dsrmQbR_S1om+zQVgakAsYb165PBctadA@mail.gmail.com>
References: <1527773132-7491-1-git-send-email-AviFishman70@gmail.com>
 <CAKKbWA6CF3M7+ohT5dsrmQbR_S1om+zQVgakAsYb165PBctadA@mail.gmail.com>
From: Avi Fishman <avifishman70@gmail.com>
Date: Thu, 31 May 2018 16:31:35 +0300
Message-ID: <CAKKbWA7iyokX8sC=EyCB+53TsmD-aHZegX0kcsNpmfpyRhhSeg@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] USB host: Add USB ehci support for nuvoton npcm7xx
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alan Stern <stern@rowland.harvard.edu>
Cc: Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
 Brendan Higgins <brendanhiggins@google.com>, mathias.nyman@linux.intel.com, 
 bjorn.andersson@linaro.org, jhogan@kernel.org, albeu@free.fr, 
 chunfeng.yun@mediatek.com, Tony Lindgren <tony@atomide.com>,
 baolu.lu@linux.intel.com, 
 Alex Elder <elder@linaro.org>, Dmitry Osipenko <digetx@gmail.com>, 
 Kate Stewart <kstewart@linuxfoundation.org>, hdegoede@redhat.com, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-usb@vger.kernel.org, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Rob Herring <robh+dt@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>,
 davem@davemloft.net, 
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
X-List-Received-Date: Thu, 31 May 2018 13:31:40 -0000

Changes since version 1:
- Follow Rob comments in device tree documentation
- minor log error fix in ehci-npcm7xx.c

This patch adds support for ehci controller for the Nuvoton npcm7xx platform.
Most of the code was taken from ehci-spear.c + specific initialization code

Avi Fishman (3):
  USB host: Add USB ehci support for nuvoton npcm7xx platform
  USB: DT probing support to ehci-npcm7xx
  MAINTAINERS: add subfolders for nuvoton *npcm*

 .../devicetree/bindings/usb/npcm7xx-usb.txt        |  17 ++
 MAINTAINERS                                        |   3 +
 drivers/usb/host/Kconfig                           |   8 +
 drivers/usb/host/Makefile                          |   1 +
 drivers/usb/host/ehci-npcm7xx.c                    | 212 +++++++++++++++++++++
 5 files changed, 241 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/npcm7xx-usb.txt
 create mode 100644 drivers/usb/host/ehci-npcm7xx.c


-- 
2.14.1
