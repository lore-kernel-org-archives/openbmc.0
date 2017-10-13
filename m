Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="XFAk3COs"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="mtBRBRJa"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yCwQx6SClzDrFB
 for <openbmc@lists.ozlabs.org>; Fri, 13 Oct 2017 15:56:09 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 64B6320B71;
 Fri, 13 Oct 2017 00:56:07 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Fri, 13 Oct 2017 00:56:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=he/EPAXPUskyNYvMNyEypCtE/Z+gLx7ZYpyFIULJAUc=; b=XFAk3COs
 urH5M38Z5kEQ+ITE/roioQIelsLQUCylL7vag/DUctmAULlG7Bnue/wfBRn1F4ug
 GOQ6qCXtRLhdd6tJC/OI1S79A+vRRDBCtjg+q3S6EaUlvuXdvIMBRnuvI5pXnmPQ
 UwqWprSQUs1YR9qKShREj/jVJrEjhPgkQqSRcx98eFkSXtsrfBoSTl2lj6Y5/8xU
 w7Z7pDAgzMvMDCbPtCMOrAaxNMOvymlVOTiu0wD57Rr5dsDWHfhagG3JFERzmwe4
 3/ADPHoO5qy6qUkjtyTq81RLXKfya7SGkHKBlemd2bROu8impvkFObjJftlreI49
 G5NyCNl+h0anfA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=he/EPAXPUskyNYvMNyEypCtE/Z+gL
 x7ZYpyFIULJAUc=; b=mtBRBRJaJHgjvMcpXkKqS7hNhpQ87uTmI/51b0qZbrZjH
 +G5RZKWtZ9Pm6YeSDr6OlDmThABV9umInRuDxtXnTDU4ogfhE7JyKXyOp4h510e5
 vkHRyeVRUf2VjrQqjxOxV62+qbkkzplsqN8oDjGSx3g6BC9hF+vIEv0iGgssoc01
 h81h/daPJvYukfHdem2kaQ7tfGUoWOgTu0LMLVOfLQ6Pba0Kl7OM4FTqtpvbuWpI
 RmaMcusFRIkIz7jJpZkLna+LkebDvGkojeUzDpbXoAfiG/BOnNgR+itr7CV51McL
 ql060B9YFy0P/hjqR9JFQojljlF9lBczfYIYBORgQ==
X-ME-Sender: <xms:Z0fgWWFsZlo1HJTNNiYeuhD6a8YkpJrBgEcSr0Y7dUpJ_tid1vcKMA>
Received: from keelia23 (220-253-53-78.dyn.iinet.net.au [220.253.53.78])
 by mail.messagingengine.com (Postfix) with ESMTPA id CD04124738;
 Fri, 13 Oct 2017 00:56:05 -0400 (EDT)
Message-ID: <1507870562.5452.195.camel@aj.id.au>
Subject: Re: OpenBMC on Raspberry PI 3.
From: Andrew Jeffery <andrew@aj.id.au>
To: Javier Romero <xavinux@gmail.com>
Cc: Yi TZ Li <shliyi@cn.ibm.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Fri, 13 Oct 2017 15:26:02 +1030
In-Reply-To: <CAEX+82KL+N5VCvo+LH20=1paTZvKo2M7PqdXk7=bFq7MdAGeSA@mail.gmail.com>
References: <CAEX+82Lr=pJEvRqfi9MA=ZBW=DR+mY2VYVUhhTBgrPFA3c239g@mail.gmail.com>
 <CAPLgG=nHvmVzBW2CDxvgaeYAHoNL53W3An-p9fK3D4HfsU=Bbw@mail.gmail.com>
 <1507325323.1545468.1130544088.6FEEF44B@webmail.messagingengine.com>
 <CAEX+82KLmByCXqVg1Hzi7r5-cH2=Cx-0OE_hLwx-Jr_XXfe1Wg@mail.gmail.com>
 <CAEX+82Ls_e7EdupoUUbWEOL5gngd5BdxAY6YptHqAVp7HuJvjA@mail.gmail.com>
 <1507466681.5452.143.camel@aj.id.au>
 <CAEX+82+KQAV5WMuWh1VZCL+zb7TXXnxeUS_=8nQk1tC=8jrtqg@mail.gmail.com>
 <1507531274.5452.154.camel@aj.id.au>
 <OF72E5748D.A94F82AF-ON482581B4.0033C44D-482581B4.003504C9@notes.na.collabserv.com>
 <CAEX+82LFjvc4=Ai6p4k66EBfE-45jrYUwvmPFGdgSb4OdzQVFA@mail.gmail.com>
 <1507594463.5452.156.camel@aj.id.au>
 <CAEX+82+j8xq5JikSPWi_ycwnoQLNUF1YVUVjxsSdtBfG3b2-Ug@mail.gmail.com>
 <1507691159.5452.168.camel@aj.id.au>
 <CAEX+82KL+N5VCvo+LH20=1paTZvKo2M7PqdXk7=bFq7MdAGeSA@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-f+OxLm8ez1ev+FPGrBBn"
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
X-List-Received-Date: Fri, 13 Oct 2017 04:56:10 -0000


--=-f+OxLm8ez1ev+FPGrBBn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2017-10-11 at 16:09 -0300, Javier Romero wrote:
> > Great! I look forward to you helping us improve our documentation and
> > on-boarding of contributors. It might be rocky but it should help those
> > coming along in the future.
>=20
> A starting point to start my contribution, so, how can I help on this?

Ah I wasn't talking about anything in particular, just that we should
be able to improve our documentation from the questions you ask as you
try to get OpenBMC working on the Raspberry Pi. But regarding the
documentation, have you read through the docs repository at all?
Contributions are certainly welcome there:

https://github.com/openbmc/docs/

Cheers,

Andrew
--=-f+OxLm8ez1ev+FPGrBBn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ4EdiAAoJEJ0dnzgO5LT5/0cP/jBzwpflmIFOZPxcqwk29zmS
EJ3uY4/rxwlV2Ql85OkILqYmDFSND2j2kPwX/BwH8B7YOJBRl83V2GC1KZpGBXqd
w1pkNo2czpUvVAnY4btc2uUCK6z24HODxLYgpsho+UxLhoCtjJDp4jZNaei2nB+P
ziD5IS76sX57eVdEgI725a4ddwtw+SCRFbapqvQYNimuWm/U0ws8WZy2nBnZX3NR
n3wgQZnEWzxkyWqsBhjH0j3m8sQz0zB2WbdSzv8i/bk/FcOpL70f5CY3QTVelswI
R1qbDvB0d15cvOOKTPY0ba8m89JmROoUzyAVdGHFNq4a/OwaDSiafEO+wCajDBPX
PxZnNBmLThnZxDFyVHLNj9JssBo2P0fOCxrlid/7SbCn+pO5fRfL4tbuLfW0b6FQ
5oK+bslYJqVM3peqkNbOU/8Y0D+ldFTOLst0VucbDt+kj+j6PhrKf8qAKA5L/L1w
9si9XIbtxshIiERR1uCsryeyLEBLWTfEeRuF3+4QNtZFnCAhy2WDwjymMh5s0Biy
tyiBpD3SpgTXwwv3F7rsiNYzCDFJyYMnMq9CPW5iVX4dapljFiiED/9v0lOjoqn9
WhTH4Wpp166sljw49/SDtlDqKOPeX72cFcdmcy21xJul76uZA+hkKqK6mit1juTb
vN84FvdbM0/vBZ/s3VWD
=RDP8
-----END PGP SIGNATURE-----

--=-f+OxLm8ez1ev+FPGrBBn--
