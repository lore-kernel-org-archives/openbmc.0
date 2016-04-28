Return-Path: <bradleyb@fuzziesquirrel.com>
Received: from mail.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qwJgY3fwZzDqB2
 for <openbmc@lists.ozlabs.org>; Thu, 28 Apr 2016 11:11:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.b=vid9EYMD; dkim-atps=neutral
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.fuzziesquirrel.com 5EE1224D37
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fuzziesquirrel.com;
 s=mail; t=1461805879;
 bh=rGUvZJUXlMNF5GXZriyxZNtSi/LgUBUtrpLglowC4+I=;
 h=Subject:From:In-Reply-To:Date:References:To:From;
 b=vid9EYMD8zZi+JY5Q92/sG991qBrWteC/gydhAJTquLHBC+qZRAvlMBPF/6QAm16y
 YC0o6mqLC6k6e85by/QlRdZ8WbJgUj1EdcMpLNYEGHN2BerTshfK6M/UFYt6dtbHsi
 vz1MR5CKNh46qhxC4+TCANW0IqGurAnV9AFLrz6I=
Received: from brads-mbp.dyn.fuzziesquirrel.com
 (Brads-MBP.dyn.fuzziesquirrel.com [192.168.253.29])
 by mail.fuzziesquirrel.com (Postfix) with ESMTPSA id 57CBE24D0A
 for <openbmc@lists.ozlabs.org>; Wed, 27 Apr 2016 21:11:18 -0400 (EDT)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH skeleton] Replace BUILD_ID with VERSION_ID in then
 inventory
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <1461615651-31359-2-git-send-email-openbmc-patches@stwcx.xyz>
Date: Wed, 27 Apr 2016 21:11:18 -0400
Content-Transfer-Encoding: quoted-printable
Message-Id: <E9106819-7335-4D66-8DC8-4E7BE7472807@fuzziesquirrel.com>
References: <1461615651-31359-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1461615651-31359-2-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 28 Apr 2016 01:11:21 -0000

I thought we were going to expose both of these? =20


> On Apr 25, 2016, at 4:20 PM, OpenBMC Patches =
<openbmc-patches@stwcx.xyz> wrote:
>=20
> From: Adriana Kobylak <anoo@us.ibm.com>
>=20
> Add VERSION_ID to the inventory instead of BUILD_ID because
> the version (git tag) is the value that gets updated during
> a firmware update, the build id remains constant.
> ---
> bin/inventory_items.py | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/bin/inventory_items.py b/bin/inventory_items.py
> index 6320f90..0a90569 100755
> --- a/bin/inventory_items.py
> +++ b/bin/inventory_items.py
> @@ -71,7 +71,7 @@ def getVersion():
> 		for line in f:
> 			p =3D line.rstrip('\n')
> 			parts =3D line.rstrip('\n').split('=3D')
> -			if (parts[0] =3D=3D "BUILD_ID"):
> +			if (parts[0] =3D=3D "VERSION_ID"):
> 				version =3D parts[1]
> 	return version
>=20
> --=20
> 2.8.1
>=20
>=20
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
