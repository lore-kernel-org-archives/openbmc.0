Return-Path: <raltherr@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c08::231; helo=mail-ua0-x231.google.com;
 envelope-from=raltherr@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="bY58AFmv"; 
 dkim-atps=neutral
Received: from mail-ua0-x231.google.com (mail-ua0-x231.google.com
 [IPv6:2607:f8b0:400c:c08::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zgqzC2ccSzDqps
 for <openbmc@lists.ozlabs.org>; Wed, 14 Feb 2018 04:58:43 +1100 (AEDT)
Received: by mail-ua0-x231.google.com with SMTP id n1so12082265uaa.2
 for <openbmc@lists.ozlabs.org>; Tue, 13 Feb 2018 09:58:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=kaoL5FY80vrOcIDQhU1geoINNMMfHgxMjMQEb60A4vI=;
 b=bY58AFmvRiilgFBjRlXbSrpUH6vHd8Ngvh4p/YZgT2U0jTzp3DPaNRKCHn2uTErJmp
 bbIDux5Tmwdb6sTFH6xTKG7+t1rRExn/KcVsz4yOKHDHVeHi2UBIX4vi0MSZQEjBoEDm
 jPL6pyl6sxVpLmwAA+ChxANNPbh3PKeWTlLqDRhpp2VcnFXMm63WlAh3Pjz1RfX/+MXr
 Ppti40vauI7I0uDGz0Edfw6vpibmgE0WBcvjJkFvU3hv5ZSjjya17tEp37/B6TcFAHnV
 /8Dz4rOMpr62CtlvT/77uqYOpKR0yWesqeVYHbQdJTBXImx2UhxdB+GEpWEil5jFrriZ
 o+bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=kaoL5FY80vrOcIDQhU1geoINNMMfHgxMjMQEb60A4vI=;
 b=VHQJ01BCXzs8H3BR9nihnGHhKwEYbqMlygCAOyUkElA0f49eT88qJzL7c97D3ukrRA
 HE3gIzfnx7ibP/wLFWj5h4J9wfYZWDLiH/bjwrziCyB5cCkbDsvgaY29G8LuRJscTBBq
 50aTEo5XfnosYP3nW94joKcKvtcuegWzBbiYGw5mfkEDfCMkIbC04Nf5TiSkNkwI8Zt+
 33/Ef907AVEGJK+Ngmn3GMLkluKdFTI+27pXKuiriWsu6dHrkFK4U0REx2T3dVCIJId0
 EZhfQAperLlSyffje9niIxRtuDlq4JGPn5Q3N5G/DSNu4kSKG6dzYnNZtKVJ/9k5Wz/L
 u4hQ==
X-Gm-Message-State: APf1xPBWpb7aA/Hffwov1YE6ljtn+QOEQez3Jm/hKs46rjSzfK+8C94V
 6rFSEh+20ZZUK/0U2/lbpXgqXXewscexWcqV23LMYA==
X-Google-Smtp-Source: AH8x226dK5eNYHwcdKIPD4iRZMVlrO90hdiWlpfSxllhSX7vjedp13qJsiz0eYfxeSNASSF953/QOvoxXIe50OFxBX8=
X-Received: by 10.176.71.209 with SMTP id w17mr1953022uac.132.1518544720265;
 Tue, 13 Feb 2018 09:58:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.161.142 with HTTP; Tue, 13 Feb 2018 09:58:39 -0800 (PST)
In-Reply-To: <277A734F-3F5B-4580-A94C-6DFDC8CFED4C@fuzziesquirrel.com>
References: <20180202030725.11771-1-bradleyb@fuzziesquirrel.com>
 <CACPK8Xdj3zeH1PM=4DtS68jHDBKd_+eCJmRiBmw6cYeJRNUUVA@mail.gmail.com>
 <277A734F-3F5B-4580-A94C-6DFDC8CFED4C@fuzziesquirrel.com>
From: Rick Altherr <raltherr@google.com>
Date: Tue, 13 Feb 2018 09:58:39 -0800
Message-ID: <CAPLgG=mgKwQuwGU2FdAnKENDGmuGHLnsDjyreJpEFSwZ0ZTHoA@mail.gmail.com>
Subject: Re: [PATCH u-boot v2016.07-aspeed-openbmc] aspeed: un-hardcode FIT
 configuration selection
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="f40304378f38a1055105651bbe6a"
X-Mailman-Approved-At: Fri, 16 Feb 2018 12:14:16 +1100
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 13 Feb 2018 17:58:48 -0000

--f40304378f38a1055105651bbe6a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

SGTM

On Mon, Feb 12, 2018 at 8:03 PM, Brad Bishop <bradleyb@fuzziesquirrel.com>
wrote:

>
> > On Feb 12, 2018, at 10:58 PM, Joel Stanley <joel@jms.id.au> wrote:
> >
> > On Fri, Feb 2, 2018 at 1:37 PM, Brad Bishop <bradleyb@fuzziesquirrel.co=
m>
> wrote:
> >> Rely on the FDT parser to select a FIT config when looking for a
> >> ramdisk_conf.  This allows image builders to use arbitrary configurati=
on
> >> names like /configurations/conf@foo.
> >
> > Can you elaborate?
> >
> > Do we even need this script? IIRC it was in place to support pre-FIT
> > configurations where the initrd and the kernel were stored in seperate
> > locations in flash. Now that all systems use FIT, we can simply say
> > "bootm 2008000".
> >
> > I suggest we don't need it, so we should change the environment to be
> >
> > #define CONFIG_BOOTCOMMAND "bootm 20080000=E2=80=9D
>
> Sounds good to me.

--f40304378f38a1055105651bbe6a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">SGTM</div><div class=3D"gmail_extra"><br><div class=3D"gma=
il_quote">On Mon, Feb 12, 2018 at 8:03 PM, Brad Bishop <span dir=3D"ltr">&l=
t;<a href=3D"mailto:bradleyb@fuzziesquirrel.com" target=3D"_blank">bradleyb=
@fuzziesquirrel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
><span class=3D""><br>
&gt; On Feb 12, 2018, at 10:58 PM, Joel Stanley &lt;<a href=3D"mailto:joel@=
jms.id.au">joel@jms.id.au</a>&gt; wrote:<br>
&gt;<br>
&gt; On Fri, Feb 2, 2018 at 1:37 PM, Brad Bishop &lt;<a href=3D"mailto:brad=
leyb@fuzziesquirrel.com">bradleyb@fuzziesquirrel.com</a>&gt; wrote:<br>
&gt;&gt; Rely on the FDT parser to select a FIT config when looking for a<b=
r>
&gt;&gt; ramdisk_conf.=C2=A0 This allows image builders to use arbitrary co=
nfiguration<br>
&gt;&gt; names like /configurations/conf@foo.<br>
&gt;<br>
&gt; Can you elaborate?<br>
&gt;<br>
&gt; Do we even need this script? IIRC it was in place to support pre-FIT<b=
r>
&gt; configurations where the initrd and the kernel were stored in seperate=
<br>
&gt; locations in flash. Now that all systems use FIT, we can simply say<br=
>
&gt; &quot;bootm 2008000&quot;.<br>
&gt;<br>
&gt; I suggest we don&#39;t need it, so we should change the environment to=
 be<br>
&gt;<br>
</span>&gt; #define CONFIG_BOOTCOMMAND &quot;bootm 20080000=E2=80=9D<br>
<br>
Sounds good to me.</blockquote></div><br></div>

--f40304378f38a1055105651bbe6a--
