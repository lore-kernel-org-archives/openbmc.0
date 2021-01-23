Return-Path: <SRS0=v44Q=G2=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1838EC433DB
	for <openbmc@archiver.kernel.org>; Sat, 23 Jan 2021 16:15:46 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D8FA22A84
	for <openbmc@archiver.kernel.org>; Sat, 23 Jan 2021 16:15:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D8FA22A84
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DNLp71HqwzDrgT
	for <openbmc@archiver.kernel.org>; Sun, 24 Jan 2021 03:15:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22a;
 helo=mail-oi1-x22a.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=vBfeVFCO; dkim-atps=neutral
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DNLmQ1PjmzDrgD;
 Sun, 24 Jan 2021 03:14:10 +1100 (AEDT)
Received: by mail-oi1-x22a.google.com with SMTP id m13so1787122oig.8;
 Sat, 23 Jan 2021 08:14:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=aGOwdo7IiEjB/o8PzIQ44cs8SlfL93ZRbT69u9ZgBSA=;
 b=vBfeVFCOy6eV/pI2NrmOSdW6HDuYebvlWjjpg3Zc3Bl+xLB0PPQUw2FXULxuLp03mX
 z9Wj9DWEi8zTyhwvjdA3feOpjdwaWcSuCHtRKlENDryeqOG2zCGWMB3/8ykTyZ0r5HV7
 sAgv5E/OfpqrR0+kUmAg6kh1N3I+wwpuwiagAP+C4sqnD+N9ihP7HlfSc7540kce76Qp
 wkhWgyQKihteORYFEDPUBy/pC/9SCfggequ9pfvktOk0iUUWwUoFbzrWJcxzVUymoPZN
 iQUQ3nYFj9f3cxJwKwg13Vnbj/cuucvoQAqK7v3QJvBYDBJJah2F3FP1QWudGTAMKnqm
 iDzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=aGOwdo7IiEjB/o8PzIQ44cs8SlfL93ZRbT69u9ZgBSA=;
 b=IEels+sl3FzYIYZRydZLPjRlFn/B+CL0091Bdi/uboZtixA+sXOfoeIfqDEdhfJ70f
 ukvQBchdp/jvXZlGY9QRdyc9QBX6Jum2HF0jlWIhXNAh/VOm2cL4xaXJksxKue87EEKG
 EhzCYsxeJF4+j5+cj5ACUNlw4ajOKHSA1EgAmwn3AroARfeSfJ1tMv6Q8PpplUY25RTF
 19mEFwPCXWn8Teh+eohCFGRzvWChLxjdTOK1Y4d1LZtA4Qtj4xz5dQlJU0W++wYA5vr8
 emj2ueLMd+/k43XUhZM69IYp2vH+gz6d942RV5wVJKikVpnsBUX42JmgsSPT1PeSV+Ge
 FvwA==
X-Gm-Message-State: AOAM532z/UkvrHCNxAAWN7Tu7I92arsV+ex0M6irkePK2LTzz5zwXKqw
 RV0rsgsK4SzIBKwgCb5AQAc=
X-Google-Smtp-Source: ABdhPJwUX1wZ0HjqJqPPmC6y8f3rdsNa8J0yV/pB7b5Xzuxhi7oi8U92QTpcFe8nyjssXaaj3SuVKQ==
X-Received: by 2002:aca:b5d6:: with SMTP id e205mr6465360oif.15.1611418447275; 
 Sat, 23 Jan 2021 08:14:07 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id r8sm2406529oth.20.2021.01.23.08.14.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 23 Jan 2021 08:14:06 -0800 (PST)
Date: Sat, 23 Jan 2021 08:14:05 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Troy Lee <troy_lee@aspeedtech.com>
Subject: Re: [PATCH v2 4/4] hwmon: Support Aspeed AST2600 PWM/Fan tachometer
Message-ID: <20210123161405.GA50622@roeck-us.net>
References: <20210113070850.1184506-1-troy_lee@aspeedtech.com>
 <20210113070850.1184506-5-troy_lee@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210113070850.1184506-5-troy_lee@aspeedtech.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: "open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jean Delvare <jdelvare@suse.com>,
 Ryan Chen <ryan_chen@aspeedtech.com>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>,
 Jonathan Corbet <corbet@lwn.net>, Andrew Jeffery <andrew@aj.id.au>,
 openbmc@lists.ozlabs.org,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, leetroy@gmail.com,
 Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 chiawei_wang@aspeedtech.com, "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Wed, Jan 13, 2021 at 07:08:48AM +0000, Troy Lee wrote:
> Add Aspeed AST2600 PWM/Fan tacho driver. AST2600 has 16 PWM channel and
> 16 FAN tacho channel.
> 
> Changes since v1:
> - fixed review comments
> - fixed double-looped calculation of div_h and div_l
> - moving configuration to device tree
> - register hwmon driver with devm_hwmon_device_register_with_info()
> 
> Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>

checkpatch says:

total: 0 errors, 9 warnings, 26 checks, 779 lines checked

This is a bit much. Please run checkpatch --strict and fix the issues
it reports. Please also fix the issues reported by 0-day as well as
the issues reported by the bindings robot, and resubmit.

Thanks,
Guenter
