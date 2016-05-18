Return-Path: <ross.burton@intel.com>
Received: from mail-io0-x22d.google.com (mail-io0-x22d.google.com
 [IPv6:2607:f8b0:4001:c06::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r8s1P0kjtzDqCJ
 for <openbmc@lists.ozlabs.org>; Wed, 18 May 2016 21:10:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b=Wn2LS++D; 
 dkim-atps=neutral
Received: by mail-io0-x22d.google.com with SMTP id 190so60021745iow.1
 for <openbmc@lists.ozlabs.org>; Wed, 18 May 2016 04:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=X024nIZ0lc3U/wMCo4Vd/tyaPH7WCVIX+2h+r38jZRY=;
 b=Wn2LS++DAtcWJfYWrj06q8Rmbn/VW6UEfyLr/ViFGqHR5ujJrqNZVVtmFaAkJmmOIN
 09QiMQ/RryJHC1U2qWnQqWk0Puq2CbLqbRvBGm2VLw7XrFNNsSO1tlIFeU2jclIl1Wpb
 Qo6+PReXAMJu4CVjl4IDkqB0wdDpL++GQ2tu3y8vSOzzSOJvPb9NWWRaXS2YFoTTRrJ0
 lfAEalusjBH2V83ZZt8EEVxFS3gHcgXMcYTierSjtEhXhkjYWgLBHV9OT1q/R4ZagvhK
 jiwPUHjf/UWDaSOnttH/Cm2HMN4fgseWpoT+PjOzyS2/Inn0jwxLxTMpd4Cf7/HDobR0
 d4WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=X024nIZ0lc3U/wMCo4Vd/tyaPH7WCVIX+2h+r38jZRY=;
 b=Ao8VEjPohHWO7QcGmBQswpCtRE7iXgT2rQ6W3OBTjF8G61LTGnh8L1qsszFZLNb1Rm
 exTXvg4SLu+u9OaNc3Q+1GFZcYdzu0nin6ViUgmvcpgiEg7ThBvw9E+j7Jl84IbY16LD
 0yCssmtiCVzsPFwGlZi1z7p0/chs8YtpmsjzL2aEh4d8w9W8QeVmgo9H12RskMn8NYGz
 WFot+1uurbNWWcGDFjHeq3mYuzWcVQE2zsfu0fabNExdN71Hr49Nsfi1g+aE2LEXXpun
 Yif0SYn0WM2/XtPMvtl0iuIVrvPhzv7udgKci2+a+/3abMW3fQk5qtssxqzRqAOzX0sh
 Hj2w==
X-Gm-Message-State: AOPr4FWsRMP39jBbMLUqVdA8qWyn0f/8OXV1LtHvEEofdP7MRxHuSkVAF+PyH24Re4x2mNjZ8+ZOCKsu4mv2tK6c
X-Received: by 10.36.160.136 with SMTP id o130mr18159711ite.38.1463569812737; 
 Wed, 18 May 2016 04:10:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.6 with HTTP; Wed, 18 May 2016 04:09:53 -0700 (PDT)
In-Reply-To: <1463559230.2703.118.camel@aj.id.au>
References: <1463447715.2703.112.camel@aj.id.au>
 <CAJTo0LbX7qrAc5e0OSJzTJ=ish7rLuGzm9LA7LbKF4DK+jy+PA@mail.gmail.com>
 <1463559230.2703.118.camel@aj.id.au>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 18 May 2016 12:09:53 +0100
Message-ID: <CAJTo0LayTmPkF9qO0SrybbLWVdQh_T7K-+xW_JYAF2K5=nM2fQ@mail.gmail.com>
Subject: Re: [yocto] Extending runqemu/runqemu-internal with new machines
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Yocto Project <yocto@yoctoproject.org>,
 Patrick Williams <patrick@stwcx.xyz>, OpenBMC <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=94eb2c04a148caf8e605331be6f5
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
X-List-Received-Date: Wed, 18 May 2016 11:10:17 -0000

--94eb2c04a148caf8e605331be6f5
Content-Type: text/plain; charset=UTF-8

On 18 May 2016 at 09:13, Andrew Jeffery <andrew@aj.id.au> wrote:

> Thanks for the pointer. Is this the patchset you're referring to?
>
>
> http://lists.openembedded.org/pipermail/openembedded-core/2016-March/118982.html
>
> A brief look suggests it might get us some of the way there, but I'll
> take a more detailed look in the next day or so.
>

I was actually thinking of
http://lists.openembedded.org/pipermail/openembedded-core/2016-May/121180.html
.

Your use case is exactly what this sort of work is aiming to solve (put the
machine-specific qemu knowledge into the BSP instead of runqemu) so
feedback would be greatly appreciated.

Ross

--94eb2c04a148caf8e605331be6f5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 18 May 2016 at 09:13, Andrew Jeffery <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:andrew@aj.id.au" target=3D"_blank">andrew@aj.id.au</a>&gt;</span> wrot=
e:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:s=
olid;padding-left:1ex"><div id=3D":8yn" class=3D"">Thanks for the pointer. =
Is this the patchset you&#39;re referring to?<br>
<br>
<a href=3D"http://lists.openembedded.org/pipermail/openembedded-core/2016-M=
arch/118982.html" rel=3D"noreferrer" target=3D"_blank">http://lists.openemb=
edded.org/pipermail/openembedded-core/2016-March/118982.html</a><br>
<br>
A brief look suggests it might get us some of the way there, but I&#39;ll<b=
r>
take a more detailed look in the next day or so.</div></blockquote></div><b=
r>I was actually thinking of=C2=A0<a href=3D"http://lists.openembedded.org/=
pipermail/openembedded-core/2016-May/121180.html">http://lists.openembedded=
.org/pipermail/openembedded-core/2016-May/121180.html</a>.</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Your use case is exac=
tly what this sort of work is aiming to solve (put the machine-specific qem=
u knowledge into the BSP instead of runqemu) so feedback would be greatly a=
ppreciated.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_e=
xtra">Ross</div></div>

--94eb2c04a148caf8e605331be6f5--
