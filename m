Return-Path: <SRS0=Wogq=KW=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63FA7C47089
	for <openbmc@archiver.kernel.org>; Thu, 27 May 2021 23:48:18 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0788B613BA
	for <openbmc@archiver.kernel.org>; Thu, 27 May 2021 23:48:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0788B613BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Frkz46WPVz300b
	for <openbmc@archiver.kernel.org>; Fri, 28 May 2021 09:48:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=cSDGAxeC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::234;
 helo=mail-lj1-x234.google.com; envelope-from=linus.walleij@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=cSDGAxeC; dkim-atps=neutral
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Frkyb3GWVz2xvc
 for <openbmc@lists.ozlabs.org>; Fri, 28 May 2021 09:47:51 +1000 (AEST)
Received: by mail-lj1-x234.google.com with SMTP id t17so3004567ljd.9
 for <openbmc@lists.ozlabs.org>; Thu, 27 May 2021 16:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h2q5bxqiL3RmhUQgZjWS0StDo6w0kZxEVUhgbpPjauE=;
 b=cSDGAxeChyN935ODp1inJLu7l0S13MyTsKIRSsqXOK6cXm+8i2omLijZJqU/JUH6Ah
 D/2OlVMBYcjb+AyQZg7J3MeEfF0BG3Vaugml//5QcemxM/+aFpgZvcLCb0bZfY0IIal3
 R5slk2oWlepD6l/bsYyrxkhjN43IBFyYL25ZFccy1lkZCi1dVZkWlfopwoxaSYvLqHj5
 Bf/dx6Knm3aucrzCINO61otLB0vyjLch4hgNIs2IoH8pmbWm2d5ZHGBinREHNkUXlMVA
 ZSfRBTBsslzQjNbsP+PZSrT3qPiw9bYhxfIrI1mTTzeUPb1fyeFG4n7X/NA0ROkKrpnJ
 T+Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h2q5bxqiL3RmhUQgZjWS0StDo6w0kZxEVUhgbpPjauE=;
 b=Ok1I2+ydk+6C4qCi80piza4pqOxucWzO2RFdTcCF5hncM71oqgGmZ3AsKZYtNCG9E+
 s/QF0blKhTB6PhDQkN9LWDbdy7+t77VdcDEavYx7GqGNGqqYZh7dPVVi/AFXukxDTydV
 hyeynuTg7Ms8RXfTw3MRO3T7XDUpYMy0AnIpOc3y+Wu+83Rkt8faVYyf6rN/ICF4uhXS
 RUcEH+UgHuaXioNIrf39Ns6wYcrmKbzweJ/EsHJMJlsgMQOjePYGVySrOPnh8kUWdPjr
 2RD6U6Bvu5QkhC5ZbiJ8R+JSUJ9k3taaHSc/GvAq01aAdcSnKkQIz5MBv8IIefwB979H
 YpSQ==
X-Gm-Message-State: AOAM532TCUkzf/u8I0YNfmXKw15zDgdNMNrxl3RhpD231MhLIbnho4IK
 Yfy0LPAd5guQcKlIoBKQMIGf8UoLnpxmBMQIYkIsJg==
X-Google-Smtp-Source: ABdhPJzRZIXUM5v0L9y/J3SYmWZlTefoTYzbZzpPJiwkvhwh8H0h3EDZMkqNbakFaetCMO0USRSrvzBmrnlu03IJpJ4=
X-Received: by 2002:a2e:90c7:: with SMTP id o7mr4436100ljg.368.1622159266928; 
 Thu, 27 May 2021 16:47:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210525055308.31069-1-steven_lee@aspeedtech.com>
 <20210525055308.31069-3-steven_lee@aspeedtech.com>
In-Reply-To: <20210525055308.31069-3-steven_lee@aspeedtech.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 28 May 2021 01:47:36 +0200
Message-ID: <CACRpkdZy0UwaJcYTiM9asVwNh4wuEYdMSrmqAPAiikbrvjtKpw@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] ARM: dts: aspeed-g6: Add pinctrl settings
To: Steven Lee <steven_lee@aspeedtech.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>,
 "moderated list:ASPEED PINCTRL DRIVERS" <linux-aspeed@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>,
 "moderated list:ASPEED PINCTRL DRIVERS" <openbmc@lists.ozlabs.org>,
 open list <linux-kernel@vger.kernel.org>,
 Billy Tsai <billy_tsai@aspeedtech.com>,
 "open list:ASPEED PINCTRL DRIVERS" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Hongwei Zhang <Hongweiz@ami.com>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Tue, May 25, 2021 at 7:53 AM Steven Lee <steven_lee@aspeedtech.com> wrote:

> AST2600 supports 2 SGPIO master interfaces and 2 SGPIO slave interfaces.
> Currently, only SGPIO master 1 and SGPIO slve 1 in the pinctrl dtsi.
> SGPIO master 2 and slave 2 should be added in pinctrl dtsi as well.
>
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Please funnel this patch through the Aspeed/ARM SoC tree.

Yours,
Linus Walleij
