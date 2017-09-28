Return-Path: <geert.uytterhoeven@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:400c:c09::244; helo=mail-wm0-x244.google.com;
 envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="X8N9zfEz"; 
 dkim-atps=neutral
Received: from mail-wm0-x244.google.com (mail-wm0-x244.google.com
 [IPv6:2a00:1450:400c:c09::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y2nyV49LvzDsPp
 for <openbmc@lists.ozlabs.org>; Thu, 28 Sep 2017 18:33:21 +1000 (AEST)
Received: by mail-wm0-x244.google.com with SMTP id u138so616295wmu.4
 for <openbmc@lists.ozlabs.org>; Thu, 28 Sep 2017 01:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=FJL9dm/7ZlsaQE893hGebXwGqiac4C2PcNh9ircWQ8Q=;
 b=X8N9zfEzucoeiJT9aT6Jdm1AKp/2v/1f8MMmQSzWCdtRSr87LGrfF4u6yfFUZBDPbh
 2+fgmxW1oNUBHEmylXINrnbSYMeo5pD1Bs1ZKNaIilJKlTC81lr/Hlum4Eel5TYzp8uE
 LXmVOQkWFGEmDm6RkMr7jAfWulivayrONt/ARnk16v5dT189D8v9kL7LTJKXltgV7WUs
 dD9vjpQpFlrVaZhWeof+7zlqhXrvWZcYgiYlNUwiqJPKy/HmCgGPi9OYkphm+tvWgjx/
 fM4b91e0ZUN2oHM2adV7vQewJ5FTJzkku4gTENnhXRPE8mb78/4Ciru/b8isan1frQpr
 cTAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=FJL9dm/7ZlsaQE893hGebXwGqiac4C2PcNh9ircWQ8Q=;
 b=b9rYVHM7M/6DtBgS3ZM0Kacf5yUayKwF2e0f+qVymWfgpeoF7w3bJ16qbS25oYToD2
 zt3YdDzhFVL587ye+UDlkxzWQK7cdCpJvxW25c7tpo56CpjUIo9vW0eUYaHaFg5Zre/4
 LeQcYIl76RkFTdbWtROCfXVm8P9rLmWYaDBpzlBt+6LXu2ljgk6LQ658HjuLGvTZI41e
 9FfmQRpye0gL6M0dnP9dTi9DiR69+58nKbjoImmDYQPAYiDASwS3uTpalo0Oy+T+SIfc
 5ZbSyN0t0rvTzS+jDrGYdfsutG2tPHs34ayV5QbIadwTJitBkb+AYx+mSvjmxCAP+cWb
 tqAw==
X-Gm-Message-State: AHPjjUgzGEXJCpmaQapN1wNuQqE0frcg2edIJB1mdqBnMwiQmMIx7D48
 S8sklLdduJVnFHsh9ZgrWjSv5sdTFtlsZuKTkME=
X-Google-Smtp-Source: AOwi7QDbfPUN4h0CanHxpn5JAospxR2VGMF9nOelwXbcDVr20BjteBp50x7wGAKon9NoeJFWWRYEWNvLVNyxXhC0Uu8=
X-Received: by 10.28.36.212 with SMTP id k203mr260094wmk.127.1506587598760;
 Thu, 28 Sep 2017 01:33:18 -0700 (PDT)
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
Received: by 10.223.129.226 with HTTP; Thu, 28 Sep 2017 01:33:18 -0700 (PDT)
In-Reply-To: <1505985932-27568-1-git-send-email-oleksandrs@mellanox.com>
References: <1505985932-27568-1-git-send-email-oleksandrs@mellanox.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 28 Sep 2017 10:33:18 +0200
X-Google-Sender-Auth: ErALBLwzm6Pxb4jxp6dk4SBrX4o
Message-ID: <CAMuHMdWfoYzWPJYaGOhF8qshKhvngwFKs=kvuH62PYif9q9+0g@mail.gmail.com>
Subject: Re: [patch v9 0/4] JTAG driver introduction
To: Oleksandr Shamray <oleksandrs@mellanox.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 openbmc@lists.ozlabs.org, 
 Joel Stanley <joel@jms.id.au>, Jiri Pirko <jiri@resnulli.us>,
 Tobias Klauser <tklauser@distanz.ch>, 
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>, mec@shout.net, 
 Vadim Pasternak <vadimp@mellanox.com>, system-sw-low-level@mellanox.com, 
 Rob Herring <robh+dt@kernel.org>, openocd-devel-owner@lists.sourceforge.net, 
 "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>,
 "David S. Miller" <davem@davemloft.net>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 28 Sep 2017 18:48:06 +1000
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Sep 2017 08:33:23 -0000

Hi Oleksandr,

[My attention was drawn by https://lwn.net/Articles/734440/]
[CC linux-spi, which was never included, while linux-serial was]

On Thu, Sep 21, 2017 at 11:25 AM, Oleksandr Shamray
<oleksandrs@mellanox.com> wrote:
> When a need raise up to use JTAG interface for system's devices
> programming or CPU debugging, usually the user layer
> application implements jtag protocol by bit-bang or using a
> proprietary connection to vendor hardware.
> This method can be slow and not generic.
>
> We propose to implement general JTAG interface and infrastructure
> to communicate with user layer application. In such way, we can
> have the standard JTAG interface core part and separation from
> specific HW implementation.
> This allow new capability to debug the CPU or program system's
> device via BMC without additional devices nor cost.
>
> This patch purpose is to add JTAG master core infrastructure by
> defining new JTAG class and provide generic JTAG interface
> to allow hardware specific drivers to connect this interface.
> This will enable all JTAG drivers to use the common interface
> part and will have separate for hardware implementation.
>
> The JTAG (Joint Test Action Group) core driver provides minimal generic
> JTAG interface, which can be used by hardware specific JTAG master
> controllers. By providing common interface for the JTAG controllers,
> user space device programing is hardware independent.
>
> Modern SoC which in use for embedded system' equipped with
> internal JTAG master interface.
> This interface is used for programming and debugging system's
> hardware components, like CPLD, FPGA, CPU, voltage and
> industrial controllers.
> Firmware for such devices can be upgraded through JTAG interface during
> Runtime. The JTAG standard support for multiple devices programming,
> is in case their lines are daisy-chained together.
>
> For example, systems which equipped with host CPU, BMC SoC or/and
> number of programmable devices are capable to connect a pin and
> select system components dynamically for programming and debugging,
> This is using by the BMC which is equipped with internal SoC master
> controller.
> For example:
>
> BMC JTAG master --> pin selected to CPLDs chain for programming (filed
> upgrade, production)
> BMC JTAG master --> pin selected to voltage monitors for programming
> (field upgrade, production)
> BMC JTAG master --> pin selected to host CPU (on-site debugging
> and developers debugging)
>
> For example, we can have application in user space which using calls
> to JTAG driver executes CPLD programming directly from SVF file
>
> The JTAG standard (IEEE 1149.1) defines the next connector pins:
> - TDI (Test Data In);
> - TDO (Test Data Out);
> - TCK (Test Clock);
> - TMS (Test Mode Select);
> - TRST (Test Reset) (Optional);
>
> The SoC equipped with JTAG master controller, performs
> device programming on command or vector level. For example
> a file in a standard SVF (Serial Vector Format) that contains
> boundary scan vectors, can be used by sending each vector
> to the JTAG interface and the JTAG controller will execute
> the programming.
>
> Initial version provides the system calls set for:
> - SIR (Scan Instruction Register, IEEE 1149.1 Data Register scan);
> - SDR (Scan Data Register, IEEE 1149.1 Instruction Register scan);
> - RUNTEST (Forces the IEEE 1149.1 bus to a run state for a specified
>   number of clocks.
>
> SoC which are not equipped with JTAG master interface, can be built
> on top of JTAG core driver infrastructure, by applying bit-banging of
> TDI, TDO, TCK and TMS pins within the hardware specific driver.

Or by using an SPI master?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
