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
 by lists.ozlabs.org (Postfix) with ESMTPS id 42kQ3X52wwzDrVM
 for <openbmc@lists.ozlabs.org>; Tue, 30 Oct 2018 06:42:16 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from brads-mbp.dyn.fuzziesquirrel.com
 (Brads-MBP.dyn.fuzziesquirrel.com [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id C642F6DC86;
 Mon, 29 Oct 2018 15:42:13 -0400 (EDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.0 \(3445.100.39\))
Subject: Re: Host console logs service
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <CAHsrh9+D-xH+w7sdg8H14rnC1qrWnfo927_AZ63rf=RUXBsqVw@mail.gmail.com>
Date: Mon, 29 Oct 2018 15:42:13 -0400
Cc: openbmc@lists.ozlabs.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <3EC17E80-CB4C-4C25-91E8-2BDF45D4D155@fuzziesquirrel.com>
References: <CAHsrh9+PQ9GKX7DMMC8oAdvNEamsw5dbfRmiTSi3kWuA6j0R_g@mail.gmail.com>
 <601A1A07-A444-4602-AC42-7E686B1CE03A@fb.com>
 <CAHsrh9KDjs8jg-x4NYooVH1cvmzv=em1C7=6OUBaUx1cOCVG5g@mail.gmail.com>
 <7D625D67-C92C-40A0-B216-6A33EF805BD7@fb.com>
 <CAHsrh9JB13DDETbDhbvkVbLb5PoRB9EFJCVj-c9TKU_5oyZP1A@mail.gmail.com>
 <CAARXrtmFSJ=p0OjkHCBqJ3+9DVADdM-TAX0azySZKu-3QHsAtg@mail.gmail.com>
 <CAHsrh9+D-xH+w7sdg8H14rnC1qrWnfo927_AZ63rf=RUXBsqVw@mail.gmail.com>
To: Artem Senichev <artemsen@gmail.com>
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
X-List-Received-Date: Mon, 29 Oct 2018 19:42:17 -0000



> On Oct 29, 2018, at 3:22 AM, Artem Senichev <artemsen@gmail.com> =
wrote:
>=20
> Hi Brad,
>=20
> Could you create phosphor-hostlogger repository inside the OpenBMC =
project?
> Or even clone existing from =
https://github.com/YADRO-KNS/phosphor-hostlogger.

Sure thing.  As usual, I=E2=80=99ll wait a couple days for anyone to =
raise any objections
to this.

>=20
> Best regards,
> Artem Senichev
>=20
> On Mon, Oct 29, 2018 at 5:01 AM Lei YU <mine260309@gmail.com> wrote:
>>=20
>> On Sat, Oct 27, 2018 at 1:59 AM Artem Senichev <artemsen@gmail.com> =
wrote:
>>>=20
>>> How can I create a gerrit request if there is no git repository for
>>> this project inside OpenBMC?
>>=20
>> This looks good and could be very useful for end users.
>> You could ask Brad to create a repo in OpenBMC, or possible post this =
design
>> doc into openbmc/docs for preview.
>>=20
>> Thanks!
