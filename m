Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c05::241; helo=mail-vk0-x241.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="XmRLvTrP"; 
 dkim-atps=neutral
Received: from mail-vk0-x241.google.com (mail-vk0-x241.google.com
 [IPv6:2607:f8b0:400c:c05::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40ljqk0pgHzF2NN
 for <openbmc@lists.ozlabs.org>; Wed, 16 May 2018 02:36:00 +1000 (AEST)
Received: by mail-vk0-x241.google.com with SMTP id x66-v6so514289vka.11
 for <openbmc@lists.ozlabs.org>; Tue, 15 May 2018 09:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=DmL0DY4f6WfzP/DA7aH0LoPiLLYc1ayvTRYaO2DhmmA=;
 b=XmRLvTrPtxHR+G1TWL/RahkLtU7YI+1uYOJSPQYQ08ldrjVfq4fp1AOxYUekx8uQ2h
 aKufrKNZJULyvXxKfydFDYywpDnrizCN5gZt6dvcKjnHZu7wyp+ctj36QQsRcGrfCA4x
 wGYd+UrP/NODSZW40HOPkAGgaSkAqh6Inimx96qD1r3ftdNqU9jZpmiVkL5JTRo/DMPG
 fk9Skg+INaG/jbtSKVcUw0Ogjf5YxWtUyev84TqlOa5J1lJ5ZF4gTYwWSfth8H1utCoH
 C34iPrhurqoELqTGrScRRnFKemcS/oKC7MTxqQz82y+XKLmHOE5kq9cSmC+aNltRaptN
 au/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=DmL0DY4f6WfzP/DA7aH0LoPiLLYc1ayvTRYaO2DhmmA=;
 b=Nq9kLcdV4DU3ZgZww7ZFqKXvkJ+prux8ebyo2peRsX/szmnB+JVtPiqMbEOKDLyYto
 TC9kB7tCQRk6tWc0w9NtdEIZY3OFtPPOnKK6mi6UEwJXhhppLMYy/TgEYDLW9WnY6i8e
 GRnCeyeiMZKO95Ptnm2toBWc5l1qPHhI+qXTjgEI7OWvj26XFhaGhqXg0cYaRMOfbFHJ
 EjU84qdgvL2gd+i78HU0aV2BhPd11gD4nNQI3/RRd0rNjQ9qS2sVhvBQ6OtgSkh2z5fE
 8NLkccQV47k+ubd22+3fpUgWBOpQzxCSJxsD7LGhGMkVBgAB4ZdDI4hnFFl6Q0QhFJS9
 zQ+A==
X-Gm-Message-State: ALKqPwct7SF0g8l6r7D/347xqg/IqmvMCYrJswjOXp1bYQEHYpQJKA5/
 o6e4niL5el7S8A6Fs1eYCy9YcEkEkY0hC3OTpOfFZQ==
X-Google-Smtp-Source: AB8JxZo2IVbth16mZsDFmkH9+4sgz7S+s51/srXnI3N9k0pImnTSJhPAvC9bTkmdapQqsDFwQCWFo4rTB9gqrRqQfMI=
X-Received: by 2002:a1f:5cca:: with SMTP id
 q193-v6mr1372320vkb.45.1526402157499; 
 Tue, 15 May 2018 09:35:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.87.198 with HTTP; Tue, 15 May 2018 09:35:37 -0700 (PDT)
In-Reply-To: <20180515162216.GA105329@mauery>
References: <CAO=notzi+BtDV=m5TYPE7UrtO-TYPVLe+LYhUcApX4UgvwfVyA@mail.gmail.com>
 <20180515162216.GA105329@mauery>
From: Patrick Venture <venture@google.com>
Date: Tue, 15 May 2018 09:35:37 -0700
Message-ID: <CAO=notyCZgdAzC2ZqtQ8FzfABFJ2BeGHt6utgRsn7guqjghM9g@mail.gmail.com>
Subject: Re: quanta q71l not booting with 4.13
To: Vernon Mauery <vernon.mauery@linux.intel.com>
Cc: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Tue, 15 May 2018 16:36:03 -0000

On Tue, May 15, 2018 at 9:22 AM, Vernon Mauery
<vernon.mauery@linux.intel.com> wrote:
> On 15-May-2018 07:26 AM, Patrick Venture wrote:
>>
>> Hi;
>>
>> So, i have a couple theories to test but before I ran them down I
>> figured I'd just ask here.  The quanta-q71l won't boot if the BMC is
>> running the 4.13 kernel from openbmc.  I'm theorizing that the spi mux
>> is flipped somehow (maybe a default pin value is getting flipped) or
>> something else is preventing the host from reading its flash.
>>
>> Has anyone experienced anything like this on their platform?
>
>
> The 4.13 kernel has a bunch of new stuff that has to be worked out in device
> tree to make pins and clocks and resets work. We had trouble getting our
> hosts booting as well when we first migrated to 4.13. We had to fix a few
> things in our device tree to get the espi clock working. I think it also
> included a patch that Jae sent to this list for the clock and reset driver.
> This may be an entirely different issue, but that was our story.
>
> +                       espi: espi@1e6ee000 {
> +                               compatible = "aspeed,ast2500-espi-slave";
> +                               reg = <0x1e6ee000 0x100>;
> +                               interrupts = <23>;
> +                               status = "disabled";
> +                               clocks = <&syscon ASPEED_CLK_GATE_ESPICLK>;
> +                               pinctrl-names = "default";
> +                               pinctrl-0 = <&pinctrl_espi_default>;
> +                       };
> +
>
> I think we also had trouble with the host video showing up after the host
> powered on, this was also dependent on some clock control settings in the
> dts. But Ed tells me this is a AST2400, so video is not your problem.

Thanks, although we have video :D on the ast2400, thanks.  I'll take a
look at the other dts between 4.10 & 4.13 and see what other changes
were made to see if anything matches what I expect (including the
patch you've included).

>
> --Vernon
