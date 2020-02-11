Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=173.167.31.197;
 helo=bajor.fuzziesquirrel.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48HGWC57DjzDqLs
 for <openbmc@lists.ozlabs.org>; Wed, 12 Feb 2020 08:44:05 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: a thought on peer code review
Message-Id: <B95A2A58-0848-451B-86D9-FA3D96E5EBC4@fuzziesquirrel.com>
Date: Tue, 11 Feb 2020 16:44:00 -0500
Cc: "Mihm, James" <james.mihm@intel.com>, Sai Dasari <sdasari@fb.com>,
 Nancy Yuen <yuenn@google.com>,
 Supreeth Venkatesh <Supreeth.Venkatesh@arm.com>
To: openbmc@lists.ozlabs.org
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
X-List-Received-Date: Tue, 11 Feb 2020 21:44:08 -0000

At the TSC call today we were talking about code review in OpenBMC and =
the notion of a lack of domain knowledge as rationale for avoiding doing =
peer review.

I was reminded of a thread that came up in IRC (thanks Adriana, Milton):

=
https://lwn.net/ml/linux-fsdevel/20200202214620.GA20628@dread.disaster.are=
a/

This is a 2-3 minute read; I suggest taking a look if you have ever =
avoided doing a review because you didn=E2=80=99t feel you knew enough =
about the problem domain.

Thanks!

-brad=
