Return-Path: <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CEB4D59D7F
	for <openbmc@archiver.kernel.org>; Mon, 25 Nov 2024 22:40:44 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xy0z26zQ2z3cVS
	for <openbmc@archiver.kernel.org>; Tue, 26 Nov 2024 09:40:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732517969;
	cv=none; b=UHQVnaw05Bri8bNzTlRpb5I2SPFt+TWPz7M9F0MbkqkYlQDPDqNKQtXayK6sT0vM3aEvuZyciRkBiNtM720q7A+tZyANV74gaTiMl3SmkfUpqVHB/M/JaNKP3bTDv1eqHK5PbBZMH4NCIZvXxi4PtyZPou77KTkYxSHvM5N9VRjbB1779/5cpT0ba/tl6ubR3VUEaIB369dJGi18zP/cw9ttjuI4gPmFQw9Wbg+YTLPqhT/0OxaMfyamq1ir3ml7I3XNEMK+QsmGRhGcaMM5c6D9qWjNKw+lSeB5U0pkdn0L3hkJuc4lrlEvEkMuB8A9sy3pC2X/j5lfCtIxu3Ylfg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732517969; c=relaxed/relaxed;
	bh=PqcyyAv2i0PkJrduNO2hdcJKVmr0nOG+uIypgYM+ZxE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=AIdOBAo5uLCSjz7SvCpvNPXdIeVgHO6lw2QaWHvBh2ShYyT2/1PGPqd8dEmo2QjTnFitKHGErn8+U7gtrptufeJIMMesFw9N2yW8OYcR94D3qrAKJxVmYghN9NnPwqeviNTOhinROEYvppAl1bUr+1jGOeMtdsWjoGzsl94bG01HvrQ9v+fvAYeBeJXKX7fS9/QMgpMfSWl5Z0JkRZ3yqiFCs+KvFj3aDzo8yuYYD022gaX47c2IsWnLRm8M42i0smd8kv4XirRj2eC4WGWtziiuIvvYWAFW3VHYbq2kgNPLG+18OOpV43Qj+mt5Y/dsq4l4ZjgwqdMruBHWWClghg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=j1LsTmu5; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com; envelope-from=jack738847@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=j1LsTmu5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com; envelope-from=jack738847@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xxc5C0htbz2xxt
	for <openbmc@lists.ozlabs.org>; Mon, 25 Nov 2024 17:59:26 +1100 (AEDT)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3823cae4be1so2504260f8f.3
        for <openbmc@lists.ozlabs.org>; Sun, 24 Nov 2024 22:59:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732517962; x=1733122762; darn=lists.ozlabs.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PqcyyAv2i0PkJrduNO2hdcJKVmr0nOG+uIypgYM+ZxE=;
        b=j1LsTmu504pi126hsqsVzROHVJJ67hELVkLBRBDalhcLVutjgamD4i8muKVSHEzZPc
         6H6GFao4l3vM2qf8eBumbq/+0oSjiT1D2RzV8GTTEDgAQhcntm9AlV6PhALLj8WwAYCp
         n922A2pf1TdxA3BSRa+mJDU7zYjzMj78kJaxUlZ65TCF9KjDuwMaIDn5JNAp5YzQTi78
         NoWgqUBCyVsURbWl+oU9Kk3IZPr/ZKzSl8wj7d7azJSI1A9AvAPccmaZf5pRpXP9DNZD
         By2yO+Ambt4ZxFxmWQ/J2Cabs819ZAJ7TOcO/f4kWYGch3eQcMaBFTVxqMddeXnI9dc/
         ZDQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732517962; x=1733122762;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PqcyyAv2i0PkJrduNO2hdcJKVmr0nOG+uIypgYM+ZxE=;
        b=PSz4BBwK/V2NDjkKrQlif+BdNaj0Hzo3H4SPHseefLaZnFwVV6egQvXPuFGZ2otEdG
         c1N2OI6JM6gHb+SjtEGjtC68eyJrBrRHJNQlWbUiYpGQrbtL64LHyDs6njazTh3TdMuI
         d1oCdsGhkkdxOyMt8bEsJRNaK7KU1x0keF06iCdNWOp23eeTjHOne0x8VPSi/ShRxe4f
         hJsGcZuO+fQUTab0amoNl9i57rLMvuZ2n2D87FqiwFa26yH77AP0VIBYpKh6mgMnwFzK
         0vm/hAaCpp+ZwKWmJ4WqlKHXLYWhrZ73ENqF4PNLZ7I8J/Q60VZakiQU8oe8xJstHvHe
         ZyHg==
