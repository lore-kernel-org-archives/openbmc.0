Return-Path: <robherring2@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.210.67; helo=mail-ot1-f67.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42bfjG3QDzzF3DV
 for <openbmc@lists.ozlabs.org>; Fri, 19 Oct 2018 06:48:02 +1100 (AEDT)
Received: by mail-ot1-f67.google.com with SMTP id c23so29192357otl.9
 for <openbmc@lists.ozlabs.org>; Thu, 18 Oct 2018 12:48:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=TW0ld+49mrI3fSEdHT5ADhTTD7haW5UOlwuNbsIgO1Y=;
 b=qGJUlNl9ccIdXNVCC/Of9MlJ9oLUj0X4DJzu1Cjtmyvn3ZGdZ6AZ2Ja+5itJbdSAnH
 1CRk6/BRriOVgKWU4SXA2T1VbFiezEZYH+zj35fgICSVkug7ls1ZliNNW/CAhOsLYgKd
 iVBAxHdF7oWUIl7bY7eKxARTkHQu/No2j/vB+vL/klVoBj+1qZM775PglDz7gQYELjeR
 VjMfi/Fg7krM2GvxZ4kcYs4I+1sv1MXjsOc2hnF6dYU4sy1zTqt5vI64XMOOesUpV6db
 x801Q3tQxk0y0YkeieWM5LeOQJaOookOJWGFPm6dYxapc7yAE2NE1cNze15Wvi2f/fbZ
 6gAw==
X-Gm-Message-State: ABuFfoh9nYTghNN89WQr4Lu80MZ4LeyW8tnSV7Wk0qDtBWgzz1+qTMOg
 We3HtT0pAlK93T4l0LkJFg==
X-Google-Smtp-Source: ACcGV61pTBVOZCJfwQpxzzSAEJbBUlOOWtYbR2d8PgtYXGZeLRF6ZuXgsc00Q8Dtt6qwFAFcwp7b7w==
X-Received: by 2002:a9d:19ec:: with SMTP id k99mr21003179otk.340.1539892080017; 
 Thu, 18 Oct 2018 12:48:00 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 111sm7483377otf.51.2018.10.18.12.47.59
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 18 Oct 2018 12:47:59 -0700 (PDT)
Date: Thu, 18 Oct 2018 14:47:58 -0500
From: Rob Herring <robh@kernel.org>
To: Kun Yi <kunyi@google.com>
Cc: openbmc@lists.ozlabs.org, kunyi@google.com,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Mark Rutland <mark.rutland@arm.com>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] dt-bindings: hwmon: Add adm127x documentation
Message-ID: <20181018194758.GA21705@bogus>
References: <20181017222710.254994-1-kunyi@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181017222710.254994-1-kunyi@google.com>
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
X-List-Received-Date: Thu, 18 Oct 2018 19:48:03 -0000

On Wed, 17 Oct 2018 15:27:09 -0700, Kun Yi wrote:
> adm127x are hot-swap controllers that allow a circuit board to be removed from
> or inserted into a live backplane. This patch adds the device tree
> bindings documentation.
> 
> Signed-off-by: Kun Yi <kunyi@google.com>
> ---
>  .../devicetree/bindings/hwmon/adm1275.txt     | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/adm1275.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
