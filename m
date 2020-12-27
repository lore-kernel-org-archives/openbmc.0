Return-Path: <SRS0=WiR3=F7=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23592C433E0
	for <openbmc@archiver.kernel.org>; Sun, 27 Dec 2020 23:24:49 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66ED72053B
	for <openbmc@archiver.kernel.org>; Sun, 27 Dec 2020 23:24:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 66ED72053B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D3xbd6yyCzDqDK
	for <openbmc@archiver.kernel.org>; Mon, 28 Dec 2020 10:24:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22e;
 helo=mail-oi1-x22e.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=IkrSnSUN; dkim-atps=neutral
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D3xZG5vFwzDqC9
 for <openbmc@lists.ozlabs.org>; Mon, 28 Dec 2020 10:23:30 +1100 (AEDT)
Received: by mail-oi1-x22e.google.com with SMTP id l207so9992376oib.4
 for <openbmc@lists.ozlabs.org>; Sun, 27 Dec 2020 15:23:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:content-transfer-encoding:mime-version:subject:message-id
 :references:to:date;
 bh=FbcqRJ0wwA5DP3StxEtqAeKjYf4XED10O8hVicJDUlA=;
 b=IkrSnSUNX4fc+url6hsKWs/PcAmXj40i9kHTfpJdqLdL3COco257tK5QmpZUu6j5sa
 iaJkfsluG/SjZBF+JcD/E69/WEtFnnCvqiJeW+fVQ46GaUBAw8xAq25GrfMS6c8NJWeJ
 LtJKuyfjWiQwClCq9oyfS9MrBjjN9Nb2sbHiR6GOzrSYKyH+XFt7S87wOYrs7pOq09T8
 mT3g3XlwpkRMHaQKTe88y833eQGzJcTcsVSJbHWK5e33CGXsCaRSKhqCLTdRon1cQqN+
 0MEnxxtHN96qbGaDAVetGjZkEByR0xQQ93g24snIL0ORMkFV5JA7LoObF5FWinhj4VDA
 Ct5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:references:to:date;
 bh=FbcqRJ0wwA5DP3StxEtqAeKjYf4XED10O8hVicJDUlA=;
 b=MXRn7EejDbNg5ZTCOvM2LgyBIDDquFVF3LkV1aYvSZOVxVLyiYybWMynRl1jG8BzP1
 vNqF/1eTYO8HCYM3cJqCQ5+jBQ0EthnNMPPbq8J2kBhuF5m3oDWiKk+Y56o5ENVGiLz0
 GYccAVH0cSPVENdjrGNb5Rj3zXbChOOFhv4KF1Ijsb8yMBWeeeQcSpNEF754IDJQedNe
 xJm7RrAejGnp44HgoZRpZcJwWPI4NGG0KWFIJ0sQ9qFmjkfiZmZ8BCYCR2yl3re5YdUk
 nmY9jYb7cQzuD5Lxyue5OeD87U+AZHZUYbqoEY7Pqi6uEqbXmP9bzHk3Wa+9ntd6ZVD6
 XaLg==
X-Gm-Message-State: AOAM530rcIAw0ATGSEhs6frmzFW4Oci7Tyn6XQA0tBLh4O+I5hvo0uW1
 ms8rPs1gBr5LiiVLIHAWLJXx6khjyQzk9Q==
X-Google-Smtp-Source: ABdhPJzzRcyva88KIAvQeSP3abw12U/zcfo6QhkBZerQn6bHER8HyXg/xHzmpPi/SQuzDheeD97Mxw==
X-Received: by 2002:aca:ab8b:: with SMTP id u133mr10531557oie.18.1609111406594; 
 Sun, 27 Dec 2020 15:23:26 -0800 (PST)
Received: from andrews-mbp-2.attlocal.net
 ([2600:1700:19e0:3310:8522:e938:1e86:cb26])
 by smtp.gmail.com with ESMTPSA id v38sm8750919ott.52.2020.12.27.15.23.25
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 27 Dec 2020 15:23:25 -0800 (PST)
From: Andrew Geissler <geissonator@gmail.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Fwd: openbmc gerrit and jenkins upgrade - Dec 28, 2020
Message-Id: <F1C4CAC4-8AB0-4D6C-A793-C5D3FA72434F@gmail.com>
References: <C9C8DBC8-8747-452F-B4EF-4102B2A46A2C@gmail.com>
To: openbMC Maillist <openbmc@lists.ozlabs.org>
Date: Sun, 27 Dec 2020 17:23:25 -0600
X-Mailer: Apple Mail (2.3608.120.23.2.4)
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

Friendly reminder, upgrade is tomorrow.

> Begin forwarded message:
>=20
> From: Andrew Geissler <geissonator@gmail.com>
> Subject: openbmc gerrit and jenkins upgrade - Dec 28, 2020
> Date: December 17, 2020 at 10:31:13 AM CST
> To: openbMC Maillist <openbmc@lists.ozlabs.org>
>=20
> Greetings,
>=20
> I=E2=80=99ve been putting a gerrit upgrade off for a while because:
>=20
> a) this current version has been running very stable
> b) my last upgrade experience was pretty rough
> c) we keep flirting with just going to github and getting rid of =
gerrit
>=20
> But it seems like the quiet holiday season is going to be my
> best time to give it a go and a gerrit to github migration does
> not appear to be imminent.
>=20
> I know to get to the latest gerrit I=E2=80=99m going to have to do =
some
> database migration work. I have no idea how long this is going
> to take so I=E2=80=99d say plan for no gerrit during the US day time =
on
> Monday Dec 28 (8am-5pm).
>=20
> I=E2=80=99ll keep you posted in discord on the 28th.
>=20
> Wish me luck,
> Andrew

