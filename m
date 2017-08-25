Return-Path: <linus.walleij@linaro.org>
Received: from mail-oi0-x229.google.com (mail-oi0-x229.google.com
 [IPv6:2607:f8b0:4003:c06::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xdvYZ0LG2zDrSb
 for <openbmc@lists.ozlabs.org>; Fri, 25 Aug 2017 18:32:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="hV5geJQj"; 
 dkim-atps=neutral
Received: by mail-oi0-x229.google.com with SMTP id j144so15459602oib.1
 for <openbmc@lists.ozlabs.org>; Fri, 25 Aug 2017 01:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=ac/PLIdHhlHrBhmjVL8NcT/6PvvWTLDaNYk9g9UKxxo=;
 b=hV5geJQjrdbQBvnQ+ma/SAKp1rBb56YdgsgMqrhw6pyeLExZ3Sc9ZC9a19wa1YdQMG
 OrFMwy6yd4eBKS63I5fs76/JkfWgl41Xxrx7N/ez43A+YKiKSj5NSNSOkSaF7yXH0Vyc
 pN7zmrzMZf4McnCaHr7HUhYChFCmwdMvZnfhs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=ac/PLIdHhlHrBhmjVL8NcT/6PvvWTLDaNYk9g9UKxxo=;
 b=eEKtjrzx9h9nml3xtNS4hQF4mXg4oOwdesCdtMZxU5Ti8JV7BHhYsRLo8NQncK78nR
 x6fGx9ChLvN7bfT9JvkhyD25wpc/tt1WgDEM4W+MMd63s5eG80yHoWH4sD3LMR7UkDP7
 qWwtI5/tpmuLFuh63XHVhtltgjsez33wwVkdd3fRj/3UGMydbnMFRG+63rj8oavu02Jp
 v1iH9m/s9AcvweTpw1JB/bBNZxEDl4FR3q98dfuJ4ZzngvNP5r3KSl74YovlnvcyFLQ+
 AhX6gFGD38ry4pOA4krK+J15s59AtSfLI5eC4DgvuQuw8fUN/ERD/B/LIXgthJYVZ+gC
 ODqw==
X-Gm-Message-State: AHYfb5gu1chQXVBx/pe8wcJMa/WREog4fdfLEIh8n0Z5rB/IVM6NwB3O
 65saDs3Azu5LTypL0GKpMPw5Cdsy/YNd
X-Received: by 10.202.102.199 with SMTP id m68mr11023300oik.297.1503649965192; 
 Fri, 25 Aug 2017 01:32:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.58.74 with HTTP; Fri, 25 Aug 2017 01:32:44 -0700 (PDT)
In-Reply-To: <CAPLgG==Jj=Ys=SvhOCspSfunbWnuqPySvW9RfuqE8HYnG4C=ZQ@mail.gmail.com>
References: <1503418256-5215-1-git-send-email-oleksandrs@mellanox.com>
 <CACRpkdZePXyo8Q36mBH7OnJU3E=yWPWSGkGUOH=zJFMjM=Yrhw@mail.gmail.com>
 <CAPLgG==Jj=Ys=SvhOCspSfunbWnuqPySvW9RfuqE8HYnG4C=ZQ@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 25 Aug 2017 10:32:44 +0200
Message-ID: <CACRpkdbozWaL0RXyZXjzxYK3JHiqYziSkTGSgGORdptX-rwR8A@mail.gmail.com>
Subject: Re: [patch v6 0/3] JTAG driver introduction
To: Rick Altherr <raltherr@google.com>
Cc: Oleksandr Shamray <oleksandrs@mellanox.com>, 
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 =?UTF-8?B?SmnFmcOtIFDDrXJrbw==?= <jiri@resnulli.us>, 
 Arnd Bergmann <arnd@arndb.de>, system-sw-low-level@mellanox.com, 
 Greg KH <gregkh@linuxfoundation.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 openocd-devel-owner@lists.sourceforge.net, 
 mec@shout.net, Rob Herring <robh+dt@kernel.org>, 
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
 vadimp@maellanox.com, Tobias Klauser <tklauser@distanz.ch>, 
 "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
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
X-List-Received-Date: Fri, 25 Aug 2017 08:32:51 -0000

On Thu, Aug 24, 2017 at 11:37 PM, Rick Altherr <raltherr@google.com> wrote:
> On Thu, Aug 24, 2017 at 2:07 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
>> On Tue, Aug 22, 2017 at 6:10 PM, Oleksandr Shamray
>> <oleksandrs@mellanox.com> wrote:
>>
>>> SoC which are not equipped with JTAG master interface, can be built
>>> on top of JTAG core driver infrastructure, by applying bit-banging of
>>> TDI, TDO, TCK and TMS pins within the hardware specific driver.
>>
>> I guess you mean it should then use GPIO lines for bit-banging?
>>
>> I was wondering about how some JTAG clients like openOCD does
>> this in some cases.
>
> Many common uses of OpenOCD leverage USB devices, such as FTDI FT232R,
> that have a command queue for bitbanging operations.  Managing these
> via libusb is ugly but platform-agnostic.

Incidentally, people are sending patches to expose the FTDI
expanders as common GPIO chips under Linux, so we can
internally in the kernel or from the usersapce character device
access them as "some GPIOs".

>> In my worst nightmare they export GPIO lines using
>> the horrid ABI in /sys/gpio/*
>
> https://sourceforge.net/p/openocd/code/ci/v0.10.0/tree/src/jtag/drivers/sysfsgpio.c

Gnah!
Whoever writes a slot-in replacement making the character device
take precendence wins lots of karma.

> While that is certainly horrible (and slow), mapping in the GPIO
> registers via /dev/mem strikes me as worse:
>
> https://sourceforge.net/p/openocd/code/ci/v0.10.0/tree/src/jtag/drivers/bcm2835gpio.c

Yeah that is quite horrible.

There were reasons to do things like that, but since we have
developed .set_multiple() to hammer several lines in a register
at once, the same efficiency can be achieved using the standard
character device.

Yours,
Linus Walleij
