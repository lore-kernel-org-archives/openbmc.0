Return-Path: <geissonator@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.218.44; helo=mail-oi0-f44.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="mCvnpK+T"; 
 dkim-atps=neutral
Received: from mail-oi0-f44.google.com (mail-oi0-f44.google.com
 [209.85.218.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 425gM646S7zF3RP
 for <openbmc@lists.ozlabs.org>; Thu,  6 Sep 2018 22:47:14 +1000 (AEST)
Received: by mail-oi0-f44.google.com with SMTP id p84-v6so20216287oic.4
 for <openbmc@lists.ozlabs.org>; Thu, 06 Sep 2018 05:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AxwRFnRuA8eS3hinatKsxtDiG92ZzaSAhC7MQ82fiQY=;
 b=mCvnpK+T6dgokr4GdvcvyG3oVkqAvMdyty6oJOEfnLI51c/nfN0RScukuFYzkjwrXi
 SYIxuLxnrX6CEcoL6A+xne7mwWrdhtrsOgIZCq58O0V4BCEQPnn+NiVe/wPiMm7TWhP7
 P5ODXlG/671elq3UPKVzdzz1I4Ghug1h1Lji/ug346gnaEmG9boLBIfm+F6Bq0oNDqHk
 OquEvqCfpmEuq1RasNe/Ax3Qgfw7p2urv9A5YRIN4LNQ9wCktTlj66bD44+nOY2D8m4/
 pIAlMdSuIStA+zpSvopkrwnZ8tX8f9p+Q5eJaLlkNzkUXzz/LzIGXZKrCe8mva1TnAih
 QPAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AxwRFnRuA8eS3hinatKsxtDiG92ZzaSAhC7MQ82fiQY=;
 b=RveUGMo/qxJ7Jl1oz9dd0h2MU9YpB92AQWf2q6I1Sep9sv7KyhO5eQfHkqLX6GIexe
 8NvSrEVcT8ISq56xTLuYhag+EqD0L131fgfrTqclCerTK1u9eWF5kkiGJZ9EJmAXQ/QX
 ntJsfgT8OyLG+3LDUr38rqFDk4WitzpiAf2ax+24UoqJZiskenU5TsMKrTCjG+XGf8yO
 0c7fQpmRu86NMpcKZmdU18BrMN5W/rkwCjAQKkx7WSOVH9+LMduvWgpkVeHUuoEIjWzq
 TWPJYTCXL1Bf8P9RcD0mu0qug2Fe2q9/7VIiPj2oYO5HcabEgdZlUyet7qXv8uGL1K+9
 rJig==
X-Gm-Message-State: APzg51Aie+kS6EHJnbHutzD0Yo3GuOIyFeggc+DhGDojnxldQu7Q+SSm
 3peDQneaBSb8OzaaWAndjDafTf6ATKq/tusgLrg=
X-Google-Smtp-Source: ANB0VdZDew5kzmlj3GsZ6wYWm36oVduV+6EEZw7Mnq47Dn9N1hu3PVVqypjQ/WFTnWuKorahywgrklCi2No1VJkBB18=
X-Received: by 2002:aca:5dc5:: with SMTP id
 r188-v6mr2847250oib.320.1536238032004; 
 Thu, 06 Sep 2018 05:47:12 -0700 (PDT)
MIME-Version: 1.0
References: <959CAFA1E282D14FB901BE9A7BF4E77249E0C0B0@shsmsx102.ccr.corp.intel.com>
In-Reply-To: <959CAFA1E282D14FB901BE9A7BF4E77249E0C0B0@shsmsx102.ccr.corp.intel.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Thu, 6 Sep 2018 07:47:01 -0500
Message-ID: <CALLMt=p=tmhvNfcfc50tXEGu7nuHS1huTgm3v3y-r-DuAu=zEw@mail.gmail.com>
Subject: Re: About new gpio API in linux/gpio.h adopted by kernel 4.8
To: kuiying.wang@intel.com
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 Andrew Geissler <geissonator@yahoo.com>, 
 chunhui.jia@linux.intel.com, kunyi731@gmail.com, james.mihm@intel.com, 
 ed.tanous@intel.com, james.feist@intel.com, chunhui.jia@intel.com, 
 Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, yong.b.li@intel.com, 
 cheng.c.yang@intel.com, qiang.xu@intel.com, hai.v.nguyen@intel.com, 
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Sep 2018 12:47:15 -0000

Hey Kuiying, this seems like more of a 4.18 kernel question for
Joel/AndrewJ. Put them on cc.
On Thu, Sep 6, 2018 at 2:30 AM Wang, Kuiying <kuiying.wang@intel.com> wrote:
>
> Hi Brad/Andrew,
> I found the new gpio API adopted by kernel 4.8, is not fully ready, all the lines are "unnamed".
> If that we cannot switch to it now.
> Or there is special kernel based configuration I have to do?
>
> root@wolfpass:/tmp# ./gpiodetect
> gpiochip0 [SGPIOA] (8 lines)
> gpiochip1 [SGPIOB] (8 lines)
> gpiochip10 [1e780000.gpio] (232 lines)
> gpiochip2 [SGPIOC] (8 lines)
> gpiochip3 [SGPIOD] (8 lines)
> gpiochip4 [SGPIOE] (8 lines)
> gpiochip5 [SGPIOF] (8 lines)
> gpiochip6 [SGPIOG] (8 lines)
> gpiochip7 [SGPIOH] (8 lines)
> gpiochip8 [SGPIOI] (8 lines)
> gpiochip9 [SGPIOJ] (8 lines)
> root@wolfpass:/tmp# ./gpioinfo /dev/gpiochip1
> gpiochip1 - 8 lines:
>         line   0:      unnamed       unused  output  active-high
>         line   1:      unnamed       unused  output  active-high
>         line   2:      unnamed       unused  output  active-high
>         line   3:      unnamed       unused  output  active-high
>         line   4:      unnamed       unused  output  active-high
>         line   5:      unnamed       unused  output  active-high
>         line   6:      unnamed       unused  output  active-high
>         line   7:      unnamed       unused  output  active-high
> root@wolfpass:/tmp# ./gpioinfo /dev/gpiochip10
> gpiochip10 - 232 lines:
>         line   0:      unnamed       unused   input  active-high
>         line   1:      unnamed       unused   input  active-high
>         line   2:      unnamed       unused   input  active-high
>         line   3:      unnamed       unused   input  active-high
>         line   4:      unnamed       unused   input  active-high
>         line   5:      unnamed       unused   input  active-high
>         line   6:      unnamed       unused   input  active-high
>         line   7:      unnamed       unused   input  active-high
>         line   8:      unnamed       unused   input  active-high
>         line   9:      unnamed       unused   input  active-high
>         line  10:      unnamed       unused   input  active-high
>         line  11:      unnamed       unused   input  active-high
>         line  12:      unnamed       unused   input  active-high
>         line  13:      unnamed       unused   input  active-high
>         line  14:      unnamed       unused   input  active-high
>         line  15:      unnamed       unused   input  active-high
>         line  16:      unnamed       unused   input  active-high
> root@wolfpass:/tmp# ./gpioget /dev/gpiochip10 219
> ./gpioget: error reading GPIO values: Device or resource busy
>
> Thanks,
> Kuiying.
