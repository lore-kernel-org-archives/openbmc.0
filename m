Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::842; helo=mail-qt1-x842.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="ZOBwDGIT"; 
 dkim-atps=neutral
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 440LP972RYzDqR1;
 Thu, 14 Feb 2019 13:46:05 +1100 (AEDT)
Received: by mail-qt1-x842.google.com with SMTP id w4so5304699qtc.1;
 Wed, 13 Feb 2019 18:46:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3/MRHWH1eDADDzg2rOvmAkC2VlQ9FZSO20nJ01BKou0=;
 b=ZOBwDGIT+ZM/62JcaKodRruEg6MZEx7u1rDKDLZI7oUdTUaqmLP/oPE9H2AqCEy6Yh
 AGE01qRXvWMxMEm1uao4AM5MOd1oUasFq7YYo7pcyN/CsXADMuG6CCaTqzDPuoXMlj/Q
 7taEStcUyJt81+2hKw1oX5Kxufsnlgaw0WpwU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3/MRHWH1eDADDzg2rOvmAkC2VlQ9FZSO20nJ01BKou0=;
 b=izD0Z+kV7eNPSsYMx3JUgbFixFxw1sgjWJ8qohdNOm8eWLJxUUVEEAcjre9nWRx3Wn
 t35FYlc2YE0WR4BWk3AEP/H4qEJ8qXARI+YKvBk3F/RSqn56OKy5pYoOZZLEnx5i15X7
 rAREaCNs65oN73xAM5A9mTHiAVw20URmq7xdXQQagGT6bS9s8CQbjXTQuIYxd36JHVE6
 pNmjhRqQw7GJDtQwqWlyq5ly0WshOt7kN5IuEloQf72Y0mgQM+QL4lBs/fx+F4zGdRmx
 NkToBjIIbRDu5qFnPQKg6by26GlPXFihKAGp/M08vJe0X4ACQtDW65hiSTxhqJ+nEjAG
 vAnQ==
X-Gm-Message-State: AHQUAuZFNSXciGo4wuiNyn2U5mDX+Bw2bdX7nkYQfgahki2Xmnwe88Z9
 CSn28q6TlI0leCwyyJyhFRkAlKrnnd5U5EI5VvI=
X-Google-Smtp-Source: AHgI3IYVFUxFm5ZUKno8dfN1w1OUychW7eKLBeT+GFdZOe1hsy/Drqp7SV49xIoy6ltd72KHDHIq+FvP//j52i37m8o=
X-Received: by 2002:aed:3574:: with SMTP id b49mr1115856qte.235.1550112362963; 
 Wed, 13 Feb 2019 18:46:02 -0800 (PST)
MIME-Version: 1.0
References: <1547708191-8721-1-git-send-email-wangzqbj@inspur.com>
 <4C4C6975-CA11-4609-BF8D-6246A1C5F193@fb.com>
In-Reply-To: <4C4C6975-CA11-4609-BF8D-6246A1C5F193@fb.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 14 Feb 2019 13:15:51 +1030
Message-ID: <CACPK8XdFPLdGJw2RM3r55wX=8U1UgLNN_kk-9jBZenMF6ezSpg@mail.gmail.com>
Subject: Re: [PATCH] ARM:dts:aspeed Add Inspur on5263m5 BMC
To: Vijay Khemka <vijaykhemka@fb.com>
Cc: John Wang <wangzqbj@inspur.com>, "andrew@aj.id.au" <andrew@aj.id.au>, 
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, 
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Thu, 14 Feb 2019 02:46:07 -0000

On Wed, 13 Feb 2019 at 08:40, Vijay Khemka <vijaykhemka@fb.com> wrote:

> =EF=BB=BFOn 2/12/19, 1:58 PM, "Linux-aspeed on behalf of John Wang" <linu=
x-aspeed-bounces+vijaykhemka=3Dfb.com@lists.ozlabs.org on behalf of wangzqb=
j@inspur.com> wrote:
>
>     Add initial version of device tree file for on5263m5 ast2500bmc
>
>     Signed-off-by: John Wang <wangzqbj@inspur.com>
>     ---
>      arch/arm/boot/dts/aspeed-bmc-inspur-on5263m5.dts | 146 +++++++++++++=
++++++++++
>      1 file changed, 146 insertions(+)
>      create mode 100644 arch/arm/boot/dts/aspeed-bmc-inspur-on5263m5.dts

>     +&pinctrl {
>     +   aspeed,external-nodes =3D <&gfx &lhc>;
>     +};
> This pinctrl definition is not required as it is already defined in aspee=
d-g5.dtsi.

I've already applied the patch and sent the pull request. Please
follow up with a patch to clean this up.

Cheers,

Joel
