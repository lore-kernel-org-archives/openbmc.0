Return-Path: <SRS0=Cph1=GN=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52F52C433E0
	for <openbmc@archiver.kernel.org>; Sun, 10 Jan 2021 17:20:51 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84EF322B2C
	for <openbmc@archiver.kernel.org>; Sun, 10 Jan 2021 17:20:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 84EF322B2C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DDNsB4vq7zDqMb
	for <openbmc@archiver.kernel.org>; Mon, 11 Jan 2021 04:20:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.171;
 helo=mail-oi1-f171.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com
 [209.85.167.171])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DDNq310qBzDqLc
 for <openbmc@lists.ozlabs.org>; Mon, 11 Jan 2021 04:18:53 +1100 (AEDT)
Received: by mail-oi1-f171.google.com with SMTP id d203so17758678oia.0
 for <openbmc@lists.ozlabs.org>; Sun, 10 Jan 2021 09:18:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=0atvGl4wyF8gi+A5MyTDj8dXxWkRMttxRAM1sDUE6l8=;
 b=gl0PalHET2b3V9axWzjH4LJQ7aMG3aRIuQWCaMzE3aHk5kBoDMCKZt0oiLvEIw1dyA
 w5VT7bu0/TiT5luaDxyKZpaATOSlE8yUZKwTIYXMH7NiZAMqqvrzJSv2ASXZ5hAa4Jgn
 vLhC6SFvZMPZaWDFlV/Wr3E6NXobmgm4UvJ4qOVmBQCGhdrRChGO/ssmYBiZ66Tt+no5
 +BgFbJEr15BkFDUF/2rHh/Y52VGCnN7dXu05l/Gu95H7q+FiJfQAo1NP5fjCf7TT3Qre
 9FH+1ACPopLoBUtT5FUpRYafU2jmHcDEJ3QEO5B64NpIXpDfI7BTgNQP/jNdnreX4q9R
 Kg9g==
X-Gm-Message-State: AOAM531Y+Ys9orOHbW6Wdf9rjXCdKSAXFMbW8Apb1n9OOhwrj6fHWGQJ
 1/i7HH79FMTVZ55lIYDlGA==
X-Google-Smtp-Source: ABdhPJxNu1nnwAhVK/0IWOQRUYRUBa7d2NcHd/qwEnyubX3gyHaAdZejLXM3kxeqo9P6SAVOH57WwQ==
X-Received: by 2002:a05:6808:b26:: with SMTP id
 t6mr8361584oij.169.1610299130054; 
 Sun, 10 Jan 2021 09:18:50 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id o135sm2827330ooo.38.2021.01.10.09.18.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jan 2021 09:18:49 -0800 (PST)
Received: (nullmailer pid 785277 invoked by uid 1000);
 Sun, 10 Jan 2021 17:18:46 -0000
From: Rob Herring <robh@kernel.org>
To: =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
In-Reply-To: <20210108224008.705687-1-j.neuschaefer@gmx.net>
References: <20210108224008.705687-1-j.neuschaefer@gmx.net>
Subject: Re: [PATCH 1/2] dt-bindings: arm: Convert nuvoton,
 npcm750 binding to YAML
Date: Sun, 10 Jan 2021 11:18:46 -0600
Message-Id: <1610299126.020227.785276.nullmailer@robh.at.kernel.org>
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
Cc: devicetree@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Tali Perry <tali.perry1@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Fri, 08 Jan 2021 23:40:06 +0100, Jonathan Neuschäfer wrote:
> The general trend is to have devicetree bindings in YAML format, to
> allow automatic validation of bindings and devicetrees.
> 
> Convert the NPCM SoC family's binding to YAML before it accumulates more
> entries.
> 
> The nuvoton,npcm750-evb compatible string is introduced to keep the
> structure of the binding a little simpler.
> 
> Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
> ---
> 
> If someone else wants to be listed as the maintainer, please let me
> know.
> ---
>  .../devicetree/bindings/arm/npcm/npcm.txt     |  6 -----
>  .../devicetree/bindings/arm/npcm/npcm.yaml    | 23 +++++++++++++++++++
>  2 files changed, 23 insertions(+), 6 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/npcm/npcm.txt
>  create mode 100644 Documentation/devicetree/bindings/arm/npcm/npcm.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/arm/npcm/npcm.yaml:20:13: [warning] wrong indentation: expected 14 but found 12 (indentation)

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/arm/npcm/npcm.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/arm/npcm/npcm.yaml#

See https://patchwork.ozlabs.org/patch/1423975

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