X-Gm-Message-State: AOJu0Yy8U6ePKhHNhzHtFhxbo0/jHvkvHVuAlEPldRaSQ04619AJVAbF
	6H1p26dqjmGfbiGuzrMA/FycfnGrh9tqAlHcfCQgsPfIyMPRmlanbC369kHaeP7p8U8kmwRe9XZ
	cXieJ3ZhHTgXvkyYbZ9g9TSgzEE9X4tg=
X-Gm-Gg: ASbGncu5GBoDw9GnEpMXnx2sBMYMVEKnpcmkbbgEL/vr1UUTvIWLOxCJ2Au0dkd6JW/
	UIkCmSt5H6UHOkSIMBOg0zNqO+A==
X-Google-Smtp-Source: AGHT+IElYJfVxhNktQ0Yrt7+qdUHPVZMDTEJMK+AMRtXe/JwekQNDOE2CgoRjuW3t5STpLjtuaCyfTnc1WVXBJKuAI8=
X-Received: by 2002:a05:6000:1887:b0:382:5284:989 with SMTP id
 ffacd0b85a97d-38260bcdbc5mr10545654f8f.46.1732517962001; Sun, 24 Nov 2024
 22:59:22 -0800 (PST)
MIME-Version: 1.0
From: Jack <jack738847@gmail.com>
Date: Mon, 25 Nov 2024 12:29:10 +0530
Message-ID: <CAKMbc5vCGEaR3rLn0+3kqyEhj02i+o9ceF61i3LOuf1huz1vXw@mail.gmail.com>
Subject: Fetching Bios Attributes on BMC side.
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000b133610627b745b8"
X-Mailman-Approved-At: Tue, 26 Nov 2024 09:40:28 +1100
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
Sender: "openbmc" <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

--000000000000b133610627b745b8
Content-Type: text/plain; charset="UTF-8"

I'm working on remote BIOS setup support for *intel based platform*.
In my case the BaseBIOSTable attribute is empty which pldmd is responsible
for populating this attribute.
I taken property of BaseBIOSTable from busctl utility where it show
*"a{s(sbsssvva(sv))}
0"*.
The *0* at the end of the output likely indicates the number of elements in
the array (a),
meaning that the array is currently empty or doesn't contain any entries.
So what should i do if i want to take Bios attributes at BMC side & also i
did'y find any .json or xml file in BMC side?

--000000000000b133610627b745b8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;m working on remote BIOS setup support for <b>intel =
based platform</b>.<div>In my case the <code class=3D"gmail-inline">BaseBIO=
STable</code> attribute is empty which=C2=A0<code class=3D"gmail-inline">pl=
dmd</code> is responsible for populating this attribute.</div><div>I taken =
property of BaseBIOSTable from busctl utility where it show <b>&quot;a{s(sb=
sssvva(sv))} 0&quot;</b>.</div><div>The <b>0</b> at the end of the output l=
ikely indicates the number of elements in the array (a),<br>meaning that th=
e array is currently empty or doesn&#39;t contain any entries.</div><div>So=
 what should i do if i want to take Bios attributes at BMC side &amp; also =
i did&#39;y find any .json or xml file in BMC side?</div><code class=3D"gma=
il-inline"></code></div>

--000000000000b133610627b745b8--
