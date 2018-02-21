Return-Path: <brendanhiggins@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400d:c09::242; helo=mail-qk0-x242.google.com;
 envelope-from=brendanhiggins@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="cMfc5eZt"; 
 dkim-atps=neutral
Received: from mail-qk0-x242.google.com (mail-qk0-x242.google.com
 [IPv6:2607:f8b0:400d:c09::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zmQ2r3DnNzF0lm
 for <openbmc@lists.ozlabs.org>; Wed, 21 Feb 2018 15:47:47 +1100 (AEDT)
Received: by mail-qk0-x242.google.com with SMTP id f25so501749qkm.0
 for <openbmc@lists.ozlabs.org>; Tue, 20 Feb 2018 20:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=cwMdZ7IcPdFj48Bm7+r19FJVZeI5qVs+tIUdr4ls/8c=;
 b=cMfc5eZtB0DmLUExA/7KWRxxJ0QxH/ri78QTBWFQOf9Yfam9mEoSBcFwPCeH11w3iK
 GHz+ftsmlHT+K6T5dZCckJN0O4SrQXZ1tC/udtdBxJo9wgcL0gayNa6y7Ef95b6crbeo
 s7njQeCR19Cu5gqXqId2ZobFdWECTNaLBURmApTrfqjXgmJ79PAot7jFZgcG/suJHiLm
 2pLn3xYHd3v44fILyyu01n+LmboBOgQFyInGV9tj5eRFSLF1KjBcuTYijxT+mYaK2vJN
 H66//XM3TYXjpu3kGDbs3mO+zZEosEj3qqvyiA4dsz53Uu/7B8ANpTWYKZggHDRS7J9i
 lqoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=cwMdZ7IcPdFj48Bm7+r19FJVZeI5qVs+tIUdr4ls/8c=;
 b=ndj6J51Ex7dCvU7IyjiTdOd3OGszYPLJBvjGvhGj9UMqRusu5Z6bL0dEOxFsFuPk19
 vEenZu6A9QjjbpmS6HL5yFnfSPZvFNOeTGP8ys4G0tg8kY9EaSc/gB5rCXw1Y8VWjTvn
 g8/5QfqZ/0OaGD7zS96mBTzf0pdspAm/GEpnxi0UUJ8IuCFaHUz+Z3rLkCP9EIR5CYAL
 ye5ImZ33adH1hKxLuOSpXAkKXsIahc3qwkmhbRhSiP75BVUs1G4JpdNdYnpoBW8oCQm/
 o76ZHQifrO61jxdfWzzYHWoQEZm+xWv/GV9ffyuz5oLESTWXlfwDTcpfkZ14Lc31hQ6K
 cPwQ==
X-Gm-Message-State: APf1xPC0S2S+DZaHJAGCCD1zdYYuOVqX7L9aIRlePfQddcKg4I5RA4Yr
 m8c6umZ/Pju2L0PrNgs3+LL2N/2JqL3HMEzpN01gYQ==
X-Google-Smtp-Source: AG47ELure/VQjDazgLTvyvOVJOtNCCXiMO5k+ZkWhbJhUBhhNyAbtcWqL1ddlryNSD3xG5HGMXHJ334lz+WgPhkflO4=
X-Received: by 10.55.1.78 with SMTP id 75mr3071329qkb.310.1519188465265; Tue,
 20 Feb 2018 20:47:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.34.104 with HTTP; Tue, 20 Feb 2018 20:47:44 -0800 (PST)
In-Reply-To: <20180219144905.bfrycjnas7dcuo34@rob-hp-laptop>
References: <1518701959-22899-1-git-send-email-tali.perry1@gmail.com>
 <1518701959-22899-2-git-send-email-tali.perry1@gmail.com>
 <CAFd5g44gBJp0-mYEWGdyiA67BCi2pZWAG2bYPS-WdJEwH1oA5A@mail.gmail.com>
 <20180219144905.bfrycjnas7dcuo34@rob-hp-laptop>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Tue, 20 Feb 2018 20:47:44 -0800
Message-ID: <CAFd5g44argF0oaOq7fOM0YbCBK5h8NyRia+H8CbRC5qAQHe5WA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] clk: npcm750: update text with fixed clocks
To: Rob Herring <robh@kernel.org>
Cc: Tali Perry <tali.perry1@gmail.com>, Mark Rutland <mark.rutland@arm.com>, 
 Russell King <linux@armlinux.org.uk>, Avi Fishman <avifishman70@gmail.com>,
 Tomer Maimon <tmaimon77@gmail.com>, Rick Altherr <raltherr@google.com>, 
 devicetree <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Nancy Yuen <yuenn@google.com>, 
 Patrick Venture <venture@google.com>
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
X-List-Received-Date: Wed, 21 Feb 2018 04:47:49 -0000

On Mon, Feb 19, 2018 at 6:49 AM, Rob Herring <robh@kernel.org> wrote:
> On Thu, Feb 15, 2018 at 02:38:12PM -0800, Brendan Higgins wrote:
>> On Thu, Feb 15, 2018 at 5:39 AM, Tali Perry <tali.perry1@gmail.com> wrote:
>> >
>> > Signed-off-by: Tali Perry <tali.perry1@gmail.com>
>> >
>>  <snip>
>>
>> I think this should probably be rolled into [PATCH v2 1/1] npcm750: add fixed
>> clocks (moved from drivers/clk/clk-npcm7xx.c):
>> https://www.spinics.net/lists/arm-kernel/msg634678.html
>
> No, binding docs, dts files and driver code should all be separate
> patches.

My mistake. This patch has a dt-bindings include file; should the include file
go in here, with the dtsi changes, or in its own separate patch?

Thanks
