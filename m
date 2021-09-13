Return-Path: <SRS0=dV0T=OD=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12862C433EF
	for <openbmc@archiver.kernel.org>; Mon, 13 Sep 2021 12:19:24 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A7DA60F58
	for <openbmc@archiver.kernel.org>; Mon, 13 Sep 2021 12:19:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8A7DA60F58
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H7QWt0WWCz2yM4
	for <openbmc@archiver.kernel.org>; Mon, 13 Sep 2021 22:19:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.50; helo=mail-ot1-f50.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com
 [209.85.210.50])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H7QWJ5Hmpz2xtT;
 Mon, 13 Sep 2021 22:18:50 +1000 (AEST)
Received: by mail-ot1-f50.google.com with SMTP id
 i3-20020a056830210300b0051af5666070so13002338otc.4; 
 Mon, 13 Sep 2021 05:18:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=QviKwU9E32B1NHqI9WCd3jJH00Se8iBU33oRL7KYCVI=;
 b=Vl6WRt1l5woCTrvDGRlV3vMuK/N14FjAXg+UsdN16Fh5X2/SZWlXCLqqlC9UOX3pGx
 /OdSgooEYxikew/xY1lCJumGJHdxK/6GYwRXFI5/TVP32Ihoji9B2D9P2dfbDuNb9jjW
 ChM2F/qULh4iB1qz74LQn6qisZkgzdUl5WDyczyWYlgj0/0537wyzYvSnpbhmb+A1nzC
 TyzsKwcX3qwPwEKPvhC61X3QjAnbYrllow1+sAMLsVq/d1t1o9USY9Vea0Btr1myGYMu
 +vw2nU4O3pq/YMaElujR9s+nzYy+1w3xNNxnJWpbf0S4NTtILEqOGH9Cl8Z3nOIaI1J9
 /1RQ==
X-Gm-Message-State: AOAM530NSomZ6lbDCx64uVMDPSumpgOc8qPFkmIBWx6nir7GJSAWz++/
 gO6er4WYNDZ2Gla8yNOl0g==
X-Google-Smtp-Source: ABdhPJzMsElTnZR96Stl0Jidt4vyTF4mY6gkVe/sRFOau/+qhl1NPc8J930JqDDSM8aDFfgq6rLrHQ==
X-Received: by 2002:a9d:7cd7:: with SMTP id r23mr9250801otn.165.1631535527526; 
 Mon, 13 Sep 2021 05:18:47 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id k8sm1791521oom.20.2021.09.13.05.18.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 05:18:46 -0700 (PDT)
Received: (nullmailer pid 444719 invoked by uid 1000);
 Mon, 13 Sep 2021 12:18:43 -0000
From: Rob Herring <robh@kernel.org>
To: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
In-Reply-To: <20210913060231.15619-2-chiawei_wang@aspeedtech.com>
References: <20210913060231.15619-1-chiawei_wang@aspeedtech.com>
 <20210913060231.15619-2-chiawei_wang@aspeedtech.com>
Subject: Re: [PATCH v4 1/4] dt-bindings: mfd: aspeed-lpc: Convert to YAML
 schema
Date: Mon, 13 Sep 2021 07:18:43 -0500
Message-Id: <1631535523.196891.444718.nullmailer@robh.at.kernel.org>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, andrew@aj.id.au,
 openbmc@lists.ozlabs.org, yulei.sh@bytedance.com, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, osk@google.com
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Mon, 13 Sep 2021 14:02:28 +0800, Chia-Wei Wang wrote:
> Convert the bindings of Aspeed LPC from text file into YAML schema.
> 
> Signed-off-by: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
> ---
>  .../devicetree/bindings/mfd/aspeed-lpc.txt    | 157 ---------------
>  .../devicetree/bindings/mfd/aspeed-lpc.yaml   | 187 ++++++++++++++++++
>  2 files changed, 187 insertions(+), 157 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
>  create mode 100644 Documentation/devicetree/bindings/mfd/aspeed-lpc.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/mfd/aspeed-lpc.example.dts:30.35-36.15: Warning (unique_unit_address): /example-0/lpc@1e789000/lpc-ctrl@80: duplicate unit-address (also used in node /example-0/lpc@1e789000/lpc-snoop@80)
Documentation/devicetree/bindings/mfd/aspeed-lpc.example.dt.yaml:0:0: /example-0/lpc@1e789000/lpc-ctrl@80: failed to match any schema with compatible: ['aspeed,ast2600-lpc-ctrl']
Documentation/devicetree/bindings/mfd/aspeed-lpc.example.dt.yaml:0:0: /example-0/lpc@1e789000/reset-controller@98: failed to match any schema with compatible: ['aspeed,ast2600-lpc-reset']
Documentation/devicetree/bindings/mfd/aspeed-lpc.example.dt.yaml:0:0: /example-0/lpc@1e789000/lpc-snoop@80: failed to match any schema with compatible: ['aspeed,ast2600-lpc-snoop']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1527193

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

