Return-Path: <bradleyb@fuzziesquirrel.com>
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x7B7j2C0gzDq60
 for <openbmc@lists.ozlabs.org>; Thu, 13 Jul 2017 06:56:17 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@fuzziesquirrel.com
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: Linux Kernel PMBus drivers
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <CAFR_W8pJRVbb75NKmZcE=S1tHsQ8F4NSUToGgJ0vavaJKkEaWQ@mail.gmail.com>
Date: Wed, 12 Jul 2017 16:56:13 -0400
Cc: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <BF2D9544-F30B-445F-A336-2A5C0CF5E3AF@fuzziesquirrel.com>
References: <CAFR_W8pJRVbb75NKmZcE=S1tHsQ8F4NSUToGgJ0vavaJKkEaWQ@mail.gmail.com>
To: Maxim Sloyko <maxims@google.com>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Jul 2017 20:56:17 -0000


> On Jul 12, 2017, at 1:32 PM, Maxim Sloyko <maxims@google.com> wrote:
>=20
> Hi Joel,
>=20
> I have a couple of small PMBus HWMon Linux Kernel drivers for Zaius =
(Infineon and Intersil parts). Do you know which subtree/mailing list I =
should send these to or how can I figure this out?
>=20

linux-hwmon@vger.kernel.org

> Thanks.
>=20
> --=20
> Maxim Sloyko
