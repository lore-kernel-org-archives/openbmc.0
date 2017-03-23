Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x241.google.com (mail-yw0-x241.google.com
 [IPv6:2607:f8b0:4002:c05::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vpSRk1zZFzDq7N
 for <openbmc@lists.ozlabs.org>; Thu, 23 Mar 2017 11:41:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="mApshFEF"; 
 dkim-atps=neutral
Received: by mail-yw0-x241.google.com with SMTP id p77so21927247ywg.0
 for <openbmc@lists.ozlabs.org>; Wed, 22 Mar 2017 17:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=rpQhkRn805rB92xxCHnNwGQZBfIgS4t3zt5DkHcdtOQ=;
 b=mApshFEFdUxliHOVfQJ/tOXUOBBQB9hVF4abeWVLMQCAOqzADMXzUWLSpqoasDy0Wt
 taBn7kvcM0rV/dGUGEAh/1HarmsDkoUgR0EmNddQbW9TQvQ11ec6NohLCoJOxYpHUkmB
 6y+eiQA8SpK+GMlN0QkuHt4Qlylpte1QcUIc7HS7Q31h0FGLuSl7aeKZypMQSo59cjYa
 9Sk0IqFByhoKx/Vcr3LdAl4ap6+7qseiSE8uBA+Nx308Eix2aaC3twGm7iBqh7PsPo6s
 Twlq8579bMxZKfvkzeuMKiKbGAFmNrV/dc+FFEkhC8sr27BWT30HVFbQIvEP7LaLybCo
 x+nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=rpQhkRn805rB92xxCHnNwGQZBfIgS4t3zt5DkHcdtOQ=;
 b=Pkpm0vpt/hiFV5v7LVsDM2d3PwwxNEH8RrSpg15WzNV2OPx1GF0ZFVkhkgIMDYn6xf
 noJSnn4nSJvYTXdvf3R0fAbhTUycQEhsMav/E+sqU5AH+afJ8npFBgrb6MuAcEZ+7hQv
 JWFNAV5MhHxjvigptvEP8Wh8GR/0Vl0vhPq1iR0iml5anCMk8pVQNsAm6qpx7FbemDry
 zcRyvOYGs9UeoeWXqIVI59eqsJM8SjNizW23J6DE2XWkIZgJP7kRlno+B2N20g3v82ZX
 Q/2p4Urz+SGoCeG2gaQZ1RR0w8NwukJXOEN5LvT+iTeF9W5RmzD5gvCxm46HvDbqZA6a
 SA0g==
X-Gm-Message-State: AFeK/H0jZ1YR4eVg9HIJmmhGBDPHnbsFT4tDifeRz6LSwg/+wr9tT9Kue0zOPt7HaI4c56R5/WcjGvSSNXSItA==
X-Received: by 10.37.194.5 with SMTP id s5mr27973184ybf.136.1490229711263;
 Wed, 22 Mar 2017 17:41:51 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.37.197 with HTTP; Wed, 22 Mar 2017 17:41:30 -0700 (PDT)
In-Reply-To: <20170323002727.117666-1-peterh@google.com>
References: <20170323002727.117666-1-peterh@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 23 Mar 2017 11:11:30 +1030
X-Google-Sender-Auth: x_bllAJx9yvxb7XiwCGz8kylg9c
Message-ID: <CACPK8Xc2jfaxO5yXMj=vHOt6sRmrcDa8-YcKbC3ptEwN9LCSGA@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: zaius: Enable 12V Delta Power Brick.
To: Peter Hanson <peterh@google.com>
Cc: OpenBMC <openbmc@lists.ozlabs.org>, Xo Wang <xow@google.com>
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
X-List-Received-Date: Thu, 23 Mar 2017 00:41:54 -0000

Hello Peter,

Welcome to the project. Congrats on your success with the git tools,
v2 looks much better. There's some tips and tricks on the wiki for
next time:

 https://github.com/openbmc/linux/wiki/SubmittingPatches#use-the-git-tools

On Thu, Mar 23, 2017 at 10:57 AM, Peter Hanson <peterh@google.com> wrote:
> Signed-off-by: Peter Hanson <peterh@google.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> index 3bd70ed810af..4fd27617bb3a 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> @@ -269,7 +269,13 @@
>         /* Master selector PCA9541A @70h (other master: CPU0)
>          *   LM5066I PMBUS @10h
>          */
> -       /* 12V SMPS Q54SH12050NNDH @61h */
> +
> +       /* 12V SMPS Q54SJ12050 @61h */
> +       q54sj12050@61 {

This is an interesting name. I assume it means something to you? My
favourite search engine came up empty.

You're free to use whatever name you think is appropriate for the
node, so if you want to make it name like "power-brick" you could.

If you're happy with this name then that's fine too. I'll wait for
Xo's ack and apply it.

Cheers,

Joel

> +               compatible = "delta,dps800";
> +               reg = <0x61>;
> +       };
> +
>         /* CPU0 VR ISL68137 0.7V, 0.96V PMBUS @64h */
>         /* CPU0 VR ISL68137 1.2V CH03 PMBUS @40h */
>         /* CPU0 VR ISL68137 0.8V PMBUS @60h */
> --
> 2.12.1.500.gab5fba24ee-goog
>
