Return-Path: <robh@kernel.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org; envelope-from=robh@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="2oOBvfxg"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 414Mg25KXDzF3Vx
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jun 2018 04:56:11 +1000 (AEST)
Received: from mail-it0-f48.google.com (mail-it0-f48.google.com
 [209.85.214.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CEB6C208B5
 for <openbmc@lists.ozlabs.org>; Mon, 11 Jun 2018 18:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1528743368;
 bh=uOuSeR04aB0L2xNI58oziZVGNpzvPImu9dU4RNiFZEU=;
 h=In-Reply-To:References:From:Date:Subject:To:Cc:From;
 b=2oOBvfxgLi+yimW/LBGJ1noixd+W+2Ls/iSXG9rppMhVRpdHzEuENrpkMoTKA8lz3
 P0OpSP36ZVU4URVagnmEReGbUKM15UzLxqrLpa3yZbL4Yzpc0O0nmwkINj+DAeUNGd
 xkKJPZw+JvJPcpKHWC6199x6y38QA5Hl6sMT1hBo=
Received: by mail-it0-f48.google.com with SMTP id l6-v6so12283921iti.2
 for <openbmc@lists.ozlabs.org>; Mon, 11 Jun 2018 11:56:08 -0700 (PDT)
X-Gm-Message-State: APt69E1wOdJL8Yg9IL7DSfwmAIEL1ns9iGz73GXLbVy7nqswiukuYZgR
 tRcPXEkIMCDUk3VNwInkeovd5we1l3MujSpu2w==
X-Google-Smtp-Source: ADUXVKLHfb1NzFhVt+bY0i5KyLmxs5EYPa5oF6EP5td7WkO2bi4dI7fg4F6aiSB5b5jHuQyLpuhI0Qz/OkAzkCeRnWc=
X-Received: by 2002:a24:798f:: with SMTP id
 z137-v6mr186427itc.19.1528743368188; 
 Mon, 11 Jun 2018 11:56:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4f:6403:0:0:0:0:0 with HTTP; Mon, 11 Jun 2018 11:55:47
 -0700 (PDT)
In-Reply-To: <CAKKbWA4gm1x8VazdMjZ6a9bwGmt=_mZYS2S3FnB2x36Ng+cjCQ@mail.gmail.com>
References: <20180607145821.322979-1-avifishman70@gmail.com>
 <20180607145821.322979-3-avifishman70@gmail.com>
 <20180611181646.GA5537@rob-hp-laptop>
 <CAKKbWA4gm1x8VazdMjZ6a9bwGmt=_mZYS2S3FnB2x36Ng+cjCQ@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 11 Jun 2018 12:55:47 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJYafGzpr8+VQSYJcE5EMo1xZ8NrXTyGBS-7GhU-X+PVg@mail.gmail.com>
Message-ID: <CAL_JsqJYafGzpr8+VQSYJcE5EMo1xZ8NrXTyGBS-7GhU-X+PVg@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] dt-bindings: usb: new ehci-npcm7xx dt
To: Avi Fishman <avifishman70@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alan Stern <stern@rowland.harvard.edu>, 
 Tomer Maimon <tmaimon77@gmail.com>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, 
 Brendan Higgins <brendanhiggins@google.com>,
 Mathias Nyman <mathias.nyman@linux.intel.com>, 
 Bjorn Andersson <bjorn.andersson@linaro.org>, James Hogan <jhogan@kernel.org>,
 Alban <albeu@free.fr>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Tony Lindgren <tony@atomide.com>,
 baolu.lu@linux.intel.com, 
 Alex Elder <elder@linaro.org>, Dmitry Osipenko <digetx@gmail.com>, 
 Kate Stewart <kstewart@linuxfoundation.org>,
 Hans de Goede <hdegoede@redhat.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux USB List <linux-usb@vger.kernel.org>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Mark Rutland <mark.rutland@arm.com>, 
 devicetree <devicetree@vger.kernel.org>
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
X-List-Received-Date: Mon, 11 Jun 2018 18:56:15 -0000

On Mon, Jun 11, 2018 at 12:24 PM, Avi Fishman <avifishman70@gmail.com> wrote:
> On Mon, Jun 11, 2018 at 9:16 PM, Rob Herring <robh@kernel.org> wrote:
>> On Thu, Jun 07, 2018 at 05:58:20PM +0300, avifishman70@gmail.com wrote:
>>> From: Avi Fishman <AviFishman70@gmail.com>
>>>
>>> Device Tree documentation for Nuvoton npcm7xx EHCI.
>>>
>>> Signed-off-by: Avi Fishman <AviFishman70@gmail.com>
>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Rob, if I understand you want me to add another version (v5) with the
> above line (only on the dt)?

No need to *only* do that. Maintainers will collect them on the last
version when they apply patches. You just can't expect that
maintainers will go look at prior versions and collect them.

>>> ---
>>>  Documentation/devicetree/bindings/usb/npcm7xx-usb.txt | 17 +++++++++++++++++
>>>  1 file changed, 17 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/usb/npcm7xx-usb.txt
>>
>> Please add acks/reviewed-bys when posting new versions.
>>
>> Rob
