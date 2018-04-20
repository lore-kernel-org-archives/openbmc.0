Return-Path: <a.amelkin@yadro.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.251; helo=mta-01.yadro.com;
 envelope-from=a.amelkin@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="rkNdDxj+"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.251])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40SGvn1rBmzF21F
 for <openbmc@lists.ozlabs.org>; Fri, 20 Apr 2018 23:31:01 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id EDF73516F6;
 Fri, 20 Apr 2018 13:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:in-reply-to:mime-version:user-agent
 :date:date:message-id:from:from:references:subject:subject
 :received:received:received; s=mta-01; t=1524231056; x=
 1526045457; bh=Q2cOIT0PNEnp6fdlbkYRAi5TTqMjLRAzKmMiCvwGKg8=; b=r
 kNdDxj++ZFNsdwN5LLVauIlG9bRavBYkVe/kKkl+ewat/FCaboFSsQyhL4gWRcPE
 BSgET/wP9GRSUVkerLmQkeTiH8grb+DJTHjfq+d7wtVcGG4HZCOUpPariKofU78s
 LenZOnQSX/KCMbj6gb+cQedy1mzanx+PGlDpYEhKCc=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cEk6kEm3yc5T; Fri, 20 Apr 2018 16:30:56 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id BB66F50A07;
 Fri, 20 Apr 2018 16:30:55 +0300 (MSK)
Received: from [172.17.14.168] (172.17.14.168) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Fri, 20
 Apr 2018 16:30:55 +0300
Subject: Re: IPMI Firmware Firewall
To: Vernon Mauery <vernon.mauery@linux.intel.com>
CC: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>, <emilyshaffer@google.com>, 
 <tomjose@linux.vnet.ibm.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <1d827b60-27cf-25f9-3df0-07f28de9fdf5@linux.vnet.ibm.com>
 <1d8664d8-d3ad-0be8-7237-535ed0f6ea34@yadro.com>
 <20180419183637.GT113334@mauery>
From: Alexander Amelkin <a.amelkin@yadro.com>
Openpgp: preference=signencrypt
Autocrypt: addr=a.amelkin@yadro.com; prefer-encrypt=mutual; keydata=
 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
 dTYsE5wSxM06T2l/MILupCNZ7A==
Message-ID: <6b0c2313-0b57-4f7e-275c-50c946a81be9@yadro.com>
Date: Fri, 20 Apr 2018 16:30:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <20180419183637.GT113334@mauery>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="PQW46rX1GHfREHkaqM0tuOePGWkWMkdWB"
X-Originating-IP: [172.17.14.168]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
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
X-List-Received-Date: Fri, 20 Apr 2018 13:31:03 -0000

--PQW46rX1GHfREHkaqM0tuOePGWkWMkdWB
Content-Type: multipart/mixed; boundary="s0WVsJQh1aWPvhtnUFOjAxN62i0Stloxm";
 protected-headers="v1"
From: Alexander Amelkin <a.amelkin@yadro.com>
To: Vernon Mauery <vernon.mauery@linux.intel.com>
Cc: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>, emilyshaffer@google.com,
 tomjose@linux.vnet.ibm.com, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Message-ID: <6b0c2313-0b57-4f7e-275c-50c946a81be9@yadro.com>
Subject: Re: IPMI Firmware Firewall
References: <1d827b60-27cf-25f9-3df0-07f28de9fdf5@linux.vnet.ibm.com>
 <1d8664d8-d3ad-0be8-7237-535ed0f6ea34@yadro.com>
 <20180419183637.GT113334@mauery>
In-Reply-To: <20180419183637.GT113334@mauery>

--s0WVsJQh1aWPvhtnUFOjAxN62i0Stloxm
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

19.04.2018 21:36, Vernon Mauery wrote:
> On 19-Apr-2018 03:52 PM, Alexander Amelkin wrote:
>> is "owned"/managed by a different entity than the hardware. E.g. in a
>> dedicated server hosting or similar scenarios. The owner of the hardwa=
re
>> may not want to allow the tenants to be able to perform destructive or=

>> potentially destructive operations on the BMC. I can think of
>> prohibiting firmware updates (even with good firmwares), user
>> management, network configuration, SEL and PEF/PET manipulation, et al=
=2E
>
> The biggest trouble with it is that the configuration of it happens as
> the admin user, so if your untrusted user has admin privileges, they
> could potentially just change the firmware firewall.
Well, if an untrusted user has admin password, then you're doomed anyway
as they may come over LAN and ruing everything.

I thought that this Firewall was intended to block certain commands on
System Interface where no authentication is required.



--s0WVsJQh1aWPvhtnUFOjAxN62i0Stloxm--

--PQW46rX1GHfREHkaqM0tuOePGWkWMkdWB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJa2euOAAoJEOiTWHtbdBeNjqgP/io0hid+tb/ShGADBA5BEMjI
okZet4nbYuo5faDyHEwrXz4lHjI7p/UKT2pip1jtcF36TYdpRRW49fp9MpT+ZZLO
f1bdQoR961fecAr2gm66zHU5wBX5WcwV/Z0rC0jmQkqdyGX41hgcxWqb3Q77H9o5
6J5Y027+MkS9DGkz2EeDuutQQU0+XHQNiJdgMMF8xqM6z4Geg2kWfAj0NZO6z/aM
unzYwbP0MOYt3T3keQOh0ApSGtBKVVmjxzGsu3Oi0Uxc0aShpq7yk5FfXeWbgmw3
nc+fuibLuH559m33hdyRarPFt62D833Rb4IeQ+1u4YyvL6GPyg8ZouodLcqjDq0X
qNVSPxWpSRbYJnR+ZHuRUwouzNcp2veJcLVPjO4jL0jkJcpWsbpbIE7WWM1Mn8Yz
mtX2M+j0I2OCBWLbwlzxyoLq/g+/R6hRI41LWYd7zWfhmate8gUX9qkudfiT7aZA
rS3NDCwGCJriRO5l0jmexRo5d576WAK3NThCmkJBGmSE7f/hiHt8SI5ekisSGiDa
JvcHyterY400aaBkMUo000/FeZpeevUQlrtIDJYA8rysMgSFwaMvSonb/drVWtKo
Ux6dGeukWWc6a62GhyEtP8dEU8/3xvM2OmbL4/QVVesLVNDLxLGU++rZi+fizP6u
K4xJLraWgup2CF68aaZu
=3Sib
-----END PGP SIGNATURE-----

--PQW46rX1GHfREHkaqM0tuOePGWkWMkdWB--
