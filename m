Return-Path: <venture@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c05::235; helo=mail-vk0-x235.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="fmYukqyu"; 
 dkim-atps=neutral
Received: from mail-vk0-x235.google.com (mail-vk0-x235.google.com
 [IPv6:2607:f8b0:400c:c05::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ym0P20ckjzDql7
 for <openbmc@lists.ozlabs.org>; Tue, 28 Nov 2017 08:31:49 +1100 (AEDT)
Received: by mail-vk0-x235.google.com with SMTP id j67so18358012vkd.8
 for <openbmc@lists.ozlabs.org>; Mon, 27 Nov 2017 13:31:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=SACK8o603uTbSxCwrIQgMIEJypL4Zn6KKz0ZahHLt6Q=;
 b=fmYukqyuI8uP0vld1zGQT3zdWWwV9nsQNEQhHdKmmQH8jaOCsgLJ3nwSBLxhcInyIZ
 2/lURZI5TJVnydd39Mrz+hF6L8lyaGwfY8p5LmEMymN324GzgCDyliqewRJgrFYBkjFh
 lOJvS631nc8MvEEzAIagDABxZEs+FHFeOA/Co9IVyND5JXr1im67AAjiLpQeeO86GYTf
 fZccSAQIlxht1KxgfWThwBGXn3GlFPV9opoVh72QIZt67ija5iqU+WHtb0n2bN6svHhH
 8Ne2NgXPFp1y3eK1L2xD4/XzaEwNKLXjnKwBRsMD34/rExH25X/KepTcs4HIv/6b7rGO
 pUww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=SACK8o603uTbSxCwrIQgMIEJypL4Zn6KKz0ZahHLt6Q=;
 b=sES0SuG4tQkk0tiTvRuEX06Gsfu/BwXOFGr4zpAF3A8x46v34iHTi0ow+x/KzOkga7
 R8J3VhZOj78Xff5sjK8ZBaMVBPHkGTMpyQcpkuqXpYnRrCHeedIA6WoGqDQ8k6y53+M8
 HEB7OZ/JTFFVQsvpyD72J8H6yZo4XX9nrSpzQZoil9ezMD4M6dmupOhtU0l7z8n3nIy5
 VpjBevmrTu8EbG7/5Bb/cUkuhkemg5KaVnuo2ZlKcvbKeIPe4/lCSufK1mUeliPdm6iF
 KDSUk7Mm7atGO+18uZeoncqVqHitwk9I6m0uKeOJs4DYLttrXCzhupWgxm/HI0uyLmw0
 DxSw==
X-Gm-Message-State: AJaThX4np/Di2U06yi1BKM7ABxE3Wt+EFcsN5zjiHTqCT0y2pPGGY3bq
 V2Gw5l85ZCyZ6vgz5fmbaYTmSzv7F3Iz7+z2V4W6Fg==
X-Google-Smtp-Source: AGs4zMZfNT4JB4wFnRjnVV1Uq5HHk9CWonKrYeCJazKHta6JP29fKyfizuCsobAYzaFgkdkcefcRqsJfVt/25MCHbq0=
X-Received: by 10.31.167.85 with SMTP id q82mr7702501vke.49.1511818307057;
 Mon, 27 Nov 2017 13:31:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.94.150 with HTTP; Mon, 27 Nov 2017 13:31:26 -0800 (PST)
In-Reply-To: <1511817272.13581.27.camel@fuzziesquirrel.com>
References: <1511817272.13581.27.camel@fuzziesquirrel.com>
From: Patrick Venture <venture@google.com>
Date: Mon, 27 Nov 2017 13:31:26 -0800
Message-ID: <CAO=notxaO+m3oCGJxHZhhaUhqh-t9ahENgpVrSBy4JysFeiHEw@mail.gmail.com>
Subject: Re: RFC: multiple system configurations in a single image
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Mon, 27 Nov 2017 21:31:50 -0000

On Mon, Nov 27, 2017 at 1:14 PM, Brad Bishop
<bradleyb@fuzziesquirrel.com> wrote:
> A new use-case for OpenBMC I'm excited to support is multiple system
> configurations in a single image.
>
> First, a recap of the current state of affairs.
>
> No support exists in-tree for this use case today.  At the moment
> OpenBMC applications are data-driven using in-memory structures (via
> generated source code).  This is the yaml->python->mako pattern you
> might be familiar with.
>
> Obviously this pattern alone does not enable multiple configurations to
> be supported in a single image so a fundamental change is required.
>
> One proposal that has been made (out in Gerrit) is to replace the YAML
> with JSON and parse it on the BMC.
>
> I'll outline what I think the good/not-so-good of this approach are, as
> compared to some other yet-to-be-invented idea for achieving the same
> thing.
>
> good:
>   - low complexity
>   - removal of python dependency from application build

Extra pro: you can edit it at run-time and relaunch the application :)

>
> not-so-good:
>   - complexity shift from build to runtime (parsing, validation)

There is a downside to delayed validation, however, the parsing is a
"one-time" start-up cost for the applications.  Also, it might be
cleaner in terms of one system file describing everything that all the
different daemons can parse... there are certainly a few different
approaches to this.

>   - loss of implementation freedom of choice (adopting the proposed
> solution _requires_ json parsing on _all_ platforms using reference
> applications, even platforms using single configuration images)

Previously for the most part, we all had to do yaml->cpp, which
certainly had its own drawbacks.  I think json will provide a cleaner
mechanism for backwards compatibility.  Every platform wont' need to
regularly update their configuration files unless there's a breaking
change.

>
> I'd like to hear about any of the following:
>
> - alternative ways to support multiple configurations in a single image
> - items missing from the pro/con list above
> - thoughts on whether or not the cons listed have any meaningful impact
>
> thx - brad
