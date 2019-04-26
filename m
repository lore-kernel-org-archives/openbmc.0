Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::12a; helo=mail-it1-x12a.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="D7jI5v3B"; 
 dkim-atps=neutral
Received: from mail-it1-x12a.google.com (mail-it1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44qz2Y61hhzDqcx
 for <openbmc@lists.ozlabs.org>; Fri, 26 Apr 2019 12:46:13 +1000 (AEST)
Received: by mail-it1-x12a.google.com with SMTP id y10so3532563itc.1
 for <openbmc@lists.ozlabs.org>; Thu, 25 Apr 2019 19:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1uqxwrZyfNJWtv1hO0dk0sfcNJsYoh8ddvN0QsddYUM=;
 b=D7jI5v3BhYldDV8XWdDwU3X8Od3w+5HP4yvkb0zngZqOAImNvO92+KfafJpbeAgHxn
 Ox2IdDxPyfJP6cl0tehG/gERA87Wl5MRSdFvKuAXJfBXAkPNRFbD6ZABwWpwIX0QKPbG
 9injCWxa6I3rEgQUR408p/xt0pfbXkVS4dTJ5ErOQvfYiJu73N1hqt2npFrZiaXa/9Zm
 9zpi9Y9UycSr9uYH61nuBsKuGtCSYdmzSkkzw0z5wXYgE0hYsbJYCQOiTPf+9UGQmN9D
 JX3GfgAU91sv0IJLPvh0dKCIgLFm8z+4BnihgVMPGCiw2ZbyhGIINBD22YqoVYWigurB
 xcHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1uqxwrZyfNJWtv1hO0dk0sfcNJsYoh8ddvN0QsddYUM=;
 b=qIIXHXAo3cDDzWiH7EefwePXDYVQ9QJlV6frhn8/apGlRWEvuOFGULh8B2dONFudjv
 3DNun9Pb93hwGu/WilxQOliaVG6vqjdCq4squKFLUPb8Hvsp4i8sxX95Jq5NxwI5scAp
 cIXW0Oiew8Usac+Yb9tlTzUc2qqfkbDnt18IPR1YW+90G2G3tcozHBafZ42WdnwEy+OG
 m1k+vjTkGZEiVa1gsknBzfYBipY/aRa74vEL+n+56PhyG1uyYBnOqJCSonhrg4sC9Jc2
 y1JphjEux39OK7cJw8HmsUIvQIxErUWi4iLU4AgRvVOlVOQK2GylGSa4g/SPGgnJcRv9
 OTiQ==
X-Gm-Message-State: APjAAAW/B8et33lOUPh8GHbiKR4116/Cj0+14qkYyVJl3Knya3SZenh9
 u0sYoQPC6df9inX6iMFLe6mZ3FavTLfpLqV1RYM=
X-Google-Smtp-Source: APXvYqwsAUwDpsl3j+8zc0RWb9m/kHiuB3UWd9tNMrtN5CX27+jeixDgHfrjHRsziGRucW6K+B6shiAKkb7f3KnwJX8=
X-Received: by 2002:a24:1492:: with SMTP id 140mr5836407itg.76.1556246769941; 
 Thu, 25 Apr 2019 19:46:09 -0700 (PDT)
MIME-Version: 1.0
References: <4ddbeb3bc1b64b1097775eddf9608cd9@Eltsrv03.Eltan.local>
 <CAO=notz9eixtsv48gnJgqsNBK8jx9tLR_vwuL41dZy7pAtpvZw@mail.gmail.com>
 <a666a65dca65479aac93175385efd027@Eltsrv03.Eltan.local>
 <CAO=notyfFvATQceE4XkDOQXncB2pN65ODB_O+3ucF4QtTRTQSA@mail.gmail.com>
In-Reply-To: <CAO=notyfFvATQceE4XkDOQXncB2pN65ODB_O+3ucF4QtTRTQSA@mail.gmail.com>
From: Lei YU <mine260309@gmail.com>
Date: Fri, 26 Apr 2019 10:45:51 +0800
Message-ID: <CAARXrt=X6Y=jinvBayc9gaArDasKgZjqr43L=7o56xB=Rj=E5Q@mail.gmail.com>
Subject: Re: bmcweb image upload
To: Patrick Venture <venture@google.com>
Cc: Wim Vervoorn <wvervoorn@eltan.com>, 
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "Tanous,
 Ed" <ed.tanous@intel.com>
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
X-List-Received-Date: Fri, 26 Apr 2019 02:46:14 -0000

On Fri, Apr 26, 2019 at 12:22 AM Patrick Venture <venture@google.com> wrote=
:
>
> On Thu, Apr 25, 2019 at 8:17 AM Wim Vervoorn <wvervoorn@eltan.com> wrote:
> >
> > Hello Patrick,
> >
> > Thanks for the response. I will try this. Some other thing I noticed is=
 that the image update now uses a TAR file. Basically it transfers the TAR =
to the system, then untars the file and uses it. This means the mechanism r=
equires twice the size of the TAR file.

This really is a problem for small RAM system.

> Yikes, that's absolutely true and unusable.  We only do image uploads
> over in-band mechanisms today for our platforms.  And in the future,
> that is likely going to stay the same for the ast2400s -- although
> good to know this issue.
>
> The tar is used for UBI, IIRC< and not a static image layout -- with
> the static image layout, does it still use a tarball?  We've stuck
> with static layout instead of using UBI for unrelated reasons.
>

Actually, we have tarball like <machine>-<date>.tar for static layout as we=
ll
now, containing separated image-xxx, manifest and signatures.
And we could use the same method as UBI to do code update for static layout=
.

> >
> > I am now considering to use an ISO file and mount this this will requir=
e less memory. What do you think about this, do I overlook something or can=
 this be a viable solution?
>

Yup, this is doable (not necessary ISO though), as long as the free memory =
is
enough for the BMC code itself.

> We just use the actually image-bmc that's generated and a signature
> file for the updates, but the code to handle this isn't fully upstream
> yet (WIP openbmc/phosphor-ipmi-flash).
