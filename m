Return-Path: <SRS0=gkvK=PO=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 846D0C433EF
	for <openbmc@archiver.kernel.org>; Tue, 26 Oct 2021 17:12:47 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E35261040
	for <openbmc@archiver.kernel.org>; Tue, 26 Oct 2021 17:12:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6E35261040
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=yadro.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hdz0X5pFkz2yhl
	for <openbmc@archiver.kernel.org>; Wed, 27 Oct 2021 04:12:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=i3XvWZaG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.filippov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=i3XvWZaG; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hdyzk2bDKz2y0C
 for <openbmc@lists.ozlabs.org>; Wed, 27 Oct 2021 04:12:02 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id DC0E24609D
 for <openbmc@lists.ozlabs.org>; Tue, 26 Oct 2021 17:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 mime-version:content-transfer-encoding:content-type:content-type
 :content-language:accept-language:message-id:date:date:subject
 :subject:from:from:received:received:received:received; s=
 mta-01; t=1635268315; x=1637082716; bh=Ir90sAAPVTnZ6z2p8CQ3/fgsh
 vWal9pOPn8u6nlWG2k=; b=i3XvWZaG/tszKPweBNqLLl89duVASXvZd3aE80IQl
 wE0F9+tv2UGEyHaNefcoUPkl8rhWMxvfMazLdZPcbPNmmv2+PeSeuA0rRVtPmM9n
 3MPH4RRMT0d/j5leVFU9BmyngbqDBFo/Ob+NBD04dO+oeJ62oiTW0ONy+ix8md39
 PA=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mcasbAX8tyUb for <openbmc@lists.ozlabs.org>;
 Tue, 26 Oct 2021 20:11:55 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id BCCEC45FFF
 for <openbmc@lists.ozlabs.org>; Tue, 26 Oct 2021 20:11:55 +0300 (MSK)
Received: from T-EXCH-04.corp.yadro.com (172.17.100.104) by
 T-EXCH-03.corp.yadro.com (172.17.100.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Tue, 26 Oct 2021 20:11:55 +0300
Received: from T-EXCH-04.corp.yadro.com ([fe80::d8c5:6f0a:3d48:18df]) by
 T-EXCH-04.corp.yadro.com ([fe80::d8c5:6f0a:3d48:18df%15]) with mapi id
 15.01.0669.032; Tue, 26 Oct 2021 20:11:55 +0300
From: "Alexander A. Filippov" <a.filippov@yadro.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Blinking of the paired LEDs
Thread-Topic: Blinking of the paired LEDs
Thread-Index: AQHXyoyTXCgpfO9IDkeDP7PfSxrOnA==
Date: Tue, 26 Oct 2021 17:11:54 +0000
Message-ID: <2f488f5e7e1140369a3663679bddd673@yadro.com>
Accept-Language: ru-RU, en-US
Content-Language: ru-RU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [10.199.18.134]
Content-Type: text/plain; charset="koi8-r"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

We have green-red paired LEDs on our hardware. In SysFS they present as a p=
air of standalone LED.=20
And we switch the different color in different cases using separate LED gro=
ups in the phosphor-led-manager that turns corresponding physical LEDs.

One of those LED groups turning on the such LED to the yellow blinking by s=
etting the blink mode on the both physical LED. But sometimes these physica=
l LEDs turn with a little time lag. This leads to the blinking of the four =
states: green (short) -> yellow (long)-> red (short) -> off(long).

I believe this occurs when there is a some traffic through D-Bus (e.g. duri=
ng the host starting) and LED manager can't set the physical LEDs mode sync=
hronously.

And I see nothing better than trying to combine the phosphor-ledcontroller =
instances into one process and probably to implement the method for setting=
 the properties with one D-Bus call.

Does anybody have suggestions about any better solution?=
