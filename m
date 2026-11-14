Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912E2606A323
	for <openbmc@archiver.kernel.org>; Sat, 14 Nov 2026 18:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RAuiaFJG
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jRj3t0fj8z3c7b;
	Sun, 15 Nov 2026 05:15:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::b132" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1794680153;
	cv=pass; b=ZwUzRwJLfub+KshyrkmMWpPd7zGUSYF29BydWGQOB8vwxil3SMREUewgE1Ud/9doMK6NGUodu6sZZq1SslYVfJy0v24tdzQ3bdyvSKW/8QbyjvWgeca4z21TzJyRHzPTZTpu+mHF8xHk09GF+FCIRRpQJt+A+f8FufdTL7oVWkGdfxXA4JofO30YQOYR14PL6m1MT/R9hrr55s0PSMNUIGWLBxRG16DcAfQYCbJvDEi1Z7KmX/qQgakz7BCNEdgCAea7qDNPo03dFK5uNr4Vl3nxdZ+tlnqkaYPlWtmKnbTXSQbxM9D2SoEf5Jkxf5h4WBPLtxOLAHgZ28wNN/TYGw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1794680153; c=relaxed/relaxed;
	bh=jhG2jterp4LepruA7vfcIa4Bv0JmGQ/v8B3fUzIaejI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=BlGQ+SM5b8y+XBgUSi/KtNlCnns+Sf+s3f/hAsPMRnCTk9tA1CkbyDu1st06VQqkTAt2GrPINqjdjuBGF0suXW2Iv8h3eCCDeCaKPvCfDO63R3dMeUGZ+keiwW1GYQDkIYsTgNwT3wcbBCdo4FNb6+9DlY7RzDSTKvnkj4jae5m8BUzRICrix7a2fKA9vtQ7QG/XgckdxVKSkAMYm5E9RP78QixBU9qozskTIQ/uNQi8vK9taHzqSu895ngJ5YKL4uAowo3n1KRmrzYBQ4723VTMC3OLqBxCWOg5FKTaW4wuRmiBMfKUEDHlraFxoSbBjlaSZtGCAFXqXgzR4srM3w==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RAuiaFJG; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b132; helo=mail-yx1-xb132.google.com; envelope-from=prasanth.padarthi10@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RAuiaFJG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b132; helo=mail-yx1-xb132.google.com; envelope-from=prasanth.padarthi10@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yx1-xb132.google.com (mail-yx1-xb132.google.com [IPv6:2607:f8b0:4864:20::b132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jRj3s1Ldwz3c55
	for <openbmc@lists.ozlabs.org>; Sun, 15 Nov 2026 05:15:53 +1100 (AEDT)
Received: by mail-yx1-xb132.google.com with SMTP id 956f58d0204a3-67be5d0e9cbso1311432d50.3
        for <openbmc@lists.ozlabs.org>; Sat, 14 Nov 2026 10:15:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794680151; cv=none;
        d=google.com; s=arc-20260327;
        b=iXQLZa90BE8zHX03NjqRRlaxQcI6Oe/MqSzzTpjPw2CNlkkJbTqGkxfM4AaTvkkW4a
         /WNgk0qfxvz2kQZsbsUAFNuNs4n7m5NKBMlRHWQEPYTqX5WR6P54yEbA1d+Q8+uZ0PxI
         3E6tWOCANsFd496du5Yev1h/a4jXI0rFbmdBCcuIHzXsLHe9mWcQHSRpdrugs6hDzgiL
         qVRCQlM7CDl/gxE1yG3QaVADyjVYFXrsBQ59bB7hHHTgmQnT8XKC1f8KRX9b9IB44WTb
         7yxlsVuLojWspMA6D3PieX5McYXjm1fQDdpPtRsgQMJJQGQP3cNqXV160AGSk0zJMlC/
         xSRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=jhG2jterp4LepruA7vfcIa4Bv0JmGQ/v8B3fUzIaejI=;
        fh=gFKNMqGUlAytHKLCQaxrCzbSkChyDJlccgGF8K0xBwE=;
        b=rTaui7ZJec9BeZUDvvAsZo8rdk9fZFG3JkBq2n4eW2H4mgAr6LtsL4h+RgEmevmK8l
         o1eB8TatCN+sz+KQbxGFWkmyRPkP3AJvdR66nh9AJ8YqunqYGrOB4Gab8c0gqM6YZAnO
         ZNfYG4altGyTA/Vs4kjNFwfU+FMDhQufheVqYATq0nvYX5yRxxl9CXEQXQzKG4s+MOBK
         B5KqkXTdzAmjTTr8e6G5Au+RXfa6XUSTGrykGaWGza6Ks4m69kaPnVztlo5XdWbDx78e
         g99YNYWwI11JW+4r1RQuIS+sSBSqXNH4YpGRVq+cHw2h4t2L/y7kCId7N9hD/nVOtjZr
         N2Ag==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794680151; x=1795284951; darn=lists.ozlabs.org;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jhG2jterp4LepruA7vfcIa4Bv0JmGQ/v8B3fUzIaejI=;
        b=RAuiaFJG1EmynoQZYko6T7yrgr7yXFFhd3UqPCUuvDXacpkbEYF3zCy0W0UNyVb47W
         VouuJsw0HN1dO9JAswpwkhqLrGR6sb0zXqhw5n29c4RZoosVs/suFlXxryoJqtX9dmvZ
         izxiPRe9tR//qu1+WsxHX1x41Mqb7PCYQvgTKdrtW87rRpq3OVprhhr/f0gjjt9nITRD
         AQfiNPDnEBu+5TNoEDeuqzmXDCkw1pLKPld0Rp2mMCf6oUkVGmK3r9fUhHDa3xKvI8+x
         uuu7Ln8A3QVsmcQiq0A0Av7laKzV5/XrArSjZdE7XhLhygkdTLv/2PuHZ0lBSr9clOR5
         Rvig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794680151; x=1795284951;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jhG2jterp4LepruA7vfcIa4Bv0JmGQ/v8B3fUzIaejI=;
        b=MBJrxHnIdXAYbn6Gu84CHExQpKGyexVkDs9AI+DtmFeumMZQwG0rydYKZhn99WDfQS
         AtaN1+rIL8KWKzxQ450J9U1+3dC3PqX5bJabOPYaPtnwSz8drZovPTCG05DnwgOTuiOo
         fXuUYpkk89iXJDJnTTEoFm+Gr6xIaBO0rfC7tCln8DX+nVrcGlW/qzAtZ1+85cQeCwXC
         Pwscy5rSJrtIYnsTSZ4k9DcjFrZv72N1WSkv0mXpwTYRJ/ZTZ0CZhKVUx6TmcmvsXgaj
         eny2EBr1WUTsyG62H9OCWViAyXd1USvEkGvM1bO0TVN+/OK0in0XMAYpeRI+20rvzw2s
         XGGQ==
X-Gm-Message-State: APuU4Z98WAA7GpNb/luSZ2SLMpG03SfqEsVoXY7AeCl91x7jWy2sTvEx
	/ijn6nsrQZKJrjU6yw+3smx/X3fSN6YxrfTedCWlWjSVbXnZUMZtjvdl6FwevcY8A39ghswSs/q
	n4s5duEP+KjjE3/FLMXBIokT3HtE3cLMjd518
X-Gm-Gg: AYBFou0Jcf/riUrhn4xlTb9a/ntG2kyBs2L9z4QXKD768RJkNtwkAadryAo+/NLJfjz
	piMV6jAp7bowjg2hr+iwNmTJKb8HseUf7cIVpJTyW8oLM+xGPbz4DS/ZdKYxZp57nQbdg1LUIQl
	F/b8ELI3ra1/O9KYHkph/FyeFVUmyp6ivMy+3KsvZkE71E4v3sTUYe8yJ5k4Szi9V5BajMp2nCK
	2+Xzt8vnbL0NOFiCNJwsGxzJd88mC9IM7DsQ2FltJ66w8uOf2q421/aGuf2Ar1wQ/NUNN1mDbCP
	Qd7PVPRoDSXcXIV+QH1R4zS2D/irJDQLvsCFZFJTcUXfe60/hG3aSiE6qtPb638M0GYGQgS6eg1
	HZfjjwR3wzm5ONdiBSLNPXebfiNsjMLj2DVLOOw==
X-Received: by 2002:a05:690e:a47:b0:67d:a95e:27d2 with SMTP id
 956f58d0204a3-67da95e2a0emr296698d50.84.1794680150503; Sat, 14 Nov 2026
 10:15:50 -0800 (PST)
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
From: Prasanth <prasanth.padarthi10@gmail.com>
Date: Sat, 14 Nov 2026 23:45:38 +0530
X-Gm-Features: AclHuK8KfhloOyWA2DTWaNDXzIj2X8exqc5QXhHkbzPciZPJlFDCfY2AyieEpBs
Message-ID: <CAMFFDGi2K2uFa-UW7Vosu4ezB+h4nUknSo+yyo0MbR5VmmfBVA@mail.gmail.com>
Subject: Request for remote presentation: OpenBMC bring-up on ASRock Rack B650D4U
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi everyone,

I would like to present my experience independently porting OpenBMC to
an ASRock Rack B650D4U motherboard with an AST2600 BMC.

The proposed talk would cover:

Discovering board hardware mappings from vendor firmware and UART logs.

Preparing Linux and U-Boot device trees and booting a custom OpenBMC image.

Bringing up host power control and debugging the AST2600 GPIO
passthrough interaction.

Current limitations, validation results, and upstreaming lessons.

Proposed title: =E2=80=9CBringing OpenBMC to an Off-the-Shelf Server
Motherboard: Lessons from the ASRock Rack B650D4U=E2=80=9D

Would a 15=E2=80=9320-minute presentation, followed by questions, be suitab=
le
for an upcoming OpenBMC community meeting? I am based in India and
would participate remotely.

Please let me know the appropriate meeting, scheduling process, and
whether an outline or slides are needed beforehand. I can adjust the
duration to fit the agenda.

Thanks,
Prasanth

