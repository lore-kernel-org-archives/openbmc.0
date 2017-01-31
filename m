Return-Path: <raltherr@google.com>
Received: from mail-it0-x230.google.com (mail-it0-x230.google.com
 [IPv6:2607:f8b0:4001:c0b::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vCZdM27W6zDq9K
 for <openbmc@lists.ozlabs.org>; Wed,  1 Feb 2017 05:33:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Vwr5pGeE"; 
 dkim-atps=neutral
Received: by mail-it0-x230.google.com with SMTP id 203so356200ith.0
 for <openbmc@lists.ozlabs.org>; Tue, 31 Jan 2017 10:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=RSjQJmnx6wrt6qS0RzQBANoFKp3d6kWu/BFJvxWXCZI=;
 b=Vwr5pGeEI+kWfZpqNjczIBy+8HCkK26pjotStbQ/kJU6Zi67MOABaaB3fBxzNHMytM
 Na1E9HBoC/IcWCn27zI2aZUzyA3nhgg/ONvVqmrRXUlYLxJYGeQywibugvs2FelMbiUa
 VUCGEZUbm4hTlwO84A6MVgtw/2PrpDbXp4m2sUR8FUyTElFcL0Rb5l6Q48hfwT43RLby
 KqQohpr18nw5GCGjDM0YFqqzD/EhMfsxvCYUqUraf6vzxxCImXjGlEFzeWDi6dKJaL4w
 4KlVudqo9qomRsjbnsZs5AxrTV1TvtL6MqvCw0e8/fM+OjLz0Xh/35p9JFbnRpOi3eS4
 EsQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=RSjQJmnx6wrt6qS0RzQBANoFKp3d6kWu/BFJvxWXCZI=;
 b=jHiGj5/qysKl//Efc4xvcqehIEYxiBkwaadtXOw44EUVz66kd9DtR3kJ+1Cv4+0tky
 aoIT70Jt/haABwKZlNvOVwuLx7aznHgMYtIQQD/BkuFt5O+s8JVGE8Gbcd68cPm5m0X4
 dws5uUgmM0aAhXWxwanrvWXYHTaEYVhrWgxbAC9gSsXvtwSU6oSg1VAK7k1x4vL7KuzX
 7Eu5FljeWmBT/R3KyOOFow32QdTg4EwdlPSHw263sp5cYr8QiEueQAsC9WdrZ5W26i7X
 Y9rnKz/L+DlENJdUSc9t+lhi/IAAFcaR6pzdVeJsV+g4OuynEWS16leuNkTYPLQrnZKI
 gKAg==
X-Gm-Message-State: AIkVDXJZLCiQiI/mwyrrnkOkX4RZPgwAjFsMeN56H8v+an/HPt+7AAW1zrz/+0LEmXmaa0fxSze15btLxLOLZ6xe
X-Received: by 10.36.48.208 with SMTP id q199mr21689180itq.28.1485887588178;
 Tue, 31 Jan 2017 10:33:08 -0800 (PST)
MIME-Version: 1.0
Received: by 10.64.133.226 with HTTP; Tue, 31 Jan 2017 10:33:07 -0800 (PST)
In-Reply-To: <20170131181641.k3jnv73ha5v2kjsh@asimov>
References: <75C63AB7-E340-4A78-BA82-80F96EAEA051@linux.vnet.ibm.com>
 <OF3E869A3E.DB3E43DE-ON862580B3.008284D7-862580B3.0082FDDB@notes.na.collabserv.com>
 <20170127030706.GB5504@heinlein.lan> <87o9ypw13y.fsf@linux.vnet.ibm.com>
 <20170131181641.k3jnv73ha5v2kjsh@asimov>
From: Rick Altherr <raltherr@google.com>
Date: Tue, 31 Jan 2017 10:33:07 -0800
Message-ID: <CAPLgG=nY-_A6HvVmY45U5U=wrz4iRK5P=R0e_0NPVs=B--CLdw@mail.gmail.com>
Subject: Re: OpenBMC Image Management
To: Patrick Williams <patrick@stwcx.xyz>
Cc: Stewart Smith <stewart@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=001a1140aa84df1831054768291a
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
X-List-Received-Date: Tue, 31 Jan 2017 18:33:11 -0000

--001a1140aa84df1831054768291a
Content-Type: text/plain; charset=UTF-8

dm-verity works by hashing each 4k block of the raw block device.  The
resulting tree of hashes is stored on the block device outside the
filesystem.  That should work fine for MTD.  I suspect it will work with
UBI as well since UBI is just another block device type.  So, we can
probably store FIT+squashfs+dm-verity(of squashfs)+UBIFS(r/w) in UBI.
It'll take some experimentation.

Rick

On Tue, Jan 31, 2017 at 10:16 AM, Patrick Williams <patrick@stwcx.xyz>
wrote:

> On Mon, Jan 30, 2017 at 04:47:13PM +1100, Stewart Smith wrote:
> > dm-verity (a device-mapper target taht cryptographically verifies each
> > filesystem block) could be a way to very easily get most of what's
> > needed here.
> >
> > https://lwn.net/Articles/459420/
> >
> > https://source.android.com/security/verifiedboot/
> >
>
> Any ideas on how nicely that plays with mtd/ubi?  I don't see anything
> about it.  I do see some dm-verity presentations claiming that IMA is
> slow and dm-verity is much faster.
>
> We should have all code in a SquashFS image anyhow.  Signing / verifying
> that whole image might be reasonable as well.
>
> --
> Patrick Williams
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
>
>

--001a1140aa84df1831054768291a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">dm-verity works by hashing each 4k block of the raw block =
device.=C2=A0 The resulting tree of hashes is stored on the block device ou=
tside the filesystem.=C2=A0 That should work fine for MTD.=C2=A0 I suspect =
it will work with UBI as well since UBI is just another block device type.=
=C2=A0 So, we can probably store FIT+squashfs+dm-verity(of squashfs)+UBIFS(=
r/w) in UBI.=C2=A0 It&#39;ll take some experimentation.<div><br></div><div>=
Rick</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">O=
n Tue, Jan 31, 2017 at 10:16 AM, Patrick Williams <span dir=3D"ltr">&lt;<a =
href=3D"mailto:patrick@stwcx.xyz" target=3D"_blank">patrick@stwcx.xyz</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On Mon,=
 Jan 30, 2017 at 04:47:13PM +1100, Stewart Smith wrote:<br>
&gt; dm-verity (a device-mapper target taht cryptographically verifies each=
<br>
&gt; filesystem block) could be a way to very easily get most of what&#39;s=
<br>
&gt; needed here.<br>
&gt;<br>
&gt; <a href=3D"https://lwn.net/Articles/459420/" rel=3D"noreferrer" target=
=3D"_blank">https://lwn.net/Articles/<wbr>459420/</a><br>
&gt;<br>
&gt; <a href=3D"https://source.android.com/security/verifiedboot/" rel=3D"n=
oreferrer" target=3D"_blank">https://source.android.com/<wbr>security/verif=
iedboot/</a><br>
&gt;<br>
<br>
</span>Any ideas on how nicely that plays with mtd/ubi?=C2=A0 I don&#39;t s=
ee anything<br>
about it.=C2=A0 I do see some dm-verity presentations claiming that IMA is<=
br>
slow and dm-verity is much faster.<br>
<br>
We should have all code in a SquashFS image anyhow.=C2=A0 Signing / verifyi=
ng<br>
that whole image might be reasonable as well.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
Patrick Williams<br>
</font></span><br>______________________________<wbr>_________________<br>
openbmc mailing list<br>
<a href=3D"mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</a><br=
>
<a href=3D"https://lists.ozlabs.org/listinfo/openbmc" rel=3D"noreferrer" ta=
rget=3D"_blank">https://lists.ozlabs.org/<wbr>listinfo/openbmc</a><br>
<br></blockquote></div><br></div>

--001a1140aa84df1831054768291a--
