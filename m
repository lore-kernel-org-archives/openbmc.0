Return-Path: <bradleyb@fuzziesquirrel.com>
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 11CFB1A0CCC
 for <openbmc@lists.ozlabs.org>; Thu,  3 Dec 2015 04:35:01 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@bajor.fuzziesquirrel.com
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: rest server authentication
Message-Id: <0DE254DA-169E-4DA5-A7A7-940A648F147F@fuzziesquirrel.com>
Date: Wed, 2 Dec 2015 12:34:55 -0500
To: OpenBMC Patches <openbmc@lists.ozlabs.org>
Mime-Version: 1.0 (Mac OS X Mail 9.1 \(3096.5\))
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 02 Dec 2015 17:35:02 -0000

If you use the rest server, read on=E2=80=A6

I have a pending pull request that will require login to the rest server =
before it can be used.  For examples on doing this with curl see here:

https://github.com/bradbishop/phosphor-docs/blob/master/rest-api.md

Please let me know of any concerns or feedback.

thx - brad=
