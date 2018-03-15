Return-Path: <a.amelkin@yadro.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.251; helo=mta-01.yadro.com;
 envelope-from=a.amelkin@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="XpyE04IQ"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.251])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40246T4GfpzDrST
 for <openbmc@lists.ozlabs.org>; Thu, 15 Mar 2018 21:08:16 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 9945F530AC
 for <openbmc@lists.ozlabs.org>; Thu, 15 Mar 2018 10:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:mime-version:user-agent:date:date
 :message-id:subject:subject:from:from:received:received
 :received; s=mta-01; t=1521108489; x=1522922890; bh=iEmKgZeeGQUm
 tk3zjpybJIckxG6bQbsjzI6rO+a+Kqg=; b=XpyE04IQ5sWs32megtvKxkQudxAZ
 efpzHv424keV1dWXb0CpAN40v7pMMm9Sm71MA0vVV98LIl0glBZaG5WwPKCuqMfZ
 gdHmjiJ17cRa19QFCwEIMg1XOf5vHwzMXP+pUL2r7jri4JaIgqJpn+1rGm93dA5V
 BIcugHv4hJ5aCFE=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wUnzY_XZgsSg for <openbmc@lists.ozlabs.org>;
 Thu, 15 Mar 2018 13:08:09 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 986EE50C92
 for <openbmc@lists.ozlabs.org>; Thu, 15 Mar 2018 13:08:09 +0300 (MSK)
Received: from [172.17.14.168] (172.17.14.168) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Thu, 15
 Mar 2018 13:08:09 +0300
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: Alexander Amelkin <a.amelkin@yadro.com>
Subject: Increasing GitHub issues value
Message-ID: <9f0a5475-3c1b-d744-6708-16ec881e6dcb@yadro.com>
Date: Thu, 15 Mar 2018 13:08:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.0
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="EFdmKLBXqFVMmqviJgi1KkmhJ3b5XDj7w"
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
X-List-Received-Date: Thu, 15 Mar 2018 10:08:18 -0000

--EFdmKLBXqFVMmqviJgi1KkmhJ3b5XDj7w
Content-Type: multipart/mixed; boundary="szZG2BkJGx48A41z6BHxeJqtMhHZCrIVS";
 protected-headers="v1"
From: Alexander Amelkin <a.amelkin@yadro.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Message-ID: <9f0a5475-3c1b-d744-6708-16ec881e6dcb@yadro.com>
Subject: Increasing GitHub issues value

--szZG2BkJGx48A41z6BHxeJqtMhHZCrIVS
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

Hi everyone!

While trying to write a customer-readable Change Log and Release Notes,
I've been browsing through a lot of git commit logs, some of them
referencing GitHub issues. I have noticed one common problem shared by
almost all issues that makes it extremely painful to create the document
I was trying to make. That is a total lack of reasoning behind the
conducted changes. A typical issue looks like an imperative "Change
everything" without even a slight hint as to "why do that" and "what was
wrong with the original code".

There are lots of such issues by almost all the members.

My proposal is to enforce verbose desriptions in GitHub issues.

=46rom my previous experience of working on DO-178B certified projects,
the following approach helps a lot when doing a retrospective of the
changes or investigating why a certain part of code is present and/or
works as it does (was it intended, or is it a mistake):

1. As the initial description (first comment) for the issue, write as
many words as you can to explain the original problem, trying as hard as
possible to make this description clear to a non-member, a
non-programmer (admin), or even a non-technical person. Be as much
user-centric in the description as possible, but don't forget to include
all the technical details that you have as well, for they will be needed
for the engineer assigned to this issue or even yourself later when you
come back to this issue 3 years later in search of a root cause for some
problem.

2. When you get to working on the issue, write a verbose "Analysis"
comment describing what you have discovered while investigating the
original problem. Any quotes from e-mail correspondence, links to
mailing list posts, etc. are very welcome in this part. Filling out this
part often helps to realize that you've been actually going a wrong way
or that the original problem is not a problem at all.

3. Once you come up with a solution, write a comment (verbose again)
that describes what exactly you're going to do and why (although "why"
should have mostly been covered in the "Analysis" part). This greatly
helps in clearing your own mind and obtaining a precise understanding of
your changes before you actually push them, helps reviewers to review
the pushed code, and later helps to fix bugs in it that passed the review=
=2E

4. Preferably describe in a separate comment the impact on the end user
experience that your change is going to have (i.e. what change in system
behavior or UI does it yield). If all the issues (or better yet commit
logs) had this part, writing Release Notes would be a breeze.

What do you guys think?

With best regards,
Alexander.



--szZG2BkJGx48A41z6BHxeJqtMhHZCrIVS--

--EFdmKLBXqFVMmqviJgi1KkmhJ3b5XDj7w
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJaqkYIAAoJEOiTWHtbdBeNtgAQAJJtnBsS6su6XBvIptiW2KX4
yoqU/mR82POFB29QYuyeHpYY4MvMAKCu2CRvSNVekkkRn5dNZilR2WZ8VEV08cnw
hmGgqWClnAQTtAxT5JIWDRuXKlNNvO/ZPGDUzHiifXq8nZq5KfM0fPAbxVJEeVc7
xBPw1gJWLEB7Hi8n4eWc1S3yOo9ttZtOLBuK3n40ooiTdNSD6iGATFRMjV/z58n4
zB2av4hKaFzP8S7i2MyXeB/FZ0W3grU9jCDwy4ASFbekmLlK7aZda+15QOnJXOep
fkiBwMLyVahmItjItxz394cbLm5enFtn9IH3MSaczIF/IBTetRyWd++JZyYNpBcY
VwORw0waROpG/kZzxMr66PbsAmF+52JWD7TKJdPLtBbdoQeH/yn0AY4N5bOYMRBG
pUW3uA2XfffKvkTJMz0x1PwsXRt23gKUqG5vOtS1Ee47j3rynObwtMUmWbQ/uFwO
txajde2P2/weU4LPGUoiuAmN8NX2+P1ADAaxQEZflG3xSc4hkjCNJI3PS86SWPhs
RA9/Kf5ucCSlKqhaqL9tZNvAfRrH8hwUjiKvUtt0KgDcj7R8JQB1TQjtSmed9lCU
8Tc8GMJbqKy0aZVURuSuJptvbYarmbRwbg8PNw2bPRXy5QMvnl7E4rxfdDnRyHbK
D+1RED8OG9oXwiPdgaef
=O/Qk
-----END PGP SIGNATURE-----

--EFdmKLBXqFVMmqviJgi1KkmhJ3b5XDj7w--
