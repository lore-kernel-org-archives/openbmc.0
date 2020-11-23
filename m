Return-Path: <SRS0=Uzhw=E5=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20C61C388F9
	for <openbmc@archiver.kernel.org>; Mon, 23 Nov 2020 22:51:47 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B5F9206D8
	for <openbmc@archiver.kernel.org>; Mon, 23 Nov 2020 22:51:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=phoenix.com header.i=@phoenix.com header.b="Yz/e1fqr";
	dkim=pass (1024-bit key) header.d=phoenix.com header.i=@phoenix.com header.b="vlQtpove"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B5F9206D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=phoenix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cg2TD09ddzDqRh
	for <openbmc@archiver.kernel.org>; Tue, 24 Nov 2020 09:51:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=phoenix.com (client-ip=216.205.24.170;
 helo=us-smtp-delivery-170.mimecast.com;
 envelope-from=patrick_voelker@phoenix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=phoenix.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=phoenix.com header.i=@phoenix.com header.a=rsa-sha256
 header.s=mimecast20170203 header.b=Yz/e1fqr; 
 dkim=pass (1024-bit key) header.d=phoenix.com header.i=@phoenix.com
 header.a=rsa-sha256 header.s=mimecast20170203 header.b=vlQtpove; 
 dkim-atps=neutral
Received: from us-smtp-delivery-170.mimecast.com
 (us-smtp-delivery-170.mimecast.com [216.205.24.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cg2RM2wLxzDqJs
 for <openbmc@lists.ozlabs.org>; Tue, 24 Nov 2020 09:50:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1606171798;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=/zXldb7I7WQQpWvSwJ1t/yh8Xtg+xsw5qNqTZ4XWlIM=;
 b=Yz/e1fqrPsMxV20io9sLy40Nh0QrijfJWLELFG2hJc9MiQHoHnhR5xXYEDo9VG2J0EV8Lt
 7B9ZgHWl8koQ4W1eJFYeKjqozo/Hf8AFqT3G9dWOzm2cihma4ppWLTZvoOcd0VDLuuCa2q
 nbuL9zmag+v87n4Dt7xTJ4b38aEBIiY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1606171799;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=/zXldb7I7WQQpWvSwJ1t/yh8Xtg+xsw5qNqTZ4XWlIM=;
 b=vlQtpoveUlx7lmaBZ1XIrzKLkLX8np9ZQKn2iCLdINyRarK5UHWYEwMLeKUzXmkMo5iIxa
 GYivPfvQokWoytcc/ovjEmVfukYjhh0E2et3pn3P2EuwF+aUf2g1zBkirGGtbw3oRSrvqd
 IB7Yh4A4G8BjetildPNI5CqOMrnEs5s=
Received: from SCL-EXCHMB-13.phoenix.com (67.51.239.50 [67.51.239.50])
 (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-395-WVv6TBI1NvuX6G7ALPTpqA-1; Mon, 23 Nov 2020 17:49:56 -0500
X-MC-Unique: WVv6TBI1NvuX6G7ALPTpqA-1
X-CrossPremisesHeadersFilteredBySendConnector: SCL-EXCHMB-13.phoenix.com
Received: from SCL-EXCHMB-13.phoenix.com (10.122.68.16) by
 SCL-EXCHMB-13.phoenix.com (10.122.68.16) with Microsoft SMTP Server (TLS) id
 15.0.1156.6; Mon, 23 Nov 2020 14:49:54 -0800
Received: from SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b]) by
 SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b%12]) with mapi id
 15.00.1156.000; Mon, 23 Nov 2020 14:49:54 -0800
From: Patrick Voelker <Patrick_Voelker@phoenix.com>
To: "OpenBMC (openbmc@lists.ozlabs.org)" <openbmc@lists.ozlabs.org>
Subject: Unresponsive BMC after booting into Ubuntu
Thread-Topic: Unresponsive BMC after booting into Ubuntu
Thread-Index: AdbB6IVyteZuFHQ2RRKT4gj4Gu4WPw==
Date: Mon, 23 Nov 2020 22:49:54 +0000
Message-ID: <f659f8a48f24404fbc5dda747000865d@SCL-EXCHMB-13.phoenix.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.122.68.180]
MIME-Version: 1.0
X-OrganizationHeadersPreserved: SCL-EXCHMB-13.phoenix.com
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA70A150 smtp.mailfrom=patrick_voelker@phoenix.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: phoenix.com
Content-Language: en-US
Content-Type: text/plain; charset=WINDOWS-1252
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
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

I have a situation where, while booting the host into Ubuntu desktop 18.04,=
 my OpenBMC ast2500 BMC stops responding on all interfaces including its de=
bug serial console.  It doesn't do this when the host boots into Windows.

Nothing came up when I did an initial google search.  Also, nothing unusual=
 jumps out at me if I watch the BMC's 'journal -f' prior to the issue.  No =
kernel panic or anything like that.

Are there any known issues like this?  If not, are there some pointers to r=
elevant debug strategies for when BMC is not available?  I'd like to avoid =
JTAG debugging the kernel if possible.  :-)

