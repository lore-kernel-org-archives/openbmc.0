Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::731; helo=mail-qk1-x731.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="ZCkdGqtV"; 
 dkim-atps=neutral
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [IPv6:2607:f8b0:4864:20::731])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43fVvq6Hx1zDqSr
 for <openbmc@lists.ozlabs.org>; Wed, 16 Jan 2019 13:07:19 +1100 (AEDT)
Received: by mail-qk1-x731.google.com with SMTP id 189so2836322qkj.8
 for <openbmc@lists.ozlabs.org>; Tue, 15 Jan 2019 18:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=O8qKPrzraF22KZIyXQWlfuDAbSInjXdbOm9yqBnz8Qc=;
 b=ZCkdGqtVgCDcn3rf321CsRThqhuJiiZc+DHrLbz4GJ0w7H8dtsQyDt7sqmqjvvunDz
 HDqKgKtMQB1anFrBSFrLCkjiMFArkPlc6bhNyX592Rb3Jm3aK563wzPlrXsUkyFw1bvw
 t/0h7rXtBOljE3MN8HWUybAWCA4bMylueXv3c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=O8qKPrzraF22KZIyXQWlfuDAbSInjXdbOm9yqBnz8Qc=;
 b=MuDzBLEZkWgSU8O9MsjzsM5otcg6eo7LhlEsD25zMQvMEnlkvU8qLTIc0s3cmBp9z9
 /KIFUF9yEKtEZA7R74hgRGS3UPlTjcZgo1gfvC3FDPj2YT3aILpR5F+uvQvFkTYZgx4X
 zrP2scU3EKQTuuWoHmtFIH40bxEp+PigAi0ALzs1l9ovxc+QXmV0fxSiJ8+es3liURlf
 YtjGowgt1AMWG7tkXjJMbK6+g4kFqzhYRymISzzi2qQgx/ZeECcFVvRU7Dws1yFzd68S
 ns7FF1YLIhBFDdytzHactY7LBpRsM04M/zssKT/lUkb1emgE9yPqXVLzZxCozoi7S3SD
 mD6A==
X-Gm-Message-State: AJcUukeqEnBASb9Xef+f0MBMGsyxOCHwTehE+BihDUn1U5Jd7jZxKrb/
 7ak7ElaEFpHAcEAuWs2OjSogxtMZmSDvsaPC9dQ=
X-Google-Smtp-Source: ALg8bN7iCC8np0+OMt+ZdKRU+kxlmiCCbe0EHE1/6TwPmH1XnM7ql23styIxHeIRz1l+fQeNrV7vbiVC+DqVb8eM3as=
X-Received: by 2002:ae9:dec5:: with SMTP id s188mr4954620qkf.127.1547604436897; 
 Tue, 15 Jan 2019 18:07:16 -0800 (PST)
MIME-Version: 1.0
References: <CAH3qHnYAVEVVgQZHaezCS6v=gUGGwUF7bsch700T-OzYv_0NUQ@mail.gmail.com>
In-Reply-To: <CAH3qHnYAVEVVgQZHaezCS6v=gUGGwUF7bsch700T-OzYv_0NUQ@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 16 Jan 2019 13:07:04 +1100
Message-ID: <CACPK8Xf95c1RH_J-TsMWYQjFqOLxLN4ve5+y5y_1pK3k6ECwgw@mail.gmail.com>
Subject: Re: OpenBMC Globalization
To: Ryan Arnell <ryanarnellibm@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 16 Jan 2019 02:07:21 -0000

Hi Ryan,

On Wed, 16 Jan 2019 at 09:21, Ryan Arnell <ryanarnellibm@gmail.com> wrote:

> Happy new year everyone! Last month in our community call, IBM Design Tea=
m discussed about globalization for OpenBMC. The slide deck can be found he=
re-

Thanks for sharing. I was a bit confused when I saw "globalisation".
As it turns out this is a IBM (and Sun!) term for what the open source
community commonly calls internationalization, or i18n.

https://en.wikipedia.org/wiki/Internationalization_and_localization#Naming

Perhaps we could use the open source terminology when interacting with
the community.

> We propose using a service like g11n-pipeline. This way we will only have=
 a single ts file to translate. Also, this way we will have more robust tra=
nslation as we will have control over translated phrases. We can also test =
our layout properly against all the proposed languages.

Can you share some more information on g11n-pipeline?

Cheers,

Joel
