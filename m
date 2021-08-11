Return-Path: <SRS0=4HNa=ND=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C77B2C4338F
	for <openbmc@archiver.kernel.org>; Thu, 12 Aug 2021 01:37:48 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 329056101E
	for <openbmc@archiver.kernel.org>; Thu, 12 Aug 2021 01:37:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 329056101E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GlTpL4NMLz3bXS
	for <openbmc@archiver.kernel.org>; Thu, 12 Aug 2021 11:37:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.214.173;
 helo=mail-pl1-f173.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GlHvV4jvGz3022;
 Thu, 12 Aug 2021 04:11:34 +1000 (AEST)
Received: by mail-pl1-f173.google.com with SMTP id f3so3748889plg.3;
 Wed, 11 Aug 2021 11:11:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1A9gzdbnn58lRehU+hUclDHaFNwYQNoEsi8rcFLZjN8=;
 b=m5NmHqpXW8x5o8qlAc0H4Mq9o46Vbz/6D0wVm+2Gk/8y0oCTu2t/kdIVM1BrpU7/ZR
 /sPcOLDYA6x5a+BANa1hf217pI8UIJ0r9M1lqVVaW+CgzMZ6b9r6te1haIHoopZKRVgv
 JDSttyH9EiUEtCmGPeatkIhk65+Qz+1U83ekiAKZ5WFlvD8dIsGVCAf2pWl2wQZ3Xngw
 oTUsbTOAZGdklY6ilaH4NyJX9ZrP3zoJ+tYwNPnUqJkszePKs6nX8/OPjsrVX7Q9xSCD
 jBs8DkByiqDSg9A8wnBcsTcQeRTOV2yPjEkp48prO0gM8R20o/UfEDds3k4HGysb+jWr
 d0yQ==
X-Gm-Message-State: AOAM531YXGiQeQODSZ1ykL76ni7ZFhzOMn2iwXCNul3yYrTWNiy5SnSQ
 cgbvKfmpMaBVG0+SHGilDA==
X-Google-Smtp-Source: ABdhPJylZYCNsi7aLdnU5BXGhlWKKRwa0qCJ5LYDWJSxKrWZNnd2izzg5emDhPlR1+rNNPVyexC6GA==
X-Received: by 2002:a63:a902:: with SMTP id u2mr174837pge.123.1628705489665;
 Wed, 11 Aug 2021 11:11:29 -0700 (PDT)
Received: from robh.at.kernel.org ([208.184.162.215])
 by smtp.gmail.com with ESMTPSA id 66sm196425pfu.67.2021.08.11.11.11.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Aug 2021 11:11:28 -0700 (PDT)
Received: (nullmailer pid 15921 invoked by uid 1000);
 Wed, 11 Aug 2021 18:11:22 -0000
Date: Wed, 11 Aug 2021 12:11:22 -0600
From: Rob Herring <robh@kernel.org>
To: Iwona Winiarska <iwona.winiarska@intel.com>
Subject: Re: [PATCH v2 03/15] dt-bindings: Add generic bindings for PECI
Message-ID: <YRQSyjFcS8bAfqDU@robh.at.kernel.org>
References: <20210803113134.2262882-1-iwona.winiarska@intel.com>
 <20210803113134.2262882-4-iwona.winiarska@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210803113134.2262882-4-iwona.winiarska@intel.com>
X-Mailman-Approved-At: Thu, 12 Aug 2021 11:37:21 +1000
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
Cc: linux-aspeed@lists.ozlabs.org, linux-doc@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>, Zev Weiss <zweiss@equinix.com>,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 openbmc@lists.ozlabs.org, x86@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>, Guenter Roeck <linux@roeck-us.net>,
 devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 Tony Luck <tony.luck@intel.com>, Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 Yazen Ghannam <yazen.ghannam@amd.com>, Olof Johansson <olof@lixom.net>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Tue, 03 Aug 2021 13:31:22 +0200, Iwona Winiarska wrote:
> Add device tree bindings for the PECI controller.
> 
> Signed-off-by: Iwona Winiarska <iwona.winiarska@intel.com>
> ---
>  .../bindings/peci/peci-controller.yaml        | 33 +++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/peci/peci-controller.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
