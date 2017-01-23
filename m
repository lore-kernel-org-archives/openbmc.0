Return-Path: <raltherr@google.com>
Received: from mail-io0-x231.google.com (mail-io0-x231.google.com
 [IPv6:2607:f8b0:4001:c06::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v6hJY1zGBzDq62
 for <openbmc@lists.ozlabs.org>; Tue, 24 Jan 2017 06:31:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Fb8V1V78"; 
 dkim-atps=neutral
Received: by mail-io0-x231.google.com with SMTP id j13so118002587iod.3
 for <openbmc@lists.ozlabs.org>; Mon, 23 Jan 2017 11:31:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=tuy5B0MDgBTy9p1gRaJKvYGrTZ7Qy8DmdKqVbhJHHIE=;
 b=Fb8V1V78CIDuhqrNTdcIzQk+n7u0n9lMab2Vh9qFoUE6jnktyho7uUmfuU50gdpIKY
 6XOjKTxI5iThlAYSNcnfPS0PKI/N99GZa8GXRYUxvpHamNHnWrxqkKFrZvv3DFVzffql
 G7VI5Q/WnntMCO9K4PljpYjNzIOPXqkwlLcGnDCZ77hATrAfEQPZhUw+Oq4JF7B6/c5E
 VdWq+SBOlQN7E9Md0jTYlPvj2EWfr+SA26DRyjDREuEuxYEzs99hyPFNLabDjD/g8qLC
 G9vkee/udsUG4tKeu3BQ1s02ZaSMzzOlkYmliFtOQ7uri+8hnhMdFthtkD1kWbjjruCV
 I50A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=tuy5B0MDgBTy9p1gRaJKvYGrTZ7Qy8DmdKqVbhJHHIE=;
 b=W6tDGXYI7zHDHFUkXb5ljURShGEhIvCBeCCZC1AZHZ8M5tV5N9g7DUZ3a+pwAQLhkL
 +lOaQGGzQcTQWdY53T6rfYvmthnRCtFXCUzMyASd7QY59xBwi++MZeUFgmMCKWjNWjCG
 xRNL6l/feC+HXAL1iLMecAdR+SZtnaL9mUSqVz/CpH6MRrDQxt4172X60WCBL9AajWLI
 N93B2er+r11UCjM6DjvQRXABc7QJYIol8sWxyanb2CtU3CXPzsoRO47dnhs7qa7ZNAcx
 Mzec3Z70/ppqFRvpYxDOrsdTuCr1ZjVGhvsBdEl0PL2EFpxBNOY7+elTjmiQ8uNDtZ02
 UOGw==
X-Gm-Message-State: AIkVDXJ8CsTRQ15Ku5aMsxTYNYXNFaCoNzFep6uM8iV6BVOVYBr4Q5kcgDCmJQgWegtsL3sU5X44cQwsZrPV1MIy
X-Received: by 10.107.28.204 with SMTP id c195mr26888974ioc.223.1485199897670; 
 Mon, 23 Jan 2017 11:31:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.130.106 with HTTP; Mon, 23 Jan 2017 11:31:36 -0800 (PST)
In-Reply-To: <CAPH-5w4WxSfjx5JLewxbUyVkfrDsD8CHvgjeOnOa++WhwdDMkQ@mail.gmail.com>
References: <CAPH-5w5h5B5PwPuYDcTyRC8Ea-y4ryxsQ8+q2JtJxc2Oi9+ZWg@mail.gmail.com>
 <64A10099-953A-42D4-ACD7-7F355C737D25@fuzziesquirrel.com>
 <CAPH-5w4WxSfjx5JLewxbUyVkfrDsD8CHvgjeOnOa++WhwdDMkQ@mail.gmail.com>
From: Rick Altherr <raltherr@google.com>
Date: Mon, 23 Jan 2017 11:31:36 -0800
Message-ID: <CAPLgG=kUim4aE7xK8=z0MprBp4yxiMDKJhtYhFR0mb-PwEpy7w@mail.gmail.com>
Subject: Re: Does anyone tftpboot the userspace image?
To: Xo Wang <xow@google.com>
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=001a113fd9a252cb350546c80c8f
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
X-List-Received-Date: Mon, 23 Jan 2017 19:31:42 -0000

--001a113fd9a252cb350546c80c8f
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 23, 2017 at 11:23 AM, Xo Wang <xow@google.com> wrote:

> Hi folks,
>
> Thanks for chipping in on this.
>
> On Sun, Jan 22, 2017 at 5:10 PM, Brad Bishop
> <bradleyb@fuzziesquirrel.com> wrote:
> > Hi Xo
> >
> > Honestly this is my _only_ use case=E2=80=A6 I don=E2=80=99t ever flash=
 machines unless
> > whatever I am testing specifically requires that, which for me anyway,
> > is very infrequent.
> >
> > There doesn=E2=80=99t necessarily have to be an all or nothing approach=
 taken
> here.
> >
> > cpio.lzma.u-boot can be removed from IMAGE_FSTYPES in several places:
> >
> > -in your local.conf
> > -in zaius.conf in the zaius layer
> > -in a yet to be created ingrasys.conf in the ingrasys layer
> > -probably other ways too
> >
> > Alternatively, we can turn it off by default and add it where it is
> desired - possibly
> > -in my local.conf
> > -in in ibm.conf
> >
>
> I don't think we have to do anything about this. I didn't realize what
> the images are useful for until after I had mailed the change.
>
> Now that I know netbooting from the rootfs is possible I'll try it on
> my setup. It should save a fair bit of time flashing the userspace
> portion---another development annoyance for me. :)
>
> You should add this to the cheatsheet in the project docs.
>
> > I guess what I am not sure of is which makes more sense to be the
> default?
> > When these kinds of questions come up I tend to think in terms of what
> would
> > benefit new users of the project the most?  I honestly don=E2=80=99t kn=
ow - what
> does
> > everyone else think?
> >
>
> I would say that it's a fair default to generate all the useful
> products on a simple "bitbake obmc-phosphor-image" invocation. Like
> you said, it's not difficult to remove products in local.conf.
>
> A third solution is to fix up the build dependency chain:
> do_generate_flash currently depends on do_image_complete (thus all the
> fs image products). If the netboot image were a separate recipe from
> obmc-phosphor-image, then you could run "bitbake -c generate_flash
> obmc-phosphor-image" for only the assembled flash image.
>
> However, I'm pretty sure this would require two image roots be
> installed with the same packages, so a normal build would be a lot
> slower. Probably not a good solution, but maybe you folks know of a
> way to make that work.
>
>
Ideally, do_generate_flash would be a separate image type, not a recipe.  I
don't know how to request specific IMAGE_FSTYPES from the command-line
other than editing local.conf.  I've not tried having an environment
variable overriding IMAGE_FSTYPES (i.e IMAGE_FSTYPE=3D"cpio" bitbake
obmc-phosphor-image).  I've started the discussion in upstream OE-Core to
add raw-flash image generation to the wic tool (
http://lists.openembedded.org/pipermail/openembedded-core/2017-January/1315=
33.html
).


> > -brad
> >
> >
> >> On Jan 20, 2017, at 8:59 PM, Xo Wang <xow@google.com> wrote:
> >>
> >> Hi folks,
> >>
> >> I noticed from this discussion
> >> https://lists.ozlabs.org/pipermail/openbmc/2016-April/thread.html#2738
> >> that kernel developers were tftpbooting the userspace image from a
> >> obmc-phosphor-image-<machine>.cpio.lzma.u-boot file.
> >>
> >> 1. How does/did that work? I guess you needed a custom init in the
> >> initrd to load the u-boot container (?) instead of from mtd?
> >>
> >> 2. Are you still using this? Building the extra .cpio.lzma.u-boot is
> >> kind of slow, with an extra ~45 seconds to do 'find | cpio | lzma;
> >> mkimage' every build, and it can't be parallelized.
> >>
> >> I ask because I mailed a change to remove those image products from
> >> the build, then followed the 'blame' to this use case:
> >> https://gerrit.openbmc-project.xyz/#/c/1957/
> >>
> >> cheers
> >> xo
> >> _______________________________________________
> >> openbmc mailing list
> >> openbmc@lists.ozlabs.org
> >> https://lists.ozlabs.org/listinfo/openbmc
>
> cheers
> xo
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
>

--001a113fd9a252cb350546c80c8f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Jan 23, 2017 at 11:23 AM, Xo Wang <span dir=3D"ltr">&lt;<a href=
=3D"mailto:xow@google.com" target=3D"_blank">xow@google.com</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi folks,<br>
<br>
Thanks for chipping in on this.<br>
<span class=3D"gmail-"><br>
On Sun, Jan 22, 2017 at 5:10 PM, Brad Bishop<br>
&lt;<a href=3D"mailto:bradleyb@fuzziesquirrel.com">bradleyb@fuzziesquirrel.=
com</a>&gt; wrote:<br>
&gt; Hi Xo<br>
&gt;<br>
&gt; Honestly this is my _only_ use case=E2=80=A6 I don=E2=80=99t ever flas=
h machines unless<br>
&gt; whatever I am testing specifically requires that, which for me anyway,=
<br>
&gt; is very infrequent.<br>
&gt;<br>
&gt; There doesn=E2=80=99t necessarily have to be an all or nothing approac=
h taken here.<br>
&gt;<br>
&gt; cpio.lzma.u-boot can be removed from IMAGE_FSTYPES in several places:<=
br>
&gt;<br>
&gt; -in your local.conf<br>
&gt; -in zaius.conf in the zaius layer<br>
&gt; -in a yet to be created ingrasys.conf in the ingrasys layer<br>
&gt; -probably other ways too<br>
&gt;<br>
&gt; Alternatively, we can turn it off by default and add it where it is de=
sired - possibly<br>
&gt; -in my local.conf<br>
&gt; -in in ibm.conf<br>
&gt;<br>
<br>
</span>I don&#39;t think we have to do anything about this. I didn&#39;t re=
alize what<br>
the images are useful for until after I had mailed the change.<br>
<br>
Now that I know netbooting from the rootfs is possible I&#39;ll try it on<b=
r>
my setup. It should save a fair bit of time flashing the userspace<br>
portion---another development annoyance for me. :)<br>
<br>
You should add this to the cheatsheet in the project docs.<br>
<span class=3D"gmail-"><br>
&gt; I guess what I am not sure of is which makes more sense to be the defa=
ult?<br>
&gt; When these kinds of questions come up I tend to think in terms of what=
 would<br>
