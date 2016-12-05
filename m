Return-Path: <raltherr@google.com>
Received: from mail-io0-x22b.google.com (mail-io0-x22b.google.com
 [IPv6:2607:f8b0:4001:c06::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tXWTg2Dc0zDvhh
 for <openbmc@lists.ozlabs.org>; Tue,  6 Dec 2016 04:09:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="nbk8FnDn"; 
 dkim-atps=neutral
Received: by mail-io0-x22b.google.com with SMTP id m5so468830302ioe.3
 for <openbmc@lists.ozlabs.org>; Mon, 05 Dec 2016 09:09:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=tpifsJavnl+W+fKfDSypgy1h8TReMKfl/NfQMPEnmnI=;
 b=nbk8FnDnWKGWnyVDAkXwFYZ1dV9PC6AcEpeT0lUAUPOMj1/8EDps8DUYsAmlxe0kyo
 ok0vAQCp+vlI1Jq7rbzuILObfgmVDfmzwB1hHPQ+j3eslZk6iTVrcAds6JWkct67LvA/
 3i0vysFMiY2mQK7mRuO826sPhWImQeLlh7GO6yYEVyMcILwgs77Nt2bPte4mmk/UfUdY
 W2oIEnXo8Wd0zkrXcRPHPRSEprMa1UF9X/aHhykZmLTaHLUUA4mwLTyoyeSXVWX+CMug
 oAicPS1ZmpVv30Sx0Vy7aIA+EzNVAkEfKGV2oC+B89WWQH8Zu68I9k5aZJgR3xt8lyqd
 EINw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=tpifsJavnl+W+fKfDSypgy1h8TReMKfl/NfQMPEnmnI=;
 b=TlxHG8KSSWfzIDI8eBivNOFeeow/+kQUQcRbxM1p+26741Kkij7T3Dv36nHLzBmU0x
 TbMLONV3n310eBLWnAc8GRwJC7Hya7kCW+FYHvciZbhyuK3fzpj+IXCJ5W6k0pUjFxWX
 U/N8lX7IZJEvj6lvrdyXQt2FO0hXFRgwK5p2nlp5j9PZMEynSGH9fPeEEMtnJ7+suiKx
 b6bOXlXW4l/xhHIBnSHzvJRqYtikec7qc4bqv2kPsTlZj9+RXorIDL3JZeSvF9nqepKI
 suEEiiF1kAvqpqkE41OmuCWFBlinLJmzr0NpjT43qyJ7+v+SJh/cNN8oA5TlGTzNXMjv
 r9Cw==
X-Gm-Message-State: AKaTC036zD9iStcwHuJwMRIQEFHJkk0uWKwjcLNvXsBdVrbbg6p1SQ0cd9Q96AZ+fcMsCEVmapleAp4GjKnouwbY
X-Received: by 10.36.190.6 with SMTP id i6mr9266537itf.37.1480957796261; Mon,
 05 Dec 2016 09:09:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.154.197 with HTTP; Mon, 5 Dec 2016 09:09:55 -0800 (PST)
In-Reply-To: <e0967b2e-2de1-c41f-1620-e7e0b8d5b158@kaod.org>
References: <1480717624-24994-1-git-send-email-raltherr@google.com>
 <1480717624-24994-2-git-send-email-raltherr@google.com>
 <CAPnjgZ3WpLrsHMARpbkdSRzTd51y4Noi+fYYh+tVncWgG5pUBw@mail.gmail.com>
 <e0967b2e-2de1-c41f-1620-e7e0b8d5b158@kaod.org>
From: Rick Altherr <raltherr@google.com>
Date: Mon, 5 Dec 2016 09:09:55 -0800
Message-ID: <CAPLgG=nWr5Cy-8uh=4gq=oReL5GFdKvc4bneiMyMCksQ1j=bCA@mail.gmail.com>
Subject: Re: [PATCH u-boot v2 1/3] aspeed: remove hack loading ramdisk in
 memory
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: Simon Glass <sjg@chromium.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=94eb2c19d4ea6001ca0542ec5b88
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
X-List-Received-Date: Mon, 05 Dec 2016 17:10:00 -0000

--94eb2c19d4ea6001ca0542ec5b88
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

See the next patch in this series.  OpenBMC uses ATAGS when building a
legacy image.  U-Boot ATAGS support wasn't causing ramdisk relocation.
It's not really a FIT vs legacy issue so much as a FDT vs ATAGS issue.  We
could still use legacy images with FDT and the ramdisk would be relocated
fine.  I fixed the ATAGS support to trigger ramdisk relocation as that's
the actual bug.

On Mon, Dec 5, 2016 at 12:13 AM, C=C3=A9dric Le Goater <clg@kaod.org> wrote=
:

> Hello,
>
> On 12/05/2016 07:24 AM, Simon Glass wrote:
> > On 2 December 2016 at 15:27, Rick Altherr <raltherr@google.com> wrote:
> >> From: C=C3=A9dric Le Goater <clg@kaod.org>
> >>
> >> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> >> Signed-off-by: Rick Altherr <raltherr@google.com>
> >> ---
> >>  common/image.c | 11 -----------
> >>  1 file changed, 11 deletions(-)
> >
> > Reviewed-by: Simon Glass <sjg@chromium.org>
> >
>
> So how do you fix the ramdisk loading ? is using the FIT images
> enough to work around this problem ?
>
> For legacy type images, this patch seemed to work :
>
>         https://github.com/legoater/u-boot/commit/
> 86fd073a12650ee7fc4e6514f2b0f159be275f29
>
> I am not sure if this is a good approach though.
>
> Thanks,
>
> C.
>

--94eb2c19d4ea6001ca0542ec5b88
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">See the next patch in this series.=C2=A0 OpenBMC uses ATAG=
S when building a legacy image.=C2=A0 U-Boot ATAGS support wasn&#39;t causi=
ng ramdisk relocation.=C2=A0 It&#39;s not really a FIT vs legacy issue so m=
uch as a FDT vs ATAGS issue.=C2=A0 We could still use legacy images with FD=
T and the ramdisk would be relocated fine.=C2=A0 I fixed the ATAGS support =
to trigger ramdisk relocation as that&#39;s the actual bug.</div><div class=
=3D"gmail_extra"><br><div class=3D"gmail_quote">On Mon, Dec 5, 2016 at 12:1=
3 AM, C=C3=A9dric Le Goater <span dir=3D"ltr">&lt;<a href=3D"mailto:clg@kao=
d.org" target=3D"_blank">clg@kaod.org</a>&gt;</span> wrote:<br><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex">Hello,<br>
<div><div class=3D"h5"><br>
On 12/05/2016 07:24 AM, Simon Glass wrote:<br>
&gt; On 2 December 2016 at 15:27, Rick Altherr &lt;<a href=3D"mailto:ralthe=
rr@google.com">raltherr@google.com</a>&gt; wrote:<br>
&gt;&gt; From: C=C3=A9dric Le Goater &lt;<a href=3D"mailto:clg@kaod.org">cl=
g@kaod.org</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: C=C3=A9dric Le Goater &lt;<a href=3D"mailto:clg@kao=
d.org">clg@kaod.org</a>&gt;<br>
&gt;&gt; Signed-off-by: Rick Altherr &lt;<a href=3D"mailto:raltherr@google.=
com">raltherr@google.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 common/image.c | 11 -----------<br>
&gt;&gt;=C2=A0 1 file changed, 11 deletions(-)<br>
&gt;<br>
&gt; Reviewed-by: Simon Glass &lt;<a href=3D"mailto:sjg@chromium.org">sjg@c=
hromium.org</a>&gt;<br>
&gt;<br>
<br>
</div></div>So how do you fix the ramdisk loading ? is using the FIT images=
<br>
enough to work around this problem ?<br>
<br>
For legacy type images, this patch seemed to work :<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://github.com/legoater/u-boot/c=
ommit/86fd073a12650ee7fc4e6514f2b0f159be275f29" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/legoater/u-<wbr>boot/commit/<wbr>86fd073a126=
50ee7fc4e6514f2b0f1<wbr>59be275f29</a><br>
<br>
I am not sure if this is a good approach though.<br>
<br>
Thanks,<br>
<br>
C.<br>
</blockquote></div><br></div>

--94eb2c19d4ea6001ca0542ec5b88--
