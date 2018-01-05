Return-Path: <xow@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400e:c05::22c; helo=mail-pg0-x22c.google.com;
 envelope-from=xow@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="n7IDXYo3"; 
 dkim-atps=neutral
Received: from mail-pg0-x22c.google.com (mail-pg0-x22c.google.com
 [IPv6:2607:f8b0:400e:c05::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zD0DP5qPZzDqJx
 for <openbmc@lists.ozlabs.org>; Sat,  6 Jan 2018 09:47:32 +1100 (AEDT)
Received: by mail-pg0-x22c.google.com with SMTP id j2so1305279pgv.3
 for <openbmc@lists.ozlabs.org>; Fri, 05 Jan 2018 14:47:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=wgBmUlZXq5G1N9PJVq7qOjpu8Wwgdu/VaAKreapy8gI=;
 b=n7IDXYo3lC5LlEs5kHuC7aeBS89GXIpYn/HYVPm0DhxCEifhDxv9znQicquJ1Bajqn
 r06nPW0dB7pxhu+jDqSH1cOBwDi/nNL6PNYI4pZR4zUa8DW46X1yh3r5mMDSnLgrR+bt
 QnIpR2rBObwSFfDHI0sFnQbC9mwYwHIejVyoQ5MELV+DiunglMQhqHZwD1dIU6FAqeiz
 UP4MNHWCUNsaaMKBgaApNAH/AMXqKUnYHTYPayjOQp6hiwXONJEPGGLKRseSnG57Ojs0
 s8H40ypZU1R8oKkjdBFtriuwWzSdSoEVRv5Fi72yTHyrK+7Cb2Scv8UwE4E1xs+4ADSI
 OriQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=wgBmUlZXq5G1N9PJVq7qOjpu8Wwgdu/VaAKreapy8gI=;
 b=S5AizicvGrBFmezeizAqgN6FWJM47FlWSpIamAaUBTKqoebiPa7DrFd3iyKPyJ06+/
 aZ/WCGncP1ofqlMUWv2DkYRfXCxzzOy4LPAA7vRrhuKq9SiNYjFQitgftJ9Pb/dCFrZa
 9yeWcdQiPFqMn2WKrmL27YTuxjB0O0iGIisGubQ9Y/zfRSlThNjWvyEaTDOGWxhh1wyo
 UcbtDAMFFRaSO/lWRXrhtdVrEBO5ni9zXCpIfFzbGIFLtqIkTlG0JXBVaKrGeM2XMHPm
 mzTVOLP4jviw4ngvQKt9qVdZDbZBP7gAzKSosb8If9NXlLsy4Qw7vum4djRciQzIfO9C
 My4A==
X-Gm-Message-State: AKGB3mK/4HgelhqSONfZhYDb01+YIyO5GURs+ZUWhl8sRzlqJhKvsJSH
 SCS3/3XAYLFYBOItKR52E8wuCADr0r/wHzDeE3oNTIE7ePU=
X-Google-Smtp-Source: ACJfBotFkjggRfOQdx+wx32TveN6UI91x5iIMcXWQrZuk9cqh02Vea9eaH+7v+PVotcfQE9O2y61sFFY08NeswvHfs4=
X-Received: by 10.99.51.77 with SMTP id z74mr3520775pgz.324.1515183953598;
 Fri, 05 Jan 2018 12:25:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.185.4 with HTTP; Fri, 5 Jan 2018 12:25:52 -0800 (PST)
In-Reply-To: <17364132-2499-fe30-b7e3-935008e8e9be@gmail.com>
References: <17364132-2499-fe30-b7e3-935008e8e9be@gmail.com>
From: Xo Wang <xow@google.com>
Date: Fri, 5 Jan 2018 12:25:52 -0800
Message-ID: <CAPH-5w7=t0xZVbb4TfJ+_r57uqMLj8+XVJBQ6aGiPm9=PBqCwg@mail.gmail.com>
Subject: Re: Enable Thumb for Aspeed 2400
To: Huy Duong <quochuybk2010@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Patrick Venture <venture@google.com>
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
X-List-Received-Date: Fri, 05 Jan 2018 22:47:36 -0000

@venture you might be interested in this.

On Thu, Jan 4, 2018 at 9:55 PM, Huy Duong <quochuybk2010@gmail.com> wrote:
> Hi all,
>
> On Aspeed 2400, /proc/cpuinfo shows that Thumb is supported. But look like
> thumb is currently not enabled in Yocto.

The AST2400 build is already targeting the ARM926EJ-S and building for
architecture armv5te (see tune-arm926ejs.inc).

>
> I tried to add "ARMPKGSFX_THUMB = "t"" to
> meta-openbmc-bsp/meta-aspeed/meta-ast2400/conf/machine/include/ast2400.inc
> and see that everything still works well.

Right, packages still default to generating ARM code (as opposed to
Thumb code) because ARM_INSTRUCTION_SET isn't set. I think what you
did will force all packages to build emitting Thumb, even those that
prefer to be built emitting ARM.

>
> Is there any reason why Thumb is not enabled by default? I think Thumb can
> help to improve performance a lot.

You can experiment by weakly setting ARM_INSTRUCTION_SET ?= "thumb" in
your local.conf or machine configuration, which will default packages
to build emitting Thumb.

As for performance, can you back that up? It's my understanding that
Thumb (the first version) can be denser than ARM at the cost of
execution speed because of how limited the ISA is.

With that said, the AST2500 should have Thumb2 support, which ARM
claims minimal impact to performance for even more compact code than
Thumb. A quick glance through our build files shows that the AST2500
build is targeting base ARMv6 and Yocto might not even have support
for Thumb2 on ARMv6 (doesn't seem to pass the right gcc flags). It
doesn't look like a huge amount of work to get those right.

Either way, this could be low hanging fruit for reducing code size.

>
> --
> Thanks and best regards,
> Huy Duong

xo
