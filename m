Return-Path: <SRS0=4Mv8=MM=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36458C07E9B
	for <openbmc@archiver.kernel.org>; Tue, 20 Jul 2021 17:32:47 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58BC761003
	for <openbmc@archiver.kernel.org>; Tue, 20 Jul 2021 17:32:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 58BC761003
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ACULAB.COM
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GTm4r5lc5z3bdl
	for <openbmc@archiver.kernel.org>; Wed, 21 Jul 2021 03:32:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aculab.com (client-ip=185.58.85.151;
 helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com;
 receiver=<UNKNOWN>)
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GTm4R4XPRz2yXf
 for <openbmc@lists.ozlabs.org>; Wed, 21 Jul 2021 03:32:21 +1000 (AEST)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-206-GSzzkNyhNdi0mB4cT-gXiQ-1; Tue, 20 Jul 2021 18:32:15 +0100
X-MC-Unique: GSzzkNyhNdi0mB4cT-gXiQ-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.23; Tue, 20 Jul 2021 18:32:14 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.023; Tue, 20 Jul 2021 18:32:14 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Mark Brown' <broonie@kernel.org>
Subject: RE: [PATCH 1/2] spi: fsi: Reduce max transfer size to 8 bytes
Thread-Topic: [PATCH 1/2] spi: fsi: Reduce max transfer size to 8 bytes
Thread-Index: AQHXfL3Ikg6avb1lOkyp/qlhiL4746tL1OlQ///yyICAAFhm4A==
Date: Tue, 20 Jul 2021 17:32:13 +0000
Message-ID: <018ee235eabd420bb32f6acf57dfe121@AcuMS.aculab.com>
References: <20210716133915.14697-1-eajames@linux.ibm.com>
 <20210716133915.14697-2-eajames@linux.ibm.com>
 <20210716171936.GB4137@sirena.org.uk>
 <81a40f8690d297ebfb6697dbea63279bcf2f24fa.camel@linux.ibm.com>
 <20210719152010.GB4174@sirena.org.uk>
 <d2e07f0beda57ffeaa31e8cf5bf28edfbd982e58.camel@linux.ibm.com>
 <0a637d7704df4303abe783215080578d@AcuMS.aculab.com>
 <20210720131303.GB5042@sirena.org.uk>
In-Reply-To: <20210720131303.GB5042@sirena.org.uk>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 'Eddie James' <eajames@linux.ibm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

From: Mark Brown
> Sent: 20 July 2021 14:13
>=20
> On Tue, Jul 20, 2021 at 01:04:38PM +0000, David Laight wrote:
>=20
> > Having said that, you might want a loop in the driver so that
> > application requests for longer transfers are implemented
> > with multiple hardware requests.
>=20
> No, that's something that should be and indeed is done in the core -
> this isn't the only hardware out there with some kind of restriction on
> length.

Ah, ok, there is another loop before any 'users'.
> > I do also wonder why there is support in the main kernel sources
> > for hardware that doesn't actually exist.
>=20
> We encourage vendors to get support for their devices upstream prior to
> hardware availability so that users are able to run upstream when they
> get access to hardware, this means users aren't forced to run out of
> tree code needlessly and greatly eases deployment.

This one just seemed a bit premature.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

