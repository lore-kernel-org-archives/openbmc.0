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
 by lists.ozlabs.org (Postfix) with ESMTPS id 43fM4f6TfdzDqTs
 for <openbmc@lists.ozlabs.org>; Wed, 16 Jan 2019 07:14:26 +1100 (AEDT)
Received: by mail-oi1-f193.google.com with SMTP id j21so3147946oii.8
 for <openbmc@lists.ozlabs.org>; Tue, 15 Jan 2019 12:14:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=CyUQBmP+iGazWEmfrNU1o6MRlHYu14uuv7V2WlMWplY=;
 b=VNIjQrwIfXz9xR1p+KviTxH5wbFyAqIcGhHN8vcIEu6V4kafoP1b2It1N8xS34ywVV
 TIZ6V1bWM7JFKN6X7QhS8s8m+PF7Q1/AO4B2X27h6BE4VX91pDRQev3jtZX33SWH5Qvq
 x2LTFlcDQry07/RGT/G8kxSeEEPwGoNMxjHSXm1UhQ+vtveaqWQNgDpwmqVcSfS5kq/r
 TKvimOWKvqHytGabHIGqfJphm206eyw64AJ1DedHt+iy1+U0nyYkGtK/Q56g1sf5jomD
 j9dQpOTEUtui3g/RIT4lhtMeYRU0MgROD/kLmboVZd/g3dL/vkZYL98LcwXzr7r6J72D
 mg4g==
X-Gm-Message-State: AJcUukfQxG3QZ4LT6jCUgrMoMMYKqjxgB13OUSvyRWrxmh9oBTzCuRq3
 Xpog9paWvDzbXmKp2DhMoA==
X-Google-Smtp-Source: ALg8bN7TObt1i8wtgsCsVNH2E7IfQ9L2xPHo9n4xVCDyfIXI02aLszYmWoMKoFwZbbwhIe4Sv5d1Ig==
X-Received: by 2002:aca:5508:: with SMTP id j8mr3015444oib.240.1547583264679; 
 Tue, 15 Jan 2019 12:14:24 -0800 (PST)
Received: from localhost ([70.231.7.113])
 by smtp.gmail.com with ESMTPSA id b23sm1691970otq.5.2019.01.15.12.14.23
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 15 Jan 2019 12:14:23 -0800 (PST)
Date: Tue, 15 Jan 2019 14:14:23 -0600
From: Rob Herring <robh@kernel.org>
To: Xiaoting Liu <xiaoting.liu@hxt-semitech.com>
Cc: jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org,
 mark.rutland@arm.com, openbmc@lists.ozlabs.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 shunyong.yang@hxt-semitech.com, dongsheng.wang@hxt-semitech.com,
 Xiaoting Liu <xiaoting.liu@hxt-semitech.com>
Subject: Re: [PATCH v3 2/4] dt-bindings: hwmon: add dps650ab documentation
Message-ID: <20190115201423.GA4331@bogus>
References: <cover.1546918172.git.xiaoting.liu@hxt-semitech.com>
 <0527fcf7155ea12a2a1be680b3617691e6e26d72.1546918172.git.xiaoting.liu@hxt-semitech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0527fcf7155ea12a2a1be680b3617691e6e26d72.1546918172.git.xiaoting.liu@hxt-semitech.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
X-List-Received-Date: Tue, 15 Jan 2019 20:14:27 -0000

On Thu, 10 Jan 2019 10:24:33 +0800, Xiaoting Liu wrote:
> Bindings for Delta Electronics DPS-650-AB power supply.
> 
> Signed-off-by: Xiaoting Liu <xiaoting.liu@hxt-semitech.com>
> ---
> v3:
>   Change patch commit message.
>   Add vendor delta to the compatible property.
> ---
> v2:
>   Change the patch subject.
> ---
>  Documentation/devicetree/bindings/hwmon/dps650ab.txt | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
