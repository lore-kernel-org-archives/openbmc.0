Return-Path: <robherring2@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.161.194; helo=mail-yw0-f194.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-yw0-f194.google.com (mail-yw0-f194.google.com
 [209.85.161.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 410jNz0sPGzF1wr
 for <openbmc@lists.ozlabs.org>; Wed,  6 Jun 2018 06:01:21 +1000 (AEST)
Received: by mail-yw0-f194.google.com with SMTP id s201-v6so1144542ywg.8
 for <openbmc@lists.ozlabs.org>; Tue, 05 Jun 2018 13:01:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=yhccSuGNlO4Nb486fzI5Hp5TbXTUQgxg88S+9R4DZ9Y=;
 b=WpWmxfzIja2DXIdoyUIYNRZcscJuWfc0VzIN66sjZC/66yeaHKVsthLSBBKYpaTy4w
 eb9rx8mIgoQqjuyqYiBC0LJZI6D5CiDI5l+AUtp1kKVtHCaToEKLK/C0Jp0cv1NaqM9S
 u53QAcmF2frqlhqc5Kb2wwvMQeqoG9IZFMxlA1CgE2sU3MTnFw/faoOfLakQZgiJz7P3
 /9N2LKox852DUjT3t9CkPjP5XNfSwhG/uwm1b+C7Ztv1VALqSMHYvwz21d0HBCUCNlpW
 Wt6HUKUJ8eVjrEL3KGlNklc8NgAjrLSnkJjhPXDQW3KI6TKJeCWJltvLq9uCwU0jInDF
 lQSg==
X-Gm-Message-State: APt69E1yCH//VjSmEWP7rouINAvBtQemmHSCClFCj3AjcwrFt2h8Vaot
 f1kC3ods810PBKhdM0/teA==
X-Google-Smtp-Source: ADUXVKIhV3GbfMK61lXvQwEmTDPmLWTuoHbz32OfaaZqEEy7dFDuIMywHBiBLOdjlY1RqTKkLYGY0w==
X-Received: by 2002:a81:6f57:: with SMTP id k84-v6mr38668ywc.170.1528228877846; 
 Tue, 05 Jun 2018 13:01:17 -0700 (PDT)
Received: from localhost (24-223-123-72.static.usa-companies.net.
 [24.223.123.72])
 by smtp.gmail.com with ESMTPSA id a127-v6sm11629401ywc.29.2018.06.05.13.01.16
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 05 Jun 2018 13:01:17 -0700 (PDT)
Date: Tue, 5 Jun 2018 14:01:15 -0600
From: Rob Herring <robh@kernel.org>
To: avifishman70@gmail.com
Cc: gregkh@linuxfoundation.org, stern@rowland.harvard.edu,
 tmaimon77@gmail.com, venture@google.com, yuenn@google.com,
 brendanhiggins@google.com, mathias.nyman@linux.intel.com,
 bjorn.andersson@linaro.org, jhogan@kernel.org, albeu@free.fr,
 chunfeng.yun@mediatek.com, tony@atomide.com,
 baolu.lu@linux.intel.com, elder@linaro.org, digetx@gmail.com,
 kstewart@linuxfoundation.org, hdegoede@redhat.com,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 openbmc@lists.ozlabs.org, mark.rutland@arm.com, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/3] USB: DT probing support to ehci-npcm7xx
Message-ID: <20180605200115.GA20061@rob-hp-laptop>
References: <1527788430-12494-1-git-send-email-avifishman70@gmail.com>
 <1527788430-12494-3-git-send-email-avifishman70@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1527788430-12494-3-git-send-email-avifishman70@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
X-List-Received-Date: Tue, 05 Jun 2018 20:01:24 -0000

On Thu, May 31, 2018 at 08:40:29PM +0300, avifishman70@gmail.com wrote:
> From: Avi Fishman <AviFishman70@gmail.com>

The subject sounds like a driver change, not a binding doc. To start 
with, the subject prefix should be "dt-bindings: usb: ..."

> Device Tree documentation for Nuvoton npcm7xx EHCI.
> 
> Signed-off-by: Avi Fishman <AviFishman70@gmail.com>
> ---
>  Documentation/devicetree/bindings/usb/npcm7xx-usb.txt | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/npcm7xx-usb.txt

Otherwise,

Reviewed-by: Rob Herring <robh@kernel.org>
