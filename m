Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="ACdLtHe3"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="QLgyCC7y"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yHCSz00PPzDrG0
 for <openbmc@lists.ozlabs.org>; Thu, 19 Oct 2017 00:24:18 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 10CA220A59;
 Wed, 18 Oct 2017 09:24:14 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Wed, 18 Oct 2017 09:24:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=Jh3HhqSmrQEi6DTzZHrotO8UabTH08IlVh6qPeJKQ3I=; b=ACdLtHe3
 83SYf/Yic3JREqykJq4WxBUzlrD9cX7hwF9RQCWIM+VKbtpMGy7ZAKO2GOWpiHIW
 Y5oqZe++ZhYS51sZHpIsdlgyqbl2l6hvNypvbBHG2tZbOlUttDSYrq6RmTJrNXez
 eTx+o8W6+SLzTV5jE115p+vtlIu4dcVqexuKtk4cKN614HcRA3kaz5zjz9/aWgIS
 eJ5DCOqaEjj1V90eGhR0UBeolmWGzo1knx2CiK9RqgarjqsgMNpI6fUomc6UgyAS
 ZrrMgQmSZQ5IpRAZaXP2Hrig9C1XqrLwapTPbUZmWA6AA5dulaozY44XBRwXpVwV
 5WGHKl94tMBJEw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=Jh3HhqSmrQEi6DTzZHrotO8UabTH0
 8IlVh6qPeJKQ3I=; b=QLgyCC7yl+cBSgBFuV4Eti5iqA/X1vWfHKnMShRTPDRzN
 UUPR/H3vOrvOU1Lfs58MSuoGE6jJjYD9btqJjsscYdmIm9kwE1ScJl4IzRzvr75K
 HP3ke09MLojVy798lcZD51YQx4e6/auOqdr2Jr46bYJAvG3DNq56J1SdQs72JNEw
 oTIVKTUzFGt3wovYatqVtLMQYk0UPgUxxGFIYNvvzmlK2XjN5q5EzUHVJUeHZ2Tk
 fLiVG6VIVG7eLUIw9Ie4gmx2nXdbRPzYHhsCz8Qn0qmt2bFi3xqV4CL4WrEs/E1v
 D74gvS2RVCMFWrfDTNoSa1rlspyTwbaa8UZ7ehvqQ==
X-ME-Sender: <xms:_VXnWVp7Hfbmyh_5nQb3PqZQuAQCtCEooYrmTjX3hsL5NXXInusw_Q>
Received: from keelia26 (220-253-53-78.dyn.iinet.net.au [220.253.53.78])
 by mail.messagingengine.com (Postfix) with ESMTPA id C3C53247D9;
 Wed, 18 Oct 2017 09:24:11 -0400 (EDT)
Message-ID: <1508333045.24322.25.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 2/3] drivers: fsi: sbefifo: Fix memory leak
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, bradleyb@fuzziesquirrel.com, "Edward A. James"
 <eajames@us.ibm.com>
Date: Wed, 18 Oct 2017 23:54:05 +1030
In-Reply-To: <1508276153-3779-3-git-send-email-eajames@linux.vnet.ibm.com>
References: <1508276153-3779-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1508276153-3779-3-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-tQoxkuZ/hyn4pmt9dfdu"
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
X-List-Received-Date: Wed, 18 Oct 2017 13:24:21 -0000


--=-tQoxkuZ/hyn4pmt9dfdu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2017-10-17 at 16:35 -0500, Eddie James wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>=C2=A0
> Transfers weren't being cleaned up if they were complete but the user
> never finished reading. This is very common.

I'm curious as to why this is common, but regardless, the patch looks
fine given the premise.

Andrew

>=C2=A0
> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> ---
> =C2=A0drivers/fsi/fsi-sbefifo.c | 5 +++++
> =C2=A01 file changed, 5 insertions(+)
>=C2=A0
> diff --git a/drivers/fsi/fsi-sbefifo.c b/drivers/fsi/fsi-sbefifo.c
> index c914eaf..764d8f3 100644
> --- a/drivers/fsi/fsi-sbefifo.c
> +++ b/drivers/fsi/fsi-sbefifo.c
> @@ -321,6 +321,11 @@ static void sbefifo_client_release(struct kref *kref=
)
> =C2=A0
> =C2=A0	if (!READ_ONCE(sbefifo->rc)) {
> =C2=A0		list_for_each_entry(xfr, &client->xfrs, client) {
> +			if (test_bit(SBEFIFO_XFR_COMPLETE, &xfr->flags)) {
> +				kfree(xfr);
> +				continue;
> +			}
> +
> =C2=A0			/*
> =C2=A0			=C2=A0* The client left with pending or running xfrs.
> =C2=A0			=C2=A0* Cancel them.
--=-tQoxkuZ/hyn4pmt9dfdu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ51X1AAoJEJ0dnzgO5LT5+wwP/j9iEH750IP/Gw9VDDVT6OLs
sl2e1kkdS2Ot+HkPer6nOQEa3sXmGnHb6N2ickyA4Uwk1P/loowfDGkQEV2Z5FPi
Ke6Cs13jP5qw+wORfg/gf21y1iZ4UWjQhlBtKHY4wnL+r9IFgu3UV/KCptgrzw8P
sVTaYuefam/UuXHqUpp1MLnvTcNm4QirRu+0Xa3AMrOUXays7Zbbe/w4dHqmrq1M
DGERykwXmVRyeqbr2htXNKz7hZNWFDXuqgbsa33T6IEJLOXuZpU83n39ih9Yge5E
V5xwWUGmv632uJZECOL3enKGrcKgxHMvZGhi/Iyaj/ENhzAbHmGcopLbqBCUZpo+
acfQAXFgPkdQSGkGk8Aj87jRfSnsPVuPO97u03GdjNQBpHLt/rDuM89O1pT7LAuD
urmOIEiSmpNS1FbJKPXRySOPl0V9res8sqe+nV3Vk5euE7p+KWGnmYLsfw7j8a+Q
vMmUCh20n+AXVP2hOg6Egyu+sdvJH6Bz9xEWlhOEEdw10bLMWu/tBMk7mOuwYWBC
D4TKEVtDAVX2kYIyRLfMe/GvLucvaTOFSTTuTS3yfv1Hh0w8AviSlKzmBG2Qwj9d
JUv6U1OPOebTpIjZ+iLR3t3T4epZgtwHtWEqXh7wfIZnK7cL0mr8O407ir+k9/lY
Zpyi2uWbFhXcHbNiwn2A
=MBcd
-----END PGP SIGNATURE-----

--=-tQoxkuZ/hyn4pmt9dfdu--
