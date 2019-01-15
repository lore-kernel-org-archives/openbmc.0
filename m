Return-Path: <robherring2@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.167.195; helo=mail-oi1-f195.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43fNpC3bDrzDqMp
 for <openbmc@lists.ozlabs.org>; Wed, 16 Jan 2019 08:32:03 +1100 (AEDT)
Received: by mail-oi1-f195.google.com with SMTP id y1so3318039oie.12
 for <openbmc@lists.ozlabs.org>; Tue, 15 Jan 2019 13:32:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=z9gEuT+YNXtCWVAFBTcu1FTumM4T92y7to9PgZX0coQ=;
 b=O6bx0rnkvKtbDMC8QT8JSK+YeVg/1YeyjicW1I/usQjlbUduqqONCzK/nhvZC2dHSs
 Pxb3oUQJuJJni7EX7DsxIFu22kMNF+I4OkO8d4JyK/s8Xi4+4+qkWnwzpV06ihgLNjfD
 Ah8MEp1lNhTg3BuLDAB7ysCV92zk9OTa+pLewymuVdZ/JRaJp4s/23fRhJIrhNxUUViR
 t7KU0JEPv8GYNL47DEEQf4P4ai0duyCcdg1QdnR7lSgG59ehH8eL0TvL7EjIRmUig3sZ
 +uX1uwJK2jBaRMldyfAUizhkp5/AqXyMHjYSOo6F/qHKW5APU7OH1XY1QttKMLf8gNhH
 nzjA==
X-Gm-Message-State: AJcUukfac5QWzkQopHW1pfHlCaFkKRtIHXRzbAaMU50xUqVrwfSxiVUz
 +6xXtHnHcBt2E1Cb1Cdl5w==
X-Google-Smtp-Source: ALg8bN46tdJkXSr9UlbEAiQScxzL4Sh2niknXE4jMQPxp0hHi2TBQnCAmqsaPBl7jSHP+unwEvy0Xg==
X-Received: by 2002:aca:4d3:: with SMTP id 202mr488889oie.345.1547587920354;
 Tue, 15 Jan 2019 13:32:00 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id z18sm1862540otp.41.2019.01.15.13.31.59
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 15 Jan 2019 13:31:59 -0800 (PST)
Date: Tue, 15 Jan 2019 15:31:58 -0600
From: Rob Herring <robh@kernel.org>
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: jic23@kernel.org, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net,
 robh+dt@kernel.org, mark.rutland@arm.com, yuenn@google.com,
 venture@google.com, brendanhiggins@google.com,
 avifishman70@gmail.com, joel@jms.id.au, linux-iio@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>
Subject: Re: [PATCH v2 1/2] dt-binding: iio: add NPCM ADC documentation
Message-ID: <20190115213158.GA7016@bogus>
References: <20190109164343.164205-1-tmaimon77@gmail.com>
 <20190109164343.164205-2-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190109164343.164205-2-tmaimon77@gmail.com>
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
X-List-Received-Date: Tue, 15 Jan 2019 21:32:04 -0000

On Wed,  9 Jan 2019 18:43:42 +0200, Tomer Maimon wrote:
> Added device tree binding documentation for Nuvoton BMC
> NPCM Analog-to-Digital Converter(ADC).
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  .../bindings/iio/adc/nuvoton,npcm-adc.txt          | 35 ++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/nuvoton,npcm-adc.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
