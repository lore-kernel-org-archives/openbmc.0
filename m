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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46YZ9C2KcbzF4lf
 for <openbmc@lists.ozlabs.org>; Thu, 19 Sep 2019 08:17:35 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.115] (unknown [192.168.253.115])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 055F26DECB;
 Wed, 18 Sep 2019 18:17:31 -0400 (EDT)
Content-Type: text/plain;
	charset=utf-8;
	delsp=yes;
	format=flowed
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: src-uri-bad in flashd and chassisd recipes
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <1558DF2D-BC3C-489C-AC4A-9DF7F8332E01@fb.com>
Date: Wed, 18 Sep 2019 18:17:31 -0400
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Message-Id: <277CCA1F-5D7F-4CC1-B7D3-4D7CAAA9593F@fuzziesquirrel.com>
References: <1558DF2D-BC3C-489C-AC4A-9DF7F8332E01@fb.com>
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
X-List-Received-Date: Wed, 18 Sep 2019 22:17:35 -0000

at 5:51 PM, Wilfred Smith <wilfredsmith@fb.com> wrote:

> I=E2=80=99m been seeing these warnings after a =E2=80=9Cgit pull=E2=80=9D=
. Are these warnings =20
> expected? Is it okay to attempt to cure them or are they simply transie=
nt =20
> warnings?
They are definitely not transient.

>
> Wilfred
>
> WARNING: obmc-phosphor-flashd-1.0-r1 do_package_qa: QA Issue: =20
> obmc-phosphor-flashd: SRC_URI uses PN not BPN [src-uri-bad]
> WARNING: obmc-phosphor-chassisd-1.0-r1 do_package_qa: QA Issue: =20
> obmc-phosphor-chassisd: SRC_URI uses PN not BPN [src-uri-bad]

FWIW these two recipes specifically are some pretty old sample recipes=E2=
=80=A6it =20
would be great to someday get rid of these entirely.  But in the meantime=
, =20
I would love a patch that changes PN to BPN for these or anywhere else yo=
u =20
see a warning like this.

-brad
