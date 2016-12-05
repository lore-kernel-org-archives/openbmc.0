Return-Path: <robherring2@gmail.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
 [209.85.218.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tXfYD2hqWzDvwD
 for <openbmc@lists.ozlabs.org>; Tue,  6 Dec 2016 09:28:32 +1100 (AEDT)
Received: by mail-oi0-f67.google.com with SMTP id v84so38572338oie.2
 for <openbmc@lists.ozlabs.org>; Mon, 05 Dec 2016 14:28:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=rCT85YHViMENmshR4xNungB45u0mscXB7gqLCTxQ3Ow=;
 b=GryarH7bj1S3FD8VHZNTXxkdQM4gRaiIldAgtLER91R75EgdbDIeVDp7ID2KywdKrC
 zhY5XZ3FsgHA1lD9lUv+UvQIhP9/RfoTxw0xYU9SfhCFaW1Gnvv63ny92zwbhH6scLyh
 1BD5OdS2tHz1/iF4N6MdVmloU61b4EQyy2kBnAL6uBoAyFs8EX9JZG9Ss9VOwXJW8rMs
 ZeaIwrEZnXcOPMOIpzdhTdxKKuMMhME7PensTrZ/wVw6eVwNGf1DGl0CH0k0Ls+A8hI9
 s1vZjkxbp05l7MGVq7pdpZYo+vqpkrrofWHvLXtv6QzF+4sFf6DYa96kFAdoWrjEwY3C
 pVIg==
X-Gm-Message-State: AKaTC02i4sJkqkUx4djhVrwMIsmhpbxFWz2HzLldXRJjDos6Wjs4YfYhc9zRFpbACBPgSQ==
X-Received: by 10.157.63.200 with SMTP id i8mr30346523ote.170.1480976909683;
 Mon, 05 Dec 2016 14:28:29 -0800 (PST)
Received: from localhost (72-48-98-129.dyn.grandenetworks.net. [72.48.98.129])
 by smtp.gmail.com with ESMTPSA id
 s33sm6643528ota.37.2016.12.05.14.28.29
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 05 Dec 2016 14:28:29 -0800 (PST)
Date: Mon, 5 Dec 2016 16:28:26 -0600
From: Rob Herring <robh@kernel.org>
To: Brendan Higgins <brendanhiggins@google.com>
Cc: wsa@the-dreams.de, vz@mleia.com, clg@kaod.org, mouse@mayc.ru,
 mark.rutland@arm.com, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, joel@jms.id.au, openbmc@lists.ozlabs.org
Subject: Re: [PATCH v5 2/2] i2c: aspeed: added documentation for Aspeed I2C
 driver
Message-ID: <20161205222826.brehi3nbcg3exwum@rob-hp-laptop>
References: <1480467618-7497-1-git-send-email-brendanhiggins@google.com>
 <1480467618-7497-3-git-send-email-brendanhiggins@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1480467618-7497-3-git-send-email-brendanhiggins@google.com>
User-Agent: Mutt/1.6.2-neo (2016-08-21)
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
X-List-Received-Date: Mon, 05 Dec 2016 22:28:32 -0000

On Tue, Nov 29, 2016 at 05:00:18PM -0800, Brendan Higgins wrote:
> Added device tree binding documentation for Aspeed I2C controller and
> busses.
> 
> Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> ---
> Changes for v2:
>   - None
> Changes for v3:
>   - Removed reference to "bus" device tree param
> Changes for v4:
>   - None
> Changes for v5:
>   - None
> ---
>  .../devicetree/bindings/i2c/i2c-aspeed.txt         | 61 ++++++++++++++++++++++
>  1 file changed, 61 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/i2c-aspeed.txt

Acked-by: Rob Herring <robh@kernel.org>
