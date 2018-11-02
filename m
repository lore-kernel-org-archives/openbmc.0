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
 by lists.ozlabs.org (Postfix) with ESMTPS id 42mc8m72MzzF36d
 for <openbmc@lists.ozlabs.org>; Fri,  2 Nov 2018 20:24:23 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from brads-mbp.dyn.fuzziesquirrel.com
 (Brads-MBP.dyn.fuzziesquirrel.com [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 2EF8D6DC86;
 Fri,  2 Nov 2018 05:24:20 -0400 (EDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.0 \(3445.100.39\))
Subject: Re: Host console logs service
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <CAHsrh9+D-xH+w7sdg8H14rnC1qrWnfo927_AZ63rf=RUXBsqVw@mail.gmail.com>
Date: Fri, 2 Nov 2018 05:24:19 -0400
Cc: openbmc@lists.ozlabs.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <C0BE70B4-92F0-4E2E-8B7C-F377C75E9742@fuzziesquirrel.com>
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
X-List-Received-Date: Fri, 02 Nov 2018 09:24:25 -0000


> On Oct 29, 2018, at 3:22 AM, Artem Senichev <artemsen@gmail.com> =
wrote:
>=20
> Hi Brad,
>=20
> Could you create phosphor-hostlogger repository inside the OpenBMC =
project?
> Or even clone existing from =
https://github.com/YADRO-KNS/phosphor-hostlogger.


https://github.com/openbmc/phosphor-hostlogger

and

=
https://gerrit.openbmc-project.xyz/#/c/openbmc/phosphor-hostlogger/+/15176=
/

Thanks Artem!=
