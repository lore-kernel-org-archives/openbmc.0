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
 by lists.ozlabs.org (Postfix) with ESMTPS id 433ZyP6M1TzDqYj
 for <openbmc@lists.ozlabs.org>; Tue, 27 Nov 2018 05:22:20 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 7D09A6E469;
 Mon, 26 Nov 2018 13:22:16 -0500 (EST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.1 \(3445.101.1\))
Subject: Re: dbus-sensors repo
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <138849a6-0505-d92b-bb50-ca7d20033f16@linux.intel.com>
Date: Mon, 26 Nov 2018 13:22:16 -0500
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Vijay Khemka <vijaykhemka@fb.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <A8FCDD6A-C888-4ED1-8F55-0680415F5CF8@fuzziesquirrel.com>
References: <138849a6-0505-d92b-bb50-ca7d20033f16@linux.intel.com>
To: James Feist <james.feist@linux.intel.com>
X-Mailer: Apple Mail (2.3445.101.1)
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
X-List-Received-Date: Mon, 26 Nov 2018 18:22:22 -0000



> On Nov 20, 2018, at 5:13 PM, James Feist <james.feist@linux.intel.com> =
wrote:
>=20
> Hi Brad,
>=20
> With there being more interest in the dbus-sensors project in =
s2600wf-misc, would it be possible to create a new repo for this project =
so it would be easier for others to use?

Done.  https://github.com/openbmc/dbus-sensors

There is an initial commit with the license out there.  Feel free
to force push a s2600wf-misc subtree=E2=80=A6then we don=E2=80=99t lose =
the commit
history.

-brad=
