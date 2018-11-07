Return-Path: <a.amelkin@yadro.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.251; helo=mta-01.yadro.com;
 envelope-from=a.amelkin@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="T6/oBrQr"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.251])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42qpgQ2pGrzF3G0
 for <openbmc@lists.ozlabs.org>; Thu,  8 Nov 2018 01:28:34 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 5B0144193F
 for <openbmc@lists.ozlabs.org>; Wed,  7 Nov 2018 14:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:mime-version:user-agent:date:date
 :message-id:subject:subject:from:from:received:received
 :received; s=mta-01; t=1541600909; x=1543415310; bh=sof6Pl2SJ099
 KfY/i8Z5WfzR5lSWk71OvC76A+L7UNQ=; b=T6/oBrQruLd37lKASIkWJNRdLHNu
 i9Ze51Yj2S4MSpa++6656PpWgcHVG+tANofN993jGr2SURYjiFjKQU1nAZAt/9aG
 MGCMdZIbsN5R9oes3FfgRT0JS01cyxevdzCRrQR7+b1Te+vK32I0gufa/uJm4nLV
 XDVkzLzUCTBkc9c=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mbw71HKqXzyW for <openbmc@lists.ozlabs.org>;
 Wed,  7 Nov 2018 17:28:29 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 3072641203
 for <openbmc@lists.ozlabs.org>; Wed,  7 Nov 2018 17:28:29 +0300 (MSK)
Received: from [172.17.14.197] (172.17.14.197) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Wed, 7 Nov
 2018 17:28:28 +0300
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: Alexander Amelkin <a.amelkin@yadro.com>
Subject: Mains blink, chassisoff, and power restore policy
Openpgp: preference=signencrypt
Autocrypt: addr=a.amelkin@yadro.com; prefer-encrypt=mutual; keydata=
 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
 dTYsE5wSxM06T2l/MILupCNZ7A==
Message-ID: <b4b918fb-d400-c209-750c-5cf7d88863cc@yadro.com>
Date: Wed, 7 Nov 2018 17:28:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.0
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="bWmh0CkJuEGRMWNqxNS3r7ckR8s2VkTkh"
X-Originating-IP: [172.17.14.197]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
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
X-List-Received-Date: Wed, 07 Nov 2018 14:28:35 -0000

--bWmh0CkJuEGRMWNqxNS3r7ckR8s2VkTkh
Content-Type: multipart/mixed; boundary="uOYbTXqStepTGoVLbukffmCCRRhWqKspt";
 protected-headers="v1"
From: Alexander Amelkin <a.amelkin@yadro.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Message-ID: <b4b918fb-d400-c209-750c-5cf7d88863cc@yadro.com>
Subject: Mains blink, chassisoff, and power restore policy

--uOYbTXqStepTGoVLbukffmCCRRhWqKspt
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

Hi all!

Do you think that a host turned off with `obmcutil chassisoff` (not `obmc=
util poweroff`) should return back to 'on' state upon AC power cycle when=
 power restore policy is 'Restore' ?

Currently it does, quite weirdly. That happens because `obmcutil poweroff=
` command sets RequestedHostTransition to Off, but `obmcutil chassisoff` =
command does not change that property.

It is proposed to add a new service, which sets RequestedHostTransition p=
roperty to value Off on obmc-chassis-hard-poweroff target call.

The corresponding change is in Gerrit:
https://gerrit.openbmc-project.xyz/#/c/openbmc/meta-phosphor/+/15061/

I invite everyone to discuss it there as so far we have only two quite op=
posite opinions on this expressed in Gerrit comments.

WBR,
Alexander.


--uOYbTXqStepTGoVLbukffmCCRRhWqKspt--

--bWmh0CkJuEGRMWNqxNS3r7ckR8s2VkTkh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJb4vaMAAoJEOiTWHtbdBeNxtIQAJHB5fY1xMhSCKhYFf5xCQsz
0TAmYdo3C4oqt+P0dJ8fkBM5C83fTHFdmSl8ZkjwDrgxpJ54/5Og6zYG2z5nZHBp
BLXzadHJ60bM0Ic+UKW2hbsrIjjKS1EDllG+rGu74gwoGJv1nnj1CRgaSYxrBehV
H+YfXQYSEzilTSDqbFI4a4tKriZx10/uhUYXQ9Tie3ZbCqrGv9Jum5+ZUFPy7kPR
rXHUO5uUcwMtpkmEFD6+2yzFKP+jaU3MtKEkKtJaYoUnGmcnFpm/LK8Bf/341cVb
O/Z+tq2IH2NGoyWpm5iKZfsSZyYS1om/C28o3YpR8ObGKqarl14DOHjh4Y7xZhy9
7mDPYY0m5aaT0lIWLvcDR0U9fNuZfW0HhDZafeeSgurGJB0RCNp1DGFF2V14peSH
lJjRUbDE62TQmkHSgEMUftz++yrm66v4npqnUS9DOs4CxXIWMpXm4ek4xkiaubGU
+21Wo8/4H+iGXDKr8ukS1LU9s4weYOpEZ5rRsw/dtRKLO97mt1ure+FC3ivJa+Jx
m9WGbrMwKymd8K86N/+tQNyhYH+7r09F/XXmn2aSrNZqhLhYCk6q3cxvK6hcvpma
k+GEv2Mczg6enG7o9a7MoxRs9Pvdj1HutKuwfNznChVN0Ffb9cV1MvPezT6JgvOB
HrW4T1M9MOIW/PKj9lCs
=BNKZ
-----END PGP SIGNATURE-----

--bWmh0CkJuEGRMWNqxNS3r7ckR8s2VkTkh--
