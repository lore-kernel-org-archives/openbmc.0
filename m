Return-Path: <xow@google.com>
Received: from mail-qk0-x231.google.com (mail-qk0-x231.google.com
 [IPv6:2607:f8b0:400d:c09::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t78nf456ZzDvHd
 for <openbmc@lists.ozlabs.org>; Tue,  1 Nov 2016 09:54:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=mgpBkoLl; 
 dkim-atps=neutral
Received: by mail-qk0-x231.google.com with SMTP id o68so181156276qkf.3
 for <openbmc@lists.ozlabs.org>; Mon, 31 Oct 2016 15:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=NKYiElKXY8/wds8d05fBraC6icaXewaScKCm6KcXWxw=;
 b=mgpBkoLluc1d0LdZeO+BY4Xw83HMwY/CSxEM+hlZOm8mxMdBSGBkTJQM+hM9vGPzNM
 a9kec0KlniimDPuGq90nZLtR2FYj4myzXOLafWmV42+r8xQOeOjx8wQOhL7hPULjlEnH
 Yc9Nm7pB7NN+TfuBdbfrODkR+g4yiopF5MJ+Vbs3ks+9jG7TbXtLRAc2HI0QhEz8IasI
 XYNrvto7JEm2INa8gMSxmCYisEv0UV3nazIMaN/N2H2Zbtf0Eb2ncoboAzt4KOxiIVSz
 Z9l8L6ZzOOMvsTRAuG1mec68/BU9+9byGWrUaHxJXEoUWW5Nca3DJOudV76HEv1uEBnR
 qArg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=NKYiElKXY8/wds8d05fBraC6icaXewaScKCm6KcXWxw=;
 b=YALNoAZ97SQp6NG+55OpXYdYLB/IDpNDZLVBU46E2k7OWYuoE51NJ62nAYcYA3xbkf
 uavdM1LMJVV1Kd1sKOhqqzorla24jFfpeN4fC4O73vw9O4ticXW/lRB4CfDoTPZkdZjY
 7FYiPvkrN6HAWZn221le4nv0u7HWTDxx0zxgdc5wuruiSX1gzK4oHB7mKGZ+SY0sg4Z6
 dLmCcW2IK09HCot1wkZeUYZ4Xcv0rOp2YrxkMLsO/qbJqmAQimLme0HLAcbhiyM1+tqK
 /s4sAMDZexs9zK7w+qse3pXWSf6/xGNGVb6z34s/pzTcQYPHsLEYYnHLAgCjCRK/g4nU
 0GfQ==
X-Gm-Message-State: ABUngvfMZnC5k9j3gcg2mqeS1VvHkeB1y1FW3AlEoeZWyKoY/VjXGSczTDhLq22L+qICwxwS55I9dx9Md6Gmt/ON
X-Received: by 10.55.165.10 with SMTP id o10mr25901871qke.233.1477954483489;
 Mon, 31 Oct 2016 15:54:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.58.194 with HTTP; Mon, 31 Oct 2016 15:54:43 -0700 (PDT)
In-Reply-To: <CACPK8Xer5mm=UxWnui0AWQM7dwg_0WFwSDhscuerT6X7RHBZMg@mail.gmail.com>
References: <1477004194-107484-1-git-send-email-xow@google.com>
 <CACPK8Xc+_m07jKCm-2tEGetpe7DuM03OrqOVp7wBH=4XgxrzrA@mail.gmail.com>
 <CACPK8Xer5mm=UxWnui0AWQM7dwg_0WFwSDhscuerT6X7RHBZMg@mail.gmail.com>
From: Xo Wang <xow@google.com>
Date: Mon, 31 Oct 2016 15:54:43 -0700
Message-ID: <CAPH-5w7m8jtBuFK2rL2AKvjzjaeM6oTW_ks6ua4FtTVQ_LS8rQ@mail.gmail.com>
Subject: Re: [PATCH linux] mach-aspeed: Add Zaius BMC PHY reset
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Mon, 31 Oct 2016 22:54:47 -0000

Hi Joel,

On Mon, Oct 24, 2016 at 9:18 PM, Joel Stanley <joel@jms.id.au> wrote:
> Hi Xo,
>
> On Fri, Oct 21, 2016 at 3:27 PM, Joel Stanley <joel@jms.id.au> wrote:
>> On Fri, Oct 21, 2016 at 9:26 AM, Xo Wang <xow@google.com> wrote:
>>> The Broadcom PHY for the Zaius BMC requires a hard reset after RGMII
>>> clocks are enabled. This asserts the reset in case it wasn't performed
>>> in U-Boot.
>
>> I'm not sure how we would handle this properly if we were to submit it
>> upstream. We can carry it for now though.
>
> I came across this thread on lkml: https://patchwork.ozlabs.org/patch/685741/
>
> It has some suggestions for now to do a hard reset of the IP on boot
> using GPIOs, which might be an upstreamable solution for your issue.
>
> Cheers,
>
> Joel

I was hoping to wiggle out of needing this PHY reset if it can instead
happen in U-Boot, but now I'm thinking that would be an irritating
(and unexpected) dependency to have.

The discussion and proposed code there make sense to me. The
discussion for the general libphy driver reset looks like it has some
nuances yet to be ironed out:
https://patchwork.ozlabs.org/patch/623651/

Do you think the path of least controversy would be to port the
Freescale MAC patch to the Broadcom PHY driver?

cheers
xo
