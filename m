Return-Path: <bradleyb@fuzziesquirrel.com>
X-Greylist: delayed 597 seconds by postgrey-1.35 at bilbo;
 Sat, 27 Aug 2016 05:03:53 AEST
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.b=X7IjjAEQ; dkim-atps=neutral
Received: from mail.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sLVnj3F1szDrdq
 for <openbmc@lists.ozlabs.org>; Sat, 27 Aug 2016 05:03:53 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.fuzziesquirrel.com 276EF28DB8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fuzziesquirrel.com;
 s=mail; t=1472237630;
 bh=1U9mlBf35dplfXqgIlQ1xAKakOwaJpCKPPk7OqonSjo=;
 h=From:Subject:Date:To:From;
 b=X7IjjAEQNqIsr8QgAk/i0eJqI/31gDE+/dNXWJm77w1/tCjWX9auPdLB0jmv6WR4A
 7fegsmktbwFNPBvlH6U3JO+sqffievfQPHEOp3F7Lsu61I3j4AsZtncXvX0E3axprE
 9oAvh1YHAzI1/8c81z9qP8Rt6kX0lhU1O1egfDTI=
Received: from [192.168.253.29] (unknown [192.168.253.29])
 by mail.fuzziesquirrel.com (Postfix) with ESMTPSA id 0F02428D94
 for <openbmc@lists.ozlabs.org>; Fri, 26 Aug 2016 14:53:49 -0400 (EDT)
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: naming conventions
Message-Id: <2EB33EE8-EFD0-4EA1-A54F-8C6A03FDEBDC@fuzziesquirrel.com>
Date: Fri, 26 Aug 2016 14:53:48 -0400
To: OpenBMC Patches <openbmc@lists.ozlabs.org>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
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
X-List-Received-Date: Fri, 26 Aug 2016 19:03:54 -0000

I wanted to take a stab at standardizing our naming conventions a little =
better.

In general, applications would be (loosely) named after the layer they =
are associated with.  For example:

phosphor-foo: application that can run on any card running OpenBMC
op-foo: application that can only run on OpenPOWER systems
ibm-foo: application that can only run on IBM systems
palmetto-foo: application specific to the Palmetto system

I chose phosphor-foo rather than obmc-foo to draw attention to the fact =
that =E2=80=98Phosphor=E2=80=99 refers to a reference =
implementation/distribution (ideally) of OpenBMC (similar to =
Poky/OpenEmbedded).

When naming things or filling out description fields in recipes, etc, =
please avoid the overly redundant name or description: obmc-phosphor or =
=E2=80=9CPhosphor OpenBMC=E2=80=9D.  Given that Phosphor is the =
reference for OpenBMC you can just say =E2=80=9CPhosphor."

thoughts/feedback?

-brad=
