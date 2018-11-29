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
 by lists.ozlabs.org (Postfix) with ESMTPS id 435SK54KdLzDrN4
 for <openbmc@lists.ozlabs.org>; Fri, 30 Nov 2018 06:30:00 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 6696F6DC89;
 Thu, 29 Nov 2018 14:29:57 -0500 (EST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.1 \(3445.101.1\))
Subject: Re: Add TARGET_MACHINE to /etc/os-release
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <20181129080232.GA26099@bbwork.lan>
Date: Thu, 29 Nov 2018 14:29:57 -0500
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <4EEE3842-6BD8-4241-9483-C6E640751C92@fuzziesquirrel.com>
References: <mailman.11506.1542344002.668.openbmc@lists.ozlabs.org>
 <966f717c-59a9-7f88-7b37-91edb9d72276@charter.net>
 <FA5A8B03-6706-4072-A1A9-EE8B1BC1575F@fuzziesquirrel.com>
 <20181129080232.GA26099@bbwork.lan>
To: "Alexander A. Filippov" <a.filippov@yadro.com>,
 Joseph Reynolds <joseph-reynolds@charter.net>
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
X-List-Received-Date: Thu, 29 Nov 2018 19:30:02 -0000


> On Nov 29, 2018, at 3:02 AM, Alexander A. Filippov =
<a.filippov@yadro.com> wrote:
>> On Wed, Nov 28, 2018 at 01:36:37PM -0500, Brad Bishop wrote:
>>=20
>> Just FYI - MACHINE winds up in uname -a:
>>=20
>> root@palmetto:/var/lib/systemd# uname -a
>> Linux palmetto 4.18.12-b29e57c654b8d7cfa15d632fbc0ebfe0897b8203 #1 =
Thu Nov 15 21:52:09 UTC 2018 armv5tejl GNU/Linux
>>=20
>> Perhaps this meets your need without additional code?
>>=20
>> -brad
>=20
> Brad, it is the hostname. For example in my case it looks like this:
>=20
> root@malevich:~# uname -a
> Linux malevich.dev.yadro.com =
4.18.20-d608acfd4ac3fe17f3081bee8fcd4dcd896c2ffa #1 Thu Nov 29 07:19:11 =
UTC 2018 armv5tejl GNU/Linux
>=20

heh.  oops.  Thanks for pointing that out Alexander :-)

Joseph - ignore my suggestion please.

-brad=
