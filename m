Return-Path: <robherring2@gmail.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
 [209.85.218.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wM4wb3YrmzDqCL
 for <openbmc@lists.ozlabs.org>; Tue,  9 May 2017 00:42:39 +1000 (AEST)
Received: by mail-oi0-f67.google.com with SMTP id h4so9652103oib.0
 for <openbmc@lists.ozlabs.org>; Mon, 08 May 2017 07:42:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=xrxXb9nULoupewtCnxtW3C/5wDrAZs9FP7Xjk/C271o=;
 b=txrwWxSSo2MzV3rIaZv4zd/rqJ4kh7VRdVArJ3cmqe/vpPhlfgsJDqZNXSYsX+NNsD
 XjnbnKmjSti3MTjdn5glJ3Qw68XafFdv6sjIggmQVdOfioJfc0BdhfTYcXXXuylX0iHx
 xpTv9mXqEDMSNeYDrkpmXKQ4WsZ3K0vnqhgogKXz7xI+UfqXZPX0pA/INRAwghd0eBJd
 98ASZSn6PO3YKaK1/tbgwn/9uiSF34NKv4ZG3MFotr7w43s5h3zyn9iM6QUf2WgIxELr
 XL3g0x4YbXx74b1C07/KtKG/SZQTm0qqbsi6z8zPoy71teAFXudnzAqTXdlbaEHnonns
 SyPw==
X-Gm-Message-State: AN3rC/7dIQpibyKG3DW/yKVFdC2mbFnvt1ka+8WhPX/bFV8jZjb/mrhD
 UCwPXHnw0f6gnA==
X-Received: by 10.157.1.97 with SMTP id 88mr22776007otu.66.1494254557197;
 Mon, 08 May 2017 07:42:37 -0700 (PDT)
Received: from localhost (66-90-148-125.dyn.grandenetworks.net.
 [66.90.148.125])
 by smtp.gmail.com with ESMTPSA id c126sm6754392oia.5.2017.05.08.07.42.36
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 08 May 2017 07:42:36 -0700 (PDT)
Date: Mon, 8 May 2017 09:42:36 -0500
From: Rob Herring <robh@kernel.org>
To: Jeremy Kerr <jk@ozlabs.org>
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH RFC] Documentation/devicetree: Add specification for FSI
 busses
Message-ID: <20170508144236.r5ezra467hyzebtv@rob-hp-laptop>
References: <1493704508-27119-1-git-send-email-jk@ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1493704508-27119-1-git-send-email-jk@ozlabs.org>
User-Agent: NeoMutt/20170113 (1.7.2)
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
X-List-Received-Date: Mon, 08 May 2017 14:42:40 -0000

On Tue, May 02, 2017 at 01:55:08PM +0800, Jeremy Kerr wrote:
> This change introduces a proposed layout for describing FSI busses in
> the device tree. While the bus is probe-able, we'd still like a method
> of describing subordinate (eg i2c) busses that are behind FSI devices.
> 
> The FSI core will be responsible for matching probed slaves & engines to
> their device tree nodes, so the FSI device drivers' probe() functions
> will be passed a struct device with the appropriate of_node populated
> where a matching DT node is found.
> 
> RFC at this stage, so I'd welcome any feedback.
> 
> Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
> ---
>  Documentation/devicetree/bindings/fsi/fsi.txt | 144 ++++++++++++++++++++++++++
>  1 file changed, 144 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/fsi/fsi.txt
> 
> diff --git a/Documentation/devicetree/bindings/fsi/fsi.txt b/Documentation/devicetree/bindings/fsi/fsi.txt
> new file mode 100644
> index 0000000..b5e85c7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/fsi/fsi.txt
> @@ -0,0 +1,144 @@
> +FSI bus & engine generic device tree bindings
> +=============================================
> +
> +The FSI bus is probe-able, so Linux is able to enumerate FSI slaves, and

s/Linux/the OS/

Otherwise, looks good to me.

Rob
