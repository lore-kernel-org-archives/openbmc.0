Return-Path: <robherring2@gmail.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
 [209.85.218.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sgh5q6ymFzDsnj
 for <openbmc@lists.ozlabs.org>; Sat, 24 Sep 2016 04:02:23 +1000 (AEST)
Received: by mail-oi0-f68.google.com with SMTP id n202so9317513oig.2
 for <openbmc@lists.ozlabs.org>; Fri, 23 Sep 2016 11:02:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=rmBQSF7CtcjVvUl7F1JN2agsAza47v43HALFuN7SJTg=;
 b=HaBW5/Wy+PivDgJ0B8La4b44Qh8w6P4NyOMQkIn+F1HZG7s/Lx6bjqtP5qy5pnukZg
 HLN92OBexdr7maWzxPKdGXoL5UQ4FUoFYs2wXCLskeQjV9sqgppX+ztXkjB3yS0+o6tK
 diVyxyrBbnwVza1Cf8iqzX8W0l47EouNIUtVcr+EKasGULECCWGH3SsAS4FvVHHOIC/M
 DEe3lIuBSXuONJK7L5BjkXWz2qLCOYcRcvA63jSNMml+Ua14p6a+AzDQDGDUE3jj1J20
 xyMvCUflpd4VyEe1tWzifiqCjw6mBYW9pCtNde5dBHQwxGbUBWjsdHsrP2NjFU1T/BjK
 lhcw==
X-Gm-Message-State: AE9vXwPKsFtTkHs52LnB7xK7QMh63SfRpoy1K/M9Wq9BmTrmAN5Ovu2LaiB0XAjPy6T8OA==
X-Received: by 10.202.237.143 with SMTP id l137mr12449419oih.121.1474653741149; 
 Fri, 23 Sep 2016 11:02:21 -0700 (PDT)
Received: from localhost (72-48-98-129.dyn.grandenetworks.net. [72.48.98.129])
 by smtp.gmail.com with ESMTPSA id
 j189sm2459890oih.27.2016.09.23.11.02.20
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Sep 2016 11:02:20 -0700 (PDT)
Date: Fri, 23 Sep 2016 13:02:19 -0500
From: Rob Herring <robh@kernel.org>
To: Brendan Higgins <brendanhiggins@google.com>
Cc: wsa@the-dreams.de, mark.rutland@arm.com, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, joel@jms.id.au, jk@ozlabs.org
Subject: Re: [PATCH v3 2/2] i2c: aspeed: added documentation for Aspeed I2C
 driver
Message-ID: <20160923180219.GA9401@rob-hp-laptop>
References: <CAFd5g47W-dGVt6hA+FSpqxCqvd5ZpQP=FCCpYGErahF0iKqTEQ@mail.gmail.com>
 <1474327414-651-1-git-send-email-brendanhiggins@google.com>
 <1474327414-651-2-git-send-email-brendanhiggins@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1474327414-651-2-git-send-email-brendanhiggins@google.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Approved-At: Sat, 24 Sep 2016 05:03:31 +1000
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Sep 2016 18:02:24 -0000

On Mon, Sep 19, 2016 at 04:23:34PM -0700, Brendan Higgins wrote:
> Added device tree binding documentation for Aspeed I2C controller and
> busses.
> 
> Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> ---
> Changes for v2:
>   - None
> Changes for v3:
>   - Removed reference to "bus" device tree param
> ---
>  .../devicetree/bindings/i2c/i2c-aspeed.txt         | 61 ++++++++++++++++++++++
>  1 file changed, 61 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/i2c-aspeed.txt

Acked-by: Rob Herring <robh@kernel.org>
