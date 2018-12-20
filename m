Return-Path: <raj.khem@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::730; helo=mail-qk1-x730.google.com;
 envelope-from=raj.khem@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="aFCbjYV4"; 
 dkim-atps=neutral
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43Kv4P4s71zDqkZ
 for <openbmc@lists.ozlabs.org>; Thu, 20 Dec 2018 12:17:05 +1100 (AEDT)
Received: by mail-qk1-x730.google.com with SMTP id o125so48933qkf.3
 for <openbmc@lists.ozlabs.org>; Wed, 19 Dec 2018 17:17:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=MdzKC7BuvJb+7Jnnq1y4JznGIhz/zX9fYG3ZsUVrq20=;
 b=aFCbjYV4UrJMoA6Wv0aPpA4+FLsBXmpURn564AmevSxXFUV1lXCWDnJ7BK1JhVQt1b
 XquoOzvRPq9lQE+x0z5Aq0rCAYZ67CRXjX55gecC7G6JFEfA042/OrOaVavBpKYwoEHZ
 vN1czGvHqaweITLFgSNqWXENoRpzmZJwrCOyPskSpL9sI0fKzTo4zt0DFrJujRVUoI8c
 ja/yClGgq9Io4u9PGoXwKoXiOQfAq7w19emUgBkb7oKzfoJ4O51hpycj6e3OkyKf4Yw5
 5tq3R3xDCIiuuIEoYhZclZAyOVkDI1ICPCDYq0/Dq7uM3Rxf1QRbnU/h785OWODcyTL9
 fucg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MdzKC7BuvJb+7Jnnq1y4JznGIhz/zX9fYG3ZsUVrq20=;
 b=RhE0YPWLltDOAjVk75KpW8ZGrBmB8pR1yDxVx3/8ZEEBYncbpD9xSodrMWj8KEogQu
 Z38Sjaa2DmercaPYu8H4TTzMPRpbosp8FMwmdLv1E7tN7S6SazOYmV58TxdxLUZeC2ie
 g4VEw0uZm23wMobYchHh7UqChyEj8nUsOYnE3liCFUYJvI5gZlwxjh4zDuKov3c90A70
 zFmV8OLV9vJ5+DzwHIIXRo73FqGwD6SqUimFWod88Takl1abA7H1NNP907iPFQaArWxO
 bdm09m1xPDFKv1inlzp0gJMQ6k6t5wqh6KpDuwcpD6Va6j4uHQKbYIqWbUAhX3IKjz2V
 13nQ==
X-Gm-Message-State: AA+aEWZqy48XRcgw0qLQeQGopsdm5LH9OOnvrZrF0xTHSh6SaXwQW3aJ
 R4GWM8LIAoKSJIX+HZ1xsO7KVCo5bkZha8M4Yrg=
X-Google-Smtp-Source: AFSGD/XipdTQsBpMaiHOZLwt6uUcz7TjAN7VvG0IMgRyWdz//joZAN1+1BuO9hkkxnbJBIac6asFaqDH68t2KlMijRg=
X-Received: by 2002:a37:a80a:: with SMTP id r10mr23436124qke.2.1545268623124; 
 Wed, 19 Dec 2018 17:17:03 -0800 (PST)
MIME-Version: 1.0
References: <e0464c53-3d11-884c-75bd-1e78aed97ded@linux.intel.com>
 <E4F39B19-40EF-4774-B2B3-6C37A2CB98DC@fuzziesquirrel.com>
In-Reply-To: <E4F39B19-40EF-4774-B2B3-6C37A2CB98DC@fuzziesquirrel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 19 Dec 2018 17:16:37 -0800
Message-ID: <CAMKF1sq5rCLE+mW4zzs59kpZnA_g9LJzvpSL0TyW5Lng8A0Xdg@mail.gmail.com>
Subject: Re: [OE-core] flto automake
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: James Feist <james.feist@linux.intel.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Thu, 20 Dec 2018 01:17:10 -0000

On Tue, Dec 18, 2018 at 4:42 PM Brad Bishop <bradleyb@fuzziesquirrel.com> w=
rote:
>
>
>
> > On Dec 18, 2018, at 1:08 PM, James Feist <james.feist@linux.intel.com> =
wrote:
> >
> > If you aren't planning on enabling flto in a repo you can ignore this e=
mail.
> >
> >
> > I've created a new class flto-automake https://github.com/openbmc/meta-=
phosphor/blob/master/classes/flto-automake.bbclass if you are enabling -flt=
o in an autotools project you might be interested in. When using static lib=
raries you may run into undefined references when building with Yocto. Yoct=
o by default uses:


The changes are right but I think flto should also be a DISTRO_FEATURE
and this change should become effective only when flto is in
DISTRO_FEATURES

> >
> > export AR =3D "${HOST_PREFIX}ar"
> > export RANLIB =3D "${HOST_PREFIX}ranlib"
> >
> > for AR and RANLIB. This new class replaces these with the gcc equivalen=
t wrappers that can work with the flto object files. This doesn't seem to b=
e an issue for the CI build, it only shows up for Yocto builds. Reference: =
http://stackoverflow.com/questions/25878407/how-can-i-use-lto-with-static-l=
ibraries#comment67660913_25878408
> >
> > For Cmake I suggest looking at the way bmcweb handles it in CMakesLists=
:
> > https://github.com/openbmc/bmcweb/blob/master/CMakeLists.txt#L92

hardcoding is not right. We have cross versions of these tools
installed during OE build and we also have options to use non-gcc
compilers, e.g. llvm provides its own verisons of llvm-ar and
llvm-ranlib and llvm-nm which should be used when using clang
or other llvm based static compilers.
This is right fix for cross compiling with CMake
https://github.com/YoeDistro/meta-ti/blob/yoe/mut/recipes-bsp/rwmem/rwmem/0=
001-Use-CMake-provided-vars-for-ar-and-ranlib.patch

> >
> > Thanks,
> >
> > James
>
> Thanks James
>
> I wonder if this is something they would be interested in upstream.  I=E2=
=80=99ve copied
> the oe-core mailing list for possible comment.
>
> -brad
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
