Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="QCG/AmGc"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="gT5XvIZe"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y0tPS4kGdzDr4N
 for <openbmc@lists.ozlabs.org>; Mon, 25 Sep 2017 15:46:36 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id E0DAE20C31;
 Mon, 25 Sep 2017 01:46:33 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Mon, 25 Sep 2017 01:46:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=TzwAvZNh1CKr20zrvTbkXmZET8pHEHpk3UJ/Byjo7
 ac=; b=QCG/AmGcJ0ZrFvoc/2YsuV7qG+bgIxQ83XmYZgelIj07R2Eppb6j8RbYr
 fLlV8j+B/12wtczJuYCQXQZUQ4HWjJepZQTlOU+PRbyAIHMVzSvx6zwMUtmZApjf
 JSsEbS1PawlXHE/QLmD90nJCo432P3Gd/TBkMWUN/3fcr78a9IGNFBAtksQFwhkC
 GU+MXvf8Tizcdd4u/DUcaCHU3LEd7DdiZsg37pecMDbVXnR/ZDaCHxuErJwuroKE
 MrKGTngDySoOKhrJltileN/OckDekOSEjTfxuRuWgs4hAJJrRldAiENIVlhhp6mA
 4pePbHrVWTEZeXKT2DgD8XekZTCsw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=TzwAvZNh1CKr20zrvT
 bkXmZET8pHEHpk3UJ/Byjo7ac=; b=gT5XvIZeuZH94PG1xnJqMSgCIdkVeMkwOt
 qs9s92X2/qav27moxhW1WqKk++/xn7g40CKGit0RbjQfsr+ZLgd82jiwDE/qQC82
 HTyv5aunHy/cdxcZNALt1/Ag7yOCRDraASJShIOH4YlN2c1/KIOwpXDHj7u5z86i
 SNGUwdJ2qNTw2gINo8KvnJvOe+lbncrhOFbPwZyiZMo08G3F0NznYGUm1KGo/khj
 QfZI2v8AnXE4Hrgx+rKuzb2GT0jqeYCfiuZQSaHTJatF8dKNG6ap/14Vj6MApxr/
 vNLkj7NUIT4GDNhxY419OhVao4oiZTvpsjG+pS1QktrdA+DwtIdw==
X-ME-Sender: <xms:OZjIWXl7471qW3sOZMHWCmlF9_gRgGzAXzyCoRSMQHKwsBB5IJDFhw>
X-Sasl-enc: A96BJ1DaA71sm4BeciSpjvh4uVFcH3QHy61VqqmaEeGe 1506318393
Received: from keelia16 (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 214FC7E187;
 Mon, 25 Sep 2017 01:46:31 -0400 (EDT)
Message-ID: <1506318388.30138.20.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 1/3] drivers/fsi/sbefifo: refactor to
 upstream list state
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Cc: "Edward A. James" <eajames@us.ibm.com>
Date: Mon, 25 Sep 2017 15:16:28 +0930
In-Reply-To: <1506315435.30138.17.camel@aj.id.au>
References: <1506033838-2078-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1506033838-2078-2-git-send-email-eajames@linux.vnet.ibm.com>
 <1506315435.30138.17.camel@aj.id.au>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-HBO/imkyvNnw58T9JgGM"
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
X-List-Received-Date: Mon, 25 Sep 2017 05:46:37 -0000


--=-HBO/imkyvNnw58T9JgGM
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

