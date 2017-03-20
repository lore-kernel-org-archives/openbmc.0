Return-Path: <trini@konsulko.com>
Received: from mail-qt0-x230.google.com (mail-qt0-x230.google.com
 [IPv6:2607:f8b0:400d:c0d::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vn61P6vlGzDqC2
 for <openbmc@lists.ozlabs.org>; Tue, 21 Mar 2017 06:47:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=konsulko.com header.i=@konsulko.com header.b="JTSLJ8z3";
 dkim-atps=neutral
Received: by mail-qt0-x230.google.com with SMTP id r45so115794042qte.3
 for <openbmc@lists.ozlabs.org>; Mon, 20 Mar 2017 12:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=0XBLDjxhE75rlA9FK+9oQJ2XbKfO5kC10huMJjQkncA=;
 b=JTSLJ8z3ht3RRn9pCkgoI+fpdgDjaOYylvQeOgzPQ7GwRE+YEYXiQO/oxGxFh8yfnZ
 VnwoWrCUeujNhvGDqmtliEqEAyIPtJSSX0gQ464texDzs9znI/FRbmxxc42UEBAvPuCs
 ta8xAPSwn6yNE12MEXQqctX4eCfs2MAdOaRjk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=0XBLDjxhE75rlA9FK+9oQJ2XbKfO5kC10huMJjQkncA=;
 b=pXrI0LEjQlOX2krncS2kKH8v7iXW+OqnVBxsvDJWQwSc07Wj3rr7H8oeAoqRTmwtf+
 z3YNRWHw2k+2Z5fzeRHp3Tuj45k8YUTf2p3AQT4/U80OyNr4SElxn7pr6CC5ngz8cfLQ
 ME/6WA6noBRSyeILXySiieSzt16VBUeIZfHvRbgbECyz3TpdvEE+Pwsy3tbGJ3eY67jM
 xxy/kfIAy8FjTMqoQWwd6nmnfNitkNVj5k3lJG94CbAS2U4OJzEmw+FhTDSJ/62BpeBK
 Rwsp0WCd53YTTs9B8PKNcJbtfJtF5RS/SuPcBoqMk0FydgdXWwWK5rNIethZEj3QE5ES
 toYA==
X-Gm-Message-State: AFeK/H3SDQHJtfoXfEGaRSWLpQI93SExc5c7aGTJ5dkMkYoXjVMjfS277u3uTagWECnvNg==
X-Received: by 10.200.49.76 with SMTP id h12mr27308349qtb.44.1490039270108;
 Mon, 20 Mar 2017 12:47:50 -0700 (PDT)
Received: from bill-the-cat (cpe-75-180-228-133.ec.res.rr.com.
 [75.180.228.133])
 by smtp.gmail.com with ESMTPSA id z196sm13094754qkb.11.2017.03.20.12.47.49
 (version=TLS1_2 cipher=AES128-SHA bits=128/128);
 Mon, 20 Mar 2017 12:47:49 -0700 (PDT)
Date: Mon, 20 Mar 2017 15:48:21 -0400
From: Tom Rini <trini@konsulko.com>
To: Maxim Sloyko <maxims@google.com>, Simon Glass <sjg@chromium.org>
Cc: U-Boot Mailing List <u-boot@lists.denx.de>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: [U-Boot] [PATCH 13/17] aspeed: Add support for Clocks needed by
 MACs
Message-ID: <20170320194821.GY19897@bill-the-cat>
References: <20170316213624.140344-1-maxims@google.com>
 <20170316213624.140344-14-maxims@google.com>
 <20170319164217.GN19897@bill-the-cat>
 <CAFR_W8qO-hP880NMdyHgGuwq_agsMXcPyfJWt9C8Hot-sW2e6w@mail.gmail.com>
 <20170320173034.GX19897@bill-the-cat>
 <CAFR_W8q_mPwTU9NH1vhf7rQuBQ1JLxdHjSS7me_QWqh1878hTg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="bQ0zDxTE3Kp3DTll"
Content-Disposition: inline
In-Reply-To: <CAFR_W8q_mPwTU9NH1vhf7rQuBQ1JLxdHjSS7me_QWqh1878hTg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
X-List-Received-Date: Mon, 20 Mar 2017 19:47:55 -0000


--bQ0zDxTE3Kp3DTll
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 20, 2017 at 10:52:12AM -0700, Maxim Sloyko wrote:
> On Mon, Mar 20, 2017 at 10:30 AM, Tom Rini <trini@konsulko.com> wrote:
>=20
> > On Mon, Mar 20, 2017 at 10:24:20AM -0700, Maxim Sloyko wrote:
> > > On Sun, Mar 19, 2017 at 9:42 AM, Tom Rini <trini@konsulko.com> wrote:
> > >
> > > > On Thu, Mar 16, 2017 at 02:36:20PM -0700, Maxim Sloyko wrote:
> > > > > Add support for clocks needed by MACs to ast2500 clock driver.
> > > > > The clocks are D2-PLL, which is used by both MACs and PCLK_MAC1 a=
nd
> > > > > PCLK_MAC2 for MAC1 and MAC2 respectively.
> > > > >
> > > > > The rate of D2-PLL is hardcoded to 250MHz -- the value used in As=
peed
> > > > > SDK. It is not entirely clear from the datasheet how this clock is
> > used
> > > > > by MACs, so not clear if the rate would ever need to be different.
> > So,
> > > > > for now, hardcoding it is probably safer.
> > > > >
> > > > > The rate of PCLK_MAC{1,2} is chosen based on MAC speed selected
> > through
> > > > > hardware strapping.
> > > > >
> > > > > So, the network driver would only need to enable these clocks, no
> > need
> > > > > to configure the rate.
> > > > >
> > > > > Signed-off-by: Maxim Sloyko <maxims@google.com>
> > > > > ---
> > > > >
> > > > >  arch/arm/dts/ast2500-u-boot.dtsi               |   8 +
> > > > >  arch/arm/include/asm/arch-aspeed/scu_ast2500.h |  62 +++++-
> > > > >  drivers/clk/aspeed/clk_ast2500.c               | 265
> > > > ++++++++++++++++++++++---
> > > > >  include/dt-bindings/clock/ast2500-scu.h        |   2 +
> > > > >  4 files changed, 304 insertions(+), 33 deletions(-)
> > > > >
> > > > > diff --git a/arch/arm/dts/ast2500-u-boot.dtsi
> > > > b/arch/arm/dts/ast2500-u-boot.dtsi
> > > > > index faeeec1be4..f826646095 100644
> > > > > --- a/arch/arm/dts/ast2500-u-boot.dtsi
> > > > > +++ b/arch/arm/dts/ast2500-u-boot.dtsi
> > > > > @@ -61,3 +61,11 @@
> > > > >               };
> > > > >       };
> > > > >  };
> > > > > +
> > > > > +&mac0 {
> > > > > +     clocks =3D <&scu PCLK_MAC1>, <&scu PLL_D2PLL>;
> > > > > +};
> > > > > +
> > > > > +&mac1 {
> > > > > +     clocks =3D <&scu PCLK_MAC2>, <&scu PLL_D2PLL>;
> > > > > +};
> > > >
> > > > Why is this here and not in the main dts file?  The -u-boot.dtsi is=
 for