&gt; benefit new users of the project the most?=C2=A0 I honestly don=E2=80=
=99t know - what does<br>
&gt; everyone else think?<br>
&gt;<br>
<br>
</span>I would say that it&#39;s a fair default to generate all the useful<=
br>
products on a simple &quot;bitbake obmc-phosphor-image&quot; invocation. Li=
ke<br>
you said, it&#39;s not difficult to remove products in local.conf.<br>
<br>
A third solution is to fix up the build dependency chain:<br>
do_generate_flash currently depends on do_image_complete (thus all the<br>
fs image products). If the netboot image were a separate recipe from<br>
obmc-phosphor-image, then you could run &quot;bitbake -c generate_flash<br>
obmc-phosphor-image&quot; for only the assembled flash image.<br>
<br>
However, I&#39;m pretty sure this would require two image roots be<br>
installed with the same packages, so a normal build would be a lot<br>
slower. Probably not a good solution, but maybe you folks know of a<br>
way to make that work.<br>
<div class=3D"gmail-HOEnZb"><div class=3D"gmail-h5"><br></div></div></block=
quote><div><br></div><div>Ideally, do_generate_flash would be a separate im=
age type, not a recipe.=C2=A0 I don&#39;t know how to request specific IMAG=
E_FSTYPES from the command-line other than editing local.conf.=C2=A0 I&#39;=
ve not tried having an environment variable overriding IMAGE_FSTYPES (i.e I=
MAGE_FSTYPE=3D&quot;cpio&quot; bitbake obmc-phosphor-image).=C2=A0 I&#39;ve=
 started the discussion in upstream OE-Core to add raw-flash image generati=
