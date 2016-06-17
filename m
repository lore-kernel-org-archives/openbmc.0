Return-Path: <bradleyb@fuzziesquirrel.com>
Received: from mail.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rWST01lVdzDqCY
 for <openbmc@lists.ozlabs.org>; Sat, 18 Jun 2016 03:50:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.b=s0/o/nFE; dkim-atps=neutral
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.fuzziesquirrel.com 6184D28F28
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fuzziesquirrel.com;
 s=mail; t=1466185808;
 bh=yRWRxPfpdArJfPQ+s+h79wwWRNnsPABBB1p+heceCGo=;
 h=Subject:From:In-Reply-To:Date:Cc:References:To:From;
 b=s0/o/nFEdpMEX/6ByjS2/53WziGYVshPnbHvrkd7xna3KUcEz6MoZ5qxXpVivo3Sh
 GPruXbPfp0cTjLPF5NDfcNyQOfTjT+NDNFhinpS526D2EpHv/cH5Cnywkxvt9TNltk
 /8Y3II9q5YH7Bq01yJFYzaUlSb1vp+XdISmgNq2s=
Received: from [192.168.253.29] (unknown [192.168.253.29])
 by mail.fuzziesquirrel.com (Postfix) with ESMTPSA id 99D9028EF2;
 Fri, 17 Jun 2016 13:50:07 -0400 (EDT)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH openbmc v2 2/2] Remove rest-dbus from Barreleye image
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <20160617160035.4873-3-openbmc-patches@stwcx.xyz>
Date: Fri, 17 Jun 2016 13:50:07 -0400
Cc: OpenBMC Patches <openbmc@lists.ozlabs.org>,
 Adriana Kobylak <anoo@us.ibm.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <75522302-6F18-4598-AD21-E4911FF59CBE@fuzziesquirrel.com>
References: <20160617160035.4873-1-openbmc-patches@stwcx.xyz>
 <20160617160035.4873-3-openbmc-patches@stwcx.xyz>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
X-Mailer: Apple Mail (2.3124)
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
X-List-Received-Date: Fri, 17 Jun 2016 17:50:14 -0000


> On Jun 17, 2016, at 12:00 PM, OpenBMC Patches =
<openbmc-patches@stwcx.xyz> wrote:
>=20
> From: Adriana Kobylak <anoo@us.ibm.com>
>=20
> The rest-dbus is a package intended for development debug. Remove it
> from the Barreleye image now that Barreleye is entering production.
> The rest-dbus packages in part of the development package.
>=20
> Signed-off-by: Adriana Kobylak <anoo@us.ibm.com>

Reviewed-by: Brad Bishop <bradleyb@fuzziesquirrel.com>

> ---
> .../meta-rackspace/meta-barreleye/conf/local.conf.sample              =
| 4 ++++
> 1 file changed, 4 insertions(+)
>=20
> diff --git =
a/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/conf/=
local.conf.sample =
b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/conf/=
local.conf.sample
> index 8799d8d..00209c1 100644
> --- =
a/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/conf/=
local.conf.sample
> +++ =
b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/conf/=
local.conf.sample
> @@ -243,3 +243,7 @@ INHERIT +=3D "extrausers"
> EXTRA_USERS_PARAMS =3D " \
>   usermod -p '\$1\$UGMqyqdG\$FZiylVFmRRfl9Z0Ue8G7e/' root; \
>   "
> +
> +# Package exclusions - Exclude packages included by default in the =
common image
> +IMAGE_INSTALL_remove =3D "packagegroup-obmc-phosphor-apps-extrasdev"
> +
> --=20
> 2.8.4
>=20
>=20
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
