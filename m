Return-Path: <blue@cmd.nu>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=cmd.nu
 (client-ip=2a00:1450:4864:20::543; helo=mail-ed1-x543.google.com;
 envelope-from=blue@cmd.nu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=cmd.nu
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=cmd.nu header.i=@cmd.nu header.b="C1uWiQC4"; 
 dkim-atps=neutral
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42vM3f2cDTzF3HX
 for <openbmc@lists.ozlabs.org>; Tue, 13 Nov 2018 19:58:21 +1100 (AEDT)
Received: by mail-ed1-x543.google.com with SMTP id h15so4930704edb.4
 for <openbmc@lists.ozlabs.org>; Tue, 13 Nov 2018 00:58:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cmd.nu; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=loU/WUKdkzSGH+aK20B8fUvEEO6Dz4MaFv1f9LYSXVM=;
 b=C1uWiQC4yz2UHG/+QDE4S61BNcCYsMw/iaSAozQxlIHTlm5GXk6UTKCgd4Sc6DWzDX
 s3ZgLpxFIj1FQbUwh2hX67odLJUKZBSDvHc3MVVHnJ5FUqeV7DHliN6WU3nTNDNGkKI4
 W6oSRTQwB/ZKm0B+ESag0qslN5YPdrlUTxYOg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=loU/WUKdkzSGH+aK20B8fUvEEO6Dz4MaFv1f9LYSXVM=;
 b=iphosukTMoFIF9pfv9546fuxM9mlEl+em7M6S9GtTlbOR764r0m3pJxHqXWUTAKyqi
 wXotxAuR2+dPIx0lJFzbUZsIUdvqg/8cVVXjXOg7JKsjLiiN1waVGFjluHUKODkYdxTR
 +uBOlTndQHxCNGtoDs30hJLN+rT0QVuJxDz5gRIDRIXL5UlPMnOTs4pqgD3FXoCFZkEp
 KdSOOPGYCKuJHTUJHsV8dWdzBoPtcznFu9pGeC3/HDTE23zkLXR2EOurHnVKfIN7H4JJ
 zzs4jjUlR07NVcWXduz/RcWQs0f+zGjQ8sd4GDj6pCsQ/MwfEXOPIqL7pzpZ9EeAMZSa
 R+9A==
X-Gm-Message-State: AGRZ1gIGiMntkxU69DoIN2sqohDgq7gDA4RHjjVTjcUKP+AuvgoV1eVf
 eHgwurPtWKO4qmofMicM1W1py783kHqCJvHnxF3p/g==
X-Google-Smtp-Source: AJdET5exfpJicplYtNM49zxXWC3Fni16YR7+R4r4+BH+7Gx0k9D3PiCWlmc13Lhh5pFz1binBBUhOKKVE1CmNi+/foI=
X-Received: by 2002:a50:b7b7:: with SMTP id
 h52-v6mr15451035ede.17.1542099498722; 
 Tue, 13 Nov 2018 00:58:18 -0800 (PST)
MIME-Version: 1.0
References: <20181112142137.160970-1-bluecmd@google.com>
 <21acbd66-c75c-d5e3-fcfb-fa75421a7879@kaod.org>
 <CADiuDAQ1mjh56ibSd+tNq2NFiJFtLcAfyoC8fdd=y+4Mu+jD6w@mail.gmail.com>
 <1542068863.1552891.1574692280.790D270F@webmail.messagingengine.com>
In-Reply-To: <1542068863.1552891.1574692280.790D270F@webmail.messagingengine.com>
From: Christian Svensson <blue@cmd.nu>
Date: Tue, 13 Nov 2018 09:58:08 +0100
Message-ID: <CADiuDARPsPGkHP1HRm1RVP=G2scSLozSON3o5h_PuA3ngT5eXg@mail.gmail.com>
Subject: Re: [PATCH] qemu: aspeed_timer: Use signed muldiv for timer resets
To: andrew@aj.id.au
Cc: clg@kaod.org, Christian Svensson <bluecmd@google.com>, 
 "openbmc @ lists . ozlabs . org" <openbmc@lists.ozlabs.org>,
 Joel Stanley <joel@jms.id.au>
Content-Type: multipart/alternative; boundary="000000000000d47d0e057a88044a"
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
X-List-Received-Date: Tue, 13 Nov 2018 08:58:23 -0000

--000000000000d47d0e057a88044a
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 13, 2018 at 1:27 AM Andrew Jeffery <andrew@aj.id.au> wrote:
> By inspection the concept of the patch seems okay to me. However, the
issue
> that host-utils.h takes care of in addition to providing helpers is
support for
> those helpers on systems that don't support 128-bit integers. The patch
should
> be sent to the upstream lists, and I don't think we should be breaking
> qemu-arm-* generally for systems that we might not care about.

Ah, yes - I missed that there were two - one for systems with int128 and
one for them
without. Hm, that does complicate things.

Given that we only have one operand that is ever negative, how do you feel
about a patch
that goes along the lines of:

if (delta >= 0) {
  t->start += muldiv64(delta, NANOSECONDS_PER_SECOND, rate);
} else {
   t->start = (int64_t)t->start - muldiv64(-delta, NANOSECONDS_PER_SECOND,
rate);
}

That should avoid any issues I think, save us/me from implementing a signed
muldiv,
but cost a bit on the readable code side.

--000000000000d47d0e057a88044a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On Tue, Nov 13, 2018 at 1:27 AM Andrew Jeffery &lt=
;<a href=3D"mailto:andrew@aj.id.au">andrew@aj.id.au</a>&gt; wrote:<br>&gt; =
By inspection the concept of the patch seems okay to me. However, the issue=
<br>&gt; that host-utils.h takes care of in addition to providing helpers i=
s support for<br>&gt; those helpers on systems that don&#39;t support 128-b=
it integers. The patch should<br>&gt; be sent to the upstream lists, and I =
don&#39;t think we should be breaking<br>&gt; qemu-arm-* generally for syst=
ems that we might not care about.<div><br></div><div>Ah, yes - I missed tha=
t there were two - one for systems with int128 and one for them</div><div>w=
ithout. Hm, that does complicate things.</div><div><br></div><div>Given tha=
t we only have one operand that is ever negative, how do you feel about a p=
atch</div><div>that goes along the lines of:</div><div><br></div><div>if (d=
elta &gt;=3D 0) {</div><div>=C2=A0 t-&gt;start +=3D muldiv64(delta, NANOSEC=
ONDS_PER_SECOND, rate);=C2=A0=C2=A0<br></div><div>} else {</div><div>=C2=A0=
=C2=A0

t-&gt;start =3D (int64_t)t-&gt;start=C2=A0-=C2=A0muldiv64(-delta, NANOSECON=
DS_PER_SECOND, rate);</div><div>}</div><div><br></div><div>That should avoi=
d any issues I think, save us/me from implementing a signed muldiv,</div><d=
iv>but cost a bit on the readable code side.</div><div><br></div></div>

--000000000000d47d0e057a88044a--
