Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="KHA16mVL"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="oOWnUuDT"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yBdrs4LffzDr5T
 for <openbmc@lists.ozlabs.org>; Wed, 11 Oct 2017 13:55:40 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 3B37A20B0E;
 Tue, 10 Oct 2017 22:55:38 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Tue, 10 Oct 2017 22:55:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:message-id:mime-version:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=18ZFsU
 IhSeGCMcVDt/P/DvPJL+nW42wW6F8cZQbw5S4=; b=KHA16mVLJvWudyRj9XkpBU
 dgvDgpBGlmtcy2CLJ75uYNvbv/HvOsvw37pbOeCBPh7CWk6SAV9Tk1I/SiwbHwNz
 DyVwzG0g41Vih/Up38axvzIEDXRyFPUvDIIxysEffcxMy3PvZT4TdzwbMbW5GfzT
 zNm5fYu7PsS9PzBVwiQXFLw+qYP4gAGHMYNkI3ZqICDrSZ3H9lIbYCnGyzOs6oLl
 trmxAxeaVOGgXqfn1RadZptZBEc6n/b78MyBXescR3DfKaFRSZNc3sHMEL6xN6hX
 EihJBJ3SMghUy+cZ5XN5CXsQY3yjGGr6ZolE/vsPsTOhQoRzHefrRZRhBuaAcdXA
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=18ZFsUIhSeGCMcVDt/P/DvPJL+nW42wW6F8cZQbw5
 S4=; b=oOWnUuDT/UlkE0yDBMLJsGyx9DAFnlxZ7ACzn6SFK0dV0q6ocyY2cssC1
 TEw/tYKSetxm1Hp120Tz0yWuRVX82BEcYpCwOr6C+TMPVBhIsiRqOtRN1Lveaqrx
 yTMZ7JfSg/RtMpGSOA7ZNaruBtmYMx0DFXODUqTfLL7WRebNHp7Z2eRec4iGCwRU
 1P9VI6kRE6pvHBP35p00rLJ+/GxK3Pozt06Q6YGps7J4Yov55zkX6i4OfbbTmHtM
 Gv+0G3aalkQIv1IJ7WKdQo9V7ExS5aVY6fh0sBJkZyNfy2gw4AUIbZP7PeRhU6Ft
 oYMJKBmdaZ1z7ytZvQI05kEzmBeoA==
X-ME-Sender: <xms:KojdWWbHe-bqI81d1a_npoQwVOy7ph9IW43ZtFGb-iVS1rfP7AiWcQ>
X-Sasl-enc: ZvkIIw7F5aUvSG/yMHyAMQX1ZVsm9YV36wcgFEg6hrYW 1507690537
Received: from keelia23 (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id BEA5C7E9F0;
 Tue, 10 Oct 2017 22:55:36 -0400 (EDT)
Message-ID: <1507690531.5452.164.camel@aj.id.au>
Subject: Kernel maintenance Oct 11-30th
From: Andrew Jeffery <andrew@aj.id.au>
To: OpenBMC <openbmc@lists.ozlabs.org>
Date: Wed, 11 Oct 2017 13:25:31 +1030
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-CEG/I7FGrctp51UjyUYc"
X-Mailer: Evolution 3.22.6-1ubuntu1 
Mime-Version: 1.0
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
X-List-Received-Date: Wed, 11 Oct 2017 02:55:43 -0000


--=-CEG/I7FGrctp51UjyUYc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

Joel's away again from today until the 30th, so I'll be maintaining the
kernel and u-boot until he returns. Please Cc me on the necessary
patches and discussions!

Cheers,

Andrew
--=-CEG/I7FGrctp51UjyUYc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ3YgjAAoJEJ0dnzgO5LT5f2wP/1qgJ0gAvXnGvc3qS+EhTHQE
oaceR2lslK88DtmPOnM+rjiFnvUxMfw8qV1ECQbjCNW5TMWEgNBcy6yd75fsG1FP
7//1T+CN0yr6sedi1cz2mpXPmRECDh/N2uYYwwLgzYg0sFrnJEMfM1hTkU9q464v
iPEjPt6EIcppu57lBztdXsUa/K+LjqFMpm/LKf51hJ1rpKSitSw9xo+5h26aFcqp
Hlgm47s/c64wxKl70uqjUKMjbGlSsmjEIVNzroQiNTwk+JNL8M6RkoXLOlvP+pvw
3OmpD8vIafjcIAfZv059nVwQqwkJr9dQ28ITCJpuX1Dic/QrPlFpdPS51H3NO+sU
16YOgWSQUOiaWJZtxrUb0Ih8h7GS2ZoIns2aMJL9hPwXXDzxGO5agDkvlzwHnFKU
oUU79IZIv75bfpz/t0zvfdZ56PRHlXCaw0f+atHXr1hvZyXw7GHcwwS0rLElUTzL
SK7+PVvY5S+Lcy3CKyb3Wjo/mbvsYQb5J9UpobegZ+OfpS6ILBO/AHaJnv9W6f+X
B1FfmJDSrntXfCpP+3hBBXamq09Mt3Yq20/zJxnvbeWIg/bew6otBkwHfdp5yexW
/PL2Z7NiJVf3zYqlkIoQKkUN14EU5hQnzCa9iHFYttoLIPTHiyLoMvsWg6Q/x9sb
SOV+8m+CF1lMrlHhP5Na
=oXa+
-----END PGP SIGNATURE-----

--=-CEG/I7FGrctp51UjyUYc--