> > > > stuff that's not appropriate in the upstream dts file.  Thanks!
> > >
> > > There is no clock driver for this part in mainline Linux Kernel yet a=
nd I
> > > don't know how it will end up being configured. I suspect that they m=
ight
> > > not use the same bindings though.
> > >
> > > Should I put this into board specific dts?
> >
> > So this applies to a lot of parts of the series here.  What we don't
> > want to do is have places where the DTS here diverges from the Linux
> > kernel DTS and we don't reconcile them.  If the relevant Linux drivers
> > are not in mainline, are they at least in linux-next or otherwise
> > submitted to the relevant subtrees?
> >
>=20
> No, as far as I know, maybe Rick (cc'ed) knows what is the plan there.
>=20
> I'm not really working on the linux driver and it's outside of my control.
>=20
> I can change network driver, so that it does not use this DT configuration
> and either hard code clock config into it, or configure it's clocks in
> board specific file -- would that be more acceptable?

For all the cases where you don't have the DT portion itself upstream
yet, go with platdata instead for now.  Unless I'm mis-recalling things
that is.

--=20
Tom

--bQ0zDxTE3Kp3DTll
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJY0DIFAAoJEIf59jXTHXZSCOcP/RwSaCcc4aYLjTlhHr4IE5L4
bdOmYR3dSEehDX+Y6ofMFwfICTVFUIr6jBP6r6Bq4A8UBw6LMrp0zdubQtZZFMLO
+ecE8teGT4zNJHisRtT5L6NsiVs/Taqnjxd6DthGlRWe31dxYwuv0YxDCgK1L4ry
rUQQub84x5nQg4cC6TK9sGAiK0Sc2XqrD9N1jlPR/xZSDONuL28e3mfzk4gTGtqj
934YfWvLSjPvr1pkIpvj8iHWBF0DZwHM6DOXKGjQGW/FQE6i1Zog/fqy7QrDqPhP
nzgKewzYAjdq7jUKcytktgc47cIGHVCTuSSLlnjUGgC5Pypsv8EanB9Vzj3tVLQG
C1ePKVfwGqeLpOvlZx3l4lLDbrZvysIqOOtRXM53s1DBIaziY0a6DLOb5WAMCWP2
NyvgakzNpAmKFLiDDiJ1tNE1fkuq1V5CC0iDpNM2CgmVFKhwK5/URHuOZowu0XkV
1SZKDzRxrWot5+BrAxJoede/HFbZ9yNov5tcie1E+jErYJDL5xtKvZZXp+FTwgG0
82Ij1EZ29ZkSBPfsvbCYn+qG1O6IIjayCI/RCXsalQQMgaiSF/NgokYcAkocVIf+
P5p5m5jY2Y6oN1jsTkFoscVQiJKGDlJwI//mZUswjQWpzbQhWVU+NaKKCdNMWJSZ
kR6DM2a1j8LCv5LLqjGB
=YkEe
-----END PGP SIGNATURE-----

--bQ0zDxTE3Kp3DTll--
