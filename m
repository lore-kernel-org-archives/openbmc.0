Return-Path: <brendanhiggins@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400d:c09::233; helo=mail-qk0-x233.google.com;
 envelope-from=brendanhiggins@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="VgOwtIdW"; 
 dkim-atps=neutral
Received: from mail-qk0-x233.google.com (mail-qk0-x233.google.com
 [IPv6:2607:f8b0:400d:c09::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xnGhM3B4rzDrJ7
 for <openbmc@lists.ozlabs.org>; Wed,  6 Sep 2017 18:19:14 +1000 (AEST)
Received: by mail-qk0-x233.google.com with SMTP id z143so17607547qkb.3
 for <openbmc@lists.ozlabs.org>; Wed, 06 Sep 2017 01:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=5Y4fb2QvLTTO0o38qmXh6+NqvCrTLkTYOPSmgk4t/3o=;
 b=VgOwtIdWcXRhzmhQqE9WSKF3lCo9W78zppxGp7DtnfKRIE5pHGF0on/7P49419ALhJ
 HnIJ5hZTw9T4P+euQT+saEZqPi6i5CUwjz9eexSSg3IV3gLng9k8TO8ZVcYy0ba2byKf
 vUCKHTkXdc5hS6WjH22fi/2S3KElfE7KUATleoO6ppowp8mlCAVgwrCe7UgaYeUR5Tw5
 xuiqZlM9IQBGkipZ95BIZYughMMNUHfnPHlg+AlSj15eEeVl6CISEn+ycW27VLbXRxKT
 UstrIxAAdtPRuoBgV8qsSWndkPuAGzXUOzdYLPs3dsmGzL2xdyz4Oo2KQQmmVW/byyCS
 4cag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=5Y4fb2QvLTTO0o38qmXh6+NqvCrTLkTYOPSmgk4t/3o=;
 b=EdqxnJJf02TnKlqQ4gh2oQ5c9bOtrgbScJ26J3CNOBZ+DiNXpm35vculWSFt7j6ovK
 1OkhY1xDpg8WwNWLHMc2C2f5TMcQa7z/OYwYHfa7QgwH0OaiHW2PL/lVsdECOdyCXImo
 VquckLBnSFP+5BiTRwdMCMipIcDCPnggRP593owzkLHqPRYmRfRr9UBdu9Q238MRMgjV
 kDtyqgwqce9h63rN2eagtu0nx7eo4j/ACO70ZrJy9cuN3fYOtd6koQRngZOAytPiLjz2
 FozaGc6dmG5tACONprt8EKIglgziiGxPTw9u8XCQQA4FaFkQ2itc9ZvVuftcrsPb9KLl
 NHTA==
X-Gm-Message-State: AHPjjUgPsg+HEfMwzsTVOJjx6YaDYYLLyRlJZ+lL1SEfKUUwyykjvi2H
 m2PgqrCJ0aoTxGGEfHAKiXL280MyG7y8
X-Google-Smtp-Source: ADKCNb7GiSGGeGMTEwmx69SxSOfdLRHMym0m9NwpqcZ77exLqJiGLdCAneVbKfc1gI5HQ2hgrJQS1lxDuYVEqGO6Hck=
X-Received: by 10.55.98.19 with SMTP id w19mr2388279qkb.261.1504685951754;
 Wed, 06 Sep 2017 01:19:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.33.197 with HTTP; Wed, 6 Sep 2017 01:19:11 -0700 (PDT)
In-Reply-To: <CACPK8Xc0jrnx96=BoGMwQgoT2brgc0UTNU5HMHXDeFfeToVgxA@mail.gmail.com>
References: <20170906003016.2159-1-brendanhiggins@google.com>
 <20170906003016.2159-3-brendanhiggins@google.com>
 <CACPK8Xc0jrnx96=BoGMwQgoT2brgc0UTNU5HMHXDeFfeToVgxA@mail.gmail.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Wed, 6 Sep 2017 01:19:11 -0700
Message-ID: <CAFd5g45s6yo=HSut76YknOkUeKbV8yOXWbivc=EyM2s7R8DOrA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] arm: dts: add Nuvoton NPCM750 device tree
To: Joel Stanley <joel@jms.id.au>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Russell King <linux@armlinux.org.uk>, avifishman70@gmail.com,
 tmaimon77@gmail.com, 
 Rick Altherr <raltherr@google.com>, Florian Fainelli <f.fainelli@gmail.com>, 
 devicetree <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Wed, 06 Sep 2017 08:19:16 -0000

On Tue, Sep 5, 2017 at 10:23 PM, Joel Stanley <joel@jms.id.au> wrote:
> On Wed, Sep 6, 2017 at 10:00 AM, Brendan Higgins
> <brendanhiggins@google.com> wrote:
>> +++ b/Documentation/devicetree/bindings/arm/npcm/npcm.txt
>> @@ -0,0 +1,6 @@
>> +NPCM Platforms Device Tree Bindings
>> +-----------------------------------
>> +NPCM750 SoC
>> +Required root node properties:
>> +       - compatible = "nuvoton,npcm750";
>> +
>
> This is minimal. I assume there will be more content added as more
> support is added?

Yep, that's the plan. They have a number of similar BMCs, both those
based on different ARM cores and some with different peripheral sets,
so we will probably want to have different compat strings for those.

>
> Does it need it's own directory?

Not sure, I saw that some of the other architectures did it, some did
not. I don't feel strongly about it.

>
>
>> diff --git a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
>> new file mode 100644
>> index 000000000000..54df32cff21b
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
>
>> +
>> +/dts-v1/;
>> +#include "nuvoton-npcm750.dtsi"
>> +
>> +/ {
>> +       model = "Nuvoton npcm750 Development Board (Device Tree)";
>> +       compatible = "nuvoton,npcm750";
>> +
>> +       chosen {
>> +               stdout-path = &serial3;
>> +               bootargs = "earlyprintk=serial,serial3,115200";
>> +       };
>> +
>> +       memory {
>> +               reg = <0 0x40000000>;
>> +       };
>> +
>> +       cpus {
>> +               enable-method = "nuvoton,npcm7xx-smp";
>> +       };
>> +
>> +       clk: clock-controller@f0801000 {
>> +               status = "okay";
>> +       };
>> +
>> +       apb {
>> +               watchdog1: watchdog@f0009000 {
>> +                       status = "okay";
>> +               };
>
> You've already got the label for the node, is there are reason you
> don't use a phandle to set the status?

Addressed in v4.

>
> &watchdog1 {
>    status = "okay";
> };
>
> Same with the serial nodes below.
>
>> +
>> +               serial0: serial0@f0001000 {
>> +                       status = "okay";
>> +               };
>> +
>> +               serial1: serial1@f0002000 {
>> +                       status = "okay";
>> +               };
>> +
>> +               serial2: serial2@f0003000 {
>> +                       status = "okay";
>> +               };
>> +
>> +               serial3: serial3@f0004000 {
>> +                       status = "okay";
>> +               };
>> +       };
