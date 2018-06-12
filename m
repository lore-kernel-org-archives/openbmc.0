Return-Path: <sergei.shtylyov@cogentembedded.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=cogentembedded.com
 (client-ip=2a00:1450:4010:c07::242; helo=mail-lf0-x242.google.com;
 envelope-from=sergei.shtylyov@cogentembedded.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=cogentembedded.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=cogentembedded-com.20150623.gappssmtp.com
 header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="W6UtYCGp"; 
 dkim-atps=neutral
Received: from mail-lf0-x242.google.com (mail-lf0-x242.google.com
 [IPv6:2a00:1450:4010:c07::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 414k4z5TB8zF44q
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jun 2018 18:46:26 +1000 (AEST)
Received: by mail-lf0-x242.google.com with SMTP id 36-v6so34706250lfr.11
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jun 2018 01:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0ImfPuMr8t26sZqnTD/IQuaXUA+hBMVXTKAL/3TwpSI=;
 b=W6UtYCGpSeXxQPdcWrt4t3eH5aszsPC6dIAdDrJLXPy/+uboimHl0PgiXLU4Fc6pAw
 TGAhw52Bi3AJ8ukksH+yr7jO06gn5ib+uJL9VMRxWSlLH1TI3rzvcOuHebxR94bhEeNg
 8U3LcqF4xFjtJMG0r4/PEj+1xtYcXQwbd6zsUV5XJ5/xSL+oSLxEZxYBODtIlSuJFmGU
 BAJAQEns1d0QluT0TGLYHu71w1jqAW5tsCzjgJYiGnutUPx1pR/A987UhiPUlQzlDDAe
 Qe9llAdXdHFGcYRb7QsUDrCkCgGzEmPcfpKaSEMnSvdzAVOTKOmnLONTM9zTDKazxy3E
 k3/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0ImfPuMr8t26sZqnTD/IQuaXUA+hBMVXTKAL/3TwpSI=;
 b=rBDpQTdnsnzcmL9xPkRXrpj+YBFVPtRjfuyQbmE2nWLl3x9pZPwVZlZqxKJDQ8r2o2
 KPNs/XRgiVnqk7XatrTb/XLnNfd1oIKtyGH3UlRKRXgVfHSL6fWQYLqY22st+CfWaN9z
 CswQbj684ZZEysPjqUk8eylCxsMR9Q3aLRzHpEvFEOzbBKWaf6DSRzonGfQNO5Gb2JUN
 UwOqd4nDxoJWZ1eNswlQe7NovD0xUvZaCZ5Z+ohQyEFjDkIZmTW83rwZyYpOxZOU6CR5
 ELcp8uWMIiyh0b7WNde/BgDhRLVHc+aGGzSKxZwLcSsuXjyAl+7/kdcAnWL3RD6UuEFK
 U2+Q==
X-Gm-Message-State: APt69E0N9CE/Y0aW1QSmhN1QqZNeGshnh/b9hFm0qk3RMssEsJnNoaTp
 LdF5EkNcrpf1tiDCJH8o5xtcxA==
X-Google-Smtp-Source: ADUXVKIUAfBT+3SajwxIN/N9tLdb4zlL9zjk0Z8hByfs3z+u4Ia7kRPAfeRE5HNj/flRiJeJl5hmxA==
X-Received: by 2002:a2e:419:: with SMTP id 25-v6mr1683132lje.146.1528793182337; 
 Tue, 12 Jun 2018 01:46:22 -0700 (PDT)
Received: from [192.168.0.126] ([31.173.81.249])
 by smtp.gmail.com with ESMTPSA id s20-v6sm87843lfk.56.2018.06.12.01.46.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 12 Jun 2018 01:46:21 -0700 (PDT)
Subject: Re: [PATCH v5 2/3] dt-bindings: usb: new ehci-npcm7xx dt
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
References: <20180611195837.251551-1-avifishman70@gmail.com>
 <20180611195837.251551-3-avifishman70@gmail.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <e12a159a-53ff-0c5e-9ce0-4fa9f93dd429@cogentembedded.com>
Date: Tue, 12 Jun 2018 11:46:22 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180611195837.251551-3-avifishman70@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 18 Jun 2018 12:04:07 +1000
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
X-List-Received-Date: Tue, 12 Jun 2018 08:46:29 -0000

Hello!

On 6/11/2018 10:58 PM, avifishman70@gmail.com wrote:

> From: Avi Fishman <AviFishman70@gmail.com>
> 
> Device Tree documentation for Nuvoton npcm7xx EHCI.
> 
> Signed-off-by: Avi Fishman <AviFishman70@gmail.com>
> Reviewed-by:   Rob Herring <robh@kernel.org>
> ---
>   Documentation/devicetree/bindings/usb/npcm7xx-usb.txt | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/usb/npcm7xx-usb.txt
> 
> diff --git a/Documentation/devicetree/bindings/usb/npcm7xx-usb.txt b/Documentation/devicetree/bindings/usb/npcm7xx-usb.txt
> new file mode 100644
> index 000000000000..b682bec103f9
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

    How about "reg"?

> +
> +Example:
> +
> +	ehci1: usb@f0806000 {
> +		compatible = "nuvoton,npcm750-ehci";
> +		reg = <0xf0806000 0x1000>;
> +		interrupts = <0 61 4>;
> +	};
> 

MBR, Sergei
