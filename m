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
 by lists.ozlabs.org (Postfix) with ESMTPS id 43KG8T6pPJzDqZH
 for <openbmc@lists.ozlabs.org>; Wed, 19 Dec 2018 11:33:28 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 6D53A6DC86;
 Tue, 18 Dec 2018 19:33:23 -0500 (EST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.1 \(3445.101.1\))
Subject: Re: flto automake
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <e0464c53-3d11-884c-75bd-1e78aed97ded@linux.intel.com>
Date: Tue, 18 Dec 2018 19:33:23 -0500
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 openembedded-core@lists.openembedded.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <E4F39B19-40EF-4774-B2B3-6C37A2CB98DC@fuzziesquirrel.com>
References: <e0464c53-3d11-884c-75bd-1e78aed97ded@linux.intel.com>
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
X-List-Received-Date: Wed, 19 Dec 2018 00:33:30 -0000



> On Dec 18, 2018, at 1:08 PM, James Feist <james.feist@linux.intel.com> =
wrote:
>=20
> If you aren't planning on enabling flto in a repo you can ignore this =
email.
>=20
>=20
> I've created a new class flto-automake =
https://github.com/openbmc/meta-phosphor/blob/master/classes/flto-automake=
.bbclass if you are enabling -flto in an autotools project you might be =
interested in. When using static libraries you may run into undefined =
references when building with Yocto. Yocto by default uses:
>=20
> export AR =3D "${HOST_PREFIX}ar"
> export RANLIB =3D "${HOST_PREFIX}ranlib"
>=20
> for AR and RANLIB. This new class replaces these with the gcc =
equivalent wrappers that can work with the flto object files. This =
doesn't seem to be an issue for the CI build, it only shows up for Yocto =
builds. Reference: =
http://stackoverflow.com/questions/25878407/how-can-i-use-lto-with-static-=
libraries#comment67660913_25878408
>=20
> For Cmake I suggest looking at the way bmcweb handles it in =
CMakesLists:
> https://github.com/openbmc/bmcweb/blob/master/CMakeLists.txt#L92
>=20
> Thanks,
>=20
> James

Thanks James

I wonder if this is something they would be interested in upstream.  =
I=E2=80=99ve copied
the oe-core mailing list for possible comment.

-brad=
