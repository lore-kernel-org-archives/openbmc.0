Return-Path: <arndbergmann@gmail.com>
Received: from mail-oi0-x243.google.com (mail-oi0-x243.google.com
 [IPv6:2607:f8b0:4003:c06::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xMx780zY9zDsVF
 for <openbmc@lists.ozlabs.org>; Thu,  3 Aug 2017 00:55:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="OX086XMb"; 
 dkim-atps=neutral
Received: by mail-oi0-x243.google.com with SMTP id s21so5858915oie.5
 for <openbmc@lists.ozlabs.org>; Wed, 02 Aug 2017 07:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=jlN7oaBs8ATVTHInhs529BMiaXoKWWJ2gKElA060GQw=;
 b=OX086XMbG/CrJ3qcYT2GB7AD2l+A0Fj72DbTu77sm1qARWdHYwtcjsQ4MK5vcF3XCo
 yyTOlxIrtuDOzeXUxuVNvBIFxMUbu6hdamtaTm3htf++Bi5zWqDVzikkftXl3ODzcQ0g
 HOZZqQXL9mKrKfUCGIrIBevYAZtjjgJNnRAEm6s8bsj6U26Kd0akMTmPtlZxojcjzHLk
 XpNjMrZ9/OtMJhZz+yDqCGLCLriyL5XHXMUzOgQzHl0w5lggO+arj5XFAVW6dA0PJ1ot
 fJIM70kf/SpgYchStiijvwvuGCdPzZAN08bORwXOpAnOzttr7QmXWd2LN7BJlRcEC+B2
 7J7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=jlN7oaBs8ATVTHInhs529BMiaXoKWWJ2gKElA060GQw=;
 b=qn7INrS97s57gfOuxkUol2de0MZ7hyvNYjcJ9Fbj2SHtYxO/f5l1lntVNB7K4AZl4o
 JFJR+ykvY2aTJTpupjMvi3tK53kQOhP+xF0Ym9Ao6jiHoGNoWwSkaC2AhvxO3Fjc+2wq
 x4UqVKVYXHBCczlm+VycY2bvnvH8rykI8hILI4flH5qJRo3lu9Dxl3u2fPDTl5VP43Mf
 IlEplgM2I/DRRTNDoUc5YZOU4IX5yi2lXc3dhNCoQ/l0aljPapkPvOSdCjoqh4K1lhS7
 ZLIJdgw6tdA48tbjNWHJ8GVqrxcbvO3uUa5Cl3noMlYL8ivZVuZgdkzZxNAxVwByUrn1
 euSQ==
X-Gm-Message-State: AIVw113fnJKvxYrO9dCmvx6qkv0ucnpQYZ0xO0a/yNv+jpwB8K5XxhzS
 Ep6GqZOSioL2eM5JiTJH5jaoRuUJeA==
X-Received: by 10.202.193.9 with SMTP id r9mr11894619oif.199.1501685697732;
 Wed, 02 Aug 2017 07:54:57 -0700 (PDT)
MIME-Version: 1.0
Sender: arndbergmann@gmail.com
Received: by 10.182.29.34 with HTTP; Wed, 2 Aug 2017 07:54:57 -0700 (PDT)
In-Reply-To: <1501679918-20486-3-git-send-email-oleksandrs@mellanox.com>
References: <1501679918-20486-1-git-send-email-oleksandrs@mellanox.com>
 <1501679918-20486-3-git-send-email-oleksandrs@mellanox.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 2 Aug 2017 16:54:57 +0200
X-Google-Sender-Auth: mFW1RK1q-2VKs6Dij9SKV10t2HU
Message-ID: <CAK8P3a02O4Xrt+HECjs+GQLw8s9novYLdUUmk_V+oK=EX-HqfQ@mail.gmail.com>
Subject: Re: [patch v1 2/2] drivers: jtag: Add Aspeed SoC 24xx and 25xx
 families JTAG master driver
To: Oleksandr Shamray <oleksandrs@mellanox.com>
Cc: gregkh <gregkh@linuxfoundation.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>, 
 =?UTF-8?B?SmnFmcOtIFDDrXJrbw==?= <jiri@resnulli.us>, 
 Tobias Klauser <tklauser@distanz.ch>, linux-serial@vger.kernel.org,
 mec@shout.net, vadimp@maellanox.com, system-sw-low-level@mellanox.com, 
 Jiri Pirko <jiri@mellanox.com>
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
X-List-Received-Date: Wed, 02 Aug 2017 14:55:01 -0000

On Wed, Aug 2, 2017 at 3:18 PM, Oleksandr Shamray
<oleksandrs@mellanox.com> wrote:
> Driver adds support of Aspeed 2500/2400 series SOC JTAG master controller.
>
> Driver implements the following jtag ops:
> - freq_get;
> - freq_set;
> - status_get;
> - idle;
> - xfer;
>
> It has been tested on Mellanox system with BMC equipped with
> Aspeed 2520 SoC for programming CPLD devices.
>
> Signed-off-by: Oleksandr Shamray <oleksandrs@mellanox.com>
> Signed-off-by: Jiri Pirko <jiri@mellanox.com>

Looking at this one before the subsystem. Overall looks really nice,
it seems you got a good abstraction between the subsystem and the
driver.

> +
> +static int aspeed_jtag_freq_set(struct jtag *jtag, unsigned long freq);
> +static int aspeed_jtag_freq_get(struct jtag *jtag, unsigned long *frq);
> +static int aspeed_jtag_status_get(struct jtag *jtag,
> +                                 enum jtag_endstate *status);
> +static int aspeed_jtag_idle(struct jtag *jtag,
> +                           struct jtag_run_test_idle *runtest);
> +static int aspeed_jtag_xfer(struct jtag *jtag, struct jtag_xfer *xfer);

Please try to reorder the functions definitions in a way that lets you
remove the forward declarations.

> +
> +static void aspeed_jtag_run_test_idle_sw(struct aspeed_jtag *aspeed_jtag,
> +                                        struct jtag_run_test_idle *runtest)
> +{
> +       char sm_pause_irpause[] = {1, 1, 1, 1, 0, 1, 0};
> +       char sm_pause_drpause[] = {1, 1, 1, 0, 1, 0};
> +       char sm_idle_irpause[] = {1, 1, 0, 1, 0};
> +       char sm_idle_drpause[] = {1, 0, 1, 0};
> +       char sm_pause_idle[] = {1, 1, 0};

These could be 'static const' if you adapt the aspeed_jtag_sm_cycle
prototype accordingly.

> +
> +static const struct of_device_id aspeed_jtag_of_match[] = {
> +       { .compatible = "aspeed,aspeed-jtag", },
> +       {}
> +};

The series should include a patch for the DT binding for this device.
You may want to be a little more specific here, to avoid problems if
aspeed ever makes an updated version of this device with a slightly
different register interface. Usually we include the full name of the
SoC in the "compatible" string for that.

       Arnd
