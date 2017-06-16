Return-Path: <geissonator@gmail.com>
Received: from mail-io0-x22d.google.com (mail-io0-x22d.google.com
 [IPv6:2607:f8b0:4001:c06::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wq0kz0FPvzDq88
 for <openbmc@lists.ozlabs.org>; Fri, 16 Jun 2017 22:57:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ksqWzTbw"; 
 dkim-atps=neutral
Received: by mail-io0-x22d.google.com with SMTP id i7so29938694ioe.1
 for <openbmc@lists.ozlabs.org>; Fri, 16 Jun 2017 05:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=2sqg5Kqti8fiqfglkwdU+uNs48if3Ot48ZJRQnuef9g=;
 b=ksqWzTbwWDTH1OL7vh1RZMLBKHgp35njCIVJnXHw+9bD3Dvp+koqbQidmUcJgCaQt2
 8JCAVocEnrGBLJKFTM/qh3GvKmegC/NDa7cn/NloVNoEDbkPkrYXhGvtRug8h1f1H5MO
 3B6kDPPaYO1HCAdlZI18LxbIWwcb1z+AgB8S/OebcpvyyImQRgqyljNa7sqTgLaQfJL8
 rKDQVhFMqSkIJQNRy8IWruKTbZ7iCQcDotDyreE6Vdkm539T53xKy8Osy65OpS1NxVn5
 oml4VOAQIZQ0S1YAk0kn3nXvGc9i5E6fClQHgJdTpt3WNxk2ns/+pSs/3cyE+8DVz/1k
 YTbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=2sqg5Kqti8fiqfglkwdU+uNs48if3Ot48ZJRQnuef9g=;
 b=NcemvrI8ZiQ1/DeO7f4EUBvea1TbHNHIAYcqJRfKi5cd1M2czqHUnmAFPZcdhZdRS7
 qKU8li17+wjVSgz1wamPAi2U1njCAm3d9tfkdQeeJH974aOxbJDxQiUCkh4LLZaWD2q6
 8TOJKM2c1Ua0dgZp5l40qPBFv12SHxchkrhs73kbNFGeSCyj6yQMtOE+Komythg3NuQP
 /lW8oCrtDc1nmJwndGObQWlD3aV/Gk6EM/ZRIIlHNgpNW9aEubTO8XZB4Axiz5gd7QLF
 lALzc6wItxAw90jVMj/NpvEBsI57lslxIwLtN42xTM5IJ8TVYeGrmTA/PouUAO1b7FOt
 MkTg==
X-Gm-Message-State: AKS2vOyP36e4ZH1PwoTSz7gLOLpNDNiGq0jq3as9DtnY7XgfRZjLMPYV
 mqrfIdbZZlbGBRVPN2RzwMRYgk+iQw==
X-Received: by 10.107.17.21 with SMTP id z21mr9817791ioi.34.1497617831385;
 Fri, 16 Jun 2017 05:57:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.133.40 with HTTP; Fri, 16 Jun 2017 05:57:10 -0700 (PDT)
In-Reply-To: <1497582330728.74747@rackspace.com>
References: <1497582330728.74747@rackspace.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Fri, 16 Jun 2017 07:57:10 -0500
Message-ID: <CALLMt=qkjc31EyMv64_fpqaJoyrVB90tAoVvuuuUMMMBa195mQ@mail.gmail.com>
Subject: Re: Changing Power Button behavior
To: Adi Gangidi <adi.gangidi@rackspace.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Chad Somerlot <chad.somerlot@rackspace.com>, 
 Brad DeBauche <brad.debauche@rackspace.com>
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
X-List-Received-Date: Fri, 16 Jun 2017 12:57:15 -0000

Hey Adi, issues 771 and 776 track the refactoring work for the
buttons.  If you want to take a stab at it the old code is out in
skeleton, skeleton/pwrbutton/button_power_obj.c is for the button
monitoring and signal generation,
skeleton/pychassisctl/chassis_control.py for the handling  of the
signal.

You'll want to make sure the POWER_BUTTON gpio is configured right for
your system.  https://github.com/openbmc/openbmc/issues/1593 would
also be something to look out for.  A quick glance shows
chassis_control.py using the right targets for power on so nothing
obvious to me on why it wouldn't work.

Andrew

On Thu, Jun 15, 2017 at 10:05 PM, Adi Gangidi <adi.gangidi@rackspace.com> wrote:
> Hi Nice folks on the mailing list,
>
>
> In our testing on Barreleye G2 server we noticed that:
>
>
> BMC short press:  Doesn't effect power state
>
> BMC long press:   Reboots the host (instead of poweroff)
>
>
> Is that what its coded to ? Where can I find the code that dictates this
> behavior ? Any tips on how to go about changing this would be helpful.
>
>
>
> -Adi
