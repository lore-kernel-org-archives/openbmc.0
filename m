Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::843; helo=mail-qt1-x843.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="O+psazMW"; 
 dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43q85f5L4DzDqF0;
 Wed, 30 Jan 2019 14:30:46 +1100 (AEDT)
Received: by mail-qt1-x843.google.com with SMTP id v11so24838649qtc.2;
 Tue, 29 Jan 2019 19:30:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EOazp/NWSDbCI8C+71UDBedskrp4jlovZVpb655hqvc=;
 b=O+psazMWvQoU6qhDFavivE6P9jLDHQZ3zpfhSE/LPFAGiKfXe7TrmCEsw4aNUdKK4K
 lpJ0kIdBwycUE7Kzr87i4aTSw1FnGlWGQmYfTMzdinb/1XmuW7PbG+rvT+umTqFBzID/
 ntKSqRUK2r2MzeLpRRXXA55Y33nfT3nVs66f0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EOazp/NWSDbCI8C+71UDBedskrp4jlovZVpb655hqvc=;
 b=mBK51G+xFQZkeOgX9oaUrprHe6j1aVfkHUW+tiF5CcJgkpRVnj/s0zBQ63gGrdtz4R
 UWwikY2sy0N7GHpRQIyLhxMNDjoYZaxWNLwahTAnoy/AST6kBepvRwEE8kUVYhR47mvZ
 g6Sx75drIaxxzxgtty+Kt8r54WtmWHz2VSBXEns280rJDgpShPZ7qgsHtZn04es/3vEp
 nVgeGEW3yVgWr3W+ZwOOGtTpSVZ9w59VELT9LteSa7QFwiYGdQXx4IBYTNMuchLnOIB4
 BoHsrvvE8hIJPZqCAqoni0mTTuYh0Cr7Fmu0GHGjND+MSoGQdVFlMjbw8RQ/bjxaZfen
 wRDg==
X-Gm-Message-State: AJcUukf4clo1h/scGrGnA8eSDz0/aF3yY+/0jvKjMJBJgmcGlDmjYzUj
 eRdTot9OHh7DZFE9hc+gV5/EspF4SOBHjJlHSWg=
X-Google-Smtp-Source: ALg8bN7LW70WzD86d3+LFpR4kdydSKb/yb44aVGHjpkQPeLKmhko7YcKakMv2eFQDtrtBDy9bist227w4b+PVjN7JKU=
X-Received: by 2002:a0c:e789:: with SMTP id x9mr27109614qvn.245.1548819044408; 
 Tue, 29 Jan 2019 19:30:44 -0800 (PST)
MIME-Version: 1.0
References: <20190129230538.1044378-1-vijaykhemka@fb.com>
In-Reply-To: <20190129230538.1044378-1-vijaykhemka@fb.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 30 Jan 2019 14:30:29 +1100
Message-ID: <CACPK8Xdg+mjqL-qnNGUnRPw03sqBJGf_ckcsFnw6_F7HA96o6Q@mail.gmail.com>
Subject: Re: [PATCH v3] dt-bindings: aspeed-lpc: Make parameter optional
To: Vijay Khemka <vijaykhemka@fb.com>
Cc: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Andrew Jeffery <andrew@aj.id.au>, 
 devicetree <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-aspeed@lists.ozlabs.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "openbmc @ lists . ozlabs . org" <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Wed, 30 Jan 2019 03:30:47 -0000

On Wed, 30 Jan 2019 at 10:05, Vijay Khemka <vijaykhemka@fb.com> wrote:
>
> Memory-region and flash phandle is not a required parameter, it is
> optional to describe in device tree and needed only use basis.
>
> Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>

Acked-by: Joel Stanley <joel@jms.id.au>

Thanks for following this up Vijay.
