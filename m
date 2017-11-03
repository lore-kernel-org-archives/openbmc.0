Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yT31N2RcYzDrD1
 for <openbmc@lists.ozlabs.org>; Sat,  4 Nov 2017 00:37:59 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id A60F8161EB7;
 Fri,  3 Nov 2017 09:37:50 -0400 (EDT)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: BMC version check via restful
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <CAJRJBYMXeaVEB0BnxzKm-EbX3fK4072TDRZRCKtNaWrXMjBqZw@mail.gmail.com>
Date: Fri, 3 Nov 2017 09:37:50 -0400
Cc: openbmc@lists.ozlabs.org,
 anoo@us.ibm.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <008ED5D8-320D-4CFA-B7A4-C98289A0621F@fuzziesquirrel.com>
References: <CAJRJBYMXeaVEB0BnxzKm-EbX3fK4072TDRZRCKtNaWrXMjBqZw@mail.gmail.com>
To: tao-ching Yu <yutaoc1984@gmail.com>
X-Mailer: Apple Mail (2.3273)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 03 Nov 2017 13:38:00 -0000


> On Nov 3, 2017, at 4:14 AM, tao-ching Yu <yutaoc1984@gmail.com> wrote:
>=20
> Hi Adriana,
>=20
> I noticed the version of BMC  is under =
/xyz/openbmc_project/Software/xxxxxxx
> But I found that this "xxxxxxxx" is not fixed
> ex./xyz/openbmc_project/software/13264da3 or =
/xyz/openbmc_project/software/aaf838cc
> What does this "string" mean? Is this BMC FW related(version)? Could =
this string be fixed?
> How does user know the right object path and get the right information =
of BMC via restful?
> Because this object path is not fixed.
>=20
>=20

The image identifier is briefly discussed here: =
https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbm=
c_project/Software/README.md#image-identifier

As of today, the ID is an implementation detail and there aren=E2=80=99t =
any requirements on it
at an API level.

Keep in mind that the OpenBMC D-Bus API is first and foremost designed =
to facilitate
BMC application compatibility, not end user interface standardization.  =
End user
interface standardization would be accomplished with Redfish, IPMI, =
etc=E2=80=A6

This nuance is often lost because we do happen to have a REST server =
application that exposes
the internal D-Bus API via REST with little translation.  But ideally =
that isn=E2=80=99t
the user-interface for a complete BMC implementation.

Can you think of a scenario where adding restrictions on the ID at the =
D-Bus API level would
enable additional compatibility between on-BMC applications?

-brad=
