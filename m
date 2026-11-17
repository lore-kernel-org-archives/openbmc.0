Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3601D606A31C
	for <openbmc@archiver.kernel.org>; Tue, 17 Nov 2026 22:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N0OEanuk
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jTfhW4VrSz2y2B;
	Wed, 18 Nov 2026 09:35:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1794924059;
	cv=none; b=SQOodEBUsWW06rXLV9tr7h23u45GSNpxp2BoFMq1XjU97tkBqjt1F/dJt+OLKplMBd7NB+YAYHyxBLzESjCIRPiW8t+V/OL9x+3K++OQtvDldoxa7mQXix0i0D+pxLZgLQCQ+RrPRyzT4tQg6/yp+rAXcYlm22cHRmGWUoKbrVJr6+GsdOtrPmDnfik9Z1RwJugk/hHf6M2/OYtT8IZlyOxW2OjBiPeXIpChmbSG4F4JEq9KMayslwUJUpsPaCys8UYdV3eAaubNpoqlHklpOdcT5OFvg0brYEH1YqNG9i74PyVWZ/R9+JcRwjn+dgTPUwsEzYh2G3Yg2wq5iCnd0A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1794924059; c=relaxed/relaxed;
	bh=1n4akinMU4Hf+AOUS7LX8ylkG85tkNf4WcZP+gMfH/E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qe3fb4KSK4GqPwsdvHspVE/Cqf4+7larmz4H6248qFBYZFG0PnbgC2Cwhvzs0eIhzcmRkhO5c3XNzxKmViXSL59y7zZF7MNIdjBT1mN/HrsU877wKAjt5jqiJO5CzXBPnS3blGRfNfpO20mmqZcc2gfNR8lDqDLxoPd0BYD9mSZO2syyz0KypjoZjTc2LGzOabvsJN9E4BEcXyPgw3IlfN7jq2aUvwFwJbY2np8klEjR+76OmS+vTRpBdU0g/gjen1TxTPbH36S4q7tB6GGjYICY4VkQrI3e/ftPOywIba+R3Y1uly2etrdOvd5rFtaQKCV9xvX/dVChYQ9V17jilA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N0OEanuk; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=linusw@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N0OEanuk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=linusw@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jTRGL5BMXz2xl0
	for <openbmc@lists.ozlabs.org>; Wed, 18 Nov 2026 01:00:58 +1100 (AEDT)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 177BE430C7
	for <openbmc@lists.ozlabs.org>; Tue, 17 Nov 2026 14:00:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F38381F000CC
	for <openbmc@lists.ozlabs.org>; Tue, 17 Nov 2026 14:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794924057;
	bh=1n4akinMU4Hf+AOUS7LX8ylkG85tkNf4WcZP+gMfH/E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=N0OEanukXS6Mm9KTxE7SL8DxyX/MI0H/vbjirpu+EOJm3uRyP10i10RM03japU4sd
	 S8em5UDMgAqF3ZDHfpH1WJ+unNr8U4+QaoqU631+jFWK54v1LM1ZMXeiV+3S0oqAYd
	 LCaR3EuXIefsHGzJVwgsxWlbY+u1B7zw4tZqe1Jyy984WmpJFaHWCIuqiA7guWxW+d
	 U3r6OkBn2mbKRSCZZP28Fv37+ALd7EE9Pb39iIg1ccXfX13iaNM4AXULnC2Dfg9p4y
	 E0Cfbhsu4NWDndPrdhr8EVT4aGUZaYTddUw3lAhPYPz0hBANOFSMBh2906frfV5dpm
	 AYnohD2AseUuA==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5c14f7768acso3800433e87.3
        for <openbmc@lists.ozlabs.org>; Tue, 17 Nov 2026 06:00:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErElrro09Qx7F5NiCo7jLRDG0DyMyKS7xbFSWisZxTi855IPJxRl/+bMfwyF69/YcsqSiFO3lv3X@lists.ozlabs.org
X-Gm-Message-State: APuU4Z+fBQ5+sXy7FbgHJSoHQDB+bmsdxuiNyC0oDo+E31ufReejCukb
	4q+phLomJCy68VefgfMLKxXw6+ePg0/Kokvblw9cxbDYarx6gGvZCbkVPjzwP0BzZSew/tszKgB
	/ey2gu+l0HZd+0Q9aBZ/3w5sNcNzlVDA=
X-Received: by 2002:a05:6512:3a96:b0:5c1:4e4c:359c with SMTP id
 2adb3069b0e04-5c1709c44cemr4959950e87.36.1794924055639; Tue, 17 Nov 2026
 06:00:55 -0800 (PST)
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
Precedence: list
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261107012236.28069-1-prasanth.padarthi10@gmail.com> <20261109035633.93522-1-prasanth.padarthi10@gmail.com>
In-Reply-To: <20261109035633.93522-1-prasanth.padarthi10@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 17 Nov 2026 15:00:43 +0100
X-Gmail-Original-Message-ID: <CAD++jLmNSdgJPG_8dVKBLxN2ewvYJm99S+32SyKj_psa0DX53Q@mail.gmail.com>
X-Gm-Features: Aa3M54pM4N8FrMarps7ie1VxRtJp-XfzSOJDJp1i6ICkP2NWqZ4utwFMO5THjsE
Message-ID: <CAD++jLmNSdgJPG_8dVKBLxN2ewvYJm99S+32SyKj_psa0DX53Q@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: aspeed: Use managed pinctrl registration
To: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Cc: andrew@codeconstruct.com.au, joel@jms.id.au, ryan_chen@aspeedtech.com, 
	billy_tsai@aspeedtech.com, linux-aspeed@lists.ozlabs.org, 
	openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 9, 2026 at 4:57=E2=80=AFAM Prasanth Kumar Padarthi
<prasanth.padarthi10@gmail.com> wrote:

> The shared Aspeed probe helper registers its controller with
> pinctrl_register(), but does not unregister it on device unbind.
> The registration can therefore outlive device-managed data.
>
> Use devm_pinctrl_register() to ensure the controller is unregistered
> during device teardown.
>
> Fixes: 4d3d0e4272d8 ("pinctrl: Add core support for Aspeed SoCs")
> Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
> Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> ---
> Changes in v2:
> - Add Fixes trailer.
> - Add Reviewed-by trailer from Andrew Jeffery.

Patch applied as nonurgent fix.

Yours,
Linus Walleij

