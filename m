Return-Path: <joel.stan@gmail.com>
Received: from mail-ua0-x241.google.com (mail-ua0-x241.google.com
 [IPv6:2607:f8b0:400c:c08::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3td0yd5kSxzDt3H
 for <openbmc@lists.ozlabs.org>; Tue, 13 Dec 2016 11:32:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="dzQTWB3s"; 
 dkim-atps=neutral
Received: by mail-ua0-x241.google.com with SMTP id 50so10336316uae.2
 for <openbmc@lists.ozlabs.org>; Mon, 12 Dec 2016 16:32:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=Eap1EaiUjif7/Cbjd9+TtxzM9kjQAt6W+UGBZwme7ZU=;
 b=dzQTWB3sJcRZPYJzVn68ey3cCl8yD7AeodJyJ2yuL681sbSP3mSg8hbEU4rw1pvzvl
 wl2QcSXc9ATguEcDOb0Ci0LG+vCivdxghpmNJvkpOy+Q2cR+Vl4t5p5hwugNXEC5cIxo
 fIWeqiFUCIFf09uWoTJ620QbJe7ZrJJAn/1grR1BFkDllS1D8epXEBXde0mySLvcymdC
 tF/G0Wp7SpfflLK7I/eIkHQqXJuYenkoj1vTBvCx1uXKY6IaXTMmYvy7hlyxY/jkLVx1
 nw84QTJdJqA+OMwCLBRsQFhJ1f1I+oQQ8gSVhTksDNFGLNt33XeLPB9pRU5cPAD5YE/2
 6vlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=Eap1EaiUjif7/Cbjd9+TtxzM9kjQAt6W+UGBZwme7ZU=;
 b=lIN9VzT437NrapB7Ad0gLNDGs2QfESJKDyPCWNrEaCSG1OOpZZdBNh03fGNA4egh+I
 fV4jhfTE/+icTh0PSwhBiphhuTFinrUMidAqOTDa8ac2u0RT7atFxsJPNYMlwyX4KNgk
 GoUSeH9I6z5S9qxApAT3I9t3sNV8SyDRjEW6WyYsmhF15OzacLw6Wo24USadzuTylUqt
 MkJQvHrZDV8xktBR1t3wTALIsUdewo386Raia4iNec1OJ/XE6jkY6Bli/2J2ND5jxINE
 IybzG1vnEyhAscbf+V/6auR3P/dtubfPDSriW8FHloW67x5aGC618urgsHItrq1sJk9r
 wwfA==
X-Gm-Message-State: AKaTC03JvHNOUq/ExOoRa8bmIPkPOxY7hYqUXGndGRv3hXncg2IY41wNKagotBHcbLDw1hCj6LnAsCIH/Tcmiw==
X-Received: by 10.176.82.157 with SMTP id v29mr64927623uav.123.1481589127079; 
 Mon, 12 Dec 2016 16:32:07 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.159.48.91 with HTTP; Mon, 12 Dec 2016 16:31:46 -0800 (PST)
In-Reply-To: <CANsWYUUyzxoM6m8F6660AaRBZCytaexg=hPH2JRA7H95jZBRJQ@mail.gmail.com>
References: <1479626856-18511-1-git-send-email-jaghu@google.com>
 <CACPK8XfHxnYWBho6-r7xkbRm2LETK6ZpKagc6mjWd6xmuXYd+Q@mail.gmail.com>
 <CANsWYUUyzxoM6m8F6660AaRBZCytaexg=hPH2JRA7H95jZBRJQ@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 13 Dec 2016 11:31:46 +1100
X-Google-Sender-Auth: 8FIL7f-0ynqDbDWV57PtRkfI6l4
Message-ID: <CACPK8XcZTM1Ha9QGoVmO7-U9+Cbd1AKkB2LvxPR58e2F1YizCg@mail.gmail.com>
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
X-List-Received-Date: Tue, 13 Dec 2016 00:32:10 -0000

Hi Jagha,

On Tue, Dec 13, 2016 at 10:58 AM, Jaghathiswari Rankappagounder
Natarajan <jaghu@google.com> wrote:
> Hi Joel,
> Could you please help review this patch series. Would like to have the seven
> segment display driver for testing out on zaius machine.

I have spent a fair amount of time reading your code. It would be nice
to see other developers take a look as well. Have you asked for review
from your peers?

> (I am trying to get the fan tach driver to work and I hope to send that a> along with pwm driver for review soon.)

If you think this driver is ready to go, I suggest you send it
upstream for wider community review. Same for the pwm driver. Make
sure you cc me so I can help out.

> Also you had mentioned about writing the LPC driver. Is that checked in?

Andrew sent a proposed driver some time ago. Did you have time to review it?

 http://patchwork.ozlabs.org/patch/693032/

I think we may prefer an ioctl based approach, but this is up for debate.

Cheers,

Joel

>
> Thanks,
> Jagha
>
> On Tue, Nov 22, 2016 at 6:45 PM, Joel Stanley <joel@jms.id.au> wrote:
>>
>> We spoke on IRC about the clock changes. Lets wait until those issues
>> are addressed before reviewing this series.
>>
>> Cheers,
>>
>> Joel
>>
>> On Sun, Nov 20, 2016 at 5:57 PM, Jaghathiswari Rankappagounder
>> Natarajan <jaghu@google.com> wrote:
>> > This patchset includes:
>> >
>> > Documentation for the binding which provides an interface for adding
>> > clock,
>> > data and clear signal GPIO lines to control seven segment display.
>> >
>> > The platform device driver provides an API for displaying on two
>> > 7-segment
>> > displays, and implements the required bit-banging. The hardware assumed
>> > is
>> > 74HC164 wired to two 7-segment displays.
>> >
>> > The character device driver implements the user-space API for letting a
>> > user
>> > write to two 7-segment displays including any conversion methods
>> > necessary
>> > to map the user input to two 7-segment displays.
>> >
>> > Adding clock, data and clear signal GPIO lines in the devicetree to
>> > control
>> > seven segment display on zaius platform.
>> >
>> > The platform driver matches on the device tree node; the platform driver
>> > also
>> > initializes the character device.
>> >
>> > Tested that the seven segment display works properly by writing to the
>> > character device file on EVB AST2500 board and on Zaius board.
>> >
>> > A changelog between versions is included in the individual patches.
>> > Please
>> > provide feedback.
>> >
>> > Jaghathiswari Rankappagounder Natarajan (4):
>> >   Documentation: dt-bindings: Document bindings for seven segment
>> >     display support
>> >   drivers: misc: Character device driver for seven segment display
>> >   drivers: misc: Platform driver for seven segment display support
>> >   arm: dts: Add dt-binding to support seven segment display on zaius
>> >
>> >  .../devicetree/bindings/misc/seven-seg-gpio.txt    |  27 +++
>> >  arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts         |   8 +
>> >  drivers/misc/Kconfig                               |  16 ++
>> >  drivers/misc/Makefile                              |   2 +
>> >  drivers/misc/seven_seg_disp.c                      | 197
>> > ++++++++++++++++++++
>> >  drivers/misc/seven_seg_disp.h                      |  34 ++++
>> >  drivers/misc/seven_seg_gpio.c                      | 206
>> > +++++++++++++++++++++
>> >  7 files changed, 490 insertions(+)
>> >  create mode 100644
>> > Documentation/devicetree/bindings/misc/seven-seg-gpio.txt
>> >  create mode 100644 drivers/misc/seven_seg_disp.c
>> >  create mode 100644 drivers/misc/seven_seg_disp.h
>> >  create mode 100644 drivers/misc/seven_seg_gpio.c
>> >
>> > --
>> > 2.8.0.rc3.226.g39d4020
>> >
>
>