T24gTW9uLCAyMDE3LTA5LTI1IGF0IDE0OjI3ICswOTMwLCBBbmRyZXcgSmVmZmVyeSB3cm90ZToK
PiA+IMKgc3RhdGljIGludCBzYmVmaWZvX3JlbW92ZShzdHJ1Y3QgZGV2aWNlICpkZXYpCj4gPiDC
oHsKPiA+IC3CoMKgwqDCoMKgc3RydWN0IGZzaV9kZXZpY2UgKmZzaV9kZXYgPSB0b19mc2lfZGV2
KGRldik7Cj4gPiAtwqDCoMKgwqDCoHN0cnVjdCBzYmVmaWZvICpzYmVmaWZvLCAqc2JlZmlmb190
bXA7Cj4gPiArwqDCoMKgwqDCoHN0cnVjdCBzYmVmaWZvICpzYmVmaWZvID0gZGV2X2dldF9kcnZk
YXRhKGRldik7Cj4gPiDCoMKgwqDCoMKgwqBzdHJ1Y3Qgc2JlZmlmb194ZnIgKnhmcjsKPiA+IMKg
Cj4gPiAtwqDCoMKgwqDCoGxpc3RfZm9yX2VhY2hfZW50cnlfc2FmZShzYmVmaWZvLCBzYmVmaWZv
X3RtcCwgJnNiZWZpZm9fZmlmb3MsIGxpbmspIHsKPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoGlmIChzYmVmaWZvLT5mc2lfZGV2ICE9IGZzaV9kZXYpCj4gPiAtwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgY29udGludWU7Cj4gPiAtCj4gPiAtwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqBkZXZpY2VfZm9yX2VhY2hfY2hpbGQoZGV2LCBOVUxMLCBzYmVmaWZv
X3VucmVnaXN0ZXJfY2hpbGQpOwo+ID4gK8KgwqDCoMKgwqBXUklURV9PTkNFKHNiZWZpZm8tPnJj
LCAtRU5PREVWKTsKPiA+ICvCoMKgwqDCoMKgd2FrZV91cCgmc2JlZmlmby0+d2FpdCk7CgpBbHNv
LCBkbyB3ZSB3YW50IHdha2VfdXBfYWxsKCkgaGVyZT8gT3IgZG9lcyBpdCBub3QgbWF0dGVyIChl
eGNsdXNpdmUKdnMgbm9uLWV4Y2x1c2l2ZSk/


--=-HBO/imkyvNnw58T9JgGM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZyJg0AAoJEJ0dnzgO5LT59i4QAIbJ3epbIwsEx4xcRg384l76
tRFNjWedUZmj1p4EX0zXL/DwkBQgjSwB1bsHnm4Ube+tlj5gtYHUdwYLlAepgdP0
4LvEfTlMp4m84mqO6Q3z7j4Xc1NnHBdhFdCwtUI2krp96xEkTqyUzImHROgZlqBe
I8Xk5Ewhs0N52QnGswp2U3ApZZuq/CxMXYn/pFYbGMmLI6okUH9m9C1cWdfAQfOM
CvNzfWaPBNRCZ9t9Ku9YTSPz/QU2hL4/JTYUS7zlzciIwrd5Dnafcozti0cCXriZ
rRDm8eENo4klCgRlag429/9dx0ot3YLZG7YDtTEE6YO5P+I8nSTa2sNqgzN8PPoV
ImSCmCgKkZ6y/rvq6gStWCSFuGwxlX/O4DDPS3Wys0kbiJAZza/yaOkvu4540Fx7
foA3vecbMW5WBxM4I6Ep7bFsIQ7R0bw43qbz5Ty+fE5qCRMLDRu/r33SLs7JXSPY
Qgpb04kbxL1BbnsB8Y5Ni1O2Pkr8tMaEXmFHRoqQchQbC3SvE6NFvslttvAqs8SO
UCHgE25w+r06VXeDAZGoGbT0ybTT2SBCWTKl2grYqOD6/OZb3r0QGe02MP31NFje
4xjhK1Pz6yvWloQS+SG5g5C/XLHSTgp7sfXubAy1yb21ebQVUQl3eW65ieDmxLm+
lAuo7RG+Ev9VykQykC51
=OHOa
-----END PGP SIGNATURE-----

--=-HBO/imkyvNnw58T9JgGM--
