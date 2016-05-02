Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x22a.google.com (mail-oi0-x22a.google.com
 [IPv6:2607:f8b0:4003:c06::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qypN928FLzDqBs
 for <openbmc@lists.ozlabs.org>; Mon,  2 May 2016 12:36:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=VWHWonqf; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=Hp5B2ii/; 
 dkim-atps=neutral
Received: by mail-oi0-x22a.google.com with SMTP id v145so142666252oie.0
 for <openbmc@lists.ozlabs.org>; Sun, 01 May 2016 19:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=eu4haQWzYoREDVYcNU/Udseu0EUfkrMx8xwJAH3TmvA=;
 b=VWHWonqf/m0SElaOtif9ztP7hHZo9W62TfkqW8IklB9iLyHMxgYRNf/g2AyZ/VuzZx
 B0Fio1Ei1axx2g1pg6eckin9qa7RWNtQTd/vaHKoVuzsWZUrt0m3OACxXiDi9GGQoCZV
 bnlme3D+7+jmCvlexC5nJDO+sowC3rWTW5vYF6N1ongYNPoRXaLPGPHFJXf2qlxOAcDa
 x43fKvq+2G3BrnTPmS1pIAF69teXXH/WUUibIW6JurjBAI21gPkFAczuNk1ZbDZxSMPm
 41c4tFj43nUQC7NJtmbH+AuR1lwuExrIjuh1raDRw7oTCzNHneDUbB9yrlFgcK7pp1Rr
 aRfw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=eu4haQWzYoREDVYcNU/Udseu0EUfkrMx8xwJAH3TmvA=;
 b=Hp5B2ii/1nxOz2RSoOmFXeXD5a/LXmfSv7FLQ3o8GY/af2ev8pj74SGmpLIf6rx0xw
 lsjN9R6b+T64BfL8lCNe3vLD5/96eaJcagUYWXUgIjFhajOLJ6+rl7cqoYeQ8DvoU0WW
 hQQYk5xMBI5tlmJbuHMaj/C/UMnp2PGgfFytA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=eu4haQWzYoREDVYcNU/Udseu0EUfkrMx8xwJAH3TmvA=;
 b=G3lIB1DXgKARpJavD/Hlr+eGf6HKTBMI42y4Uk5HCcQkKbqFwrYpdoC0npPeAKKIQR
 iBxRnLmLQXVFH8Xx8p2dryEIiNy2NT4LSHCnprtLKAE98xOwFFfoP8uP4MUqjtPJwjyd
 VxRk6gg4PglutEkHpNtc2x5y36BzR5wUCfgpYmTAlhmoXDOWkyT2q+hadpwUeQYkT9gB
 IyHF/IbdGMdBF7YVL7X+oZw7RacLpHerFLpmX0dxDYExqXItQ5f6lai2C4S18oqi2YUp
 WwEPUR+zhZDnG8OIaZ2ywVXwvq5ORRNQS6GvFzKU4l1l7CCgQbdCcB6ylFJz1IcIrypD
 poaA==
X-Gm-Message-State: AOPr4FW8r7CBPKXro/1xuMNGoty+O3y3zSTnx8hZodZWOZ7vd1BtldabYvBpBriylrAaYH+J9KfiWpVk1cmADA==
X-Received: by 10.202.230.137 with SMTP id d131mr14204872oih.168.1462156598997; 
 Sun, 01 May 2016 19:36:38 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.60.79.200 with HTTP; Sun, 1 May 2016 19:36:19 -0700 (PDT)
In-Reply-To: <CADUykeoN5=KtG7FKuCOrDEY5u46VjJN3mvqmuC8CpkaemFrMNw@mail.gmail.com>
References: <CADUykeoN5=KtG7FKuCOrDEY5u46VjJN3mvqmuC8CpkaemFrMNw@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 2 May 2016 12:06:19 +0930
X-Google-Sender-Auth: d6CjKhFXD9dfUIZmK2unCAIN9qU
Message-ID: <CACPK8XeO=pANLMuVKW-1MkJ3eRymHMynH0Q-PjjJNnTX-TeLTg@mail.gmail.com>
Subject: Re: qemu: Question about including Facebook's Yosemite board
To: Teddy Reed <teddy.reed@gmail.com>
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
X-List-Received-Date: Mon, 02 May 2016 02:36:41 -0000

On Sun, May 1, 2016 at 5:57 AM, Teddy Reed <teddy.reed@gmail.com> wrote:
> I'd like to model the Facebook Yosemite board in QEMU, which from the
> QEMU model perspective, is almost equivalent to the Palmetto. The only
> requirement for the board, outside of the AST2400 capabilities, is the
> inclusion of 2 flashes.
>
> Here's an example of what I mean:
> https://github.com/theopolis/qemu/blob/bc20ef6a7a17f8424571234d4429e7e6b67f17e8/hw/arm/fbyosemite-bmc.c#L78

Great! This is really useful.

> If you don't mind including those flash definitions in the Palmetto
> model I can save some QEMU complexity by not adding another board
> definition, which IMO is ideal. If that's the case, I can also submit
> a patch to add the flashes ASAP.

I'm torn. Similar to Andrew's work to get the GEM ethernet device
working in the palmetto board, I'm not sure we want to add hacks to
that don't represent the physical system. OTOH, it's nice to be able
to boot a flash image in Qemu.

What do you think?

Cheers,

Joel
