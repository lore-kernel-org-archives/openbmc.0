Return-Path: <a.amelkin@yadro.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.251; helo=mta-01.yadro.com;
 envelope-from=a.amelkin@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="hbDxVlwQ"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.251])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41vqkM2Y2DzF0hg
 for <openbmc@lists.ozlabs.org>; Tue, 21 Aug 2018 22:29:47 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id E55104120E;
 Tue, 21 Aug 2018 12:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:mime-version:user-agent:date:date
 :message-id:subject:subject:from:from:received:received
 :received; s=mta-01; t=1534854582; x=1536668983; bh=00b58ue1R93m
 nz1DEhwKUlqz4AMa6vTdIoHjeKPNcrQ=; b=hbDxVlwQe663/vfYGk9vlXsKMpDl
 ckSdowo7yWcALJcTmESPoR30yzlW6JoH1YOLO9Aev4EeFBkzotFl5i6eRbNkK6S+
 e/SLrGjQl4mFDgi9PjOdu/VTRt/2UYzSyA0my7jmzIrPcauaXPc5Oi8HwJLc6sC6
 NCBf7nVv73nk4FI=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u5sEoFgGVriq; Tue, 21 Aug 2018 15:29:42 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id EE780411F8;
 Tue, 21 Aug 2018 15:29:42 +0300 (MSK)
Received: from [172.17.14.168] (172.17.14.168) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Tue, 21
 Aug 2018 15:29:42 +0300
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Brad Bishop
 <bradleyb@fuzziesquirrel.com>
From: Alexander Amelkin <a.amelkin@yadro.com>
Subject: Proposals for commit log policy
Openpgp: preference=signencrypt
Autocrypt: addr=a.amelkin@yadro.com; prefer-encrypt=mutual; keydata=
 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
 dTYsE5wSxM06T2l/MILupCNZ7A==
Message-ID: <0ef9181f-eb70-552b-3411-da2bc9676be1@yadro.com>
Date: Tue, 21 Aug 2018 15:29:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.0
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="ybGbpEcrFhTINbrq8B9WHzVdmtOuKZ7j7"
X-Originating-IP: [172.17.14.168]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Aug 2018 12:29:48 -0000

--ybGbpEcrFhTINbrq8B9WHzVdmtOuKZ7j7
Content-Type: multipart/mixed; boundary="qoKynLrvtULW8X1Q67XAvPPUvmZ972oVr";
 protected-headers="v1"
From: Alexander Amelkin <a.amelkin@yadro.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Message-ID: <0ef9181f-eb70-552b-3411-da2bc9676be1@yadro.com>
Subject: Proposals for commit log policy

--qoKynLrvtULW8X1Q67XAvPPUvmZ972oVr
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

Hi Brad, all!

Before I even try to submit any changes directly to CONTRIBUTING.md, I'd =
like to discuss it here.

What I'm facing is the need to create Release Notes from time to time. Th=
ose Release Notes are for server admins, not for openbmc developers. The =
most difficult and time consuming parts about this effort are:

1. Figuring out the end user impact
2. Figuring out what changes have been brought in by "bump version" commi=
ts

Thankfully, for linux-obmc version bumps Patrick Williams and Joel Stanle=
y do a great job by including the 'git shortlog' output. Unfortunately, n=
ot everyone is following this rule for bumps. I'd really like this to bec=
ome a requirement for 'bump version' commits. They could then be parsed a=
utomatically. It would also be helpful if=C2=A0 the synopsis included the=
 old and the new hash, e.g.:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
some-package: bump version 62286ef3 to 4fa63380

Author Name (2):
=C2=A0 commit 1 synopsis
=C2=A0 another commit synopsis

Another Author (3):
=C2=A0 great commit
=C2=A0 yet another great commit
=C2=A0 fix previous not-so-great commit=C2=A0

Change-Id: some-long-gerrit-hash
Signed-off-by: The Version Bumper <bumper@nowhere.net>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Including the component's origin git URL could also be helpful for automa=
ting change log fetching (finding that in the recipe is sometimes a non-t=
rivial task for a script).

