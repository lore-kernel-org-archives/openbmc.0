Return-Path: <xow@google.com>
Received: from mail-qt0-x229.google.com (mail-qt0-x229.google.com
 [IPv6:2607:f8b0:400d:c0d::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v6h6k5ThKzDqd9
 for <openbmc@lists.ozlabs.org>; Tue, 24 Jan 2017 06:23:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="ddDBkudn"; 
 dkim-atps=neutral
Received: by mail-qt0-x229.google.com with SMTP id k15so141681806qtg.3
 for <openbmc@lists.ozlabs.org>; Mon, 23 Jan 2017 11:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=WSNfF+KsIAbR9dVjcPP8wJnFbnS3V1piLAGROTXr+xo=;
 b=ddDBkudn+FdMEp9qqZJ+Xl93Wowfq1LQDr0TYJWqsOlGhcOUbxtmvcc4rccDzjS5T/
 rbXeeT6R2dqP8xzmx1pC8aw4mLDL7RSjGTb5KaoisG6jR1knkimllC3fYL+z6nCEZC+R
 cyCcyMRbmlaKub4OWDzVC1xtdN9FUarUPPLzVktykkWVOz7Zw2qrPQjQM3vuKVRIQMZw
 bd1VrL8A+7UHt3sYYBo9bFGPApk4T7S/2rVBYnCkJXDoCpEARimBX5favHqB/nBODwCE
 /12tboJ2JNeYWi81FyQ7QQQxEpoTChHc7aCyUrrf/a8Dyw+AgB4/8qTc5bFGYgFnaCDI
 Iwpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WSNfF+KsIAbR9dVjcPP8wJnFbnS3V1piLAGROTXr+xo=;
 b=PNXGCeBKSyxpa58/F6SMeyo3E1wSx8plg71wQBocIhK1Qu4euBoJTj5Zt+Tp3lkXkW
 Z/BwaSbWa3XrKM8L3fGOuiCOVAIsdbD/FUdQ3z3eTThky7M8w2XIvpuptlb839GYCybV
 kGCAbXHra/5w1k9v8NNHQO6CWpcG98uKvtgE1WjbFsWKzs8Wjf46VjhHh8lS4qkDMqfp
 +zuufJ0yvwNWW8CEtNduwy09ert8QAHP5e0PD26fLQ8D+vNM4ZhbmLXV8ExZOv8c1fV3
 WFgfqRYUUFIOYdzQZXkqbaLXUoOCmUFsHZr87IFbVnSrKO+bdTSgvMv3enggv2eFVIWG
 vo+A==
X-Gm-Message-State: AIkVDXKU7zOsFCZtC/0MLNR/iM4bjB6qKtP1BTxN8aueFKSU+Fc2ZMnDTu3Kq+PbymmIE+pA+2LHXHvqDpcJav3y
X-Received: by 10.55.18.165 with SMTP id 37mr26081507qks.22.1485199387419;
 Mon, 23 Jan 2017 11:23:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.21.116 with HTTP; Mon, 23 Jan 2017 11:23:06 -0800 (PST)
In-Reply-To: <64A10099-953A-42D4-ACD7-7F355C737D25@fuzziesquirrel.com>
References: <CAPH-5w5h5B5PwPuYDcTyRC8Ea-y4ryxsQ8+q2JtJxc2Oi9+ZWg@mail.gmail.com>
 <64A10099-953A-42D4-ACD7-7F355C737D25@fuzziesquirrel.com>
From: Xo Wang <xow@google.com>
Date: Mon, 23 Jan 2017 11:23:06 -0800
Message-ID: <CAPH-5w4WxSfjx5JLewxbUyVkfrDsD8CHvgjeOnOa++WhwdDMkQ@mail.gmail.com>
Subject: Re: Does anyone tftpboot the userspace image?
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Mon, 23 Jan 2017 19:23:12 -0000

Hi folks,

Thanks for chipping in on this.

On Sun, Jan 22, 2017 at 5:10 PM, Brad Bishop
<bradleyb@fuzziesquirrel.com> wrote:
> Hi Xo
>
> Honestly this is my _only_ use case=E2=80=A6 I don=E2=80=99t ever flash m=
achines unless
> whatever I am testing specifically requires that, which for me anyway,
> is very infrequent.
>
> There doesn=E2=80=99t necessarily have to be an all or nothing approach t=
aken here.
>
> cpio.lzma.u-boot can be removed from IMAGE_FSTYPES in several places:
>
> -in your local.conf
> -in zaius.conf in the zaius layer
> -in a yet to be created ingrasys.conf in the ingrasys layer
> -probably other ways too
>
> Alternatively, we can turn it off by default and add it where it is desir=
ed - possibly
> -in my local.conf
> -in in ibm.conf
>

I don't think we have to do anything about this. I didn't realize what
the images are useful for until after I had mailed the change.

Now that I know netbooting from the rootfs is possible I'll try it on
my setup. It should save a fair bit of time flashing the userspace
portion---another development annoyance for me. :)

You should add this to the cheatsheet in the project docs.

> I guess what I am not sure of is which makes more sense to be the default=
?
> When these kinds of questions come up I tend to think in terms of what wo=
uld
> benefit new users of the project the most?  I honestly don=E2=80=99t know=
 - what does
> everyone else think?
>

I would say that it's a fair default to generate all the useful
products on a simple "bitbake obmc-phosphor-image" invocation. Like
you said, it's not difficult to remove products in local.conf.

A third solution is to fix up the build dependency chain:
do_generate_flash currently depends on do_image_complete (thus all the
fs image products). If the netboot image were a separate recipe from
obmc-phosphor-image, then you could run "bitbake -c generate_flash
obmc-phosphor-image" for only the assembled flash image.

However, I'm pretty sure this would require two image roots be
installed with the same packages, so a normal build would be a lot
slower. Probably not a good solution, but maybe you folks know of a
way to make that work.

> -brad
>
>
>> On Jan 20, 2017, at 8:59 PM, Xo Wang <xow@google.com> wrote:
>>
>> Hi folks,
>>
>> I noticed from this discussion
>> https://lists.ozlabs.org/pipermail/openbmc/2016-April/thread.html#2738
>> that kernel developers were tftpbooting the userspace image from a
>> obmc-phosphor-image-<machine>.cpio.lzma.u-boot file.
>>
>> 1. How does/did that work? I guess you needed a custom init in the
>> initrd to load the u-boot container (?) instead of from mtd?
>>
>> 2. Are you still using this? Building the extra .cpio.lzma.u-boot is
>> kind of slow, with an extra ~45 seconds to do 'find | cpio | lzma;
>> mkimage' every build, and it can't be parallelized.
>>
>> I ask because I mailed a change to remove those image products from
>> the build, then followed the 'blame' to this use case:
>> https://gerrit.openbmc-project.xyz/#/c/1957/
>>
>> cheers
>> xo
>> _______________________________________________
>> openbmc mailing list
>> openbmc@lists.ozlabs.org
>> https://lists.ozlabs.org/listinfo/openbmc

cheers
xo
