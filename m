Return-Path: <SRS0=0lyD=FF=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF6CBC64E90
	for <openbmc@archiver.kernel.org>; Tue,  1 Dec 2020 23:46:22 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A223B20644
	for <openbmc@archiver.kernel.org>; Tue,  1 Dec 2020 23:46:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A223B20644
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=9elements.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ClzJV6MRwzDqtV
	for <openbmc@archiver.kernel.org>; Wed,  2 Dec 2020 10:46:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=9elements.com (client-ip=2a00:1450:4864:20::42b;
 helo=mail-wr1-x42b.google.com; envelope-from=philipp.deppenwiese@9elements.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=9elements.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=9elements.com header.i=@9elements.com
 header.a=rsa-sha256 header.s=google header.b=gQQ9MHuS; 
 dkim-atps=neutral
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ClDQ84mZMzDqXW
 for <openbmc@lists.ozlabs.org>; Tue,  1 Dec 2020 05:33:31 +1100 (AEDT)
Received: by mail-wr1-x42b.google.com with SMTP id u12so17565772wrt.0
 for <openbmc@lists.ozlabs.org>; Mon, 30 Nov 2020 10:33:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=9elements.com; s=google;
 h=date:from:to:message-id:subject:mime-version;
 bh=VBZap1G0nxsDxswNTzDxcqeAv2SDALuMiB8zIA9V6vo=;
 b=gQQ9MHuSVhWPrmGyjwEtlWRHyeXAxs1+3qnkicdmiutlSlunnVVenpgM0l+l7b3SAw
 L/kCPFCrz1xwDsTjar4Q3XS1ZDJOIfnnx47t1ZG1cbkaJBjJxm8FNVrtLr/ktg32eqRr
 IkijaWGh05RBJGcHhj6DG2h3NvJEu9UVNw1ywB88qnIdn9p5QDQSfz60ckvRxtLYUL6u
 +ja44jcVvRtx/WIG5L52ZemE/JE3T7kfCUP54Vx4ucjSqxQztFQB8YRpWFNsSfjV6f9U
 JrWbyttvBnXI+L8SjnVS3wr6XXwbEX/AjQ0uV7x/cfHJS7j8H+t/UKa3M2iniKvzCn4s
 RlJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:message-id:subject:mime-version;
 bh=VBZap1G0nxsDxswNTzDxcqeAv2SDALuMiB8zIA9V6vo=;
 b=hSNnSndT0QAc1G5J/v9sw/NXRRR4+ZV0KtMjux+E6H+7qP1x8olkjivftoaik7Xgr6
 hXhUG3S1+BYJDDBQHbGIxWHv37Ut2susa9dQJIqrXgWLObzHf1wOTC7g77s9rFrPAr9u
 wPGMOafMn00G8iCsAuBfeHomQNdyYFKbn3UKeWGD7qb4U7vyIhhMz80N1tTqiQu41U11
 q67eXX2NjfWurbDTJWuLNluiaemJe0usTFh1Gslid267C29fRG3s4+DU4WpeExVm+viQ
 ZcEDMipa3w5vh83sdlXQyq2SvdwqaQc+GRBqJaGDOmtNG30WBohlBNAJTVka6jUca1Hp
 pZBw==
X-Gm-Message-State: AOAM530ytwdXHtT/vblH2BzNKuOMoCtkq5IuwDoV4bK8zQlrhA3eUa9z
 hHelIoywPpS/tzUgCC1IybRaNg==
X-Google-Smtp-Source: ABdhPJwQZUYrgvWrmQeoFvdcDstYYkwSPNnPtblvILBBRZKrIrn/cnjvbji7K061xnR0+hDbS21APg==
X-Received: by 2002:adf:e541:: with SMTP id z1mr30849063wrm.389.1606761205383; 
 Mon, 30 Nov 2020 10:33:25 -0800 (PST)
Received: from Haruhi (b2b-78-94-0-50.unitymedia.biz. [78.94.0.50])
 by smtp.gmail.com with ESMTPSA id a65sm185750wmc.35.2020.11.30.10.33.23
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 30 Nov 2020 10:33:24 -0800 (PST)
Date: Mon, 30 Nov 2020 19:33:23 +0100
From: Philipp Deppenwiese <philipp.deppenwiese@9elements.com>
To: "=?utf-8?Q?coreboot=40coreboot.org?=" <coreboot@coreboot.org>, 
 "=?utf-8?Q?flashrom=40flashrom.org?=" <flashrom@flashrom.org>, 
 "=?utf-8?Q?seabios=40seabios.org?=" <seabios@seabios.org>, 
 "=?utf-8?Q?openbmc=40lists.ozlabs.org?=" <openbmc@lists.ozlabs.org>
Message-ID: <7EE9AFFB-E060-4A95-A5E7-1FD561B2EB45@getmailspring.com>
Subject: Upcoming virtual OSFC 2020
X-Mailer: Mailspring
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="5fc53af3_716e4fa6_59a10"
X-Mailman-Approved-At: Wed, 02 Dec 2020 10:45:01 +1100
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

--5fc53af3_716e4fa6_59a10
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello people,

This is a last reminder on the upcoming OSFC 2020 (www.osfc.io) which will start tomorrow noon CET.
If you are interested in attending the conference, please get your tickets via https://hopin.com/events/osfc-2020

Best regards,
Philipp

--5fc53af3_716e4fa6_59a10
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<div>Hello people,</div><br><div>This is a last reminder on the upcoming =
OS=46C 2020 (www.osfc.io) which will start tomorrow noon CET.</div><div><=
div>If you are interested in attending the conference, please get your ti=
ckets via <a href=3D=22https://hopin.com/events/osfc-2020=22 title=3D=22h=
ttps://hopin.com/events/osfc-2020=22>https://hopin.com/events/osfc-2020</=
a></div></div><br><div>Best regards,</div><div>Philipp</div>
--5fc53af3_716e4fa6_59a10--

