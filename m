Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c08::22d; helo=mail-ua0-x22d.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="utIiPuvZ"; 
 dkim-atps=neutral
Received: from mail-ua0-x22d.google.com (mail-ua0-x22d.google.com
 [IPv6:2607:f8b0:400c:c08::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zsfcJ5L2wzF1lr
 for <openbmc@lists.ozlabs.org>; Fri,  2 Mar 2018 04:31:27 +1100 (AEDT)
Received: by mail-ua0-x22d.google.com with SMTP id n1so4399994uaa.2
 for <openbmc@lists.ozlabs.org>; Thu, 01 Mar 2018 09:31:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=ragT8+yKLcSu/3Hltb+QxALELoxMr5s2yWOPODNegnY=;
 b=utIiPuvZJb/N+M/X8bTD9bGbATUUECHyQfmOjINqVGYLanNoTfl5Df675r2LX2C/e6
 OK/2fSWMMZXKUzin2INrFNm65nX5bQFCrmoP0QvDpCQAS+zrhsupt+3CAasVPO2KlSfp
 ZdbvqmpAt/fW5bqlyKM+xKXds/B5oPs+htmge2PXxf4N18XL3jwOoZwgK40KrwY8FFrQ
 XlCukMixffWZyGNKsJLC5VfPM9IDv01oWo+Fk6PpCe+c3rjOj8g1WLQ0OrtHhu9fHeHh
 k9IaNAZFRRh5YYsZQit+OILW1C5RE+ZJCWGkxNXb+ejl89IW1RSgt4QVuxnQvmYfYwhy
 M3vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=ragT8+yKLcSu/3Hltb+QxALELoxMr5s2yWOPODNegnY=;
 b=FZL0Jrczy89CbQp+AcGTALQI75Pp6N4JD9sXUt7KUVm5P8PnruBCPhTkZlzt+KAB+L
 ID5AT7Tve1KgsYDDZIUXOsZPVKmktEWizB9b5MBLVnh3Guhr/OAgDDRlztmQK1wkmRkL
 GZ291wductY335gDfcg2B3Md5tLOtBIQxCQbDvYOYK3CFItWFKKXHKpxgZe+Y++sI2mb
 0spncyHHB49uPh6WOUvEPh4PMl8w3S7wfn2ygA69BvuRP8+LVUbNM+Cl6OsZeTFl481J
 7cB9z9nqjqi4h4Z7sgURhaMmJHjt0T5SVXknqfYB0AjMNNAyrlbWi9jHZMNbkqZBOtXS
 0OsQ==
X-Gm-Message-State: APf1xPADKOgY6GamrfA3GGdkrao7j8VNlCquaLJ7MonCNzM25vdDlQ9s
 sI3P+SgwksbzVor8IehVpcerUWAN0lk0zIngf6fW4J36ptc=
X-Google-Smtp-Source: AG47ELtK3gqUsOr4hF+1y4j/YlsEViU8a4AJ6rMQ7Qfg2LYcVsBvVbg/i6GZG3CqYXt/UiaX8rxgAJCfc0f9CJ7jn40=
X-Received: by 10.159.43.2 with SMTP id p2mr1899051uaj.142.1519925484711; Thu,
 01 Mar 2018 09:31:24 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.58.79 with HTTP; Thu, 1 Mar 2018 09:31:04 -0800 (PST)
In-Reply-To: <CAO=notzv-4wn7J+uAzPYw1uWzTiN5jOGqHNEDUAzAGS+j5wivQ@mail.gmail.com>
References: <CAO=notzv-4wn7J+uAzPYw1uWzTiN5jOGqHNEDUAzAGS+j5wivQ@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Thu, 1 Mar 2018 09:31:04 -0800
Message-ID: <CAO=notySFE7ZSOwZx_XroNCeXuFo=UtSrSF7fdRuzLwSaUAwtQ@mail.gmail.com>
Subject: Re: Exposing POST codes
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Thu, 01 Mar 2018 17:31:29 -0000

Here's a patch staged that provides our snoop daemon source:

https://gerrit.openbmc-project.xyz/9298

I have to fix my git send-email to send out any kernel patches.

Patrick

On Wed, Feb 28, 2018 at 10:56 AM, Patrick Venture <venture@google.com> wrote:
> I talked to Nancy and I think it's time to revisit previous conversations
> about POST codes.  We have a simple daemon that exposes the information
> over Dbus associated with https://gerrit.openbmc-project.xyz/#/c/5006
>
> If there's interest, I can stage it against skeleton for review and comment.
>
> We have a patch to the kernel character device for the aspeed-lpc-snoop
> that is required and enables reading the post codes.
>
> Patrick
