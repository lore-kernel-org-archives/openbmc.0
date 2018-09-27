Return-Path: <robherring2@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.210.66; helo=mail-ot1-f66.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42LdfS50DkzF36x;
 Fri, 28 Sep 2018 01:15:28 +1000 (AEST)
Received: by mail-ot1-f66.google.com with SMTP id c13-v6so2872774otf.12;
 Thu, 27 Sep 2018 08:15:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=SGwwZPm5WLPYDXFV5cdVZJ7voZo5e5hoQb+hDntem7Y=;
 b=JaDYITPLx2qKnAQ5Kf+pduFQ+AQ9Whd93SQMBOqTX09HQVoSQFS2dmIEesRyPUK2fe
 anAkxo9RphRXQG8axPopXVxb6rIZDlYelBKoVY2Y6xUXymIt8dBQOtEsaQBmtMZDqNMe
 ea1OhlHxSEsojnrGIl5ktvl4K6BZI3aDspMWYAlpaFOa8MChsuFaroi6v66lv70N7HU3
 TQCoRoQQnezlPLjW+z9BQTJdMPjiZ74VftWlRwwJIB2zVHL5Buy6fiJmLw308ypdCS9W
 4REjYYKK62Q6ljARdjhuMkFXKUUV73DHOZc5nHsqktruNDcUR4CsBBlTFk1abih0nev0
 dHKA==
X-Gm-Message-State: ABuFfojkGmGQQadi4PyV2joue/aBZKO84gq8UMClsud3CzQMfXuw6k1Y
 rCU9UZrXtA7zVE2pdVQbDw==
X-Google-Smtp-Source: ACcGV61ZWH3WKzRbd05MtOdnogHcxKTDl5kseE6Cw9w2QB+ROHhooA+dhK1d7iVPUNi0rgmTp39oCg==
X-Received: by 2002:a9d:454c:: with SMTP id
 p12-v6mr7139515oti.105.1538061326125; 
 Thu, 27 Sep 2018 08:15:26 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 19-v6sm740736oty.16.2018.09.27.08.15.25
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 27 Sep 2018 08:15:25 -0700 (PDT)
Date: Thu, 27 Sep 2018 10:15:24 -0500
From: Rob Herring <robh@kernel.org>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: Lee Jones <lee.jones@linaro.org>, Thomas Gleixner <tglx@linutronix.de>,
 Juergen Gross <jgross@suse.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-doc@vger.kernel.org,
 openbmc@lists.ozlabs.org, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 James Feist <james.feist@linux.intel.com>,
 Jason M Biils <jason.m.bills@linux.intel.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>
Subject: Re: [PATCH v8 07/12] dt-bindings: mfd: Add a document for PECI
 client MFD
Message-ID: <20180927151524.GA16798@bogus>
References: <20180918215124.14003-1-jae.hyun.yoo@linux.intel.com>
 <20180918215124.14003-8-jae.hyun.yoo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180918215124.14003-8-jae.hyun.yoo@linux.intel.com>
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
X-List-Received-Date: Thu, 27 Sep 2018 15:15:29 -0000

On Tue, 18 Sep 2018 14:51:19 -0700, Jae Hyun Yoo wrote:
> This commit adds a dt-bindings document for PECI client MFD.
> 
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Andrew Jeffery <andrew@aj.id.au>
> Cc: James Feist <james.feist@linux.intel.com>
> Cc: Jason M Biils <jason.m.bills@linux.intel.com>
> Cc: Joel Stanley <joel@jms.id.au>
> Cc: Vernon Mauery <vernon.mauery@linux.intel.com>
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> ---
>  .../bindings/mfd/intel-peci-client.txt        | 34 +++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/intel-peci-client.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
