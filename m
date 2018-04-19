Return-Path: <a.amelkin@yadro.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.251; helo=mta-01.yadro.com;
 envelope-from=a.amelkin@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="V9P1QFw8"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.251])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40Rf613z29zF21Q
 for <openbmc@lists.ozlabs.org>; Thu, 19 Apr 2018 22:52:41 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 6ABFE51969;
 Thu, 19 Apr 2018 12:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:in-reply-to:mime-version:user-agent
 :date:date:message-id:from:from:references:subject:subject
 :received:received:received; s=mta-01; t=1524142355; x=
 1525956756; bh=6kDhdy5HzLxhpA4E71+LQTO9aMyS3nU7r+xkvHMibpQ=; b=V
 9P1QFw8K8UV5RCKcGxvvwWfExPSf1xVgCEJZz97szZrj1jAUSK/WFh4BNcCCodfa
 gzxjwih0EFnszsmNEqTNAXVGH4dsYTK2XToynBJZDaDaILHQvss59Nf5DKTd9cen
 Zv6Ya2aFgQpgUBRMPxb68TGAUtOW7nqKDtEZsVas1Q=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fOaPL4itacby; Thu, 19 Apr 2018 15:52:35 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 3F99750A07;
 Thu, 19 Apr 2018 15:52:35 +0300 (MSK)
Received: from [172.17.14.168] (172.17.14.168) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Thu, 19
 Apr 2018 15:52:34 +0300
Subject: Re: IPMI Firmware Firewall
To: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>, <emilyshaffer@google.com>, 
 <vernon.mauery@linux.intel.com>, <tomjose@linux.vnet.ibm.com>, OpenBMC
 Maillist <openbmc@lists.ozlabs.org>
References: <1d827b60-27cf-25f9-3df0-07f28de9fdf5@linux.vnet.ibm.com>
From: Alexander Amelkin <a.amelkin@yadro.com>
Openpgp: preference=signencrypt
Autocrypt: addr=a.amelkin@yadro.com; prefer-encrypt=mutual; keydata=
 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
 dTYsE5wSxM06T2l/MILupCNZ7A==
Message-ID: <1d8664d8-d3ad-0be8-7237-535ed0f6ea34@yadro.com>
Date: Thu, 19 Apr 2018 15:52:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <1d827b60-27cf-25f9-3df0-07f28de9fdf5@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="UByPUSeJsnyovmm0tWESiFUc8jZfoDhv0"
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
X-List-Received-Date: Thu, 19 Apr 2018 12:52:44 -0000

--UByPUSeJsnyovmm0tWESiFUc8jZfoDhv0
Content-Type: multipart/mixed; boundary="qjncsDWnrVLoCepbiQvD2CTX2tT0U24B2";
 protected-headers="v1"
From: Alexander Amelkin <a.amelkin@yadro.com>
To: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>, emilyshaffer@google.com,
 vernon.mauery@linux.intel.com, tomjose@linux.vnet.ibm.com,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Message-ID: <1d8664d8-d3ad-0be8-7237-535ed0f6ea34@yadro.com>
Subject: Re: IPMI Firmware Firewall
References: <1d827b60-27cf-25f9-3df0-07f28de9fdf5@linux.vnet.ibm.com>
In-Reply-To: <1d827b60-27cf-25f9-3df0-07f28de9fdf5@linux.vnet.ibm.com>

--qjncsDWnrVLoCepbiQvD2CTX2tT0U24B2
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

Well, although I've never seen this feature actually implemented
anywhere, I can imagine that it can be useful for cases when the host OS
is "owned"/managed by a different entity than the hardware. E.g. in a
dedicated server hosting or similar scenarios. The owner of the hardware
may not want to allow the tenants to be able to perform destructive or
potentially destructive operations on the BMC. I can think of
prohibiting firmware updates (even with good firmwares), user
management, network configuration, SEL and PEF/PET manipulation, et al.

Sincerely,
Alexander.

19.04.2018 13:17, Deepak Kodihalli wrote:
> Hi All,
>
> The Firmware Firewall is something that the OpenBMC stack does not
> implement today. Do you know how useful this is to an IPMI user? Is
> this something we must implement in the IPMI stack?
>
> It seems to apply to malicious firmware running on the BMC in a blade
> server/multi-bmc environment, but aren't those concerns addressed by
> signed images and/or other modern security features?
>
> Thanks,
> Deepak
>



--qjncsDWnrVLoCepbiQvD2CTX2tT0U24B2--

--UByPUSeJsnyovmm0tWESiFUc8jZfoDhv0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJa2JESAAoJEOiTWHtbdBeNYVUP/26d3206jEXXoqIStG+fLcgC
mHkFQpcYDKzzi2l+xZfm8ofT1D/4MZGXdp2NnqcSsibzyqKKb0WY/G59V5Bl9WKV
zHGGjGOy0NDWelCMBzcT2abtugEcxHY5ze8OlCHPIlRjUAzRBHUTm8Oszxd3kL3N
f7pheK7C47/DjQcbNQAH4OrIgToVAl71zXtEZFGYPcYxOTKm3l8i7JzuMpSGHYQ0
oPhiRoj4Xvfbal3MAfA2a8AdlUZec3jMqnKGZTbkdVdtI4YkuZEESxKlN30UM4ft
KsA0pphEweST3NbSU2Y96nkvu/OCN1G6PZ291jihBprxncYM04buogYrsgGDob4B
k4zxqnvDCzQpP/5uQJ6O3CSCsgY2W/G5jgGHgxYVkVV66TnXPx9lEn3nM+O4lGOK
sA2X3IrBFtfKFwUj0Yi3UdpZHndW9n0MnVK/PNNWXBUn4iUHehcZuJO0YBuhMOih
fu4mBB4g6vQmQ1RurauoCGZTpGXLVseW9tcRegVJl8GQHn1UKBvwOiBJUnW+yTLL
3ddaRd4H7LDX0B8q7lX0l9ECJ6nGxuZrx8ka1h0PLB6Z1XecyXldAqNbrJobyC0T
xHuHACmmdI987Eoh29Gt0mEk2Fm7TCixda9yuExLQevZSOPOAS9uQaN7EpmL/yhR
WEkTY6Lzr5wwvKOVFCHf
=wfbr
-----END PGP SIGNATURE-----

--UByPUSeJsnyovmm0tWESiFUc8jZfoDhv0--
