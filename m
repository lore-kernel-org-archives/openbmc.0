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
 by lists.ozlabs.org (Postfix) with ESMTPS id 42mjCd6MDtzF369
 for <openbmc@lists.ozlabs.org>; Sat,  3 Nov 2018 00:12:12 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [IPv6:::1] (kronos.fuzziesquirrel.com [192.168.252.1])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 4642D6DC86;
 Fri,  2 Nov 2018 09:12:09 -0400 (EDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.0 \(3445.100.39\))
Subject: Re: Request to create a new repo intel-dbus-interfaces
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <000001d47191$19096630$4b1c3290$@linux.intel.com>
Date: Fri, 2 Nov 2018 09:12:08 -0400
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "Feist, James" <james.feist@intel.com>, "Li, Yong B" <yong.b.li@intel.com>,
 spinler@us.ibm.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <AB60821F-6D24-4970-A1D0-FBAEFE5F8589@fuzziesquirrel.com>
References: <000001d47191$19096630$4b1c3290$@linux.intel.com>
To: Yong Li <yong.b.li@linux.intel.com>
X-Mailer: Apple Mail (2.3445.100.39)
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
X-List-Received-Date: Fri, 02 Nov 2018 13:12:14 -0000

Hi Yong

> On Oct 31, 2018, at 11:15 PM, Yong Li <yong.b.li@linux.intel.com> =
wrote:
>=20
> Hi Brad,
> =20
> Based on the discussions in =
https://gerrit.openbmc-project.xyz/#/c/openbmc/phosphor-dbus-interfaces/+/=
14719/
> =20
> We would like to create a new repo named =E2=80=9Cintel-dbus-interfaces=E2=
=80=9D,  similar to =E2=80=9Cibm-dbus-interfaces=E2=80=9D, it is used to =
support some=20
> Intel OEM IPMI commands, and other intel specific interfaces.
> =20
> Thanks,
> Yong

intel-dbus-interfaces created.  Please let me know who to assign =
committer access to.

thx - brad=
