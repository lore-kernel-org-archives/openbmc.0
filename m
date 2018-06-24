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
 by lists.ozlabs.org (Postfix) with ESMTPS id 41DClL1zVFzF0Vt
 for <openbmc@lists.ozlabs.org>; Sun, 24 Jun 2018 23:27:09 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id F3BD397589;
 Sun, 24 Jun 2018 09:27:03 -0400 (EDT)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: OpenBMC Release Planning Working Group
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <f86c688b-b237-bdd5-12a0-385f96902581@gmail.com>
Date: Sun, 24 Jun 2018 09:27:03 -0400
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 alirhas@microsoft.com, james.mihm@intel.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <8B76C1CF-5AF3-417A-A46F-30508DA74A38@fuzziesquirrel.com>
References: <f86c688b-b237-bdd5-12a0-385f96902581@gmail.com>
To: krtaylor <kurt.r.taylor@gmail.com>
X-Mailer: Apple Mail (2.3273)
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
X-List-Received-Date: Sun, 24 Jun 2018 13:27:11 -0000


> On Jun 21, 2018, at 3:07 PM, krtaylor <kurt.r.taylor@gmail.com> wrote:
>=20
> Hi all,
>=20
> The long anticipated OpenBMC Release Planning working group is now =
forming and will have its first meeting next week. I would like to keep =
the meeting small at first so that we can move quickly, but I do need =
complete representation. Please let me know if you'd like to participate =
and what day a meeting would work best for you. Those on copy should =
plan on attending or at least make sure someone is covering for your =
organization.
>=20
> Let me know if you have any questions.
>=20
> Regards, Kurt Taylor (krtaylor)
>=20
>=20
> Proposed times:
>=20
> 1) Tuesdays, 2:00pm Central US (1900 UTC)
>=20
> 2) Thursdays, 8:00am Central US (1300 UTC)
>=20
> 3) Thursdays, 3:00pm Central US (2000 UTC)

any of these times work for me.

>=20
>=20
> Initial Agenda:
>=20
> 1) Agree on the release process and set an initial release date in =
November (see email from May 21)
>=20
> 2) Set design and freeze milestones
>=20
> 3) "Must" deliver items for November release
>=20
> 4) How to open the design and development for a needed feature