Now for item 1, it would be great if we could have a mandatory "End-user-=
impact" line/section, like these added to the following real commits:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
whitelist: Add new phosphor settings directories
=C2=A0=C2=A0 =C2=A0
The phosphor settings properties used to be stored under
/var/lib/obmc/ but they have moved to /var/lib/phosphor-*
directories.
=C2=A0=C2=A0 =C2=A0
Update the code update whitelist to include these
directories so that the settings properties and inventory
are preserved across code updates.
=C2=A0=C2=A0 =C2=A0
Closes openbmc/openbmc#3346
=C2=A0=C2=A0 =C2=A0
Tested: On Zaius, a PrepareForUpdate and an Apply preserve
the settings.

End-user-impact: None =C2=A0=C2=A0
Change-Id: I4e528f90128e11af7d40537dceb2f9dd1db6cf73
Signed-off-by: Adriana Kobylak <anoo@us.ibm.com>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

or:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Fix to speed up boot to BMC Ready state
=C2=A0=C2=A0=C2=A0
The legacy services(like system and chassis) was assigned nice value
of 19 to alleviate CPU stress at boot time. The systemd bootchart
showed that many services are dependedent on the system service. The
nice is set to default value of 0 and there is a consistent improvement
of ~10 sec in BMC getting to ready state.

End-user-impact: Speed up BMC booting to Ready state
Change-Id: I8f9f76da0a36c136243026aa7d7691e814634987
Signed-off-by: Tom Joseph <tomjoseph@in.ibm.com>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

What do you think? Is this feasible? Any other ideas how we could simplif=
y creating release notes suitable for end users?

I totally understand that for the openbmc project the end users are syste=
m vendors, but for them (us) the end users are the server admins, and pro=
viding them with usable release notes is crucial. I'm quite sure that thi=
s is a kind of task that all vendors face, not just YADRO.

Alexander.



--qoKynLrvtULW8X1Q67XAvPPUvmZ972oVr--

--ybGbpEcrFhTINbrq8B9WHzVdmtOuKZ7j7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJbfAW2AAoJEOiTWHtbdBeNJw8QANOpCYhyZ8Z2XlLCet7Mw4jr
+yr+mm9jGAIp5wUbLN2CMsGyK2GljdiBRliy5qXy3sO68yYrzw1TW60OLPh0ulG8
EeN3gKToYyQMKUznel0wioGPT57l4SDu1O+wW6dGBxg5qLv4LIT40g7hpKOlLMJ/
09zw5G6rY+DDPhIAbgRCjzCQJVczjrH8IeCO2keVUWnuGx88jgv3W4PrjfnYMj/1
aHARuPjyv7JLTKhNv/zxzvGyxANFFjrV4yDVJBUgJIiEuCVRPjSw34HC1O4GtnCi
DjgyKHZH4LZW9plLK2PMJN0nUmdCiQWkTcd7AQkKO7BPXlrEZ+T9RAI/Qnog9WiR
ZPmVDH9CNmKw1KHlOHBlLi8p8lHNUf/2tApM+DM5aF187+c/WeYlABElRxqxmoeD
pzb5HwREPA5K0w8XReVuFkBYdrlXgM3Ndw5CpldEGdQnHocsaSXpBnjcF91feZAI
UwWtiJ3LPujV94KQJENlctkhK7rsUevC0RWr1MMBN5MzCWbtZOGOnN5f70qGqDwD
GzsJLMWuRbSOVA2xvo7LfKR9QVK4289jMQc2K+guqMeUY1XVmJct9p/Q4liWaZrx
l+gsTdD+AYDOde+Y1oMqm2lOHTOC9zAvDuQjr5r4H6UDq7P27i+ZNl5G3c4tOUV8
H/drVrqtFUXEeRsYeWKH
=FFch
-----END PGP SIGNATURE-----

--ybGbpEcrFhTINbrq8B9WHzVdmtOuKZ7j7--
