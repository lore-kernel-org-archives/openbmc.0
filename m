Return-Path: <joel.stan@gmail.com>
Received: from mail-qk0-x244.google.com (mail-qk0-x244.google.com
 [IPv6:2607:f8b0:400d:c09::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rthdS0CQ9zDqN8
 for <openbmc@lists.ozlabs.org>; Tue, 19 Jul 2016 11:04:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=JQ3JY+Zz; 
 dkim-atps=neutral
Received: by mail-qk0-x244.google.com with SMTP id q8so303341qke.3
 for <openbmc@lists.ozlabs.org>; Mon, 18 Jul 2016 18:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=LXOjre8upjYJjRwnoZjPcjx8k1S5sDMHiSdVR9SQV1M=;
 b=JQ3JY+ZzTjxP90J1R8Z4g+MyIDugQpGIhRtX6yKjIVhjzAeOk2iRIMMuvdO1GnmQfg
 ge7NlhF78soxKyNchSCV1bczs1AbvI8JWW/xCkepGP8oz7tPtv9EyPRkasF1fhjeps0e
 qmL/bUW+I1nnxSOwlSSxY5IFt7HPYlXj+ChlGEMKCGXX5iqkzQUAb4biSHlnAKXlEg7E
 o7Xf9hAPSzL15/3eVxsTc/DiE9jFTyWNVQR5U0VU/FLpzfxZerIG+Edh7NvH8d0VLPte
 IV6UEKLJ1agiArFVi8PB1jt8rQQYUaekxpUo6GQ6z34FLauXGKs7G9nQPn+nawZK1fPC
 KIlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=LXOjre8upjYJjRwnoZjPcjx8k1S5sDMHiSdVR9SQV1M=;
 b=M+m0h47wH7UPYsmL00pIc79CpsETQMPhz8XPXTVGddnUmtbhe9TsC3kBsofh4qLzeT
 dR1DC4SQPTQYHTKxqIAAfNQydWtcrzr1YJ3pO77eEPn1o2Y1HM4uJIPSOLZSDZU6IMUa
 xLylabIQknZ634STYg+DwdSLktY+c2aLunioydx/WucRud0q4qzpYrZ6tRwxcPVERxIy
 Veozgrj0V5F+byuDJpdnvEteGxK9E68JqmtCXvkg0OJoZAoIKdYkAjAc2RoF4H6lOOJ+
 sUU/xLUD3LGGiLwQ+kDQqgAISwRpn+mLjjR+W8B5rSIslyLKlIuL6LFDTh++xP78Ac/O
 5AAQ==
X-Gm-Message-State: ALyK8tLjKq8rf1R7Hj1j8kmCvFUmqJ+gtr5wb5x+1JhJ356gyHS+dL8QRJyVq0kXZkh/ruxRVMaJbxPq7U7s9w==
X-Received: by 10.55.107.6 with SMTP id g6mr47551761qkc.166.1468890249674;
 Mon, 18 Jul 2016 18:04:09 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.237.37.141 with HTTP; Mon, 18 Jul 2016 18:03:50 -0700 (PDT)
In-Reply-To: <4df82344-5f6a-b578-d2c1-988f3475890b@kaod.org>
References: <20160713202012.10446-1-openbmc-patches@stwcx.xyz>
 <20160713202012.10446-2-openbmc-patches@stwcx.xyz>
 <1468797898.954.35.camel@aj.id.au>
 <4df82344-5f6a-b578-d2c1-988f3475890b@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 19 Jul 2016 10:33:50 +0930
X-Google-Sender-Auth: cfXti6rGeUtEblkUvz8nSQ1BZM0
Message-ID: <CACPK8XeqwatCk+xaKCeqdve-qU+aoax2UMeMXXzVonYp1O7nWg@mail.gmail.com>
Subject: Re: [PATCH docs] Enhancing instructions on QEMU
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Patches <openbmc-patches@stwcx.xyz>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Chris Austen <austenc@us.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Jul 2016 01:04:12 -0000

On Tue, Jul 19, 2016 at 5:19 AM, C=C3=A9dric Le Goater <clg@kaod.org> wrote=
:
> I will have more time next week to do a resync of openbmc/qemu if you
> don't. 2.7-rc should be out then, so it will be the moment to rebase.
>
> I would also like to merge the ast2400 and ast2500 soc model. They share
> enough code to have a common base, configured by a cpu model property
> and a silicon revision property. It shouldn't be too complex to push
> at the same time.

This sounds nice!

Cheers,

Joel
