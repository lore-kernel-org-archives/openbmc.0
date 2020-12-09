Return-Path: <SRS0=7Zy5=FN=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EC35C4361B
	for <openbmc@archiver.kernel.org>; Wed,  9 Dec 2020 20:08:05 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 393AA239D1
	for <openbmc@archiver.kernel.org>; Wed,  9 Dec 2020 20:08:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 393AA239D1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Crp4y05c5zDqvK
	for <openbmc@archiver.kernel.org>; Thu, 10 Dec 2020 07:08:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.67; helo=mail-ot1-f67.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Crp3P16DbzDqjn
 for <openbmc@lists.ozlabs.org>; Thu, 10 Dec 2020 07:06:39 +1100 (AEDT)
Received: by mail-ot1-f67.google.com with SMTP id b18so2643924ots.0
 for <openbmc@lists.ozlabs.org>; Wed, 09 Dec 2020 12:06:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1HYLsU5STC7VJ/5b/CCDAd83oFpysf8ukWCgZzpkajw=;
 b=mMgLzmFdG22BEXkBtmTAkhKpGEvRPTPp38dQA2e3qK2lJu9vAI37UmmEdlBNf8Gul8
 2bXfboS4FHKbjaY5P42ja2aDXy5StBBuQXdBn8BpZy7XugwqXT1PQwEMKyVedDYAdisf
 k5ZH1v73NP3/z7WrNGzIuuYdMs5n4HXcCZgfYFQ3ivRT5P5VDhKc46Gqn4hr6IsCVjG3
 U5QioVEY8bjdTz3bvI+NfEMXilQMGbhVKkBfX5OCBX+eKMp/j5Qs2xGn9C1oRFaVMPWp
 CBL8DDUpd3D8viFzEvMXjrW6x7NgnA0FpxQVlP7bvfO1c+jtooNn6ej7FPL3jDIXrqj/
 W9/g==
X-Gm-Message-State: AOAM53069ojx0StLADU4icp7QHqKfxFVYZQwikKSbATk2lNK/HAh/J8f
 lOBk+ZP+FhHnM7bBUGlnyQ==
X-Google-Smtp-Source: ABdhPJxOThJOKUGLNNKnA40U7hoYgiUoo0PMRXTR8QsxpXqzTs5LHfDKWfPAWRI5HkfXBrHXfL6l/Q==
X-Received: by 2002:a9d:6414:: with SMTP id h20mr3238999otl.28.1607544395563; 
 Wed, 09 Dec 2020 12:06:35 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id c1sm585262ots.68.2020.12.09.12.06.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 12:06:34 -0800 (PST)
Received: (nullmailer pid 854981 invoked by uid 1000);
 Wed, 09 Dec 2020 20:06:32 -0000
Date: Wed, 9 Dec 2020 14:06:32 -0600
From: Rob Herring <robh@kernel.org>
To: Kun Yi <kunyi@google.com>
Subject: Re: [PATCH linux hwmon-next v4 3/3] dt-bindings: (hwmon/sbtsi_tmep)
 Add SB-TSI hwmon driver bindings
Message-ID: <20201209200632.GA854934@robh.at.kernel.org>
References: <20201202165601.1532213-1-kunyi@google.com>
 <20201202165601.1532213-4-kunyi@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201202165601.1532213-4-kunyi@google.com>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, jdelvare@suse.com,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 supreeth.venkatesh@amd.com, linux-hwmon@vger.kernel.org, linux@roeck-us.net
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Wed, 02 Dec 2020 08:56:01 -0800, Kun Yi wrote:
> Document device tree bindings for AMD SB-TSI emulated temperature
> sensor.
> 
> Signed-off-by: Kun Yi <kunyi@google.com>
> ---
>  .../devicetree/bindings/hwmon/amd,sbtsi.yaml  | 54 +++++++++++++++++++
>  1 file changed, 54 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/amd,sbtsi.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
