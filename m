Return-Path: <joel.stan@gmail.com>
Received: from mail-qk0-x241.google.com (mail-qk0-x241.google.com
 [IPv6:2607:f8b0:400d:c09::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rbTsF3VxRzDq5W
 for <openbmc@lists.ozlabs.org>; Fri, 24 Jun 2016 17:06:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=TF9y6wkq; 
 dkim-atps=neutral
Received: by mail-qk0-x241.google.com with SMTP id j2so19670932qkf.1
 for <openbmc@lists.ozlabs.org>; Fri, 24 Jun 2016 00:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=ct8B7g+oda+RgaveVkC0GMDgs+bXlgw1xXx5vJa8rc0=;
 b=TF9y6wkq4LUtwRwWXiFVrl3Rabx8jECZOajb9NfP/pfGBp/S90D7HDlJtkKNj7XON1
 /67qUEpm7kyp75bqnnMYiXZK0mPxf0e7tRh/tnexqhPokypU3b/BIcuJDmD28TSLI30/
 2eLKHFRtq41J1dW42HfxC4YV6LWGPv/knCqtWBW2WlHrO18AMqxcBRfn8g0FEK82SoCT
 30Xad6KNwUZn44O25u4fG6YVHgpObv6vCSY0YjsQbI0JHgalJt8aRwIW1MYkNVot4mCQ
 lhQANEMzSevtU1mt1D466ClHONMoitXPbxt0yVZ9JgapgJSw1uXW3QjriU2h0/kk4jTM
 UkkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=ct8B7g+oda+RgaveVkC0GMDgs+bXlgw1xXx5vJa8rc0=;
 b=g3KYQdB22PKTbiknz/uBCM+qDrpAaqMY8L+Mk5B0gz2CDMlF37eorkn7spaFb0Ugt+
 /m1EPTwaz3b8KULjCIr3WYH8HvJBOifcUuLD4lj8u5bmEhbCngMkGtghW8FDp2gRU4lp
 SXY2z4oCZh+x3yqoQlv7qHVMid0ygFWz+/Q2glUOCyfHe/qro4Tx5fkvvpdj4WH7W5Z0
 RsTugzKGLm2ekGWUR9/UCALnjfA8QNmmQ2zte0yemA0UE/z+9gSLE3b9zp9v3ndG2WdN
 JtaceRwbVI75SPPpc2xsbZ6IgGYVVRuO+DA1uhR/K5i1qSnbQO9yOUUW7dOPJaYYq19a
 nJQg==
X-Gm-Message-State: ALyK8tJfMAv5SsxZGIiEL0vj1RbhZknfKWnSokfPSQLCfZf3qhzyKjRxHrcktllrJ+8JlnWDyCENz1KJ5HQeNw==
X-Received: by 10.55.107.6 with SMTP id g6mr2734584qkc.166.1466751999504; Fri,
 24 Jun 2016 00:06:39 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.237.37.148 with HTTP; Fri, 24 Jun 2016 00:06:20 -0700 (PDT)
In-Reply-To: <c3003f09-8281-d22a-eeb9-6ef126a39192@kaod.org>
References: <1464556805-4340-1-git-send-email-clg@kaod.org>
 <c3003f09-8281-d22a-eeb9-6ef126a39192@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 24 Jun 2016 16:36:20 +0930
X-Google-Sender-Auth: vuDkoTunOS9X7pBVc5uoBSdwbpw
Message-ID: <CACPK8Xc_5G2c2-twjJYfpUBK7GfqWAHuFetydJQOrY9-9cNyGg@mail.gmail.com>
Subject: Re: [PATCH qemu 00/12] SMC and network support
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>
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
X-List-Received-Date: Fri, 24 Jun 2016 07:06:42 -0000

Hi Cedric,

On Fri, Jun 24, 2016 at 2:30 AM, C=C3=A9dric Le Goater <clg@kaod.org> wrote=
:
> Here is a quick update as I just did a rebase of my branch on mainline qe=
mu
> (commit c7288767523f) :
>
>         https://github.com/legoater/qemu/commits/aspeed
>

Nice work! Good to see the long list of patches on their way upstream.

> To give it a try, use :
>
>         $ qemu-system-arm -m 256 -M palmetto-bmc -nographic -nodefaults  =
\
>                 -drive file=3Dflash-palmetto,format=3Draw,if=3Dmtd \
>                 -drive file=3Dpalmetto.pnor,format=3Draw,if=3Dmtd \
>                 -net nic -net user,hostfwd=3D:127.0.0.1:2222-:22,hostname=
=3Dqemu
>                 -serial stdio

I gave this a go and got:

qemu-system-arm: Initialization of device mx25l25635f failed: failed
to read the initial flash content

HEAD is ba7a28c66ec35d0a021b2182613e2cb26706d8a4.

Cheers,

Joel
