Return-Path: <robherring2@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.167.193; helo=mail-oi1-f193.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42WzW91sHKzF3Kk
 for <openbmc@lists.ozlabs.org>; Sat, 13 Oct 2018 07:11:33 +1100 (AEDT)
Received: by mail-oi1-f193.google.com with SMTP id s69-v6so10772339oie.10
 for <openbmc@lists.ozlabs.org>; Fri, 12 Oct 2018 13:11:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=vzljci7T/FeiUvgN+Xb/IV7QGDOMZMvRO95naxrfxXk=;
 b=plLyxXSBy79y24ONjLUMnFQeNNhy9UvF0m/dWQTLsF1GqkfcuFJT2EVbtY91G2u5tu
 yHXVkLpXHE2Ry7vElTs9MhLdW2uA+PqM3nOzGM/4IemnulELi+wZDOe32uLFx1s61UJs
 fsuwF3HthPVBrxDCtku/THUkT8H+JZS9FV9y5I7avljf5p6VIXfhibG00ihcZ709IvKA
 VPRmizWjDEmo96Ea3d4f6ndmwHvExqgqWdvte1UybwJ8DDe7R0BKJpnxMfiMy2z0jeiz
 H/OF5QIwQPtCEYu3ctkUk+codlSeDq5uDxjs+DXhCr+igYRWsFuVj2zFjYR4BrooOQvk
 BaoQ==
X-Gm-Message-State: ABuFfoinyK3jOVnCgmpR4Fzv/ZWGxcGxlIBZ2p7oGS7z2hJ6ot/XE+1C
 Ox+ZIHtr4DAIT7crmUpfLw==
X-Google-Smtp-Source: ACcGV61vZ8XJNthmUi9czv1+j0LNAoLvaswKYZNrVOJexW+V4vVq7j3p7GETOB1eSUX4U6Go3xgqqg==
X-Received: by 2002:aca:5511:: with SMTP id
 j17-v6mr4232712oib.17.1539375090393; 
 Fri, 12 Oct 2018 13:11:30 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id r33sm844890otc.37.2018.10.12.13.11.29
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 12 Oct 2018 13:11:29 -0700 (PDT)
Date: Fri, 12 Oct 2018 15:11:28 -0500
From: Rob Herring <robh@kernel.org>
To: Kun Yi <kunyi@google.com>
Cc: linux@roeck-us.net, linux-hwmon@vger.kernel.org, jdelvare@suse.com,
 mark.rutland@arm.com, devicetree@vger.kernel.org,
 rlippert@google.com, benjaminfair@google.com, openbmc@lists.ozlabs.org
Subject: Re: [PATCH v2] hwmon: (adm1275): Add device tree param for shunt
 resistor
Message-ID: <20181012201128.GA13628@bogus>
References: <20180928195800.153914-1-kunyi@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180928195800.153914-1-kunyi@google.com>
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
X-List-Received-Date: Fri, 12 Oct 2018 20:11:34 -0000

On Fri, Sep 28, 2018 at 12:58:00PM -0700, Kun Yi wrote:
> The ADM series of hotswap controllers support extending
> the current measurement range by using a sensing resistor
> value other than the typical 1 mOhm. For example, using a 0.5 mOhm
> sensing resistor doubles the maximal current can be measured.
> 
> Current driver assumes a shunt resistor value of 1 mOhm in calculation,
> meaning for other resistor values, hwmon will report scaled
> current/power measurements. This patch adds a device tree parameter so
> that individual boards can configure its shunt resistor value.
> 
> Signed-off-by: Kun Yi <kunyi@google.com>
> ---
>  .../devicetree/bindings/hwmon/adm1275.txt     | 25 +++++++++++++++++++

This should be a separate patch. In particular, the subject doesn't 
really reflect that you are adding a new binding.

Otherwise, the binding looks fine.

>  Documentation/hwmon/adm1275                   |  3 +++
>  drivers/hwmon/pmbus/adm1275.c                 | 15 +++++++++--
>  3 files changed, 41 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/adm1275.txt
