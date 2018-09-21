Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d41; helo=mail-io1-xd41.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Er9aRegw"; 
 dkim-atps=neutral
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42Gk675RMpzF3Q3
 for <openbmc@lists.ozlabs.org>; Fri, 21 Sep 2018 16:22:23 +1000 (AEST)
Received: by mail-io1-xd41.google.com with SMTP id q4-v6so11110563iob.8
 for <openbmc@lists.ozlabs.org>; Thu, 20 Sep 2018 23:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vqD6tvziAHO4l+uho2tSoyVA5WboBKE5p4GmgLjNAdM=;
 b=Er9aRegwUvS+mkXe4g/rO/RkBw+6vt4JxpVui4fb42e6aDwn191HqTW4zOX77zH7cH
 sL0UF/0/b/dhPQwgwcEwRAJ/0wd8bz+4EekiP60y21mhZyhXR7heAzOMUeKStzMuXo0j
 5dXBGGZ3DdxbDEXESlFtb7bXzgHAZpGK+G9avGlcptA+fzs8g8ngNKzU2VMdcgHbyxYH
 cRSevpZC8P+eWd9PaGTXzEHjHLMT7CcUpkxs62qiWwpoIBtHzQiwQfzt75rtOhajX95i
 K6kfxr3fhKVsqURdgDH3VTp1AKtfBPMmXONO5w95QOAxib0IKiEdMZeto6SJshAwTbu8
 /jqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vqD6tvziAHO4l+uho2tSoyVA5WboBKE5p4GmgLjNAdM=;
 b=DNled6CNdb+5Nkx+zsAEPLmGqeoJ/cDFrbXDF9tBVTeGzB1JIQ9CdMAcWnrxplwF6c
 whwIfhFWCce2FoqKNgbQZHPqp5e1WHUWF0xazljHkIcD44fVJIRr3o/0O9QefhchkZHQ
 FvgJraMQ9SV8mCc79KkBg6FNHDA93j5RJtZEHaAdGTwvz27C3/s5Rxtl2Jm7KGO5KMx+
 qLrc8yvTv66q9DcFjzA6at+ojPnnQNQGOSpLl/nx4US//v5HKnXpdS/c2Myp0zJuqUhI
 AOFPspSF4oKfvtSEVNBjpTUzeSZHoMQKCe6t7zKwGgK7hif9NXy+VkiHA+8sTCDp8Ly3
 O13Q==
X-Gm-Message-State: APzg51CftzHmgzqMQ7Y5VRmlQLuZztBrKRKQATDaNkVws8Inau0jKRGg
 BRUUwLOSE+qzGxrRsAfMI57SWYY1HrXPoVD1DMc=
X-Google-Smtp-Source: ANB0VdaM5g1afACD9//W+jpFczZdXXmgjjmsM0njIiYIecRU0C3R5IMx3H4SEVo2daNmgmv1I1x/rbQ8XwTBv0m4qrA=
X-Received: by 2002:a6b:bf86:: with SMTP id
 p128-v6mr34925935iof.156.1537510940189; 
 Thu, 20 Sep 2018 23:22:20 -0700 (PDT)
MIME-Version: 1.0
References: <20180919221331.2511558-1-taoren@fb.com>
 <CACRpkdZGjvLZY7snev5W2rRGgO7bQsSqn5u2v5Nw0tH9sa4yBw@mail.gmail.com>
 <84F9ED20-0964-462E-B389-39B107A232D3@fb.com>
 <CACPK8XeEZeMskkxNChhNSO+brpoPJ5FqweWNXe22BpyytwCwFw@mail.gmail.com>
In-Reply-To: <CACPK8XeEZeMskkxNChhNSO+brpoPJ5FqweWNXe22BpyytwCwFw@mail.gmail.com>
From: Lei YU <mine260309@gmail.com>
Date: Fri, 21 Sep 2018 14:22:01 +0800
Message-ID: <CAARXrtmpUn3DKguiQSubZvCM3sJ--QxtzoYVoEvC-81udH7BLA@mail.gmail.com>
Subject: Re: [PATCH] clocksource/drivers/fttmr010: fix set_next_event handler
To: Joel Stanley <joel@jms.id.au>
Cc: taoren@fb.com, cov@fb.com, Andrew Jeffery <andrew@aj.id.au>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, daniel.lezcano@linaro.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, linus.walleij@linaro.org
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 21 Sep 2018 06:22:24 -0000

> >
> > Make sense. I actually booted up kernel on qemu-palmetto (ast2400) but I'm doubting if test is valid because it depends on how qemu emulates the hardware. It would be great if someone can help to verify the patch on physical ast2400.
>
> I gave this a spin on the ast2400. It looked okay, but I was wondering
> if you could share you test case so I can run the same test?

Tested on Palmetto (OpenPOWER P8 with AST2400), and it does show the fix is
working on AST2400 as well.
Without the patch, usleep(100) takes tens of milliseconds randomly;
With the patch, usleep(100) takes about 600~700 microseconds stably.

Tested-by: Lei YU <mine260309@gmail.com>
