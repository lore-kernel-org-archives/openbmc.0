Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46YZ3P6VgQzF4p6
 for <openbmc@lists.ozlabs.org>; Thu, 19 Sep 2019 08:12:33 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.115] (unknown [192.168.253.115])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 4EF5C6DECB;
 Wed, 18 Sep 2019 18:12:29 -0400 (EDT)
Content-Type: text/plain;
	charset=utf-8;
	delsp=yes;
	format=flowed
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: Some Recipes Randomly Fail
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <857927E9-F872-4F90-A938-1B0635FB230D@fb.com>
Date: Wed, 18 Sep 2019 18:12:28 -0400
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Message-Id: <D675A182-7304-4991-A5A5-261FEDAB62CA@fuzziesquirrel.com>
References: <857927E9-F872-4F90-A938-1B0635FB230D@fb.com>
To: Wilfred Smith <wilfredsmith@fb.com>
X-Mailer: Apple Mail (2.3445.104.11)
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Wed, 18 Sep 2019 22:12:34 -0000

at 5:48 PM, Wilfred Smith <wilfredsmith@fb.com> wrote:

> a =E2=80=9CBitbake obmc-phosphor-image=E2=80=9D will often fail a recip=
e with compilation =20
> errors that go away if I rebuild that particular recipe.

Next time it happens send the failure that is printed to the screen along=
 =20
and we=E2=80=99ll see if we can figure it out.

-brad
