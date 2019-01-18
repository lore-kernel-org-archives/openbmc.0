Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::443; helo=mail-pf1-x443.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="bC1c4ltx"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43h97X4HB3zDr4D
 for <openbmc@lists.ozlabs.org>; Sat, 19 Jan 2019 05:53:12 +1100 (AEDT)
Received: by mail-pf1-x443.google.com with SMTP id q1so7024649pfi.5
 for <openbmc@lists.ozlabs.org>; Fri, 18 Jan 2019 10:53:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ux14ZRCLu5On1O6p6SJKMZa3iXHW7uTi+GcWxt2miNY=;
 b=bC1c4ltxbcxsznJ79Wc2kJdeyfdpW1hA4fYXRl6/imLHOEvMNqcVY9FmAA+t9vn9Px
 bTIqVywVhAOjTFgklvM5dSgMGyS/hepan+zLWo6F+3xdenobFkmEaodcpqgWTBwj3Aus
 v5EP2LdmA091K0zNWRGyl1buQf8Jt1HXKT5tyKw/Z1+pLgvEC9DGUYPV92bkHXyw1iMW
 9+ApnxKV9OSs/JPUJlmCKhehHi2u08mdIpFauxQpwLNPUGsBRspsVq8xSpFDyw/e0cy2
 iP8+0HVZUqubUbcPUBBS1Uc+9nBmcQovY72QT98691m0ln1EGoai7YPP7Q/CocC0wHMi
 BW5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ux14ZRCLu5On1O6p6SJKMZa3iXHW7uTi+GcWxt2miNY=;
 b=pMspkjzWrR3Zyopby3UHgFTJPUX6gOEiDytClwhjk3WBAs5tYlBQv8GAlLA4NWAM28
 JxQy5oQaRKmrZ52uQguzKHmGqAiN8I5ADOY+YbAZZKtvGE1QRxzvk2NsYkeTQ4wbTgZb
 1MQfItDbmBiv83bP2YgxzNcjL9zeb00/yX3frcU3iEHzbK1WiL4wqpx3KEgtw0PC3v7d
 VUhu1Rmey31nQuVyzjrXJEQQJlfp+9QbHz4b4QA4aIPJDz4tR5XyDsL5nPqs/OCLdzO/
 g29kIvwrPy2aAx2WkXM+plo+gyzpe0sZD/u45fZiKL13hx07um/NObLqKlcQspE4YF7v
 QUpA==
X-Gm-Message-State: AJcUukcOIuIanstssC+7sfqueaGDOCJNTD7p0qm1wE9EA9W9GE6EVqex
 /zyFnSluc4FqNleV8YVYGrm5PN/XckAoA44pRbvSlOQk/r0=
X-Google-Smtp-Source: ALg8bN7rIvwp5hRXluJTrrAmlzwbsEfo98kIVOzGohSP8P3dQSjN8XMUI2XltReZxe0qrFp40ydc0WjIdRoVa+SgEoU=
X-Received: by 2002:a63:9a09:: with SMTP id o9mr18129866pge.94.1547837588293; 
 Fri, 18 Jan 2019 10:53:08 -0800 (PST)
MIME-Version: 1.0
References: <CAO=notxJck9xYXKv=BYADuZV1Ya771bS7Mc_-1OUfDp4iFTq2A@mail.gmail.com>
In-Reply-To: <CAO=notxJck9xYXKv=BYADuZV1Ya771bS7Mc_-1OUfDp4iFTq2A@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Fri, 18 Jan 2019 10:52:57 -0800
Message-ID: <CAO=notw=47cYNHD05s1gi5Hbef=+d+WNXoapdFMS+vY+vYq1_g@mail.gmail.com>
Subject: Re: Using mmap against aspeed-lpc-ctrl device - weird bytes :D
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Fri, 18 Jan 2019 18:53:13 -0000

On Fri, Jan 18, 2019 at 10:38 AM Patrick Venture <venture@google.com> wrote:
>
> Just to give you some context snippets:
>
> System DTS snippet:
>
> reserved-memory {
>  #address-cells = <1>;
>  #size-cells = <1>;
>  ranges;
>  lpc_mapped_memory: region@98000000 {
>   no-map;
>   reg = <0x98000000 0x00800000>; /* 8MB */
>  };
> };
>
> &lpc_ctrl {
>  status = "okay";
>  memory-region = <&lpc_mapped_memory>;
>  flash = <&spi1>; // spi disabled, but needed for lpc_ctrl to probe
> };
>
> So, on the BMC, it receives the host's memory map address --> so it
> can configure the window:
>
> https://github.com/openbmc/phosphor-ipmi-flash/blob/master/lpc_aspeed.cpp#L42
>
> Then the host tool, mmap's to the host set-aside address, 4KiB, and
> tells the BMC to copy out the 4KiB:
>
> https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-ipmi-flash/+/17505

Reading the mapping code more closely, I see I'm setting the offset to
the memory window -- this made sense when using /dev/mem, but for
aspeed-lpc-ctrl maybe it should be 0.  Testing that now.

>
> Keep in mind, previously this was working by the BMC opening /dev/mem
> and mapping against lpc_mapped_memory -- but now we're opening
> aspeed-lpc-ctrl.  In the code above, regionAddress ==
> lpc_mapped_memory, and regionSize is 64KiB.
>
> Can you take a look to at least sanity check this?
>
> It ends up copying out data that looks like this:
>
> 00000000  0a 00 01 00 0a 00 01 00  0a 00 01 00 0a 00 01 00  |................|
> *
> 00001000
>
> Patrick
