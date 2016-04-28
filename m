Return-Path: <bradleyb@fuzziesquirrel.com>
Received: from mail.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qwJbP3SR8zDqB2
 for <openbmc@lists.ozlabs.org>; Thu, 28 Apr 2016 11:07:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.b=IZHwCkUc; dkim-atps=neutral
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.fuzziesquirrel.com 677B62445E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fuzziesquirrel.com;
 s=mail; t=1461805663;
 bh=uIfZQcmWmtPjiMOMFvTBwgqUvtYHlaK/wv6BDUre2KY=;
 h=Subject:From:In-Reply-To:Date:References:To:From;
 b=IZHwCkUc7GPSssNk/UbB4UEMkKz98keVvAKsTssnd4qAQvKR/6IMBuZjrZO9hr+WL
 /vQu8iP56l1bK1eKzK9vvCyk+O+Mam+CUpXi2A8BcQEz8eu2YMDcwSbW28pLkmLumF
 mGsXVM0AqXNQdngzbEL4yv8gZisINGWGR4apc3k4=
Received: from brads-mbp.dyn.fuzziesquirrel.com
 (Brads-MBP.dyn.fuzziesquirrel.com [192.168.253.29])
 by mail.fuzziesquirrel.com (Postfix) with ESMTPSA id 8389224428
 for <openbmc@lists.ozlabs.org>; Wed, 27 Apr 2016 21:07:42 -0400 (EDT)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH skeleton] Remove CHASSIS_2 from Barreleye.py
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <1461796851-3417-2-git-send-email-openbmc-patches@stwcx.xyz>
Date: Wed, 27 Apr 2016 21:07:42 -0400
Content-Transfer-Encoding: quoted-printable
Message-Id: <5A675EF1-7258-4009-AAB4-D322CAB03A01@fuzziesquirrel.com>
References: <1461796851-3417-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1461796851-3417-2-git-send-email-openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
X-Mailer: Apple Mail (2.3124)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Apr 2016 01:07:45 -0000

Reviewed-by: Brad Bishop <bradleyb@fuzziesquirrel.com>

> On Apr 27, 2016, at 6:40 PM, OpenBMC Patches =
<openbmc-patches@stwcx.xyz> wrote:
>=20
> From: Adriana Kobylak <anoo@us.ibm.com>
>=20
> FRU_ID 2 corresponds to CPU1 and it doesn't have a CHASSIS section,
> so removing CHASSIS_2 since it causes an error on parsing the vpd
> data from hostboot and therefore it doesn't get added to the
> inventory.
> ---
> bin/Barreleye.py | 1 -
> 1 file changed, 1 deletion(-)
>=20
> diff --git a/bin/Barreleye.py b/bin/Barreleye.py
> index 09fefa0..0cf55a1 100755
> --- a/bin/Barreleye.py
> +++ b/bin/Barreleye.py
> @@ -385,7 +385,6 @@ ID_LOOKUP =3D {
> 		'BOARD_3'    : '<inventory_root>/system/misc',
> 		'PRODUCT_51' : '<inventory_root>/system/misc',
> 		'PRODUCT_100': '<inventory_root>/system',
> -		'CHASSIS_2'  : '<inventory_root>/system/chassis',
> 		'CHASSIS_100': '<inventory_root>/system/chassis',
> 		'BOARD_100'  : =
'<inventory_root>/system/chassis/io_board',
> 		'BOARD_101'  : =
'<inventory_root>/system/chassis/sas_expander',
> --=20
> 2.8.1
>=20
>=20
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
