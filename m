Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x241.google.com (mail-vk0-x241.google.com
 [IPv6:2607:f8b0:400c:c05::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vJjjD4JdczDqGV
 for <openbmc@lists.ozlabs.org>; Thu,  9 Feb 2017 14:09:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="tYvMetF3"; 
 dkim-atps=neutral
Received: by mail-vk0-x241.google.com with SMTP id r136so13468114vke.1
 for <openbmc@lists.ozlabs.org>; Wed, 08 Feb 2017 19:09:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=zgE0XdiOCAeRjBlIiA6gGQSkR7z8bvgSTqrjoAcrtYg=;
 b=tYvMetF3+PjGdZQn+igKnTGBmCj01JSp82k4n/AepFE3SHblSq9yFPoM6VgbLPCGmz
 R2SWan+EyME0hYY2rmBwZni7y9gPDvIj4ALHPOvPPvqOTa9k987si7RuV2ptrKUSRduV
 045lYmw7J5XzHHGcZHNSDojh4L6w9YwnUFaW1F1KymkwMHgJZ0CZz+1+WOYgUgjLvICm
 7mz4HPNH7nyYytDK5DfYogW7qkBh5P6frqbNaeEOBl42Om+1eOdiSp5LbiQlGtvnKJ4p
 ZmypE1AKAfhRJhcK52YQG5CDiX5foaOZ6kIvxgWwIkZt/IffWyiMZB7EwcBeYANHxkuY
 DDbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=zgE0XdiOCAeRjBlIiA6gGQSkR7z8bvgSTqrjoAcrtYg=;
 b=JEvO2kgFlDlyWq3ForvY7X3OrNXZukKCZ9iryP0euQtUQpF9RsRNM5a8OkBlcJ5wU7
 Y+Ng/4/CsAFZJfnw/Bo+8Erlaiq/LOm8dEr8t6Y7xgBNA/rvHputI8vqzjwfiFoGjIKY
 5MCI2HkqHyzY4299PxUVe/ZE8fGu4J4CtepMjtM7KVPyWETrT53KrX369xXvKxfkPzAd
 kwEq5MpvcKNkKuA2iBHIq8+L4RrEuuI3h1c6N1TZTe2kr18SZfwPsYig5RlmnB0ZCY1+
 O0j0pE7xx3RRAuKHNqeyDS0zPOO9MC3X8TLJpuCNj5uEqii4QuoiKwvx6v9QCebZpm7M
 JWcA==
X-Gm-Message-State: AMke39klAqK8ResCJyX8xNzL8Jv2BdIx1bIwoNnpUDs3F+OYiOTr18PIj+affRFFFw9s1UcXkFaL8gt1n7DU0g==
X-Received: by 10.31.92.1 with SMTP id q1mr378311vkb.151.1486609758104; Wed,
 08 Feb 2017 19:09:18 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.92.150 with HTTP; Wed, 8 Feb 2017 19:08:57 -0800 (PST)
In-Reply-To: <20170207040356.9891-1-jaghu@google.com>
References: <20170207040356.9891-1-jaghu@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 9 Feb 2017 13:38:57 +1030
X-Google-Sender-Auth: GP6gqxPZwP6OlDdoVWvcsio21EU
Message-ID: <CACPK8Xc9XftoeQPd0O6s+VgxX0mqZrPkK4nxmiTxArWBwe6TqQ@mail.gmail.com>
Subject: Re: [PATCH linux v1 0/4] Seven segment display support
To: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Nancy Yuen <yuenn@google.com>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Thu, 09 Feb 2017 03:09:21 -0000

Hello Jagha,

On Tue, Feb 7, 2017 at 2:33 PM, Jaghathiswari Rankappagounder
Natarajan <jaghu@google.com> wrote:
> Hi Joel,
> Nancy mentioned this patch can be included into openbmc linux tree now.
> Some other member will take up the work of addressing the comments from
> upstream reviewers and send the patch upstream.

Just before you sent these patches we had a chat on the topic. I
thought we decided to give the rest of this week for people to review
the new process, and then on Monday I would publish a tree based on
4.10 that you could submit patches to. Sorry for not making this
clear.

I suspect this set will apply to 4.10 as-is, so I will consider this
your submission for the 4.10 tree next week.

Next time please have a read of the development process[1] and the
rules for submitting patches[2] before sending patches. In particular,
you need to set the target branch in the subject line so I know where
you want the patches applied. If you you have any questions about the
process please let me know so I can update the documentation.

[1] https://github.com/openbmc/linux/wiki/DevelopmentProcess
[2] https://github.com/openbmc/linux/wiki/SubmittingPatches

Cheers,

Joel

>
> This patchset includes:
>
> Documentation for the binding which provides an interface for adding clock,
> data and clear signal GPIO lines to control seven segment display.
>
> The platform device driver provides an API for displaying on two 7-segment
> displays, and implements the required bit-banging. The hardware assumed is
> 74HC164 wired to two 7-segment displays.
>
> The character device driver implements the user-space API for letting a user
> write to two 7-segment displays including any conversion methods necessary
> to map the user input to two 7-segment displays.
>
> Adding clock, data and clear signal GPIO lines in the devicetree to control
> seven segment display on zaius platform.
>
> The platform driver matches on the device tree node; the platform driver also
> initializes the character device.
>
> Tested that the seven segment display works properly by writing to the
> character device file on a EVB AST2500 board which also has 74HC164 wired
> to two 7-segment displays.
>
> Jaghathiswari Rankappagounder Natarajan (4):
>   Documentation: dt-bindings: Document bindings for seven segment
>     display support
>   drivers: misc: Character device driver for seven segment display
>   drivers: misc: Platform driver for seven segment display support
>   arm: dts: Add dt-binding to support seven segment display on zaius
>
>  .../devicetree/bindings/misc/seven-seg-gpio.txt    |  27 +++
>  arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts         |   8 +
>  drivers/misc/Kconfig                               |  16 ++
>  drivers/misc/Makefile                              |   2 +
>  drivers/misc/seven_seg_disp.c                      | 201 ++++++++++++++++++++
>  drivers/misc/seven_seg_disp.h                      |  34 ++++
>  drivers/misc/seven_seg_gpio.c                      | 206 +++++++++++++++++++++
>  7 files changed, 494 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/misc/seven-seg-gpio.txt
>  create mode 100644 drivers/misc/seven_seg_disp.c
>  create mode 100644 drivers/misc/seven_seg_disp.h
>  create mode 100644 drivers/misc/seven_seg_gpio.c
>
> --
> 2.11.0.483.g087da7b7c-goog
>
