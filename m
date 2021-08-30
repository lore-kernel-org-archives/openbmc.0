Return-Path: <SRS0=oIjA=NV=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04F4FC432BE
	for <openbmc@archiver.kernel.org>; Mon, 30 Aug 2021 05:28:29 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C88960240
	for <openbmc@archiver.kernel.org>; Mon, 30 Aug 2021 05:28:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1C88960240
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=bytedance.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gyf4B2R83z2yJj
	for <openbmc@archiver.kernel.org>; Mon, 30 Aug 2021 15:28:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=rN2mDXmp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::235;
 helo=mail-oi1-x235.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20150623.gappssmtp.com
 header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=rN2mDXmp; dkim-atps=neutral
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gyf3N6Sjsz2xr1
 for <openbmc@lists.ozlabs.org>; Mon, 30 Aug 2021 15:27:39 +1000 (AEST)
Received: by mail-oi1-x235.google.com with SMTP id o185so18374472oih.13
 for <openbmc@lists.ozlabs.org>; Sun, 29 Aug 2021 22:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=823JKFFMbJf6ulkXkXX63gNESBJJYaLYVi/qXJ3+b3k=;
 b=rN2mDXmpELgLoT/tZ5p8Tfi7gR7NMapFcBvY6gii4DwAxQ0yN/bRJHDbZKwrNuTM2d
 0KhrJygm/H0mWkm3UyFnVAreDZW2Sxkgn0FYXee47OiPpFg3oynerovyKI/QUssaxq2y
 PGGLFOEWAxySmI3GU4MQLKAxUPc/MxBlAzQRkp6LFhz4pZiNksUP4QSfZPsdHWQidR38
 /j5y9LAIblRUuMLO0OUusqOgAWXHIbMTTEAoOvo/ZlNJFj2zjLw4YrGcF2wL6VAUEUUN
 UW0XNjAVUs9kr6q25MNw5+bniXej+QZzzs8jad5aVac0xHey626DsQfCTzMkKupGWEFv
 mtsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=823JKFFMbJf6ulkXkXX63gNESBJJYaLYVi/qXJ3+b3k=;
 b=E5YbNiNIe4h232s/gWy9WpxTctGOOCM/dE2bRr1j+Q/L+a63TYOTeSzA0/dNRXmLHD
 yywdQe67JC21Xxg50ZkPDup/hEYI+lvaUEzj+0Ge7zEpJSxh8I5TgJ89yVZFj9N3XR6A
 Ti1qI6stRSI4Ybu4gr5wkwCCBjOI9UgQ1plAeS+hKPuW+uy0aX9jRkWJ2ozpgRYrcFrc
 Tcu9y7VcM548H5sLFYPwHQHNvylu2QfnnBmDwJGLvJh08XiuybUG+XBwDeaInIuTz1KB
 XeyU0IOT9qdc6CFog8XyIbxa2c7eUlWwlh0PKlMuXcbJeQCAN4IKhIUy9Qpq2jlifyvx
 y3lw==
X-Gm-Message-State: AOAM5313IU+PQhSO7b5y2QIiXZBG2bty/+PgsgQmy7mvCqh0idUiWtxW
 fvqLqifAM2NlRlkIVWluScD/SxGc32PKyKTQ5x0f2nhY4UBg/zk6
X-Google-Smtp-Source: ABdhPJySAnrvyzI4i9yoNf2GVf5TnnaZX3aBBrvRrSGFZRNofwnetE3OAgLDt5n/jKc6+F39mD/rFHxnL2+TxxTsN1g=
X-Received: by 2002:a05:6808:199a:: with SMTP id
 bj26mr14088286oib.125.1630301256164; 
 Sun, 29 Aug 2021 22:27:36 -0700 (PDT)
MIME-Version: 1.0
From: Lei Yu <yulei.sh@bytedance.com>
Date: Mon, 30 Aug 2021 13:27:25 +0800
Message-ID: <CAGm54UHKKa0sMDMyZateHYhFjfb9BNTgVLPSjKioiy94R4bwOw@mail.gmail.com>
Subject: Questions about certificates in OpenBMC
To: openbmc <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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

This email is about several questions related to certificates
including bmcweb and phosphor-certificate-manager.

The background:
* When bmcweb starts from fresh, it generates a self-signed server
certificate including private key, in /etc/ssl/certs/https/server.pem
* phosphor-certificate-manager seems to watch the above file, and
generates a .rsaprivkey.pem
* When CertificateService.GenerateCSR is called,
phosphor-certificate-manager generates the private key and CSR as
privkey.pem and domain.csr in the same directory.

The questions:
1. What is the relationship between bmcweb's server.pem and .rsaprivkey.pem?
2. When generating CSR, why a new private key is generated? (It looks
like it's the same as .rsaprivkey.pem though)
3. When the CSR is signed, and CertificateService.ReplaceCertificate
is called, what exactly will happen for the keys/certificates?

Thanks!

-- 
BRs,
Lei YU
