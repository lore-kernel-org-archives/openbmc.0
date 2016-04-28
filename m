Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x242.google.com (mail-oi0-x242.google.com
 [IPv6:2607:f8b0:4003:c06::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qwSmm6LxbzDq5g
 for <openbmc@lists.ozlabs.org>; Thu, 28 Apr 2016 17:16:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=WwqF2MIz; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=HSlU6MQp; 
 dkim-atps=neutral
Received: by mail-oi0-x242.google.com with SMTP id w198so7460561oiw.2
 for <openbmc@lists.ozlabs.org>; Thu, 28 Apr 2016 00:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=XIbbLcjG1nWE9QqOoNFiiNuS/bb9C4X+ZwSGQ0a61k8=;
 b=WwqF2MIzou7lbWsMXGJOFpzvKQb4PmNGNKnN4icc9GJoYliXczu3giDp2hC5FmZYGZ
 87Gskz50jVh8etJTxr5UNZHwp/pLJHwj83VjyDruaf4/gjBHkto4G5PstyIvZtqurTv3
 ZXX9Nt9p/5F3JF++Phdzdo5ao3rt9UfZO1aUjIQDd0O8rxgu+b6QU8O1bvHFCXxOdnHa
 iHDPUnckF6P7mU2R5+CETsR27rDdp87/VXxAzmWqD11dtgOsIzTdq7/qpBzagvpfGYB0
 f/DlPH3sbCmQx6VrOge6GDKTHZget7AhvXH+C7ofW3TqLCufu/g3pNevfsL1gF7650Jb
 bXMg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=XIbbLcjG1nWE9QqOoNFiiNuS/bb9C4X+ZwSGQ0a61k8=;
 b=HSlU6MQpzJEn1TO72uRYDFh3DK1Q2QT1ddePq2SG+8st4f83lRSvstn0QaYFtnD7JP
 ZPIkScaG6HLevcGzZqhgPyvrzXEZJ3D7W6mGl5iBJz61bvuPRcN29N7OAqfFb4kCttzg
 m++Y7gIHWGUNiUfg6VKzCoiz/gVwcXyDeXWyo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=XIbbLcjG1nWE9QqOoNFiiNuS/bb9C4X+ZwSGQ0a61k8=;
 b=BhtBiRwMOkF4WMM8ronk4EsenSuLS8h50xzD0W4e9Mnkqdure0ZSviYqTfyr61zy5X
 /uQMPC3HIJEI5W2jm9GK5Bvj3SXvv1wQb9g0lheg/j/tQf1i1o0RJKWViTveglrzCZcq
 vAjlPEmvLdcgJOBkc8kFW3MgZyKGTAOsk3vzdEyYhUF+WLxpCGb9XbDYOo1bHj+xIOYa
 WWpwFhhbBqsqExuG7Y+439my8dx6ORzkXoesJZGktPd6VV+TccrfBpHvFwP56MF2FFyd
 dj3ZEmrVRH/YjaK2yfoT22jNZOLtn57/NlvgAlMPwjPRhN22P5ZUaCUPbF/wnzHORReN
 AkWg==
X-Gm-Message-State: AOPr4FW6pJBjXfciVfA1nLSt/HlgV/ejJIkYSsbJssx89vGOMPieBTH2MbkGJLemCDUNnZzctJf1scn99Z7/qw==
X-Received: by 10.157.35.113 with SMTP id k46mr6013584otd.34.1461827782507;
 Thu, 28 Apr 2016 00:16:22 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.60.79.200 with HTTP; Thu, 28 Apr 2016 00:16:03 -0700 (PDT)
In-Reply-To: <1461820769-10414-1-git-send-email-jk@ozlabs.org>
References: <1461820769-10414-1-git-send-email-jk@ozlabs.org>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 28 Apr 2016 16:46:03 +0930
X-Google-Sender-Auth: a4JFfW6EEBIPQW6OVh2ZAWJfJZQ
Message-ID: <CACPK8XdPjLeuFDocm+8x6L9nknfB6WBq5t2o17oVkPrZ-OOTbQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] server: Allow handlers to fail init
To: Jeremy Kerr <jk@ozlabs.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Apr 2016 07:16:25 -0000

On Thu, Apr 28, 2016 at 2:49 PM, Jeremy Kerr <jk@ozlabs.org> wrote:
> If a handler fails its init, we don't want to invoke its callbacks.
>
> This change adds a flag to struct handlers, to indicate whether a
> handler is active (ie, init() has returned success). Only active
> handlers are used.
>
> We also change the handler list output to indicate which are active.

Looks good. A minor comment below.

> Signed-off-by: Jeremy Kerr <jk@ozlabs.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  console-server.c | 17 ++++++++++++-----
>  console-server.h |  2 ++
>  2 files changed, 14 insertions(+), 5 deletions(-)
>
> diff --git a/console-server.c b/console-server.c
> index f8feb52..45dd07a 100644
> --- a/console-server.c
> +++ b/console-server.c
> @@ -257,7 +257,7 @@ static void handlers_init(struct console *console, struct config *config)
>  {
>         extern struct handler *__start_handlers, *__stop_handlers;
>         struct handler *handler;
> -       int i;
> +       int i, rc;
>
>         console->n_handlers = &__stop_handlers - &__start_handlers;
>         console->handlers = &__start_handlers;
> @@ -268,10 +268,14 @@ static void handlers_init(struct console *console, struct config *config)
>         for (i = 0; i < console->n_handlers; i++) {
>                 handler = console->handlers[i];
>
> -               printf("  %s\n", handler->name);
> -
> +               rc = 0;
>                 if (handler->init)
> -                       handler->init(handler, console, config);
> +                       rc = handler->init(handler, console, config);

you could do handler->active = handler-init(), and drop the rc all together.

> +
> +               handler->active = rc == 0;
> +
> +               printf("  %s [%sactive]\n", handler->name,
> +                               handler->active ? "" : "in");
>         }
>  }
