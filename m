Return-Path: <geert.uytterhoeven@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:400c:c09::242; helo=mail-wm0-x242.google.com;
 envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="FV2jeYPi"; 
 dkim-atps=neutral
Received: from mail-wm0-x242.google.com (mail-wm0-x242.google.com
 [IPv6:2a00:1450:400c:c09::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y2pbp6Z0wzDsPp
 for <openbmc@lists.ozlabs.org>; Thu, 28 Sep 2017 19:02:14 +1000 (AEST)
Received: by mail-wm0-x242.google.com with SMTP id m127so788697wmm.3
 for <openbmc@lists.ozlabs.org>; Thu, 28 Sep 2017 02:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=B8OHUWY4g6nbqeNhcZNkWYkQiSc3AHzgIHIMyPyG6to=;
 b=FV2jeYPizZAIGwZynPVykmTDWB7/TkZdTf5MK9bZBw6AckuhoWpitCCjVe4iNAmHbQ
 1IErqwjvtwnSmDJN9vNG0zP6haCbqj3XoTTllboN1MGCQAe62PnUmvZHAe7ILfqsDW3E
 lXUaHHoWUQS7VEea4o7AAhB4BB8er0nFi2eaL/+hfatZoSxk+ZKHcJ/nEDKEPpXmrnfZ
 MkfeLArpcD4tHa2A/zbgxBlVlq0QdsQ74NsYlVLdCTDGb2LjcM9oWtDvbCE9Jv69jI2+
 G3xH6LgANEV7j6Ig/zny6eGVj7gc+1kwqjDI8PjV3cMybw/0aUHYssACM6hpWcUO4KHw
 X5Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=B8OHUWY4g6nbqeNhcZNkWYkQiSc3AHzgIHIMyPyG6to=;
 b=BuPoyfn3rfUZG9RVZACduvtMICgpGt82TRVkLeZkBERrg/rIABnkCGdukqeFFZvTwb
 wlZfPK0Bti/3fQD1nsd/X1Jt33pvHH66PApot+6d53CfGujTtbVWTgiUZnY4x1dTO2ao
 0kSQjUuI3w5HaY8ptgeGb2uEvaJUzuL+XOGGuQtd5mVxP4NSBq2Vc1h+bu+RR7m2fzFW
 fXrUc25xT9ELNvVVE7YKqJd9gWP/wh6N1akO57s9lMv3FYLuGLDt5m9fQZmHCWq74IUx
 XbJtktNrozL2mM1qDCl9MHJylbGHiIgFjv8JQY3U7iaMmssB9tU3rKS97CG9ZCk0I/zt
 LcYw==
X-Gm-Message-State: AHPjjUi8W8R43uWpG7zQgGNR9ZTnKZo78PE7bfsYA3YyAOShPjVZVNa4
 29PCfIrtUNFPTKX6X8oHVMFJgLW4/aFfcozloco=
X-Google-Smtp-Source: AOwi7QABqUCPPd4e9SYSYljs3C62h4SmYVMqoXc6U86sfd7wiHmnNS1NiPlDSCQPLDGDDfFE5cVKdzUO+gnuEm7FGwA=
X-Received: by 10.28.71.25 with SMTP id u25mr373899wma.22.1506589331224; Thu,
 28 Sep 2017 02:02:11 -0700 (PDT)
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
Received: by 10.223.129.226 with HTTP; Thu, 28 Sep 2017 02:02:10 -0700 (PDT)
In-Reply-To: <AM4PR0501MB2194D67623C640E20B3A7FABB1790@AM4PR0501MB2194.eurprd05.prod.outlook.com>
References: <1505985932-27568-1-git-send-email-oleksandrs@mellanox.com>
 <CAMuHMdWfoYzWPJYaGOhF8qshKhvngwFKs=kvuH62PYif9q9+0g@mail.gmail.com>
 <AM4PR0501MB2194D67623C640E20B3A7FABB1790@AM4PR0501MB2194.eurprd05.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 28 Sep 2017 11:02:10 +0200
X-Google-Sender-Auth: yqjJszmxOFubJPBq44r3ySY7E7Y
Message-ID: <CAMuHMdX1HNym4n67y2VbZqFDLHFGunfRp-LPn0g2K4qhya_w9g@mail.gmail.com>
Subject: Re: [patch v9 0/4] JTAG driver introduction
To: Oleksandr Shamray <oleksandrs@mellanox.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Joel Stanley <joel@jms.id.au>, Jiri Pirko <jiri@resnulli.us>, 
 Tobias Klauser <tklauser@distanz.ch>, 
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
 "mec@shout.net" <mec@shout.net>, Vadim Pasternak <vadimp@mellanox.com>, 
 system-sw-low-level <system-sw-low-level@mellanox.com>,
 Rob Herring <robh+dt@kernel.org>, 
 "openocd-devel-owner@lists.sourceforge.net"
 <openocd-devel-owner@lists.sourceforge.net>, 
 "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>,
 "David S. Miller" <davem@davemloft.net>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Thu, 28 Sep 2017 09:02:18 -0000

Hi Oleksandr,

On Thu, Sep 28, 2017 at 10:53 AM, Oleksandr Shamray
<oleksandrs@mellanox.com> wrote:
>> [My attention was drawn by
>> https://emea01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flwn.net
>> %2FArticles%2F734440%2F&data=02%7C01%7Coleksandrs%40mellanox.com%7
>> C97b8ba88686a42daaace08d5064b92eb%7Ca652971c7d2e4d9ba6a4d149256f
>> 461b%7C0%7C0%7C636421844026854216&sdata=TeHD4a3%2FBN6a5XG3Jizf5
>> pmsyJHJjzkEzkpnqsXC6S0%3D&reserved=0]
>> [CC linux-spi, which was never included, while linux-serial was]
>>
>> On Thu, Sep 21, 2017 at 11:25 AM, Oleksandr Shamray
>> <oleksandrs@mellanox.com> wrote:
>> > When a need raise up to use JTAG interface for system's devices
>> > programming or CPU debugging, usually the user layer application
>> > implements jtag protocol by bit-bang or using a proprietary connection
>> > to vendor hardware.
>> > This method can be slow and not generic.
>> >
>
>
> [..]
>
>> >
>> > Initial version provides the system calls set for:
>> > - SIR (Scan Instruction Register, IEEE 1149.1 Data Register scan);
>> > - SDR (Scan Data Register, IEEE 1149.1 Instruction Register scan);
>> > - RUNTEST (Forces the IEEE 1149.1 bus to a run state for a specified
>> >   number of clocks.
>> >
>> > SoC which are not equipped with JTAG master interface, can be built on
>> > top of JTAG core driver infrastructure, by applying bit-banging of
>> > TDI, TDO, TCK and TMS pins within the hardware specific driver.
>>
>> Or by using an SPI master?
>>
>
> I think it depends on how flexible the SPI interface is. If you can set it to transfer
> from 1 to n bits at a time, and you control the TMS line in software, you should
> be able to use it. If the SPI interface can only transfer a multiple of 8 bits
> at a time, then in general it would not be suitable for JTAG.

Sure, that depends on the actual SPI master interface.
But I guess you can write a generic JTAG-over-SPI driver, and use a tms-gpios
property in DT to specify how to control TMS.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
