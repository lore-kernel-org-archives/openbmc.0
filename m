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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4028Yq0DlvzF15q
 for <openbmc@lists.ozlabs.org>; Fri, 16 Mar 2018 00:28:45 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from brads-mbp.dyn.fuzziesquirrel.com
 (Brads-MBP.dyn.fuzziesquirrel.com [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 6023B6E233;
 Thu, 15 Mar 2018 09:28:42 -0400 (EDT)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: Need info on inventory
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <1771766654.816001.1521073430437@mail.yahoo.com>
Date: Thu, 15 Mar 2018 09:28:42 -0400
Cc: openbmc@lists.ozlabs.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <1C44570D-2BC4-4280-B8E9-2369C2DF2CA2@fuzziesquirrel.com>
References: <1771766654.816001.1521073430437.ref@mail.yahoo.com>
 <1771766654.816001.1521073430437@mail.yahoo.com>
To: Mam Nag <mam.nagv@yahoo.com>
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
X-List-Received-Date: Thu, 15 Mar 2018 13:28:47 -0000


> On Mar 14, 2018, at 8:23 PM, Mam Nag <mam.nagv@yahoo.com> wrote:
>=20
> I don=E2=80=99t know what=E2=80=99s working and what=E2=80=99s not =
working. I tried dbus browser and curl commands(as mentioned in =
document)
> Not much details in =E2=80=9Cinventory=E2=80=9D, how can I get FRU =
status and other details.

Hi Mam

I=E2=80=99m going to reply to this in the form of a pull request to our =
documentation
repository.  Please bear with me while I get that ready.

thx - brad=
