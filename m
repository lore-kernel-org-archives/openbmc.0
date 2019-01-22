Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43kgcC4nDnzDqLG
 for <openbmc@lists.ozlabs.org>; Wed, 23 Jan 2019 07:53:14 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Date: Tue, 22 Jan 2019 15:53:38 -0500
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Vijay Khemka <vijaykhemka@fb.com>
Cc: openbmc <openbmc@lists.ozlabs.org>
Subject: Re: Intel-ipmi-oem repo
Message-ID: <20190122205338.m2giw4ghhievyssc@thinkpad>
References: <B67393AC-1915-4999-93D9-944EA6D61D2A@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <B67393AC-1915-4999-93D9-944EA6D61D2A@fb.com>
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
X-List-Received-Date: Tue, 22 Jan 2019 20:53:16 -0000

On Tue, Jan 22, 2019 at 06:16:20PM +0000, Vijay Khemka wrote:
> Team,
> Intel-ipmi-oem should be broken and 2 parts, genric and oem specific. I=
 see several functionality in this repo like sensors and storage commands=
 are generic enough to be used by other platform who is using entity mana=
ger. So I feel that we should have these functionalities to be moved to a=
 separate common repo which can be used by everyone and this repo can onl=
y contain Intel OEM specific IPMI command support.
>=20
> My 2 cents =F0=9F=98=8A

In general I support the goal here.

More repos, sure.  Let me know what you want them called, who the
maintainers of each should be, and confirm that they can be licensed
as Apache-2.0.

Sorry Vijay - I'm going to hijack your thread.  This is something
I've been thinking about lately and your note put it at a tipping
point for me.

We have evolved into a bit of a wild-west culture as far as putting code
(repos) up in the openbmc namespace.  There are simply no rules at all.
Anyone can simply ask Brad for a repo and it gets created, no questions
asked, no accountability.

So I guess a quick poll - does anyone find this concerning (or not)?

fwiw, I think I'm ok with this model at this point in the project,
assuming that the rules (or lack thereof) apply to everyone equally.

thx - brad
