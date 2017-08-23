Return-Path: <joel.stan@gmail.com>
Received: from mail-lf0-x231.google.com (mail-lf0-x231.google.com
 [IPv6:2a00:1450:4010:c07::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xcfBd0Td7zDqhL
 for <openbmc@lists.ozlabs.org>; Wed, 23 Aug 2017 17:27:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="rawIGwAG"; 
 dkim-atps=neutral
Received: by mail-lf0-x231.google.com with SMTP id g77so3729315lfg.1
 for <openbmc@lists.ozlabs.org>; Wed, 23 Aug 2017 00:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=Ol52XsW1eBP3cbW3OajtIT1vuckD62Q+fxQqhHqSARA=;
 b=rawIGwAGqVqTpPU7BNhFloM2FHUCYLTIfmCJO6G//s2Js855gQbyMMlGtoKULelDRI
 lUf19rYD4sGgXA+5/P5bd6zvHH9ASBZKpWnEWL2fD9LtbEjrJLFq4b6ow34/VZKotpIn
 n/dl+0iNb2d5ziFF3JU4ELzDI4qCAgsMzG18vf/viHbOxwId3rwhSX1WmdW1ptU9Hghf
 tD7ZGGnfoTvbhKDVAYSz2RRuNbVZmYUGQRfvklqW2QuKTD5DbGFMM5woVbSqngvVzvJu
 HnA4/M8bgzTamSoJyP9BWg1Rc7ZzYeRZ8tpl97k5PNWK4QOUGLmH82/eKRcNVWHjC1rL
 YvGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=Ol52XsW1eBP3cbW3OajtIT1vuckD62Q+fxQqhHqSARA=;
 b=QtZPT+ohndBvKl1FzoiL6aNqfBkFiurWtWSU0CMLDBjxcdftBp7KLuvCAtWPjyLtlR
 bUHTYWTjv8gdhXBiltZyU58ccebu5jwoPqdKV3nyoXR2L+oDS1Cj9iXWqJUnuonsZwwv
 bNGuRKUNcOQhI2JdaEjzsjkZDJZSYPfwx04/aWnh4VtJRyqF2HMgUn5TrjBXJOiz0KYt
 gzTEU0sC2xw3JX2hTrNSPGDZwCvdJ84TFAz6ZQCVd9sv2LJ+LieJqPj9ofg8M2/GfFmY
 lbMoUMbTfdA2WTb85f1b0i2Hsx436tgp9IUp/s33+L4htRE4O0814akaApuxSVsV+MbS
 volQ==
X-Gm-Message-State: AHYfb5gybIlaaMmlX3hAIoeDf5NO9+jJiioLvbBQKKMbFmTmyRDju43+
 BD+wzHJVWSsTOrpR+8TIo43GIDFc40vcdd0=
X-Received: by 10.25.153.9 with SMTP id b9mr628204lfe.123.1503473221345; Wed,
 23 Aug 2017 00:27:01 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.72.77 with HTTP; Wed, 23 Aug 2017 00:26:40 -0700 (PDT)
In-Reply-To: <CACPK8Xe1O-j_GLES1z1utTF+H8qm-u7VRD3j4ZdyLvf=U49pqw@mail.gmail.com>
References: <CACPK8Xe1O-j_GLES1z1utTF+H8qm-u7VRD3j4ZdyLvf=U49pqw@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 23 Aug 2017 16:56:40 +0930
X-Google-Sender-Auth: 0jn80TVyN7SPXzdIlL9suu-SrIw
Message-ID: <CACPK8Xc5rESiJzaum4kF9toJxRhcAkHDpRNJw+jL=eak_E9Tzg@mail.gmail.com>
Subject: Re: Andrew maintaining kernel and u-boot next week (28th Oct)
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Cc: Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Wed, 23 Aug 2017 07:27:05 -0000

On Wed, Aug 23, 2017 at 4:55 PM, Joel Stanley <joel@jms.id.au> wrote:
> Hi All,
>
> Andrew Jeffery will be taking on kernel and u-boot maintenance
> activities for the week of the 28th.

Of August. Not October.

Looks like I need a holiday...
