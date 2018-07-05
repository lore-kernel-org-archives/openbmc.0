Return-Path: <robherring2@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.218.65; helo=mail-oi0-f65.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
 [209.85.218.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41M8vr4nSzzF265
 for <openbmc@lists.ozlabs.org>; Fri,  6 Jul 2018 06:43:36 +1000 (AEST)
Received: by mail-oi0-f65.google.com with SMTP id n84-v6so19400401oib.9
 for <openbmc@lists.ozlabs.org>; Thu, 05 Jul 2018 13:43:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=pLFS+R0zSvo9gC9QGZAfaWvPZOnXVSSf2fa72qbMKGU=;
 b=tf5ArRCcIEBL+DcUjpdtkr7CSITLxV1zrhcKiO7npfR1ZKpIiJmJ6gF0mbk5UmrhKl
 Xi16ByvX6QBNqpInPag8M8p856nvRXm1ltwEQetUsX+cbBjgX2B3ImXyCLSdYbDLnZQJ
 JxnKScMTehgMAKbk1u0lp/ztipiFGoMPJOr4YjR0ZQS0guLA6k5k/evNoM97bRyJAFc+
 QkmUZGwEALr6T7JbzQhwnmwk0LRdclZRUC7x8fR7BBThbgzX+Eq0egNrCRqAxj0ir3Lr
 SeoxbHC5TXXFapQztJTbAzZXjhGuwF+2v4TyQLw5J53Acq3dfc5DSamv+/qM2SBawGBT
 yhiQ==
X-Gm-Message-State: APt69E2w9XPHpKTJUJIDhlXcQttU4TZQB0sq1gHm+0mwlCUfCTvhlX3W
 B6O5i08a3RBII7gm3yFI2g==
X-Google-Smtp-Source: AAOMgpfOnVauGtuQ5v09vxAN9e/99ptafWG9WD/nrDEDsrrgTqDotoRf4sb/nBX0rIEPizya9jWRlA==
X-Received: by 2002:aca:e3c8:: with SMTP id
 a191-v6mr9069650oih.4.1530823413174; 
 Thu, 05 Jul 2018 13:43:33 -0700 (PDT)
Received: from localhost (24-223-123-72.static.usa-companies.net.
 [24.223.123.72])
 by smtp.gmail.com with ESMTPSA id r187-v6sm1731425oib.2.2018.07.05.13.43.32
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 05 Jul 2018 13:43:32 -0700 (PDT)
Date: Thu, 5 Jul 2018 14:43:31 -0600
From: Rob Herring <robh@kernel.org>
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: mark.rutland@arm.com, jdelvare@suse.com, linux@roeck-us.net,
 avifishman70@gmail.com, yuenn@google.com, brendanhiggins@google.com,
 venture@google.com, joel@jms.id.au, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
 openbmc@lists.ozlabs.org
Subject: Re: [PATCH v8 1/2] dt-binding: hwmon: Add NPCM7xx PWM and Fan
 controller documentation
Message-ID: <20180705204331.GA1778@rob-hp-laptop>
References: <20180703232326.355718-1-tmaimon77@gmail.com>
 <20180703232326.355718-2-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180703232326.355718-2-tmaimon77@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Jul 2018 20:43:37 -0000

On Wed, Jul 04, 2018 at 02:23:25AM +0300, Tomer Maimon wrote:
> Added device tree binding documentation for Nuvoton BMC
> NPCM7xx Pulse Width Modulation (PWM)  and Fan tach controller.
> The Nuvoton BMC NPCM7XX supports 8 PWM controller outputs
> and 16 Fan tachometer controller inputs.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  .../devicetree/bindings/hwmon/npcm750-pwm-fan.txt  | 84 ++++++++++++++++++++++
>  1 file changed, 84 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/npcm750-pwm-fan.txt

Reviewed-by: Rob Herring <robh@kernel.org>