on to the wic tool (<a href=3D"http://lists.openembedded.org/pipermail/open=
embedded-core/2017-January/131533.html">http://lists.openembedded.org/piper=
mail/openembedded-core/2017-January/131533.html</a>).</div><div>=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex"><div class=3D"gmail-HOEn=
Zb"><div class=3D"gmail-h5">
&gt; -brad<br>
&gt;<br>
&gt;<br>
&gt;&gt; On Jan 20, 2017, at 8:59 PM, Xo Wang &lt;<a href=3D"mailto:xow@goo=
gle.com">xow@google.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Hi folks,<br>
&gt;&gt;<br>
&gt;&gt; I noticed from this discussion<br>
&gt;&gt; <a href=3D"https://lists.ozlabs.org/pipermail/openbmc/2016-April/t=
hread.html#2738" rel=3D"noreferrer" target=3D"_blank">https://lists.ozlabs.=
org/<wbr>pipermail/openbmc/2016-April/<wbr>thread.html#2738</a><br>
&gt;&gt; that kernel developers were tftpbooting the userspace image from a=
<br>
&gt;&gt; obmc-phosphor-image-&lt;machine&gt;.<wbr>cpio.lzma.u-boot file.<br=
>
&gt;&gt;<br>
&gt;&gt; 1. How does/did that work? I guess you needed a custom init in the=
<br>
&gt;&gt; initrd to load the u-boot container (?) instead of from mtd?<br>
&gt;&gt;<br>
&gt;&gt; 2. Are you still using this? Building the extra .cpio.lzma.u-boot =
is<br>
&gt;&gt; kind of slow, with an extra ~45 seconds to do &#39;find | cpio | l=
zma;<br>
&gt;&gt; mkimage&#39; every build, and it can&#39;t be parallelized.<br>
&gt;&gt;<br>
&gt;&gt; I ask because I mailed a change to remove those image products fro=
m<br>
&gt;&gt; the build, then followed the &#39;blame&#39; to this use case:<br>
&gt;&gt; <a href=3D"https://gerrit.openbmc-project.xyz/#/c/1957/" rel=3D"no=
referrer" target=3D"_blank">https://gerrit.openbmc-<wbr>project.xyz/#/c/195=
7/</a><br>
&gt;&gt;<br>
&gt;&gt; cheers<br>
&gt;&gt; xo<br>
&gt;&gt; ______________________________<wbr>_________________<br>
&gt;&gt; openbmc mailing list<br>
&gt;&gt; <a href=3D"mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.o=
rg</a><br>
&gt;&gt; <a href=3D"https://lists.ozlabs.org/listinfo/openbmc" rel=3D"noref=
errer" target=3D"_blank">https://lists.ozlabs.org/<wbr>listinfo/openbmc</a>=
<br>
<br>
cheers<br>
xo<br>
______________________________<wbr>_________________<br>
openbmc mailing list<br>
<a href=3D"mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</a><br=
>
<a href=3D"https://lists.ozlabs.org/listinfo/openbmc" rel=3D"noreferrer" ta=
rget=3D"_blank">https://lists.ozlabs.org/<wbr>listinfo/openbmc</a><br>
</div></div></blockquote></div><br></div></div>

--001a113fd9a252cb350546c80c8f--
