Return-Path: <xow@google.com>
Received: from mail-qk0-x234.google.com (mail-qk0-x234.google.com
 [IPv6:2607:f8b0:400d:c09::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wF53Q2CdlzDqBQ
 for <openbmc@lists.ozlabs.org>; Sat, 29 Apr 2017 06:27:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="TWuwgzX7"; 
 dkim-atps=neutral
Received: by mail-qk0-x234.google.com with SMTP id f76so62284527qke.2
 for <openbmc@lists.ozlabs.org>; Fri, 28 Apr 2017 13:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=znYXznjPK7bUyKSg71Y3ZbeOvztD4g0zMR7C0Ef3zYo=;
 b=TWuwgzX7oFCGqr0waob1IQ9MZ81SpvfbobInxgrbKz7HSuMyBtpSbYnbq9AwmOIYA/
 bWuFHL1tnnntoyNQeDbdaQ1ITFS0nLgpsTvZB1s1PpbqG+FGkggP+Y1R9bmC0JGrJ2ob
 Z4sikUdGYAJMy9CP3zWlWCNr8T13iw7yUWREx7Ef6/cTVipI7NI4exW9YcXPYqdwXnNx
 5yTB9cm6a/c9WFM8WiBM6tGiJCuhtwZz6thtW0klINKaX4ayk4MNpVFoOTCjMIZoiW2M
 clgiO5annlQlDLo9mgcbE/6bQPhgAGKJu2QmjOl/CL2oRjJqPlQ+sKsxywrv46UcTPX8
 BqwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=znYXznjPK7bUyKSg71Y3ZbeOvztD4g0zMR7C0Ef3zYo=;
 b=kAP8XH5GG/RkU6s7G4v6nR5qE13YTVnugHBflsIIrgWu8iqOuA5fnvd+NrTFKZUCcv
 JtdQJFDj425hfUFHCWjUyNp3WBgxB3FtzbyF2T6ajt05wrAx0XfI+H1c6fOLlWVoJs/j
 678fvVU3cGPHOQ+tgBjXDhYBIZxfHywxxhUKgxY1kQG1zagXKj+xsEdJlLsFa74m6Pmx
 hEqTfi0tXfO8Qkfq3s5wqSlKLza+nc4wVhC8djF0VnX6PDUAS9ssAjfZfQYWQDoawuXT
 rIl5wMlmJIqeqaFSJOq4maaAR/6X01eQBIuQBfInhSgXmngtd/y9eiGWvCTaJMWQ+DgU
 RUag==
X-Gm-Message-State: AN3rC/46IMarpjRpRkobfWFAHvYlUq7qVXIt/9R/zJRPdgwvQteaIsWS
 lytwLDNXuLEGl4JGUIu7BOGMgMzhrmd7
X-Received: by 10.55.3.13 with SMTP id 13mr10814759qkd.300.1493411262802; Fri,
 28 Apr 2017 13:27:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.73 with HTTP; Fri, 28 Apr 2017 13:27:42 -0700 (PDT)
In-Reply-To: <20170428071043.1355-2-andrew@aj.id.au>
References: <20170428071043.1355-1-andrew@aj.id.au>
 <20170428071043.1355-2-andrew@aj.id.au>
From: Xo Wang <xow@google.com>
Date: Fri, 28 Apr 2017 13:27:42 -0700
Message-ID: <CAPH-5w6Cjv1b0iExwhYqPhOz+2BKsOV6v2z2-KWnNtGeDu+h0w@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 v2 01/11] aspeed: g4: Move pinctrl subnodes
 to improve readability
To: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Cc: Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Mine <mine260309@gmail.com>, Rick Altherr <raltherr@google.com>
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
X-List-Received-Date: Fri, 28 Apr 2017 20:27:47 -0000

On Fri, Apr 28, 2017 at 12:10 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
> Moving the subnodes out of the pinctrl node declaration to a reference
> allows easier access to the remaining parts of the devicetree.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---

+OpenBMC list

Reviewed-by: Xo Wang <xow@google.com>
