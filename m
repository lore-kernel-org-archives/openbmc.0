Return-Path: <SRS0=nE6r=IJ=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEFDDC433DB
	for <openbmc@archiver.kernel.org>; Thu, 11 Mar 2021 02:19:35 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1480B64FA3
	for <openbmc@archiver.kernel.org>; Thu, 11 Mar 2021 02:19:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1480B64FA3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=phoenix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dwt1d3Gn9z3cR3
	for <openbmc@archiver.kernel.org>; Thu, 11 Mar 2021 13:19:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=phoenix.com header.i=@phoenix.com header.a=rsa-sha256 header.s=mimecast20170203 header.b=PrjzRAoS;
	dkim=pass (1024-bit key) header.d=phoenix.com header.i=@phoenix.com header.a=rsa-sha256 header.s=mimecast20170203 header.b=PCZMi6C2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=phoenix.com (client-ip=63.128.21.170;
 helo=us-smtp-delivery-170.mimecast.com;
 envelope-from=patrick_voelker@phoenix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=phoenix.com header.i=@phoenix.com header.a=rsa-sha256
 header.s=mimecast20170203 header.b=PrjzRAoS; 
 dkim=pass (1024-bit key) header.d=phoenix.com header.i=@phoenix.com
 header.a=rsa-sha256 header.s=mimecast20170203 header.b=PCZMi6C2; 
 dkim-atps=neutral
X-Greylist: delayed 68 seconds by postgrey-1.36 at boromir;
 Thu, 11 Mar 2021 13:19:08 AEDT
Received: from us-smtp-delivery-170.mimecast.com
 (us-smtp-delivery-170.mimecast.com [63.128.21.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dwt182Nrlz30Qb
 for <openbmc@lists.ozlabs.org>; Thu, 11 Mar 2021 13:19:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1615429145;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=HWdPyDujsCKHRlqEQH2OLUkmVNw5YxsMZyL4lx2Aw5c=;
 b=PrjzRAoSu+c5ddWiKMLS/6HLhToxDD20CVW7RwaKJJdP+wZ8OAI1U978fBgeDknj273Aw/
 Sk421zPtUgEv7hsOxpHaz7bpD4PXEyXI+PJvrmETVJaT2PbPNbbWUYkJqoZWUiukgJjOYj
 8sS6y/LOBDOfHaALDQO5nmVCSbVHTHo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1615429146;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=HWdPyDujsCKHRlqEQH2OLUkmVNw5YxsMZyL4lx2Aw5c=;
 b=PCZMi6C2FRWZ5OhL57KD1IRtkMeqFcPtoYO77kANyIp3vtHjeToBZvxe8dWZl8lujWHdBz
 l7mBxT7WR+Jckw2tl3Z/Xb+STB0a86tvbkMUdwTnzZrXMYImrHnRW+KH8FvIAgzSY/826R
 EPGXrv331kXWLWjK+hHomUWbrEEQyxA=
Received: from SCL-EXCHMB-13.phoenix.com (67.51.239.50 [67.51.239.50])
 (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-458-icRSxCN3OM2gs_cGH54wgg-1; Wed, 10 Mar 2021 21:17:48 -0500
X-MC-Unique: icRSxCN3OM2gs_cGH54wgg-1
X-CrossPremisesHeadersFilteredBySendConnector: SCL-EXCHMB-13.phoenix.com
Received: from SCL-EXCHMB-13.phoenix.com (10.122.68.16) by
 SCL-EXCHMB-13.phoenix.com (10.122.68.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 10 Mar 2021 18:17:45 -0800
Received: from SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b]) by
 SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b%12]) with mapi id
 15.00.1497.012; Wed, 10 Mar 2021 18:17:45 -0800
From: Patrick Voelker <Patrick_Voelker@phoenix.com>
To: "OpenBMC (openbmc@lists.ozlabs.org)" <openbmc@lists.ozlabs.org>
Subject: Adding keys to BMC production build
Thread-Topic: Adding keys to BMC production build
Thread-Index: AdcWHLaEG+FX12cqRTejcxdLrfLSog==
Date: Thu, 11 Mar 2021 02:17:45 +0000
Message-ID: <1f6f6ee72b8746939289c1897de828b2@SCL-EXCHMB-13.phoenix.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.122.68.195]
MIME-Version: 1.0
X-OrganizationHeadersPreserved: SCL-EXCHMB-13.phoenix.com
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA70A150 smtp.mailfrom=patrick_voelker@phoenix.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: phoenix.com
Content-Type: multipart/alternative; boundary="MCBoundary=_12103102117500131"
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

--MCBoundary=_12103102117500131
Content-Language: en-US
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Is there a page or document with instructions for adding a custom key for s=
igning the production BMC build?  I haven't had any luck finding it yet.

--MCBoundary=_12103102117500131
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=WINDOWS-1252

<HTML><BODY>Is there a page or document with instructions for adding a cust=
om key for signing the production BMC build?  I haven't had any luck findin=
g it yet.<BR>
</BODY></HTML>

--MCBoundary=_12103102117500131--

