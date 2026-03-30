Return-Path: <openbmc+bounces-1749-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EFEE1061B20
	for <openbmc@archiver.kernel.org>; Mon, 30 Mar 2026 20:22:40 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fl2jj1Y68z2yhv;
	Tue, 31 Mar 2026 07:22:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::631" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1774902152;
	cv=pass; b=J6fenOOyUby8rpO6p59a2Tg2BKyzlc3RWRSErDELen7y6hDT0tQc/Qduho3d1/ySp6tJpwCK9hirHCnGENbNIDuO7WmKRwh0WxXszu/eki+Zl96x8n0lCmgIr6LMNHJmrbHJTfzTlL/sKsDEzrMM/1XqfRsSZCiXAPkCpltHcV/87sR84FpBSubdgoZzQUxAzKmEf6Z/rB35Mvae1w5c+c4YEfIuiiOKpDabF3Vd3z1z1dNwYAZxSaX61XR4sdaxbn0enO7SV3PkX5MODd9r7wWzOBByHy7WLC2wADaDBa7JgU7dw/zF4Tm0fxr8NkeSMsJ6Dt3cPjn+7M3Ty5SHsg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1774902152; c=relaxed/relaxed;
	bh=V4dQey7h6WI5enffRHdWk1eZzLIGAzbiRl2nIyaUHKw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bw6K1COo50kr2AId1GBxtWNYQ1NmrSmgI9ysYcw84i7wZ1uzl2h8MhIjcde72pzW91YeJJVoFGiqbg6R1SXv2DTlMH0/A7vAYZqL1rX47DoEh4ifb3wGrngI2mDctOM/Rf7Vz7r/gR3nCdfkKaC3TjW5G53eF9p+Cr8btkVXXVgeoujwXJfE98P995lC/u4ywx8S3uECtO4BZLEx7BUH0iYHvqwtYeiJ5fvt4XHpamPazR7Mw3Wxr8xm5kVF8e0cAhKzZc4nFlxikzbfgVPkoXw4Tf9Z5Y5lkVlzsfpIxY3uncSMLyenq1fBsYMNFXEECCrEhg6M3523/9FIdHkZoA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=tanous.net; dkim=pass (2048-bit key; unprotected) header.d=tanous-net.20230601.gappssmtp.com header.i=@tanous-net.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=Qc5L+PpC; dkim-atps=neutral; spf=none (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=ed@tanous.net; receiver=lists.ozlabs.org) smtp.mailfrom=tanous.net
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=tanous-net.20230601.gappssmtp.com header.i=@tanous-net.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=Qc5L+PpC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=tanous.net (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=ed@tanous.net; receiver=lists.ozlabs.org)
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fl2jg0f5Pz2yhX
	for <openbmc@lists.ozlabs.org>; Tue, 31 Mar 2026 07:22:29 +1100 (AEDT)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2b0afa0210bso25153725ad.2
        for <openbmc@lists.ozlabs.org>; Mon, 30 Mar 2026 13:22:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774902142; cv=none;
        d=google.com; s=arc-20240605;
        b=D9PT7dZ9cN/eUY7bEDBRcnPZ5Bk0lkFXwkojlJ8Zb1F27DOT1F2kURarINectQvNzd
         /nEt18JHN4n/khdBDhhqg6MCHPQL4DI1rBUPdT2NsKE52sba+r3qqyPeCxHlsACMA8Nj
         pSLFCkFSIaPB3hbYVGBF2Xq5Om3erAYiXDnv7Ba4S7VVhXZpGOSrAHGl9yvRq2mlzRn3
         hU2w9VrJGmCw39qn2Z3mwpkm2DXX10ofQNCwfQ2RZ0VNOTLakXVjJeIu3BNenMYjrkJa
         VLFKRRGqngin85Od+u2mMKkmqjq7/JOFYmHLrR/UBnlmeiEQMBbiuSDBPjPXrDpRO3QW
         3+yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=V4dQey7h6WI5enffRHdWk1eZzLIGAzbiRl2nIyaUHKw=;
        fh=orpOMUrE2KItWuX9AuYXYWasAtb5g29CLIgZ7SpJeRo=;
        b=gS8LayOwX3qZqJTv8akTxVzq/ise3ldkYE3sgH1hvw5YDNQt1B0vOqIFRauGN6YnYr
         T/eqMS4ZVstI9sc5bNPINWCmgk2mDETCY+TgKOowM9whpoINQz1w6D3UhiMelmGYYCcd
         2kf3x0DR5pcpHgry4zFQB+aia2cf0f2aoKdxuUjfXsQhkagE9/gBgVp+0a6OVfEgIqiF
         okFmUVgpBUYcDLe2FAbOyM0twPXzdIShaPxCXIgCApph2nX/Sq6MCMY4OyBj+Rfcm0GO
         +wdHQIHldbfGbVt3daWnSqt8PWZ5Gojk/1waGB6kEDLLAMCvzxgCbK1tbdifEggIH7o9
         U5fA==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tanous-net.20230601.gappssmtp.com; s=20230601; t=1774902142; x=1775506942; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V4dQey7h6WI5enffRHdWk1eZzLIGAzbiRl2nIyaUHKw=;
        b=Qc5L+PpCeyXH5M0r11CGqht8VJ/nCq6BWHIq8+h9QB0ZTarOUxAykPu1GOWick24n5
         rQKLbAYsZzTL2Y/ttp046fuRDFKZeVl7mgmHiOgAjijcPELyr1Cz0IeQLuNa/470T6A1
         TBbIegcfeXzD0GGrO8w2G+1ksPDrf8dbn9N7HLiY9UzT7NQIY1eYS6vqZiWk8OiunfQr
         KTvCnHT/VVinyxBI07lbPw0cE6CHorzqK+Ujpx5VQ6v5h+Qk9hUK7d0gHPqxWPePfcOH
         FjkVQDDiqHNABCnikriEvvAEzZ01JuZDmwe61PcEAy4vLDMwthbVtQJi9CBHAA1nTjRe
         TGlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774902142; x=1775506942;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V4dQey7h6WI5enffRHdWk1eZzLIGAzbiRl2nIyaUHKw=;
        b=VXuuxkLNKG8KqfZMVFkVozloAHb6WS9GFoOU2tgcFm3eFje51DvApo4ssxYlyQbiMl
         4IsoEBwsfmXszRlCAcEsvjWwo0gCbM03EdTSL4kHlr3XPwCmDPm5FdRLOQ8OeT1Wt6TL
         5V4CvQcQG+IDkEsMn61dnHOAf1m6qVhFnMh5UOFLtsYyc86SuHcBUyuxYX0KXLtC+rMJ
         LhGItLbzdVpCVycXWiae8rA3iy9Vcrle9Ej92DJxxR/e/qtbGE729s4vdD338UDTTJ0y
         wLc7jcQYQog/HJ17fephiEvjq2BD1QhlfRlsCAbdW7SEb/vTo9i2CIEcT1nZOtbzzIKc
         BHUw==
