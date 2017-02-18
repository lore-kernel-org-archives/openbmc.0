Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x236.google.com (mail-yw0-x236.google.com
 [IPv6:2607:f8b0:4002:c05::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vQBSs4LLtzDq5W
 for <openbmc@lists.ozlabs.org>; Sat, 18 Feb 2017 12:02:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="gbG3fI0y"; 
 dkim-atps=neutral
Received: by mail-yw0-x236.google.com with SMTP id u68so30651102ywg.0
 for <openbmc@lists.ozlabs.org>; Fri, 17 Feb 2017 17:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=jk+Rsqwey/JBTEsy7R2QYGCQ2H8cFxqh9vEiQtBnkfo=;
 b=gbG3fI0y2UGXJvPW6Mr2pBuvYKLFVQNQtmvTBXIcQbRDdcMqh0aXFhUPbn/I90NAVO
 UPUZ1LEvjWQq3pw2ovu6UrykFSo+iPNBBQnrjpX1yHdmtXijBg1XU3gpFFQCfE8A7Clj
 9EJ1uEuCA9NNzCXRMeTx70yxAoYAXqBqQsimaO7n1V1CHQvm0ckpGGIiN25Ox8qW0lJ/
 6X1QbqFIMYrWfbAr7dPtcgT52fD34FekXCowhKXRZgH3tDJKXFYcN6rtA99/8r80kiKw
 zdJ5eM8fFmYVL/4alKBcsaAlXBUHl2tKL1vd3WwP0/Ff90eedrCAZVMZ9d+5mipD2PXo
 KN2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=jk+Rsqwey/JBTEsy7R2QYGCQ2H8cFxqh9vEiQtBnkfo=;
 b=miLM9oxhLAgP3iNNU8pcGllddA9eedaXA6TK0VS1IMRaLJhfWEiXCs3xcL8gbX+ilr
 ahOEbs8H26rkgjHHKjrAIYf7z8YlNIQ2UEFiIYaHCywioWqeaUK0nZ3BjUfey7QpfK8X
 A3XlAuZcGh4Me8+hNkwiJ6xDEEjaKaoeJdhwzbZf/ARTmYhYS5YY2Nj3PPTzVRs2u79F
 NnCQpZyYFFxuduZW1wXmM4ySbeTC1Qkj8OdIbMcOdqmXWqQN7UbXBZeHEatSc90vw2nj
 Zd9krWPgsCArTmtVC8FJ6p3ZGm6kbVoFGG345K2t1kFV4rb4RRs8ROzIO/pvreXxpAA3
 mLAQ==
X-Gm-Message-State: AMke39ll/zLVpC5uHra0libsudmNRoGyF3UMpOqUDfCdzWEIVXDamDJlb15i3ck1VxQRVS+HYP9hyuHE0Hb71A==
X-Received: by 10.129.91.194 with SMTP id p185mr7939091ywb.50.1487379754945;
 Fri, 17 Feb 2017 17:02:34 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.170.41 with HTTP; Fri, 17 Feb 2017 17:02:14 -0800 (PST)
In-Reply-To: <VI1PR0502MB30211D216F237DA5240F6FF9DD5D0@VI1PR0502MB3021.eurprd05.prod.outlook.com>
References: <VI1PR0502MB30211D216F237DA5240F6FF9DD5D0@VI1PR0502MB3021.eurprd05.prod.outlook.com>
From: Joel Stanley <joel@jms.id.au>
Date: Sat, 18 Feb 2017 11:32:14 +1030
X-Google-Sender-Auth: jFCZaSseavtYO2gPwz0IYUGDymQ
Message-ID: <CACPK8XdnwsbcJ7nJ4QWXXGnmvhswBaHsnjajAKSURbiZN7ZnUw@mail.gmail.com>
Subject: Re: DSTREAM/DS-5 use on AST2500 EVB
To: David Thompson <dthompson@mellanox.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Sat, 18 Feb 2017 01:02:38 -0000

Hello David,

On Sat, Feb 18, 2017 at 6:45 AM, David Thompson <dthompson@mellanox.com> wr=
ote:
> Does anyone utilize tools like DSTREAM & DS-5 for
> development and debug of OpenBMC software on
> the AST2500 EVB?   I=E2=80=99m actively looking to create,
> or acquire, the required DSTREAM/DS-5 platform
> configuration files for the AST2500 EVB platform.

I had to search for DSTREAM. Is this what you are referring to?

 https://developer.arm.com/products/software-development-tools/debug-probes=
-and-adapters/dstream

No, we have not used any ICE or JTAG in our development. We have not
used DS-5 either. Perhaps try to contact Aspeed directly?

Those of us working on the low level software has stuck to open source
tools. We haven't had a requirement for any hardware debugging.

Our Qemu model of the ast2500 and ast2400 SoCs is quite detailed. Most
of the code is upstream, but if you want the latest then take a look
at our repository:

 https://github.com/openbmc/qemu

Cheers,

Joel

>
>
>
> Does anyone have these configuration files, including
>
> the flash programming algorithm file, or know where
>
> I could acquire them?  I have already posted to the
>
> ARM community boards, but no luck there.
>
>
>
> Thank you in advance,
>
> Dave
>
>
>
> David Thompson
>
> Sr. Staff Engineer, System SW
>
> Mellanox Technologies
>
> 1900 West Park Drive, Suite 290
>
> Westborough MA USA 01581
>
> Direct: 508-983-6439
>
>
