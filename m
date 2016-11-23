Return-Path: <joel.stan@gmail.com>
Received: from mail-ua0-x241.google.com (mail-ua0-x241.google.com
 [IPv6:2607:f8b0:400c:c08::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tNmt44YRxzDvsv
 for <openbmc@lists.ozlabs.org>; Wed, 23 Nov 2016 13:45:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="kEgcYkpr"; 
 dkim-atps=neutral
Received: by mail-ua0-x241.google.com with SMTP id 50so15860uae.2
 for <openbmc@lists.ozlabs.org>; Tue, 22 Nov 2016 18:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=t85tfwjLniyYM2T9XQyWwQRx2imGkPZNJFBBFeOZ68M=;
 b=kEgcYkprHYHhPCmwOYAPcDhRMxJz/1QImMwJaZVDWoUe9D+hSJCofn+3XWQdzo52ET
 PP1/r90VgVRXj2tCm38vrkdmcBOVPzy02ri7PP0fySvl6fzRdK/FG+YS5/L/8NUA6f0X
 ZyzfGHuswhhqPP4Ki8AEmKG0uAdvG60iIRMOXC8ixb9dc9fglqigQzOMs7ECzomHBd+S
 hVs3aBHmYQOFqhSZfmigSkiWZ7XYxNGgatybGk03eMkTL7HsMTwTeFIFPzg6MTaVsMr5
 aJZZ1BhaSrDDFP5Ps0nrHLR4JK93Uq+b3XxEORECzn8vsP/wOTSvtIhozVDxz8vsW8Fc
 b7wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=t85tfwjLniyYM2T9XQyWwQRx2imGkPZNJFBBFeOZ68M=;
 b=ScsHEtkOaLqoGa+p7yBnPGTyrbDuMMKekwV3lBvtXMQGQ2mZT6h1fr1SII3VI9/oht
 j9yW+2YVD4habFkYkRPSNURm1ILncjjdlU4keZBeHvA5es9NppHJHmJToGEgY7uaycfV
 Fy432sCZKw3GRKbOylJ5vQhXZizuDEzspcNnMxOSDXRSLAPDM44NiNZWR7SD3H1oZxsh
 WegEYR/LeMhBq85jgsVTXcj/v1+pnRBsZvAAtKktIrES93BrMpD20v63t+Us2ZvRzlRL
 cv5OlY+MnYFudmpbjhb+qReRPesD3icpn1M4ChkzqnpB2I6Mv95Eplk7y1qpksiPyvz8
 PJEg==
X-Gm-Message-State: AKaTC01Zok0KuQuNkFq8hNjfstjVSxJ8DEUILxxy3+XTIaVCYWvCyrRC6IGESB2EOvQa/tYxCgEY9iKQGygs5Q==
X-Received: by 10.176.82.157 with SMTP id v29mr470511uav.123.1479869146221;
 Tue, 22 Nov 2016 18:45:46 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.0.193 with HTTP; Tue, 22 Nov 2016 18:45:25 -0800 (PST)
In-Reply-To: <1479626856-18511-1-git-send-email-jaghu@google.com>
References: <1479626856-18511-1-git-send-email-jaghu@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 23 Nov 2016 13:15:25 +1030
X-Google-Sender-Auth: UCGYWWrsheK0PnI3y7uIMJuHXus
Message-ID: <CACPK8XfHxnYWBho6-r7xkbRm2LETK6ZpKagc6mjWd6xmuXYd+Q@mail.gmail.com>
Subject: Re: [PATCH linux v5 0/4] Seven segment display support
To: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 23 Nov 2016 02:45:49 -0000

We spoke on IRC about the clock changes. Lets wait until those issues
are addressed before reviewing this series.

Cheers,

Joel

On Sun, Nov 20, 2016 at 5:57 PM, Jaghathiswari Rankappagounder
Natarajan <jaghu@google.com> wrote:
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
> character device file on EVB AST2500 board and on Zaius board.
>
> A changelog between versions is included in the individual patches. Please
> provide feedback.
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
>  drivers/misc/seven_seg_disp.c                      | 197 ++++++++++++++++++++
>  drivers/misc/seven_seg_disp.h                      |  34 ++++
>  drivers/misc/seven_seg_gpio.c                      | 206 +++++++++++++++++++++
>  7 files changed, 490 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/misc/seven-seg-gpio.txt
>  create mode 100644 drivers/misc/seven_seg_disp.c
>  create mode 100644 drivers/misc/seven_seg_disp.h
>  create mode 100644 drivers/misc/seven_seg_gpio.c
>
> --
> 2.8.0.rc3.226.g39d4020
>