X-Gm-Message-State: AOJu0Ywd6xBUQ6Hr7dj6R/dNq8l8DYgmnRNChZM2OfusO7OL71sVEQY4
	aWCNlb+dIktWcbXbOPKU+cD+SJhBc5bk0yc2mLv/gr+ZTY4spbjHNNNsYcWnruMMIJGdwn0nvuJ
	RzRETg8yczRpCqmUP+sNIukC4WXwIJsSDYudrdNtiNw==
X-Gm-Gg: ATEYQzzEedTnwee7sjmVN8s0U+E15F+pQosC7BOaGzQ3ydoKBToLLiZdGz/V9cJTODE
	/HxYAl0pwIejjRXabQLazrM02MlXP6csQUXGFx8nRmVyBx22azupUGc0s305+FYqsQFmVMJV+0M
	M7L6gmy+3vMNtqbblYq+ARytwcaU+11Za3Y5n9JCU0jVtMunB0ggXo6IfToqvYRMBNavvhtwNTN
	ssKvl5RbXv2DFgcL2AXCG6lsTH2QwbBZaH2R8XlDE5uVm2SVjqYBJLOmqXkvuvi7JUGcFlLmvX2
	ARcuNPENuEVfqcr9RwG+eXpoPOSeuB5gwrGdKtOO
