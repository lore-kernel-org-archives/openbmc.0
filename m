Return-Path: <SRS0=Z9vj=NZ=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 218EDC433F5
	for <openbmc@archiver.kernel.org>; Fri,  3 Sep 2021 16:00:02 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51D076108E
	for <openbmc@archiver.kernel.org>; Fri,  3 Sep 2021 16:00:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 51D076108E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H1Mv36drGz2yY7
	for <openbmc@archiver.kernel.org>; Sat,  4 Sep 2021 01:59:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=FJCNLDL+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::335;
 helo=mail-ot1-x335.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=FJCNLDL+; dkim-atps=neutral
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H1MtK6628z2xy3
 for <openbmc@lists.ozlabs.org>; Sat,  4 Sep 2021 01:59:19 +1000 (AEST)
Received: by mail-ot1-x335.google.com with SMTP id
 c19-20020a9d6153000000b0051829acbfc7so7039338otk.9
 for <openbmc@lists.ozlabs.org>; Fri, 03 Sep 2021 08:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :to; bh=2SWOSosY4jXuV3WGbC2dUOv8S3eJeCY733xVGkValcY=;
 b=FJCNLDL+EPYtY3n0Z9zxRI2KJ8UCfTZyStg1AFoMkm0+uy2tOV6F3kIq4eEYk406Mh
 wYr/BuVFi+EIwkPTWOVlKSeFl2uSc399A4+DzUxAZJKBOpcfEUVgwuJck9rOsMZ46qNX
 DQTJiyL/XQFVA51ztPCnw3b02YytCaOpmYdpPcb0bnJ0TmnDprSxJRyoIRtruViIkLNi
 5UlwPk4iyDPF4+0nuCxUE0wI8JkhgDRUSHDsfWLWdPkoZDVHNjW+C1ZpQVt5Rm7k3SLN
 f6B/br+mVBKjuc40B1Qp4uEk12mUE2usiEO24H/J6tJ8LpAUMhKYNSgHiloIJPqojgd7
 41RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:to;
 bh=2SWOSosY4jXuV3WGbC2dUOv8S3eJeCY733xVGkValcY=;
 b=Q21uo8FLBP+8/Q5g+bXdYA8BBsrpF/B6RzHOvVhiH4bDzTFKudi8b4kYu/q67fd+Gx
 ehDPfZ4Dwqvh7PgEwLyEcnW15ULe25fEdBd26t5KGEis8d8cf+Us/rwvE+wZHvOJG2ae
 vm6cvcX4kHUGfbQbaaIZAqFCmqu7PXvBfNh2P4ExSRDJweKGNVpI/PXyPCzHrt/mS/Iu
 U8ur60pfl4CIJUJuFmBLU259hGqSMsmqCjSssh82kLEZ8TTNyT6yD6z7NSqckSKhZVHS
 9GYtBo0cWXE5//m04fS76wbhTH9vSAldM3PBFY2zM2Ct3bcjhK7DS60z3RDD3sed1KR7
 jwug==
X-Gm-Message-State: AOAM530wfZciKjhoCvxDkGRagURBrhlHGwutB0ijFrcMYGO5aQzHhXdI
 j1sidBPbIeSZQhkHR6fDYTxqOTisZ3qpUw==
X-Google-Smtp-Source: ABdhPJwdJ7ICZ+n1DJl6FudvPkZqeFbVTsqrDU1h+vgpTW5dVtHGRoNeH1BLRgbeVqCpj7sV04I1tA==
X-Received: by 2002:a9d:664d:: with SMTP id q13mr3716683otm.67.1630684755136; 
 Fri, 03 Sep 2021 08:59:15 -0700 (PDT)
Received: from smtpclient.apple ([2600:1700:19e0:3310:3529:176e:5161:c497])
 by smtp.gmail.com with ESMTPSA id l8sm1034649oom.19.2021.09.03.08.59.14
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 03 Sep 2021 08:59:14 -0700 (PDT)
From: Andrew Geissler <geissonator@gmail.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: new host machine bitbake dependencies coming - lz4c, pzstd, and zstd
Message-Id: <10F48AA1-F972-4113-B6B2-2423E8BB82B8@gmail.com>
Date: Fri, 3 Sep 2021 10:59:14 -0500
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
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

Our latest rebase with upstream hit this new requirement:
  =
https://www.mail-archive.com/openembedded-core@lists.openembedded.org/msg1=
50870.html

The solution is to install these on your system:
  sudo apt install liblz4-tool zstd

OpenBMC commit which will require this:
  https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/46537

Docker script update to pull in for CI:
  =
https://gerrit.openbmc-project.xyz/c/openbmc/openbmc-build-scripts/+/46558=



Andrew=
