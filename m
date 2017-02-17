Return-Path: <cyrilbur@gmail.com>
Received: from mail-pg0-x242.google.com (mail-pg0-x242.google.com
 [IPv6:2607:f8b0:400e:c05::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vPcyB1ZmhzDqBW
 for <openbmc@lists.ozlabs.org>; Fri, 17 Feb 2017 13:52:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ehAQUaT2"; 
 dkim-atps=neutral
Received: by mail-pg0-x242.google.com with SMTP id v184so3579793pgv.1
 for <openbmc@lists.ozlabs.org>; Thu, 16 Feb 2017 18:52:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lnLn+Sp6EQ4V4Qi6oFAwufCLNj1ymHwBu7esS+jvPOA=;
 b=ehAQUaT2X4U9L6aHASGMyolZ/ZAa1GV3/eHNvSWB6nRhZjvwgZm9G3RW97Y4BNiQtL
 U6hYi9Y2T/nsyl2RiyS0MjmEoQEZOKkvnBpaLcW/Y9U2jcY/+0lnHe0Nvq29krT+sUAE
 p/CErNkg7Ny18IYiJ3JjlTszI4kvS+yKadbvC0yTd/iYjICQMzdMdu+Aiiwfg1+c8je0
 I5fslfytxtMK7PVWEBXaFOirgajizzjY6e/0Q8FGVMFVW34Z2/L0V18/rMAEX8/9U+p9
 XJOkupbSo/8jiSFMfQpZGaNXQzxxbprH8EfgyZC79bP+Xjpr5agQQf4+EgC9SKJfhZKK
 /NRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lnLn+Sp6EQ4V4Qi6oFAwufCLNj1ymHwBu7esS+jvPOA=;
 b=ZKrApJI+fdkqA4p7OdWkUsO3j2edqp5GkVrUP1UqBqcf/tR7qyp0XSjcxl/urfdt/f
 JDrhDLd7yOZHAFlekVH+Yzh5HdJh0wvlH9kqH9xLZf2NuQ2VEkrlf+YxlWKargf7DFIq
 D71AzobQG6e7x7T8UGc2GyLGdMT3I4AXDHsYy5s83D6iqAQVrQqSJ5o3jRGxSBYG3y08
 +5VYA3zatgR/gkUdBg2JUCzHKsoHGaPRXbetE5dPfsLmicOfUCdxf2CUBOP6HR32MnEN
 nzJkr9weIKB4Pq3XqQaMx5OmD3/nRMPAaA/+XENeyod3lLVvrPnPRfYlcIlG8PKHK/GX
 D+Hw==
X-Gm-Message-State: AMke39m98148RVXosTxOl0HVjKx7qtZUJFZpwV9P0d/5tCSae1t6Bc+Q4gl3wwoa4c0Z8Q==
X-Received: by 10.98.163.23 with SMTP id s23mr6584586pfe.60.1487299952600;
 Thu, 16 Feb 2017 18:52:32 -0800 (PST)
Received: from camb691.ozlabs.ibm.com ([122.99.82.10])
 by smtp.googlemail.com with ESMTPSA id
 x65sm15848594pfx.115.2017.02.16.18.52.30
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 16 Feb 2017 18:52:31 -0800 (PST)
Message-ID: <1487299862.16373.4.camel@gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: Update reserved memory nodes for
 zaius and witherspoon
From: Cyril Bur <cyrilbur@gmail.com>
To: Mine <mine260309@gmail.com>
Cc: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Fri, 17 Feb 2017 13:51:02 +1100
In-Reply-To: <CAARXrtm=xGhKQrngbjx2qZZhOx8tq-S3f948n+TnxGjkgb14Gg@mail.gmail.com>
References: <20170216054922.19722-1-cyrilbur@gmail.com>
 <CAARXrtm=xGhKQrngbjx2qZZhOx8tq-S3f948n+TnxGjkgb14Gg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.5 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Fri, 17 Feb 2017 02:52:34 -0000

On Thu, 2017-02-16 at 14:14 +0800, Mine wrote:
> Hi Cyril,
> 
> On Thu, Feb 16, 2017 at 1:49 PM, Cyril Bur <cyrilbur@gmail.com> wrote:
> > Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
> > ---
> >  arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 9 +++++++--
> >  arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts       | 9 +++++++--
> >  2 files changed, 14 insertions(+), 4 deletions(-)
> > 
> > diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> > index 4b2d8aa8abb6..2d76bfee1262 100644
> > --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> > +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> > @@ -25,9 +25,14 @@
> >                 #size-cells = <1>;
> >                 ranges;
> > 
> > -               flash_memory: region@94000000 {
> > +               flash_memory: region@98000000 {
> >                         no-map;
> > -                       reg = <0x94000000 0x04000000>; /* 64M */
> > +                       reg = <0x98000000 0x04000000>; /* 64M */
> > +               };
> > +
> > +               vga_memory: framebuffer@9c000000 {
> > +                       no-map;
> > +                       reg = <0x9c000000 0x04000000>; /* 64MB */
> 
> This assumes that Witherspoon has 512MiB RAM, then why the memory part
> indicates it has 1GiB?
> ```
>         memory {
>                 reg = <0x80000000 0x40000000>;
>         };
> ```

Oops, you're correct. I'll adjust the numbers.

> 
> >                 };
> >         };
> > 
> > diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> > index e1c9b3f4fe44..f30288f735bc 100644
> > --- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> > +++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> > @@ -25,9 +25,14 @@
> >                 #size-cells = <1>;
> >                 ranges;
> > 
> > -               flash_memory: region@94000000 {
> > +               flash_memory: region@98000000 {
> >                         no-map;
> > -                       reg = <0x94000000 0x04000000>; /* 64M */
> > +                       reg = <0x98000000 0x04000000>; /* 64M */
> > +               };
> > +
> > +               vga_memory: framebuffer@9c000000 {
> > +                       no-map;
> > +                       reg = <0x9c000000 0x04000000>; /* 64MB */
> 
> As I know Google decides to not support VGA on Zaius, so maybe
> vga_memory is not needed to Zaius at all.
> 

Happy to drop that if there won't be any VGA on the platform.

Thanks,

Cyril

> >                 };
> >         };
> > 
> > --
> > 2.11.1
> > 
