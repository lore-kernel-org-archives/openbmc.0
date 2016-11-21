Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x242.google.com (mail-oi0-x242.google.com
 [IPv6:2607:f8b0:4003:c06::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tMgBn1JPxzDvk1
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 18:26:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="zEYDmloj"; 
 dkim-atps=neutral
Received: by mail-oi0-x242.google.com with SMTP id m75so2039296oig.1
 for <openbmc@lists.ozlabs.org>; Sun, 20 Nov 2016 23:26:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=Q90Zv2ST40J1wLokZs/V9BZ42QTLSnuvCCMrYwVjJMc=;
 b=zEYDmlojvQBd76nzBKGDk2V5JXa1YAzRkOfDYzehtoIlEOhNGCN+Y5p1cOtSlIgN0t
 WjVDSXvKY5/HfhizdtawQ45I/poaR8HlIx60d9xuMtDEV3NTDvghyQiClGtPPc2rjAUl
 eWc8C1CMj63OuXWcMRSmih2HPApIWoqI4TGrRuEhHF8LhHso7QKH6YklYhxLZbanFv9B
 +yLtNaC0x4GJnZhsePGDXh5acb4KNDKyRwWdZIF9VpTRog+Ie7drI/FDJAUWN74+kabv
 oumSktROOWm6mx/rWqrJn57rPgpa6b/OsH6pgk7XHujQq+8XTPrJGjDudxOaDuGpVgFt
 8jpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=Q90Zv2ST40J1wLokZs/V9BZ42QTLSnuvCCMrYwVjJMc=;
 b=BxGKXf+fY3hJt7vQJYi6IPWB8Twa6hDagWFEgp0LQFFbAeeE8x8601XIG7lNZEqh9E
 sdElLhYkl5aRlkDKWcxMWbnQrSOgmz4B1+2ZGHarc3spXg6YugNMGKpuh7w+YHk04ZbK
 9r8G4hjZ/zZquUgxQwnM4gRgq6VEnLzOmynU8r4qaZhlFa8i2CSPhSxGnxbFsBtytO4Q
 Yz6fd2fhghzS2ARmZporbt9EATWYIHbS8xW3TpU4PDOO8LlJwUoXyP0jkelQextNaXj7
 cCNQlBlL+Sp2exeDhourPGQqSmXijSzE2VQ03eFvH0LBvqtNHIYN4IbNreH4Selbvtyo
 p87Q==
X-Gm-Message-State: AKaTC00IRgm1v9QpsXb3NrzPSCtCbnKslDCDRF1GlxiRPVpC92aMCJUt9qSCLorYnIfEILil6/spsqm3R78saA==
X-Received: by 10.157.17.26 with SMTP id g26mr7361386ote.230.1479713183443;
 Sun, 20 Nov 2016 23:26:23 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.97.41 with HTTP; Sun, 20 Nov 2016 23:26:02 -0800 (PST)
In-Reply-To: <1479478938-13267-28-git-send-email-clg@kaod.org>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
 <1479478938-13267-28-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 21 Nov 2016 17:56:02 +1030
X-Google-Sender-Auth: XhG4oAf4Q3ET_iCiRjkSi2C3JcA
Message-ID: <CACPK8XfwLoXPru6UNJfZVvZheVc4TvW9OSgjmhUEyKHLSQrbdg@mail.gmail.com>
Subject: Re: [PATCH qemu 27/38] hw/misc: add a TMP42{1,2,3} device model
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 21 Nov 2016 07:26:25 -0000

On Sat, Nov 19, 2016 at 12:52 AM, C=C3=A9dric Le Goater <clg@kaod.org> wrot=
e:
> Largely inspired by the TMP105 temperature sensor, here is a model for
> the TMP42{1,2,3} temperature sensors.
>
> Specs can be found here :
>
>         http://www.ti.com/lit/gpn/tmp421
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  default-configs/arm-softmmu.mak |   1 +
>  hw/misc/Makefile.objs           |   1 +
>  hw/misc/tmp421.c                | 400 ++++++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 402 insertions(+)
>  create mode 100644 hw/misc/tmp421.c
