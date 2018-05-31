Return-Path: <sergei.shtylyov@cogentembedded.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=cogentembedded.com
 (client-ip=2a00:1450:4010:c07::244; helo=mail-lf0-x244.google.com;
 envelope-from=sergei.shtylyov@cogentembedded.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=cogentembedded.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=cogentembedded-com.20150623.gappssmtp.com
 header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="AfGEnnpA"; 
 dkim-atps=neutral
Received: from mail-lf0-x244.google.com (mail-lf0-x244.google.com
 [IPv6:2a00:1450:4010:c07::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40xYNM2ylDzDrbk
 for <openbmc@lists.ozlabs.org>; Fri,  1 Jun 2018 02:49:50 +1000 (AEST)
Received: by mail-lf0-x244.google.com with SMTP id r2-v6so10719192lff.4
 for <openbmc@lists.ozlabs.org>; Thu, 31 May 2018 09:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VIWQumJdaH9xT8NL9rDT+D19tw+EjhW0g0iFToN9fJI=;
 b=AfGEnnpAbUfea95aRj37FPGaMsgXzJsW3m/4mnX+HcTYhJ7GpxfiuXQKaZ2eWAud8k
 gVe94arwlVZaoEH411l6WAtgIkC2MjLYOx9AWGMsBMgeGqTD8HdEF+woBDuv27X/xP27
 u121qSZ8twt3w6KjY1KN1yj7+EOtLSlVcxm8TuQLU6qWGByVvlLDKL6q9eDFuptm8o4e
 KrQH/g6hfoURUzChVhC0l5upOwr8xc+PgMEv5hHgkxjD+baetbambjyDLpxXnRvwxNcQ
 +iyvJ/+l472kacgy6jOiz6Gl3VvWlSd3ytU5cPgsEnx824efgce72yoLyDmX8z+T5Obr
 F3+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=VIWQumJdaH9xT8NL9rDT+D19tw+EjhW0g0iFToN9fJI=;
 b=iwhmdSVeITKCh7WX3satfmC+oqTSr5UhpW7GyQxqLNSIIjiptfune+HiZngBPgTUf8
 DZ3lGGhoE13iPKlgL69KJYW5U7Ziq8VPCV9ivEFfVdKv53JIfbkOdHXuHGx4SZsnM8KB
 gIGoLn1xAuvdsqJ9xjlRuOTpwrUncX6NiYOVhPGZruTH31dZkDHIsjz+0KsZhHLCLWkt
 SXzvNbrqYNoyMnhxWoJwE2NIRMK3RBozIqnxI7ubnX/2+qUg647pDT8cRXfEa709niLg
 8RAgQJ77qWFoLJ7ctEyMPK4D+f+X8wr0WPprKY1Qhjc1bgs7Mt8rXHUrafAhOl/wwe1s
 K77A==
X-Gm-Message-State: ALKqPwcn8z3SUG3HzzOMzeKFaMf+TJfYdvPmUA0OzB6Vd4n7KNQSIEhp
 QzNgU9bqFGSFKTTZrBw5u073Cg==
X-Google-Smtp-Source: ADUXVKJmJA9oOIV6rfF5+TJvox0+IU5n+iUbmN+z2q74oEIRY8NthlODQgWf9XTaZBJlHyxbEPCDpw==
X-Received: by 2002:a2e:8350:: with SMTP id
 l16-v6mr5702217ljh.28.1527785387124; 
 Thu, 31 May 2018 09:49:47 -0700 (PDT)
Received: from wasted.cogentembedded.com ([31.173.82.221])
 by smtp.gmail.com with ESMTPSA id z7-v6sm866491lfa.73.2018.05.31.09.49.44
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 31 May 2018 09:49:46 -0700 (PDT)
Subject: Re: [PATCH v2 2/3] USB: DT probing support to ehci-npcm7xx
To: avifishman70@gmail.com, gregkh@linuxfoundation.org,
 stern@rowland.harvard.edu
Cc: tmaimon77@gmail.com, venture@google.com, yuenn@google.com,
 brendanhiggins@google.com, mathias.nyman@linux.intel.com,
 bjorn.andersson@linaro.org, jhogan@kernel.org, albeu@free.fr,
 chunfeng.yun@mediatek.com, tony@atomide.com, baolu.lu@linux.intel.com,
 elder@linaro.org, digetx@gmail.com, kstewart@linuxfoundation.org,
 hdegoede@redhat.com, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, openbmc@lists.ozlabs.org, robh+dt@kernel.org,
 mark.rutland@arm.com, devicetree@vger.kernel.org
References: <1527774046-7952-1-git-send-email-avifishman70@gmail.com>
 <1527774046-7952-3-git-send-email-avifishman70@gmail.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <9fe0ca4a-c244-e909-ec27-07c3db89f941@cogentembedded.com>
Date: Thu, 31 May 2018 19:49:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1527774046-7952-3-git-send-email-avifishman70@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 01 Jun 2018 10:33:23 +1000
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 31 May 2018 16:49:56 -0000

Hello!

On 05/31/2018 04:40 PM, avifishman70@gmail.com wrote:

> From: Avi Fishman <AviFishman70@gmail.com>
> 
> Device Tree documentation for Nuvoton npcm7xx EHCI.
> 
> Signed-off-by: Avi Fishman <AviFishman70@gmail.com>
> ---
>  Documentation/devicetree/bindings/usb/npcm7xx-usb.txt | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/npcm7xx-usb.txt
> 
> diff --git a/Documentation/devicetree/bindings/usb/npcm7xx-usb.txt b/Documentation/devicetree/bindings/usb/npcm7xx-usb.txt
> new file mode 100644
> index 000000000000..dec67d4d4c30
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/npcm7xx-usb.txt
> @@ -0,0 +1,17 @@
> +Nuvoton NPCM7XX SoC USB controllers:
> +-----------------------------
> +
> +EHCI:
> +-----
> +
> +Required properties:
> +- compatible: "nuvoton,npcm750-ehci"
> +- interrupts: Should contain the EHCI interrupt
> +
> +Example:
> +
> +	ehci@e1800000 {

  The node should be named "usb@e1800000" as the DT spec. requires the generic
node names.

[...]

MBR, Sergei