X-Received: by 2002:a17:903:37ce:b0:2b0:41bf:ca83 with SMTP id
 d9443c01a7336-2b0cdcc8106mr138818315ad.23.1774902142204; Mon, 30 Mar 2026
 13:22:22 -0700 (PDT)
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <LV2PR21MB6760A3F8E6E54A1BFC53709FA655A@LV2PR21MB6760.namprd21.prod.outlook.com>
In-Reply-To: <LV2PR21MB6760A3F8E6E54A1BFC53709FA655A@LV2PR21MB6760.namprd21.prod.outlook.com>
From: Ed Tanous <ed@tanous.net>
Date: Mon, 30 Mar 2026 13:22:10 -0700
X-Gm-Features: AQROBzAXTEqtBdKYfOoVled6jvfUNW1dDZHu3gx19TUIbrpDTmVS5-j_WUsuOSg
Message-ID: <CACWQX81SGoXDZLNMV0JS6QCwEpeTCdend9yLZQwg2OXUjkrYdw@mail.gmail.com>
Subject: Re: bmcweb ComponentIntegrity routes for SPDM attestation
To: Gary Beihl <garybeihl@microsoft.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, 
	Thirupathaiah Annapureddy <thiruan@microsoft.com>, Sagar Dharia <Sagar.Dharia@microsoft.com>, 
	Giri Mudusuru <girimudusuru@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 29, 2026 at 2:19=E2=80=AFPM Gary Beihl <garybeihl@microsoft.com=
> wrote:
>
> Hello everyone,
>
>
>
> I have been looking at SPDM attestation end-to-end testing using Renode a=
nd have a working bmcweb implementation of the Redfish ComponentIntegrity r=
outes that consumes the D-Bus interfaces already merged in phosphor-dbus-in=
terfaces [1]. I noticed that the previous bmcweb WIP for ComponentIntegrity=
 was auto-abandoned [2] and there does not appear to be an active effort to=
 implement these routes upstream.
>
>
>
> The routes are designed to complement the spdmd D-Bus backend work curren=
tly in review [3][4], providing the Redfish frontend needed to complete the=
 attestation stack described in the design document [5].
>
>
>
> I wanted to check whether anyone is already working on bmcweb routes down=
stream before submitting to Gerrit. If not, I am happy to contribute and co=
llaborate on getting this piece upstream.
>
>
>
> References:
>
> 1. https://github.com/openbmc/phosphor-dbus-interfaces/tree/master/yaml/x=
yz/openbmc_project/Attestation
>
> 2. https://gerrit.openbmc.org/c/openbmc/bmcweb/+/61702

I wrote this patch in about 25 minutes while sitting in a meeting
discussing how difficult the SPDM/ComponentIntegrity feature would be
to build.  If you want to take it over, feel free.  If you have
updates, please send them to Gerrit, and I will be happy to review.  I
don't know anyone who has continued the component integrity work on
Redfish, so the engineering work is likely yours if you want to take
it on.

>
> 3. https://gerrit.openbmc.org/c/openbmc/spdm/+/80272
>
> 4. https://gerrit.openbmc.org/c/openbmc/spdm/+/80274
>
> 5. https://github.com/openbmc/docs/blob/master/designs/redfish-spdm-attes=
tation.md
>
>
>
> Looking forward to your thoughts,
>
>
>
> Gary Beihl
>
> Firmware Engineering
>
> Microsoft Corporation
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>

