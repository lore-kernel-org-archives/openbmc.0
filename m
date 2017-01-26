Return-Path: <linus.walleij@linaro.org>
Received: from mail-io0-x229.google.com (mail-io0-x229.google.com
 [IPv6:2607:f8b0:4001:c06::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v8NBT3MMQzDq62
 for <openbmc@lists.ozlabs.org>; Fri, 27 Jan 2017 00:32:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="ALIlGdDd"; 
 dkim-atps=neutral
Received: by mail-io0-x229.google.com with SMTP id j13so36314294iod.3
 for <openbmc@lists.ozlabs.org>; Thu, 26 Jan 2017 05:32:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=/Y39RRuUxmHG4JnNVP/F2c6H+qPj8O6vRbI46C7ySPI=;
 b=ALIlGdDdQ1eQygytNC2mi+nVk21l2IO8YqbW8XjUnf6FZ5/69D7ozmjIQTPmQBG2MV
 Ypr/dnO9i0sSO2xJLujjS7HlLbt8QtAiYlac7JPnqUW6UZ2IPE8J7Tdea+Ruju6GiAob
 rTBjN2/zPtpTj9VZkNHT7qnRkp/WlqHuRK/5o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=/Y39RRuUxmHG4JnNVP/F2c6H+qPj8O6vRbI46C7ySPI=;
 b=pv6g41m6ACLkQ28tvZsaktI0PyUcBjiyo0+/9mhE5l7g71a4LIMx6QLhoHVSk3Nwas
 BpcrUrwINdpWG78R41J/hdr5A2ebhj9HuZEVZV9oqeJyXku9h5MSq0y9+A5I8/+NKdRi
 1jIscUsRHjFvZ4HDR8oEkBsns/vpdTXHVhd26SuRrlMZN+sSnJt1bfAKF2jPkkgYuAyx
 WJmerc/K9EPk3dW9BDWUfcmNTiLjQO1BSKFrfGUyACjkjmVBmutY8gbf3BMhURGRtnw9
 TsCGZKZa8e5ialAaHUEA6LBimUyinfHMeVs9Qyg1yl7nsptIj2Eg07n2RwgfyKC6R43H
 xFYQ==
X-Gm-Message-State: AIkVDXI5OukgslWgyq4r2Gobyh3II+dfVe7PmdHMjBsohCkE5t+fyiv5JtRWDG9gkLhvoOioDDJDUuNjfZHg3P7T
X-Received: by 10.107.134.85 with SMTP id i82mr3055489iod.151.1485437534400;
 Thu, 26 Jan 2017 05:32:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.79.169.75 with HTTP; Thu, 26 Jan 2017 05:32:13 -0800 (PST)
In-Reply-To: <20170123052607.9424-2-andrew@aj.id.au>
References: <20170123052607.9424-1-andrew@aj.id.au>
 <20170123052607.9424-2-andrew@aj.id.au>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 26 Jan 2017 14:32:13 +0100
Message-ID: <CACRpkdbhtbcJWQ5kA-iyjMfUdDnGDr2DyH_sZBon19T1rWryPw@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpio: aspeed: Make bank names strings
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Joel Stanley <joel@jms.id.au>, 
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Thu, 26 Jan 2017 13:32:18 -0000

On Mon, Jan 23, 2017 at 6:26 AM, Andrew Jeffery <andrew@aj.id.au> wrote:

> From: Joel Stanley <joel@jms.id.au>
>
> The Aspeed SoCs have more GPIOs than can be represented with A-Z. The
> documentation uses two letter names such as AA and AB, so make the names
> a three-character array in the bank struct to accommodate this.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Patch applied.

Yours,
Linus Walleij
